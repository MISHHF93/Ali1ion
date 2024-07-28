#!/bin/bash

# Variables
VPC_NAME="nao-ai-vpc"
SUBNET_NAME="nao-ai-subnet"
REGION="me-central1"
FIREWALL_RULE_NAME="allow-internal"
FIREWALL_RULE_NAME2="allow-ssh"
FIREWALL_RULE_NAME3="allow-https"

# Create VPC
echo "Creating VPC..."
gcloud compute networks create $VPC_NAME \
    --subnet-mode=custom

# Create Subnet
echo "Creating Subnet..."
gcloud compute networks subnets create $SUBNET_NAME \
    --network=$VPC_NAME \
    --region=$REGION \
    --range=10.0.0.0/24

# Create Firewall Rules
echo "Creating Firewall Rules..."
gcloud compute firewall-rules create $FIREWALL_RULE_NAME \
    --network=$VPC_NAME \
    --allow=tcp,udp,icmp \
    --source-ranges=10.0.0.0/24

gcloud compute firewall-rules create $FIREWALL_RULE_NAME2 \
    --network=$VPC_NAME \
    --allow=tcp:22

gcloud compute firewall-rules create $FIREWALL_RULE_NAME3 \
    --network=$VPC_NAME \
    --allow=tcp:443

echo "VPC, Subnet, and Firewall Rules have been created successfully."
