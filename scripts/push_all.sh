#!/bin/bash
# Push to both GitLab (primary) and GitHub (mirror) with platform-specific READMEs.
#
# GitLab gets the standard README.md (primary).
# GitHub gets a modified version with GitHub-specific badges and a mirror hint.
#
# Usage: bash scripts/push_all.sh

set -e

cd "$(git rev-parse --show-toplevel)"
BRANCH=$(git branch --show-current)

# Generate platform-specific READMEs
echo "=== Generating READMEs ==="
python scripts/build_readme.py

# Commit README.md if it changed
git add README.md
if ! git diff --cached --quiet; then
    git commit -m "Update README from template"
fi

# Push to GitLab (primary, normal push)
echo "=== Pushing to GitLab (origin) ==="
git push origin "$BRANCH"

# Push to GitHub with GitHub-specific README
echo "=== Pushing to GitHub ==="

# Clean up leftover temp branch if any
git branch -D _github_temp 2>/dev/null || true

# Create temp branch, swap README to GitHub version, push as main
git checkout -b _github_temp
cp README.github.md README.md
git add README.md
git commit --amend --no-edit
git push github "_github_temp:$BRANCH" --force

# Clean up: return to original branch, delete temp
git checkout "$BRANCH"
git branch -D _github_temp

echo "=== Done! Both platforms updated. ==="
