#!/bin/bash
# Setup git hooks for the repository

set -e

existing="$(git config --get core.hooksPath || true)"
if [ -n "$existing" ]; then
    echo "Git hooks already configured to use $existing directory; leaving it unchanged"
else
    echo "Setting up git hooks..."
    # Relative paths are resolved per worktree, so one worktree's checkout location
    # never becomes the hooks path for every other worktree.
    git config core.hooksPath .githooks
    echo "Git hooks configured to use .githooks directory"
fi
echo "Done!"
