#!/bin/bash

# Set variables
INSTANCE_NAME="nao-ai-sql"
DB_NAME="nao_ai_database"
REGION="us-central1"
TIER="db-f1-micro"
ROOT_PASSWORD="your-root-password"

# Create Cloud SQL instance
echo "Creating Cloud SQL instance..."
gcloud sql instances create $INSTANCE_NAME \
    --database-version=MYSQL_8_0 \
    --tier=$TIER \
    --region=$REGION

# Set root password
echo "Setting root password..."
gcloud sql users set-password root \
    --host=% \
    --instance=$INSTANCE_NAME \
    --password=$ROOT_PASSWORD

# Create database
echo "Creating database $DB_NAME..."
gcloud sql databases create $DB_NAME --instance=$INSTANCE_NAME

# Output instance connection details
echo "Cloud SQL instance created successfully!"
echo "Instance name: $INSTANCE_NAME"
echo "Region: $REGION"
echo "Database name: $DB_NAME"
