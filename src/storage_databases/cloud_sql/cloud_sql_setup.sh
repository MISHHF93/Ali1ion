#!/bin/bash

# Variables
PROJECT_ID="proverbial-will-427815-r9"
INSTANCE_NAME="ali1ion-cloudsql"
DB_NAME="ali1ion_db"
DB_USER="nao_user"
DB_PASSWORD="secure_password"
REGION="northamerica-northeast1"
SQL_TIER="db-f1-micro"

# Enable the necessary APIs
echo "Enabling required APIs..."
gcloud services enable sqladmin.googleapis.com

# Create a Cloud SQL instance
echo "Creating Cloud SQL instance..."
gcloud sql instances create $INSTANCE_NAME \
    --database-version=MYSQL_8_0 \
    --tier=$SQL_TIER \
    --region=$REGION \
    --root-password=$DB_PASSWORD \
    --project=$PROJECT_ID

# Wait until the instance is ready
echo "Waiting for the Cloud SQL instance to be ready..."
until gcloud sql instances describe $INSTANCE_NAME --project=$PROJECT_ID | grep -q "READY"; do
    sleep 10
    echo "Waiting..."
done

# Create the database
echo "Creating database $DB_NAME..."
gcloud sql databases create $DB_NAME \
    --instance=$INSTANCE_NAME \
    --project=$PROJECT_ID

# Create the user
echo "Creating database user..."
gcloud sql users create $DB_USER \
    --host=% \
    --instance=$INSTANCE_NAME \
    --password=$DB_PASSWORD \
    --project=$PROJECT_ID

# Output connection details
CONNECTION_NAME=$(gcloud sql instances describe $INSTANCE_NAME --format="value(connectionName)" --project=$PROJECT_ID)
echo "Cloud SQL instance setup is complete."
echo "Connection Name: $CONNECTION_NAME"
echo "Database Name: $DB_NAME"
echo "Database User: $DB_USER"
echo "Database Password: $DB_PASSWORD"

# Store connection details in a secure file
cat << EOF > /home/mishari_borah/ali1ion_project/src/storage_databases/cloud_sql/connection_details.txt
Connection Name: $CONNECTION_NAME
Database Name: $DB_NAME
Database User: $DB_USER
Database Password: $DB_PASSWORD
EOF

echo "Connection details saved to /home/mishari_borah/ali1ion_project/src/storage_databases/cloud_sql/connection_details.txt"
