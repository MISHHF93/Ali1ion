cat << 'EOF' > build/deployment/prod/deploy_prod.sh
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

# Install/update dependencies
echo "Installing/updating dependencies..."
npm install || {
    echo "npm install failed."
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
EOF
