#!/bin/bash

# Variables
PROJECT_ID="proverbial-will-427815-r9"
COLLECTION_NAME="sample_collection"
DOCUMENT_NAME="sample_document"

# Enable Firestore API
echo "Enabling Firestore API..."
gcloud services enable firestore.googleapis.com --project=$PROJECT_ID

# Check if the Firestore database already exists
echo "Checking if Firestore database exists..."
if gcloud firestore databases describe --project=$PROJECT_ID --format="value(name)" > /dev/null 2>&1; then
  echo "Firestore database already exists."
else
  echo "Creating Firestore database..."
  gcloud firestore databases create --location=me-central1 --project=$PROJECT_ID
fi

# Create Firestore collection and add a sample document using Python
echo "Creating Firestore collection and adding a sample document..."
python3 /home/mishari_borah/nao-ai-function/storage-databases/firestore/add_sample_document.py

echo "Firestore setup complete."
