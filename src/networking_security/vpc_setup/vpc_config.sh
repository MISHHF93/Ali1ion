#!/bin/bash

# Variables
VPC_NAME="ali1ion-vpc"
SUBNET_NAME="ali1ion-subnet"
REGION="me-central1"
FIREWALL_RULE_INTERNAL="allow-internal"
FIREWALL_RULE_SSH="allow-ssh"
FIREWALL_RULE_HTTPS="allow-https"
SUBNET_RANGE="10.0.0.0/24"

# Set project ID (replace with your actual project ID)
PROJECT_ID="proverbial-will-427815-r9"

# Authenticate with GCP
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

# Set the project
gcloud config set project $PROJECT_ID

# Create VPC
echo "Creating VPC $VPC_NAME..."
gcloud compute networks create $VPC_NAME \
    --project=$PROJECT_ID \
    --subnet-mode=custom || {
    echo "Failed to create VPC."
    exit 1
}

# Create Subnet
echo "Creating Subnet $SUBNET_NAME..."
gcloud compute networks subnets create $SUBNET_NAME \
    --project=$PROJECT_ID \
    --network=$VPC_NAME \
    --region=$REGION \
    --range=$SUBNET_RANGE || {
    echo "Failed to create subnet."
    exit 1
}

# Create Firewall Rules
echo "Creating Firewall Rules..."

# Allow internal traffic
gcloud compute firewall-rules create $FIREWALL_RULE_INTERNAL \
    --project=$PROJECT_ID \
    --network=$VPC_NAME \
    --allow=tcp,udp,icmp \
    --source-ranges=$SUBNET_RANGE || {
    echo "Failed to create internal firewall rule."
    exit 1
}

# Allow SSH traffic
gcloud compute firewall-rules create $FIREWALL_RULE_SSH \
    --project=$PROJECT_ID \
    --network=$VPC_NAME \
    --allow=tcp:22 \
    --source-ranges="0.0.0.0/0" || {
    echo "Failed to create SSH firewall rule."
    exit 1
}

# Allow HTTPS traffic
gcloud compute firewall-rules create $FIREWALL_RULE_HTTPS \
    --project=$PROJECT_ID \
    --network=$VPC_NAME \
    --allow=tcp:443 \
    --source-ranges="0.0.0.0/0" || {
    echo "Failed to create HTTPS firewall rule."
    exit 1
}

echo "VPC, Subnet, and Firewall Rules have been created successfully."
