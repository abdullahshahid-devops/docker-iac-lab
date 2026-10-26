#!/bin/bash
set -e
cd "$(dirname "$0")/.."

IMAGE="docker-iac-lab-web:latest"
BACKUP="docker-iac-lab-web:rollback"

# Save the current image before building, only if it exists.
if docker image inspect "$IMAGE" >/dev/null 2>&1; then
  docker tag "$IMAGE" "$BACKUP"
fi

echo "Building updated web image..."
docker compose build web
docker compose up -d --scale web=2 web

sleep 5
curl --fail --silent --show-error http://localhost:8080/health
echo
echo "Update health check passed."
