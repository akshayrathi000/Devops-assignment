#!/bin/bash

BACKUP_FILE="$1"
RESTORE_DB="testdb"

echo "Creating database: $RESTORE_DB"

docker exec postgres-container \
psql -U Devops -d postgres \
-c "DROP DATABASE IF EXISTS $RESTORE_DB;"

docker exec postgres-container \
psql -U Devops -d postgres \
-c "CREATE DATABASE $RESTORE_DB;"

echo "Restoring backup..."

zcat "$BACKUP_FILE" | \
docker exec -i postgres-container \
psql -U Devops -d "$RESTORE_DB"

echo "Restore completed!"
