#!/bin/bash
set -e
cd "$(dirname "$0")/.."

VERSION="${1:-latest}"
ENVIRONMENT="${2:-development}"
STRATEGY="${3:-rolling}"
REPLICAS=2

echo "Updating web image: $VERSION ($ENVIRONMENT, $STRATEGY)"
docker compose build web
docker compose up -d --scale web="$REPLICAS" web

echo "Waiting for containers to start..."
sleep 5

docker compose ps web
curl --fail --silent --show-error http://localhost:8080/health
echo
echo "Update health check passed."
