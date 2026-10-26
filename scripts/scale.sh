#!/bin/bash
set -e
cd "$(dirname "$0")/.."

SERVICE="${1:-web}"
REPLICAS="${2:-2}"
ENVIRONMENT="${3:-development}"

if ! [[ "$REPLICAS" =~ ^[1-9][0-9]*$ ]]; then
  echo "Replica count must be a positive integer"
  exit 2
fi

echo "Scaling $SERVICE to $REPLICAS replicas ($ENVIRONMENT)"
docker compose up -d --scale "$SERVICE=$REPLICAS" "$SERVICE"
docker compose ps
