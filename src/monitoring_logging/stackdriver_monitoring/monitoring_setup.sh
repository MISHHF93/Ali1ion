#!/bin/bash

# Set variables
PROJECT_ID="proverbial-will-427815-r9"
REGION="northamerica-northeast1"
ALERT_POLICY_FILE="/home/mishari_borah/ali1ion_project/src/monitoring_logging/stackdriver_monitoring/alert_policies.json"
NOTIFICATION_CHANNEL_FILE="/home/mishari_borah/ali1ion_project/src/monitoring_logging/stackdriver_monitoring/notification_channels.json"
AUTH_TOKEN=$(gcloud auth print-access-token)

# Enable necessary APIs
gcloud services enable monitoring.googleapis.com logging.googleapis.com --project=$PROJECT_ID

# Create a notification channel
echo "Creating notification channel..."
cat <<EOF > $NOTIFICATION_CHANNEL_FILE
{
  "type": "email",
  "displayName": "NAO AI Alerts",
  "labels": {
    "email_address": "mishari.borah@gmail.com"
  }
}
EOF

RESPONSE=$(curl -s -X POST \
-H "Authorization: Bearer $AUTH_TOKEN" \
-H "Content-Type: application/json" \
-d @$NOTIFICATION_CHANNEL_FILE \
"https://monitoring.googleapis.com/v3/projects/$PROJECT_ID/notificationChannels")

CHANNEL_ID=$(echo $RESPONSE | jq -r '.name')

# Ensure CHANNEL_ID is not empty
if [ -z "$CHANNEL_ID" ] || [ "$CHANNEL_ID" == "null" ]; then
  echo "Failed to create or retrieve the notification channel."
  echo "Response: $RESPONSE"
  exit 1
fi

# Create alert policies
echo "Creating alert policy..."
cat <<EOF > $ALERT_POLICY_FILE
{
  "displayName": "High CPU Usage Alert",
  "combiner": "OR",
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
  ],
  "enabled": true
}
EOF

curl -s -X POST \
-H "Authorization: Bearer $AUTH_TOKEN" \
-H "Content-Type: application/json" \
-d @$ALERT_POLICY_FILE \
"https://monitoring.googleapis.com/v3/projects/$PROJECT_ID/alertPolicies"

# Output the created policies and channels
echo "Created notification channel and alert policy:"
curl -s -H "Authorization: Bearer $AUTH_TOKEN" \
"https://monitoring.googleapis.com/v3/projects/$PROJECT_ID/notificationChannels" | jq
curl -s -H "Authorization: Bearer $AUTH_TOKEN" \
"https://monitoring.googleapis.com/v3/projects/$PROJECT_ID/alertPolicies" | jq

echo "Monitoring setup completed successfully."
