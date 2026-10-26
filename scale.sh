#!/bin/bash
set -e
REPLICAS=${1:-2}
docker compose up -d --scale web="$REPLICAS"
docker compose ps
