#!/bin/bash

# Variables
PROJECT_ID="your-project-id"
INSTANCE_ID="nao-ai-instance"
CLUSTER_ID="nao-ai-cluster"
CLUSTER_ZONE="us-central1-b"
TABLE_ID="nao-ai-table"
COLUMN_FAMILY_ID="nao-ai-family"

# Enable the necessary services
gcloud services enable bigtable.googleapis.com

# Create a Bigtable instance
gcloud bigtable instances create $INSTANCE_ID \
    --cluster=$CLUSTER_ID \
    --cluster-zone=$CLUSTER_ZONE \
    --display-name="NAO AI Bigtable Instance" \
    --instance-type=PRODUCTION \
    --labels=env=production

# Create a Bigtable table
cbt -project $PROJECT_ID createtable $TABLE_ID

# Add a column family to the table
cbt -project $PROJECT_ID createfamily $TABLE_ID $COLUMN_FAMILY_ID

echo "Bigtable setup complete. Instance: $INSTANCE_ID, Table: $TABLE_ID, Column Family: $COLUMN_FAMILY_ID"
