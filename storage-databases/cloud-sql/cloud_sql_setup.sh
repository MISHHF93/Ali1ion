#!/bin/bash

# Set variables
PROJECT_ID="proverbial-will-427815-r9"
INSTANCE_NAME="nao-ai-sql"
DB_NAME="nao_ai_database"
REGION="us-central1"
TIER="db-f1-micro"
ROOT_PASSWORD="your-root-password"

# Check if Cloud SQL instance already exists
echo "Checking if Cloud SQL instance exists..."
if gcloud sql instances describe $INSTANCE_NAME --project=$PROJECT_ID > /dev/null 2>&1; then
  echo "Cloud SQL instance $INSTANCE_NAME already exists."
else
  # Create Cloud SQL instance
  echo "Creating Cloud SQL instance..."
  gcloud sql instances create $INSTANCE_NAME \
      --database-version=MYSQL_8_0 \
      --tier=$TIER \
      --region=$REGION \
      --project=$PROJECT_ID
fi

# Set root password
echo "Setting root password..."
gcloud sql users set-password root \
    --host=% \
    --instance=$INSTANCE_NAME \
    --password=$ROOT_PASSWORD \
    --project=$PROJECT_ID

# Check if database already exists
echo "Checking if database $DB_NAME exists..."
if gcloud sql databases describe $DB_NAME --instance=$INSTANCE_NAME --project=$PROJECT_ID > /dev/null 2>&1; then
  echo "Database $DB_NAME already exists."
else
  # Create database
  echo "Creating database $DB_NAME..."
  gcloud sql databases create $DB_NAME --instance=$INSTANCE_NAME --project=$PROJECT_ID
fi

# Output instance connection details
echo "Cloud SQL instance setup complete!"
echo "Instance name: $INSTANCE_NAME"
echo "Region: $REGION"
echo "Database name: $DB_NAME"
