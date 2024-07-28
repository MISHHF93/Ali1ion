#!/bin/bash

# Update and upgrade the package list
sudo apt-get update && sudo apt-get upgrade -y

# Install necessary packages
sudo apt-get install -y python3 python3-venv python3-pip git

# Clone the project repository (Assuming there's a repository to clone)
# Replace the URL with the actual repository URL
git clone https://github.com/MISHHF93/nao-ai-project.git /home/mishari_borah/nao-ai-function

# Navigate to the project directory
cd /home/mishari_borah/nao-ai-function/compute-resources/compute-engine/

# Set up a Python virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install required Python packages
pip install -r /home/mishari_borah/nao-ai-function/compute-resources/compute-engine/requirements.txt

# Start the Python application
# Replace `app.py` with your actual application entry point if different
python3 /home/mishari_borah/nao-ai-function/compute-resources/compute-engine/app.py &

# Print success message
echo "Startup script completed successfully"

