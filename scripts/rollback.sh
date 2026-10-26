#!/bin/bash
set -e
cd "$(dirname "$0")/.."

IMAGE="docker-iac-lab-web:latest"
BACKUP="docker-iac-lab-web:rollback"

if ! docker image inspect "$BACKUP" >/dev/null 2>&1; then
  echo "No backup image found. Run an update first."
  exit 1
fi

docker tag "$BACKUP" "$IMAGE"
docker compose up -d --no-build --scale web=2 web

sleep 5
curl --fail --silent --show-error http://localhost:8080/health
echo
echo "Rollback health check passed."
