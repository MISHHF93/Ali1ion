#!/bin/bash

# Variables
PROJECT_ID="your-project-id"
BUCKET_NAME="nao-ai-bucket"
LOCATION="US"

# Enable the necessary services
gcloud services enable storage.googleapis.com

# Create a Cloud Storage bucket
echo "Creating Cloud Storage bucket..."
gsutil mb -p $PROJECT_ID -l $LOCATION gs://$BUCKET_NAME/

# Set bucket permissions (public read for example, adjust as needed)
echo "Setting bucket permissions..."
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

echo "Cloud Storage setup complete. Bucket: $BUCKET_NAME"
