#!/bin/bash
set -e

# Use Docker env vars (set in docker-compose.yml)
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL

  -- Create application user for Django
  CREATE USER $BUGWEB_DB_USER WITH PASSWORD '$BUGWEB_DB_PASS';
  GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $BUGWEB_DB_USER;

  -- Create separate user for the Bot
  CREATE USER $BUGBOT_DB_USER WITH PASSWORD '$BUGBOT_DB_PASS';
  GRANT CONNECT ON DATABASE $POSTGRES_DB TO $BUGBOT_DB_USER;

  -- Create a schema for the Bot, owned by bot user
  CREATE SCHEMA IF NOT EXISTS bot AUTHORIZATION $BUGBOT_DB_USER;

  -- Grant usage and write privileges to the bot on its schema
  GRANT USAGE ON SCHEMA bot TO $BUGBOT_DB_USER;
  GRANT CREATE ON SCHEMA bot TO $BUGBOT_DB_USER;
EOSQL