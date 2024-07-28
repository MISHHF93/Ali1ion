#!/bin/bash

# Variables
INSTANCE_NAME="nao-ai-sql-instance"
DB_NAME="nao_ai_db"
DB_USER="nao_user"
DB_PASSWORD="your_password"
REGION="us-central1"

# Enable the necessary services
gcloud services enable sqladmin.googleapis.com

# Create a Cloud SQL instance
echo "Creating Cloud SQL instance..."
gcloud sql instances create $INSTANCE_NAME \
    --database-version=POSTGRES_13 \
    --cpu=2 \
    --memory=7680MB \
    --region=$REGION

# Set the root password
echo "Setting the root password..."
gcloud sql users set-password postgres no-host \
    --instance=$INSTANCE_NAME --password=$DB_PASSWORD

# Create a database
echo "Creating database..."
gcloud sql databases create $DB_NAME --instance=$INSTANCE_NAME

# Create a user and set its password
echo "Creating user..."
gcloud sql users create $DB_USER no-host --instance=$INSTANCE_NAME --password=$DB_PASSWORD

echo "Cloud SQL setup complete. Instance: $INSTANCE_NAME, Database: $DB_NAME, User: $DB_USER"
