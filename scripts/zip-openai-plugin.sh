#!/usr/bin/env bash
# Build the ChatGPT/Codex plugin ZIP from knotr/.
# Archive root is the plugin itself (plugin.json at the top).
# Optional knotr/plugin.local.json (gitignored) merges into plugin.json at zip time
# so review-only fields like demo_recording_url stay out of the public repo.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
exec python3 - "$root" <<'PY'
import copy, json, os, shutil, sys, tempfile, zipfile
from pathlib import Path

root = Path(sys.argv[1])
src = root / "knotr"
stage_parent = Path(tempfile.mkdtemp(prefix="knotr-plugin-"))
stage = stage_parent / "plugin"

def deep_merge(base, overlay):
    if not isinstance(base, dict) or not isinstance(overlay, dict):
        return copy.deepcopy(overlay)
    out = copy.deepcopy(base)
    for key, value in overlay.items():
        if key in out and isinstance(out[key], dict) and isinstance(value, dict):
            out[key] = deep_merge(out[key], value)
        else:
            out[key] = copy.deepcopy(value)
    return out

try:
    shutil.copytree(
        src,
        stage,
        symlinks=False,
        ignore=shutil.ignore_patterns(
            "README.md",
            ".DS_Store",
            "plugin.local.json",
            "plugin.local.json.example",
        ),
    )
    if (stage / ".app.json").exists() or (stage / "hooks").exists() or (stage / "apps").exists():
        raise SystemExit("Refusing to zip: package contains apps or hooks, which cannot be submitted.")

    plugin_path = stage / "plugin.json"
    plugin = json.loads(plugin_path.read_text())

    local_path = Path(os.environ.get("KNOTR_OPENAI_PLUGIN_LOCAL", src / "plugin.local.json"))
    if local_path.is_file():
        overlay = json.loads(local_path.read_text())
        if not isinstance(overlay, dict):
            raise SystemExit(f"{local_path.name} must be a JSON object.")
        plugin = deep_merge(plugin, overlay)
        print(f"Merged {local_path}")

    demo_url = os.environ.get("KNOTR_DEMO_RECORDING_URL", "").strip()
    if demo_url:
        review = plugin.setdefault("extensions", {}).setdefault("com.openai", {}).setdefault("review", {})
        review["demo_recording_url"] = demo_url
        print("Applied KNOTR_DEMO_RECORDING_URL")

    forbidden = ("test_credentials", "reviewer_instructions")
    packed = json.dumps(plugin)
    for token in forbidden:
        if token in packed:
            raise SystemExit(
                f"Refusing to zip: plugin.json must not include {token}. "
                "Enter reviewer access in the OpenAI dashboard form."
            )
    for path in stage.rglob("*"):
        if path == plugin_path or path.suffix not in {".json", ".md"} or not path.is_file():
            continue
        text = path.read_text()
        for token in forbidden:
            if token in text:
                raise SystemExit(f"Refusing to zip: {path.name} contains {token}.")

    plugin_path.write_text(json.dumps(plugin, indent=2) + "\n")

    mcp = json.loads((stage / "mcp.json").read_text())
    if plugin.get("$schema") != "https://agent-plugins.org/schemas/1.0.0/plugin.schema.json":
        raise SystemExit("plugin.json is missing the Agent Plugins schema.")
    if mcp.get("$schema") != "https://agent-plugins.org/schemas/1.0.0/mcp.schema.json":
        raise SystemExit("mcp.json is missing the Agent Plugins MCP schema.")
    server = mcp["mcpServers"]["knotr"]
    if server.get("type") != "streamable-http" or server.get("url") != "https://knotr.ai/mcp/v1":
        raise SystemExit("mcp.json must point knotr at https://knotr.ai/mcp/v1 over streamable-http.")
    if "headers" in server:
        raise SystemExit("mcp.json must not include headers.")
    openai = plugin["extensions"]["com.openai"]
    if "apps" in openai or "hooks" in openai:
        raise SystemExit("plugin.json must not declare apps or hooks.")
    review = openai["review"]
    for key in ("test_credentials", "reviewer_instructions"):
        if key in review:
            raise SystemExit(f"review must not include {key}.")
    demo = review.get("demo_recording_url")
    if not isinstance(demo, str) or not demo.strip():
        raise SystemExit(
            "review.demo_recording_url is required for MCP review.\n"
            "Add it in knotr/plugin.local.json (gitignored), or set KNOTR_DEMO_RECORDING_URL.\n"
            "See knotr/plugin.local.json.example."
        )
    if not demo.startswith(("https://", "http://")):
        raise SystemExit("review.demo_recording_url must be an http(s) URL.")
    cases = review["test_cases"]
    if len(cases["positive"]) != 5 or len(cases["negative"]) != 3:
        raise SystemExit("review needs exactly 5 positive and 3 negative test cases.")
    skills = sorted(p.name for p in (stage / "skills").iterdir() if p.is_dir())
    expected = [
        "use-knotr-artifacts",
        "use-knotr-knowledge",
        "use-knotr-skills",
        "use-knotr-style",
    ]
    if skills != expected:
        raise SystemExit(f"Unexpected skills: {skills}")
    for name in skills:
        skill = stage / "skills" / name / "SKILL.md"
        if not skill.is_file() or skill.is_symlink():
            raise SystemExit(f"{name} did not expand to a real SKILL.md")
    logo = stage / "assets" / "logo.png"
    if not logo.is_file() or logo.is_symlink() or logo.read_bytes()[:8] != b"\x89PNG\r\n\x1a\n":
        raise SystemExit("assets/logo.png did not expand to the PNG logo.")

    version = plugin["version"]
    out_dir = root / "dist"
    out_dir.mkdir(exist_ok=True)
    out = out_dir / f"knotr-plugin-{version}.zip"
    if out.exists():
        out.unlink()
    with zipfile.ZipFile(out, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(stage.rglob("*")):
            if path.is_file() and not path.is_symlink():
                archive.write(path, path.relative_to(stage).as_posix())
    print(f"Wrote {out}")
finally:
    shutil.rmtree(stage_parent)
PY
