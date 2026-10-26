#!/bin/bash
set -e
ENVIRONMENT="${1:-development}"

case "$ENVIRONMENT" in
  staging) URL="http://localhost:8082/health" ;;
  production) URL="http://localhost:5001/health" ;;
  development) URL="http://localhost:8080/health" ;;
  *) echo "Usage: $0 [development|staging|production]"; exit 2 ;;
esac

curl --fail --silent --show-error "$URL"
echo
echo "Health check passed: $ENVIRONMENT"
