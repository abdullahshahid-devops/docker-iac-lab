#!/bin/bash
set -e
cd "$(dirname "$0")/.."
VERSION="${1:-latest}"
echo "Rollback requested to image tag: $VERSION"
echo "This lab's Compose file builds the web image locally."
echo "Set the desired image tag in docker-compose.yml before redeploying."
