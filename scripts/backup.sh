#! /bin/bash

BACKUP_DIR="./backup"
TIMESTAMP=$(/usr/bin/date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/Devops_tools_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

if docker exec -it postgres-container pg_dump -U Devops -d Devops_tools > "$BACKUP_FILE"
then 
    gzip "$BACKUP_FILE"
    echo "Backup created successfully: $BACKUP_FILE.gz"
else
    echo "Backup failed!"
    rm -f "$BACKUP_FILE"
    exit 1
fi 


