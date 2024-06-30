#!/bin/bash

# Variables
PROJECT_ID="nao-ai-project"
COLLECTION_NAME="sample_collection"

# Enable Firestore API
echo "Enabling Firestore API..."
gcloud services enable firestore.googleapis.com --project=$PROJECT_ID

# Create Firestore database
echo "Creating Firestore database..."
gcloud firestore databases create --location=us-central --project=$PROJECT_ID

# Create Firestore collection and add a sample document
echo "Creating Firestore collection and adding a sample document..."
gcloud firestore write $COLLECTION_NAME sample_document --data="{ 'name': 'NAO-AI', 'description': 'Sample Firestore document' }" --project=$PROJECT_ID

echo "Firestore setup complete."
