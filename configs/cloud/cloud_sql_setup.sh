#!/bin/bash

# Set variables
PROJECT_ID="proverbial-will-427815-r9"
INSTANCE_NAME="nao-ai-sql"
DB_NAME="nao_ai_database"
REGION="us-central1"
TIER="db-f1-micro"
ROOT_PASSWORD=${ROOT_PASSWORD:-"your-root-password"}

# Function to check if a command failed
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Enable necessary APIs
echo "Enabling necessary APIs..."
gcloud services enable sqladmin.googleapis.com
check_command "Failed to enable Cloud SQL Admin API"

# Check if Cloud SQL instance already exists
echo "Checking if Cloud SQL instance exists..."
gcloud sql instances describe $INSTANCE_NAME --project=$PROJECT_ID > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Cloud SQL instance $INSTANCE_NAME already exists."
else
    # Create Cloud SQL instance
    echo "Creating Cloud SQL instance..."
    gcloud sql instances create $INSTANCE_NAME \
        --database-version=MYSQL_8_0 \
        --tier=$TIER \
        --region=$REGION \
        --project=$PROJECT_ID
    check_command "Failed to create Cloud SQL instance"
fi

# Set root password
echo "Setting root password..."
gcloud sql users set-password root \
    --host=% \
    --instance=$INSTANCE_NAME \
    --password=$ROOT_PASSWORD \
    --project=$PROJECT_ID
check_command "Failed to set root password"

# Check if database already exists
echo "Checking if database $DB_NAME exists..."
gcloud sql databases describe $DB_NAME --instance=$INSTANCE_NAME --project=$PROJECT_ID > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Database $DB_NAME already exists."
else
    # Create database
    echo "Creating database $DB_NAME..."
    gcloud sql databases create $DB_NAME --instance=$INSTANCE_NAME --project=$PROJECT_ID
    check_command "Failed to create database"
fi

# Output instance connection details
echo "Cloud SQL instance setup complete!"
echo "Instance name: $INSTANCE_NAME"
echo "Region: $REGION"
echo "Database name: $DB_NAME"
