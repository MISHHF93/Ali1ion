#!/bin/bash

# Exit on any error
set -e

# Define paths
FRONTEND_DIR="./frontend"
BACKEND_DIR="./src" # Modify this path if your backend is in a different directory

# Step 1: Set up the .env file for environment variables
echo "Setting up environment variables..."

# Check if .env file exists
if [ ! -f ".env" ]; then
  echo ".env file not found, creating a new one..."
  touch .env
  # Add your environment variables
  cat <<EOT >> .env
# .env - Environment Configuration for NAO-AI Project

# General settings
APP_NAME="NAO-AI"
ENVIRONMENT="development"
DEBUG="True"
SKIP_PREFLIGHT_CHECK=true

# Server settings
HOST="0.0.0.0"
PORT="7860"

# PostgreSQL Database settings
DB_ENGINE="django.db.backends.postgresql"
DB_NAME="nao_ai_db"
DB_USER="nao_ai_user"
DB_PASSWORD="7860"
DB_HOST="127.0.0.1"
DB_PORT="7860"
DATABASE_URL="postgresql://nao_ai_user:7860@127.0.0.1:7860/nao_ai_db"

# Security settings
SECRET_KEY="s3cure_and_un1que_key"  # Replace this with your secure key

# OpenAI API Key for integration
OPENAI_API_KEY="your_openai_api_key_here"  # Replace this with your actual OpenAI API key

# NAO-AI Model API settings
MODEL_API_URL="https://platform.openai.com/assistants/asst_8Q8CNm5hzJi2ynbC9mSmSOHf"
MODEL_API_KEY="sk-proj-UgyvOY6W4dOe16ogKcZWT3BlbkFJk70y2k9tCs21Ry27oAq4"

# Email settings (for sending email notifications)
EMAIL_HOST="smtp.gmail.com"
EMAIL_PORT="587"
EMAIL_HOST_USER="masharaiborah@gmail.com"
EMAIL_HOST_PASSWORD="your_email_password_here"  # Replace with your email app password
EMAIL_USE_TLS="True"

# Logging and monitoring settings
LOG_LEVEL="DEBUG"

# Kubernetes settings (if applicable)
K8S_NAMESPACE="default"
K8S_DEPLOYMENT_NAME="nao-ai-deployment"

# Custom environment variables
CUSTOM_VAR_1="value1"
CUSTOM_VAR_2="value2"

# Additional environment variables needed for tests
BUCKET_NAME="nao-ai"
PROJECT_ID="forward-dream-436204-t3"
VPC_NAME="your_vpc_name"  # Replace with your VPC name if needed
SUBNET_NAME="your_subnet_name"  # Replace with your Subnet name if needed
NAO_AI_INSTANCE="nao-ai-instance"
EOT
  echo ".env file created with placeholder values. Please update sensitive data appropriately."
else
  echo ".env file already exists."
fi

# Step 2: Install frontend dependencies
echo "Setting up frontend..."
cd $FRONTEND_DIR

# Check if node_modules already exist
if [ -d "node_modules" ]; then
  echo "node_modules found. Skipping npm install..."
else
  echo "Installing frontend dependencies..."
  npm install --legacy-peer-deps
fi

# Fix vulnerabilities (optional, but recommended)
npm audit fix || echo "Some vulnerabilities may need manual review."

# Check if index.js exists
if [ ! -f "src/index.js" ]; then
  echo "index.js not found in src/. Please create an index.js file to proceed."
  exit 1
fi

# Build frontend (optional, depending on whether it needs to be built beforehand)
echo "Building frontend..."
npm run build

cd ..
