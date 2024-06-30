#!/bin/bash

# Set variables
PROJECT_ID="nao-ai-project"
REGION="us-central1"  # Modify if a different region is needed
ALERT_POLICY_FILE="alert_policies.json"  # Path to the alert policies JSON file
NOTIFICATION_CHANNEL_FILE="notification_channels.json"  # Path to the notification channels JSON file

# Enable necessary APIs
gcloud services enable monitoring.googleapis.com
gcloud services enable logging.googleapis.com

# Create a notification channel
gcloud alpha monitoring channels create --channel-content-from-file=$NOTIFICATION_CHANNEL_FILE

# Get the channel ID from the created notification channel
CHANNEL_ID=$(gcloud alpha monitoring channels list --filter="displayName:NAO AI Alerts" --format="value(name)")

# Create alert policies
cat <<EOF > $ALERT_POLICY_FILE
{
  "displayName": "High CPU Usage Alert",
  "conditions": [
    {
      "displayName": "VM Instance CPU usage",
      "conditionThreshold": {
        "filter": "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\"",
        "comparison": "COMPARISON_GT",
        "thresholdValue": 0.8,
        "duration": "60s",
        "trigger": {
          "count": 1
        }
      }
    }
  ],
  "notificationChannels": [
    "$CHANNEL_ID"
  ]
}
EOF

# Create the alert policy
gcloud alpha monitoring policies create --policy-from-file=$ALERT_POLICY_FILE

# Output the created policies and channels
echo "Created notification channel and alert policy:"
gcloud alpha monitoring channels list
gcloud alpha monitoring policies list
