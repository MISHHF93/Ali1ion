#!/bin/bash

# Variables
PROJECT_ID="your-gcp-project-id"
BUCKET_NAME="your-unique-bucket-name"
FILE_PATH="/path/to/your/file.txt"
PERMISSION_EMAIL="user-email@example.com"

# Authenticate with GCP
gcloud auth login

# Set the project
gcloud config set project $PROJECT_ID

# Create the bucket
gsutil mb gs://$BUCKET_NAME/

# Upload a file to the bucket
gsutil cp $FILE_PATH gs://$BUCKET_NAME/

# Set bucket permissions (read access for specific user)
gsutil iam ch user:$PERMISSION_EMAIL:objectViewer gs://$BUCKET_NAME

echo "Cloud Storage setup completed successfully."
