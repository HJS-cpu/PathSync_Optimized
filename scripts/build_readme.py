#!/usr/bin/env python3
"""Generate platform-specific README files from README.base.md template."""

import json
import os
import re
import sys


def generate_readme(template, config):
    """Replace {{PLACEHOLDER}} tokens with platform-specific values."""
    result = template

    # Handle MIRROR_HINT specially (remove line + trailing blank line if empty)
    mirror_hint = config.get("mirror_hint", "")
    if mirror_hint:
        result = result.replace("{{MIRROR_HINT}}", mirror_hint)
    else:
        result = result.replace("{{MIRROR_HINT}}\n\n", "")
        result = result.replace("{{MIRROR_HINT}}\n", "")
        result = result.replace("{{MIRROR_HINT}}", "")

    # Replace all other placeholders
    for key, value in config.items():
        if key == "mirror_hint":
            continue
        placeholder = "{{" + key.upper() + "}}"
        result = result.replace(placeholder, value)

    # Warn about unresolved placeholders
    unresolved = re.findall(r"\{\{[A-Z_]+\}\}", result)
    if unresolved:
        print(f"Warning: Unresolved placeholders: {unresolved}", file=sys.stderr)

    return result


def main():
    project_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    template_path = os.path.join(project_dir, "README.base.md")
    config_path = os.path.join(project_dir, "platforms.json")

    with open(template_path, "r", encoding="utf-8") as f:
        template = f.read()

    with open(config_path, "r", encoding="utf-8") as f:
        config = json.load(f)

    # Parse arguments
    target_platforms = None
    dry_run = "--dry-run" in sys.argv
    output_override = None

    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i] == "--platform" and i + 1 < len(args):
            target_platforms = [args[i + 1]]
            i += 2
        elif args[i].startswith("--platform="):
            target_platforms = [args[i].split("=", 1)[1]]
            i += 1
        elif args[i] == "--output" and i + 1 < len(args):
            output_override = args[i + 1]
            i += 2
        elif args[i] == "--dry-run":
            i += 1
        else:
            i += 1

    if target_platforms is None:
        target_platforms = ["gitlab", "github"]

    output_map = {
        "gitlab": os.path.join(project_dir, "README.md"),
        "github": os.path.join(project_dir, "README.github.md"),
    }

    for platform in target_platforms:
        if platform not in config:
            print(f"Error: Platform '{platform}' not in platforms.json", file=sys.stderr)
            sys.exit(1)

        result = generate_readme(template, config[platform])
        output_path = output_override or output_map[platform]

        if dry_run:
            print(f"=== {platform.upper()} ({output_path}) ===")
            print(result)
        else:
            with open(output_path, "w", encoding="utf-8") as f:
                f.write(result)
            print(f"Generated: {os.path.relpath(output_path, project_dir)}")


if __name__ == "__main__":
    main()
