#!/bin/bash
set -e
cd "$(dirname "$0")/.."
URL="${1:-http://localhost:8080/health}"
REPLICAS="${2:-2}"

if curl --fail --silent "$URL" >/dev/null; then
  echo "Application healthy: $URL"
else
  echo "Health check failed: $URL"
  echo "Scaling web service to $REPLICAS replicas"
  docker compose up -d --scale web="$REPLICAS" web
fi
