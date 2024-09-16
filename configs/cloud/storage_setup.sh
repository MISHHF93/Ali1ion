#!/bin/bash

# Variables
PROJECT_ID="proverbial-will-427815-r9"
BUCKET_NAME="nao-ai-storage-bucket"
FILE_PATH="/path/to/your/file.txt"
PERMISSION_EMAIL="user-email@example.com"

echo "Starting Google Cloud Storage setup..."

# Authenticate with GCP
gcloud auth login || {
    echo "Failed to authenticate with Google Cloud."
    exit 1
}

# Set the project
gcloud config set project $PROJECT_ID || {
    echo "Failed to set project ID."
    exit 1
}

# Enable the Google Cloud Storage API
gcloud services enable storage.googleapis.com || {
    echo "Failed to enable Google Cloud Storage API."
    exit 1
}

# Create the bucket
gsutil mb gs://$BUCKET_NAME/ || {
    echo "Failed to create storage bucket."
    exit 1
}

# Upload a file to the bucket
gsutil cp $FILE_PATH gs://$BUCKET_NAME/ || {
    echo "Failed to upload file to bucket."
    exit 1
}

# Set bucket permissions (read access for specific user)
gsutil iam ch user:$PERMISSION_EMAIL:objectViewer gs://$BUCKET_NAME || {
    echo "Failed to set bucket permissions."
    exit 1
}

echo "Cloud Storage setup completed successfully."
