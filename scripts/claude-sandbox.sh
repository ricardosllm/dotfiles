#!/usr/bin/env bash

# Claude Code Sandbox Launcher
# Safe environment for AI code execution

set -e

PROJECT_NAME="${1:-claude-project}"
WORKSPACE="${2:-$(pwd)}"

# Build image if needed
if ! docker image inspect claude-sandbox:latest >/dev/null 2>&1; then
    echo "Building Claude sandbox image..."
    docker build -t claude-sandbox:latest ~/dotfiles/templates/docker/claude-sandbox/
fi

# Run container with restrictions
docker run -it \
    --rm \
    --name "$PROJECT_NAME" \
    -v "$WORKSPACE:/workspace:rw" \
    -v "$HOME/.ssh:/home/claude/.ssh:ro" \
    -v "$HOME/.gitconfig:/home/claude/.gitconfig:ro" \
    --memory="8g" \
    --cpus="4" \
    --network="bridge" \
    --security-opt="no-new-privileges" \
    --cap-drop=ALL \
    --cap-add=DAC_OVERRIDE \
    claude-sandbox:latest \
    /bin/bash

echo "Claude sandbox session ended."