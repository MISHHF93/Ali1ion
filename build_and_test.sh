#!/bin/bash

# Function to install pytest if not already installed
install_pytest() {
    if ! command -v pytest &> /dev/null; then
        echo "pytest is not installed. Installing pytest..."
        pip install pytest
        if [ $? -ne 0 ]; then
            echo "Failed to install pytest. Please install it manually and try again."
            exit 1
        fi
    fi
}

# Start build and test process
echo "Starting build and test process..."

# Ensure necessary directories exist
echo "Ensuring necessary directories exist..."
mkdir -p build/ci build/deployment/prod build/deployment/staging static/cdn_cgi

# Create CI configuration files if they don't exist
echo "Creating CI configuration files if they don't exist..."
[ ! -f build/ci/.travis.yml ] && touch build/ci/.travis.yml
[ ! -f build/ci/circle.yml ] && touch build/ci/circle.yml
[ ! -f build/ci/Jenkinsfile ] && touch build/ci/Jenkinsfile

# Create deployment scripts if they don't exist
echo "Creating deployment scripts if they don't exist..."
[ ! -f build/deployment/prod/deploy_prod.sh ] && cat <<EOT >> build/deployment/prod/deploy_prod.sh
#!/bin/bash
# Deployment script for production
echo "Deploying to production..."
# Add your deployment commands here
EOT

[ ! -f build/deployment/staging/deploy_staging.sh ] && cat <<EOT >> build/deployment/staging/deploy_staging.sh
#!/bin/bash
# Deployment script for staging
echo "Deploying to staging..."
# Add your deployment commands here
EOT

# Make deployment scripts executable
chmod +x build/deployment/prod/deploy_prod.sh
chmod +x build/deployment/staging/deploy_staging.sh

# Create missing static files
echo "Creating missing static files..."
[ ! -f static/cdn_cgi/trace ] && touch static/cdn_cgi/trace
[ ! -f static/favicon.ico ] && touch static/favicon.ico

# Install dependencies
echo "Installing dependencies..."
npm install
pip install -r requirements.txt

# Install pytest if not already installed
install_pytest

# Run tests
echo "Running tests..."
pytest src/tests

echo "Build and test process completed successfully."
