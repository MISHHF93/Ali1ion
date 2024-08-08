#!/bin/bash

echo "Starting production deployment..."

# Navigate to the project directory
cd /home/mishari_borah/nao_ai_project || {
    echo "Failed to change directory to project root."
    exit 1
}

# Pull the latest changes from the repository
echo "Pulling latest changes from repository..."
git pull origin main || {
    echo "Failed to pull latest changes."
    exit 1
}

# Set up the virtual environment
echo "Setting up virtual environment..."
python3.9 -m venv venv || {
    echo "Failed to create virtual environment."
    exit 1
}
source venv/bin/activate || {
    echo "Failed to activate virtual environment."
    exit 1
}

# Install/update dependencies
echo "Installing/updating dependencies..."
pip install --upgrade pip || {
    echo "Failed to upgrade pip."
    exit 1
}
pip install -r requirements.txt || {
    echo "pip install failed."
    exit 1
}

# Run database migrations
echo "Running database migrations..."
python manage.py migrate || {
    echo "Database migrations failed."
    exit 1
}

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput || {
    echo "Collecting static files failed."
    exit 1
}

# Restart the application server (adjust command as per the server setup)
echo "Restarting the application server..."
sudo systemctl restart my_app.service || {
    echo "Failed to restart application server."
    exit 1
}

echo "Production deployment completed successfully."
