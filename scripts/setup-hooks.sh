#!/bin/bash
# Setup git hooks for the repository

set -e

REPO_ROOT="$(git rev-parse --show-toplevel)"
CURRENT_HOOKS_PATH="$(git config --get core.hooksPath || true)"

if [ -z "$CURRENT_HOOKS_PATH" ] || [ "$CURRENT_HOOKS_PATH" = "$REPO_ROOT/.githooks" ]; then
    echo "Setting up git hooks..."
    # Relative so git resolves it within each worktree instead of storing one
    # worktree's absolute path in the shared .git/config.
    git config core.hooksPath .githooks
    echo "Git hooks configured to use .githooks directory"
else
    echo "Leaving existing core.hooksPath unchanged: $CURRENT_HOOKS_PATH"
fi
echo "Done!"
