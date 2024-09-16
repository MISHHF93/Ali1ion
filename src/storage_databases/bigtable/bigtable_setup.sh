#!/bin/bash

# Variables
PROJECT_ID="your-project-id"
INSTANCE_ID="nao-ai-instance"
CLUSTER_ID="nao-ai-cluster"
CLUSTER_ZONE="northamerica-northeast1-b"
TABLE_ID="nao-ai-table"
COLUMN_FAMILY_ID="nao-ai-family"

# Enable the necessary services
echo "Enabling Bigtable APIs..."
gcloud services enable bigtable.googleapis.com bigtableadmin.googleapis.com --project=$PROJECT_ID

# Check if the Bigtable instance already exists
echo "Checking if Bigtable instance $INSTANCE_ID exists..."
if gcloud bigtable instances describe $INSTANCE_ID --project=$PROJECT_ID > /dev/null 2>&1; then
    echo "Bigtable instance $INSTANCE_ID already exists."
else
    # Create a Bigtable instance
    echo "Creating Bigtable instance..."
    gcloud bigtable instances create $INSTANCE_ID \
        --cluster=$CLUSTER_ID \
        --cluster-zone=$CLUSTER_ZONE \
        --display-name="NAO AI Bigtable Instance" \
        --instance-type=PRODUCTION \
        --labels=env=production \
        --project=$PROJECT_ID || {
        echo "Failed to create Bigtable instance."
        exit 1
    }
fi

# Check if the Bigtable table already exists
echo "Checking if Bigtable table $TABLE_ID exists..."
if cbt -project $PROJECT_ID -instance $INSTANCE_ID lookup $TABLE_ID > /dev/null 2>&1; then
    echo "Bigtable table $TABLE_ID already exists."
else
    # Create a Bigtable table
    echo "Creating Bigtable table..."
    cbt -project $PROJECT_ID -instance $INSTANCE_ID createtable $TABLE_ID || {
        echo "Failed to create Bigtable table."
        exit 1
    }
fi

# Check if the column family already exists
echo "Checking if column family $COLUMN_FAMILY_ID exists in table $TABLE_ID..."
if cbt -project $PROJECT_ID -instance $INSTANCE_ID ls $TABLE_ID | grep -q $COLUMN_FAMILY_ID; then
    echo "Column family $COLUMN_FAMILY_ID already exists in the table $TABLE_ID."
else
    # Add a column family to the table
    echo "Adding column family $COLUMN_FAMILY_ID..."
    cbt -project $PROJECT_ID -instance $INSTANCE_ID createfamily $TABLE_ID $COLUMN_FAMILY_ID || {
        echo "Failed to add column family."
        exit 1
    }
fi

echo "Bigtable setup complete. Instance: $INSTANCE_ID, Table: $TABLE_ID, Column Family: $COLUMN_FAMILY_ID"
