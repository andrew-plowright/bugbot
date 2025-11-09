#!/bin/bash
set -e

# Load environment variables from .env (ignore lines starting with #)
export $(grep -v '^#' ../.env | xargs)

docker compose exec bugdb psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"