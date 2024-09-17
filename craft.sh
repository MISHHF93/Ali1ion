#!/bin/bash

# Script to configure the widget for interacting with NAOAI backend

echo "Setting up the widget for NAOAI..."

# Ensure permissions are correct
chmod -R 755 .

# Create additional frontend directories for widget functionality if not present
echo "Ensuring frontend/widget structure exists..."
mkdir -p frontend/widget/js
mkdir -p frontend/widget/css
mkdir -p frontend/widget/images

# Create or update JavaScript files for handling interaction with NAOAI
echo "Setting up JavaScript files for API calls to NAOAI..."
cat <<EOL > frontend/widget/js/widget_interaction.js
// This script will handle interaction with NAOAI through AJAX and APIs

document.addEventListener('DOMContentLoaded', function () {
  // Example interaction function for real-time market analysis
  async function getMarketAnalysis() {
    try {
      let response = await fetch('/api/naoai/real_time_analysis', {
        method: 'GET'
      });
      let data = await response.json();
      document.getElementById('market-analysis').innerText = data.analysis;
    } catch (error) {
      console.error('Error fetching market analysis:', error);
    }
  }

  // Example function for generating personalized marketing content
  async function generatePersonalizedCampaign() {
    try {
      let response = await fetch('/api/naoai/personalized_campaign', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ customer_id: '12345', preferences: { language: 'en' } })
      });
      let data = await response.json();
      document.getElementById('campaign-output').innerText = data.campaign;
    } catch (error) {
      console.error('Error generating campaign:', error);
    }
  }

  // Hook these functions to buttons or events in the widget
  document.getElementById('get-analysis-btn').addEventListener('click', getMarketAnalysis);
  document.getElementById('generate-campaign-btn').addEventListener('click', generatePersonalizedCampaign);
});
EOL

# Ensure proper HTML files are available for the widget
echo "Setting up HTML files for widget..."
cat <<EOL > frontend/widget/generate_widget.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/widgets.css">
  <title>NAOAI Widget</title>
</head>
<body>
  <div class="widget-container">
    <h1>NAOAI Marketing Assistant</h1>

    <button id="get-analysis-btn">Get Market Analysis</button>
    <div id="market-analysis"></div>

    <button id="generate-campaign-btn">Generate Personalized Campaign</button>
    <div id="campaign-output"></div>
  </div>

  <script src="js/widget_interaction.js"></script>
</body>
</html>
EOL

# Set up CSS styles for the widget
echo "Setting up CSS files for styling the widget..."
cat <<EOL > frontend/widget/css/widgets.css
/* Basic styles for the NAOAI widget */
body {
  font-family: Arial, sans-serif;
  background-color: #f9f9f9;
}

.widget-container {
  width: 400px;
  margin: 50px auto;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ddd;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

button {
  padding: 10px 20px;
  margin-top: 20px;
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

#market-analysis, #campaign-output {
  margin-top: 20px;
  font-size: 14px;
  color: #333;
}
EOL

# Check if API routes are set up for NAOAI interactions
echo "Ensuring API routes for NAOAI interactions are defined..."
# Updated path for api.py under /workspaces/NAO-AI/src/nao_ai_module/api/api.py
cat <<EOL > /workspaces/NAO-AI/src/nao_ai_module/api/api.py
from flask import Flask, jsonify, request

app = Flask(__name__)

# Example route for real-time market analysis
@app.route('/api/naoai/real_time_analysis', methods=['GET'])
def real_time_analysis():
    # Placeholder for actual analysis logic
    data = {"analysis": "Real-time market analysis data from NAOAI"}
    return jsonify(data)

# Example route for generating a personalized campaign
@app.route('/api/naoai/personalized_campaign', methods=['POST'])
def personalized_campaign():
    # Placeholder for personalized campaign generation
    customer_data = request.json
    campaign = {"campaign": f"Generated campaign for customer {customer_data['customer_id']}"}
    return jsonify(campaign)

if __name__ == '__main__':
    app.run(debug=True)
EOL

echo "Widget and API interaction setup completed!"
