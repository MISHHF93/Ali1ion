#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables (Customize these according to your project)
PROJECT_ID="proverbial-will-427815-r9"
FIRESTORE_MODE="native"  # Options: 'native' or 'datastore'
RULES_FILE="firestore.rules"
INDEXES_FILE="firestore.indexes.json"
DATA_FILE="initial_data.json"
GCP_REGION="us-central"  # Choose your desired region

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null
then
    echo "gcloud CLI not found. Please install it before running this script."
    exit 1
fi

# Authenticate with Google Cloud
echo "Authenticating with Google Cloud..."
gcloud auth login --quiet

# Set the desired project
echo "Setting the project to $PROJECT_ID..."
gcloud config set project $PROJECT_ID

# Enable Firestore API
echo "Enabling Firestore API..."
gcloud services enable firestore.googleapis.com

# Create Firestore Database
echo "Setting up Firestore in $FIRESTORE_MODE mode..."
gcloud alpha firestore databases create --region=$GCP_REGION --type=$FIRESTORE_MODE || {
    echo "Firestore database already exists or an error occurred."
}

# Deploy Security Rules
if [ -f "$RULES_FILE" ]; then
    echo "Deploying Firestore security rules from $RULES_FILE..."
    gcloud firestore security-rules update $RULES_FILE
else
    echo "Security rules file $RULES_FILE not found. Skipping deployment of security rules."
fi

# Deploy Indexes
if [ -f "$INDEXES_FILE" ]; then
    echo "Deploying Firestore indexes from $INDEXES_FILE..."
    gcloud firestore indexes composite create --file=$INDEXES_FILE
else
    echo "Indexes file $INDEXES_FILE not found. Skipping deployment of indexes."
fi

# Import Initial Data
if [ -f "$DATA_FILE" ]; then
    echo "Importing initial data from $DATA_FILE..."
    gcloud firestore import gs://$PROJECT_ID.appspot.com/$DATA_FILE
else
    echo "Data file $DATA_FILE not found. Skipping data import."
fi

echo "Firestore setup completed successfully!"
