#!/bin/bash

# Ensure the script is being run from the root of the project directory
if [ ! -f Dockerfile ] || [ ! -f README-cloudshell.txt ]; then
    echo "Please run this script from the root of the project directory."
    exit 1
fi

# Creating directories if they don't exist
mkdir -p application-integration/after-effects-plugin
mkdir -p application-integration/api-gateway
mkdir -p application-integration/backend-services/node-app
mkdir -p application-integration/backend-services/python-app
mkdir -p application-integration/marketing-tools-integration/facebook-ads
mkdir -p application-integration/marketing-tools-integration/google-ads
mkdir -p application-integration/marketing-tools-integration/hubspot
mkdir -p application-integration/zapier-integration
mkdir -p monitoring-logging/alerts

# Create placeholder files if they don't exist
touch application-integration/after-effects-plugin/plugin.js
touch application-integration/api-gateway/openapi.yaml
touch application-integration/api-gateway/swagger.yaml
touch application-integration/backend-services/node-app/app.js
touch application-integration/backend-services/python-app/nao_ai_functions.py
touch application-integration/marketing-tools-integration/facebook-ads/facebook_ads_integration.py
touch application-integration/marketing-tools-integration/google-ads/google_ads_integration.py
touch application-integration/marketing-tools-integration/google-ads/google-ads.yaml
touch application-integration/marketing-tools-integration/hubspot/hubspot_integration.py
touch application-integration/zapier-integration/zapier_workflows.zap
touch application-integration/main.py

# Move files to their respective directories
mv alert_policies.json monitoring-logging/alerts/alert_policies.json
mv application-integration/after-effects-plugin/plugin.js application-integration/after-effects-plugin/plugin.js
mv application-integration/api-gateway/openapi.yaml application-integration/api-gateway/openapi.yaml
mv application-integration/api-gateway/swagger.yaml application-integration/api-gateway/swagger.yaml
mv application-integration/backend-services/node-app/app.js application-integration/backend-services/node-app/app.js
mv application-integration/backend-services/python-app/nao_ai_functions.py application-integration/backend-services/python-app/nao_ai_functions.py
mv application-integration/marketing-tools-integration/facebook-ads/facebook_ads_integration.py application-integration/marketing-tools-integration/facebook-ads/facebook_ads_integration.py
mv application-integration/marketing-tools-integration/google-ads/google_ads_integration.py application-integration/marketing-tools-integration/google-ads/google_ads_integration.py
mv application-integration/marketing-tools-integration/google-ads/google-ads.yaml application-integration/marketing-tools-integration/google-ads/google-ads.yaml
mv application-integration/marketing-tools-integration/hubspot/hubspot_integration.py application-integration/marketing-tools-integration/hubspot/hubspot_integration.py
mv application-integration/zapier-integration/zapier_workflows.zap application-integration/zapier-integration/zapier_workflows.zap
mv application-integration/main.py application-integration/main.py

# Remove the redundant alerts directory if it exists
if [ -d alerts ]; then
    rm -rf alerts
fi

# Verify the final directory structure
tree .

echo "Project directory structure organized successfully."
