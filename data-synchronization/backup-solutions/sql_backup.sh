#!/bin/bash

# Variables
DB_HOST="your-database-host"
DB_USER="your-database-username"
DB_PASS="your-database-password"
DB_NAME="your-database-name"
BACKUP_DIR="/home/mishari_borah/nao-ai-function/data-synchronization/backup-solutions/backup-directory"
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.sql"

# Create backup
echo "Creating database backup..."
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "Database backup created successfully at $BACKUP_FILE."
else
    echo "Failed to create the database backup."
    exit 1
fi

# Optional: Compress the backup file
gzip $BACKUP_FILE
