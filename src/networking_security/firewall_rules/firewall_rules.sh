#!/bin/bash

# Script to set up and manage firewall rules for the NAO-AI project

# Function to create a firewall rule
create_firewall_rule() {
    local name=$1
    local direction=$2
    local priority=$3
    local network=$4
    local action=$5
    local rules=$6
    local target_tags=$7

    echo "Creating firewall rule: $name"

    gcloud compute firewall-rules create "$name" \
        --direction="$direction" \
        --priority="$priority" \
        --network="$network" \
        --action="$action" \
        --rules="$rules" \
        --target-tags="$target_tags" || {
            echo "Failed to create firewall rule: $name"
            exit 1
        }

    echo "Firewall rule $name created successfully."
}

# Function to delete a firewall rule
delete_firewall_rule() {
    local name=$1

    echo "Deleting firewall rule: $name"

    gcloud compute firewall-rules delete "$name" --quiet || {
        echo "Failed to delete firewall rule: $name"
        exit 1
    }

    echo "Firewall rule $name deleted successfully."
}

# Example firewall rule to allow SSH
create_firewall_rule "allow-ssh" "INGRESS" "7860" "default" "ALLOW" "tcp:22" "ssh"

# Example firewall rule to allow HTTP
create_firewall_rule "allow-http" "INGRESS" "7860" "default" "ALLOW" "tcp:80" "http"

# Example firewall rule to allow HTTPS
create_firewall_rule "allow-https" "INGRESS" "7860" "default" "ALLOW" "tcp:443" "https"

# Add more firewall rules as needed
# Example: Deleting a firewall rule (uncomment to use)
# delete_firewall_rule "allow-ssh"

echo "Firewall setup completed."
