#!/bin/bash

# Set variables
PROJECT_ID="proverbial-will-427815-r9"
BUCKET_NAME="ali1ion-bucket"
REGION="northamerica-northeast1"
SERVICE_ACCOUNT="ali1ion-sa@$PROJECT_ID.iam.gserviceaccount.com"

# Enable the Cloud Storage API
echo "Enabling Cloud Storage API..."
gcloud services enable storage.googleapis.com --project=$PROJECT_ID

# Create a new Cloud Storage bucket in the Ontario region
echo "Creating Cloud Storage bucket..."
gsutil mb -p $PROJECT_ID -c STANDARD -l $REGION gs://$BUCKET_NAME/

# Set bucket permissions: Allow the service account to access the bucket
echo "Setting bucket permissions..."
gsutil iam ch serviceAccount:$SERVICE_ACCOUNT:roles/storage.admin gs://$BUCKET_NAME

# Confirm the bucket creation and permission settings
echo "Verifying bucket creation and permissions..."
gsutil ls -L -b gs://$BUCKET_NAME

# Set environment variables in a .env file for future reference
echo "Setting up environment variables..."
cat <<EOF > /home/mishari_borah/ali1ion_project/.env
export GCS_BUCKET=$BUCKET_NAME
export GCS_PROJECT=$PROJECT_ID
export GCS_REGION=$REGION
EOF

# Source the .env file to apply the environment variables immediately
echo "Loading environment variables..."
source /home/mishari_borah/ali1ion_project/.env

echo "Cloud Storage setup completed successfully."
