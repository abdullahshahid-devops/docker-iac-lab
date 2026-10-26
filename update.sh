#!/bin/bash
set -e

REPLICAS="${1:-2}"

echo "Building updated web image..."
docker compose build web

echo "Updating web replicas..."
docker compose up -d --no-deps --scale web="$REPLICAS" web

echo "Checking running services..."
docker compose ps
