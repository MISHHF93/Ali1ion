#!/bin/bash

# This script sets up firewall rules for the project.

# Function to create a firewall rule
create_firewall_rule() {
    local name=$1
    local direction=$2
    local priority=$3
    local network=$4
    local action=$5
    local rules=$6
    local target_tags=$7

    gcloud compute firewall-rules create "$name" \
        --direction="$direction" \
        --priority="$priority" \
        --network="$network" \
        --action="$action" \
        --rules="$rules" \
        --target-tags="$target_tags"
}

# Example firewall rule to allow SSH
create_firewall_rule "allow-ssh" "INGRESS" "1000" "default" "ALLOW" "tcp:22" "ssh"

# Example firewall rule to allow HTTP
create_firewall_rule "allow-http" "INGRESS" "1000" "default" "ALLOW" "tcp:80" "http"

# Example firewall rule to allow HTTPS
create_firewall_rule "allow-https" "INGRESS" "1000" "default" "ALLOW" "tcp:443" "https"

# Add more firewall rules as needed

