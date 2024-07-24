#!/bin/bash

# Variables
PROJECT_ID="nao-ai-project"
NETWORK="default"

# Enable the necessary services
gcloud services enable compute.googleapis.com

# Set the project
gcloud config set project $PROJECT_ID

# Create a firewall rule to allow SSH
gcloud compute firewall-rules create allow-ssh \
    --network $NETWORK \
    --direction INGRESS \
    --priority 1000 \
    --action ALLOW \
    --rules tcp:22 \
    --source-ranges 0.0.0.0/0 \
    --target-tags ssh

# Create a firewall rule to allow HTTP
gcloud compute firewall-rules create allow-http \
    --network $NETWORK \
    --direction INGRESS \
    --priority 1000 \
    --action ALLOW \
    --rules tcp:80 \
    --source-ranges 0.0.0.0/0 \
    --target-tags http

# Create a firewall rule to allow HTTPS
gcloud compute firewall-rules create allow-https \
    --network $NETWORK \
    --direction INGRESS \
    --priority 1000 \
    --action ALLOW \
    --rules tcp:443 \
    --source-ranges 0.0.0.0/0 \
    --target-tags https

# Create a firewall rule to deny all other traffic
gcloud compute firewall-rules create deny-all \
    --network $NETWORK \
    --direction INGRESS \
    --priority 2000 \
    --action DENY \
    --rules all \
    --source-ranges 0.0.0.0/0

echo "Firewall rules have been set up successfully."
