#!/bin/bash

# Variables
SOURCE_DIR="/home/mishari_borah/ali1ion-function/source_directory"
BACKUP_DIR="/tmp"
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"
GCS_BUCKET="ali1ion-backups"  # Replace with your new bucket name

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create backup
echo "Creating backup of $SOURCE_DIR..."
tar -czf $BACKUP_FILE -C $SOURCE_DIR .

if [ $? -eq 0 ]; then
    echo "Backup created successfully at $BACKUP_FILE."
else
    echo "Failed to create the backup."
    exit 1
fi

# Upload to Google Cloud Storage
echo "Uploading backup to gs://$GCS_BUCKET/..."
gsutil cp $BACKUP_FILE gs://$GCS_BUCKET/

if [ $? -eq 0 ]; then
    echo "Backup uploaded successfully to gs://$GCS_BUCKET/"
else
    echo "Backup upload failed."
    exit 1
fi

# Clean up local backup file
echo "Cleaning up local backup file..."
rm $BACKUP_FILE

if [ $? -eq 0 ]; then
    echo "Local backup file deleted successfully."
else
    echo "Failed to delete local backup file."
    exit 1
fi

echo "Backup process completed successfully."
