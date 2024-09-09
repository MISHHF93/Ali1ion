#!/bin/bash

# Set the base directory of the project
BASE_DIR="/workspaces/NAO-AI/src"

# Create necessary directories in the nao_ai_module
echo "Creating necessary directories..."
mkdir -p $BASE_DIR/nao_ai_module/nao_ai_app/api

# Move Python app from application_integration/backend_services to nao_ai_module/nao_ai_app/api
if [ -d "$BASE_DIR/application_integration/backend_services/python_app" ]; then
    echo "Moving Python app to nao_ai_module..."
    mv $BASE_DIR/application_integration/backend_services/python_app/main.py $BASE_DIR/nao_ai_module/nao_ai_app/api/api.py
else
    echo "Python app not found in backend_services. Skipping."
fi

# Move core functions (nao_ai_functions.py) to nao_ai_module/nao_ai_app
if [ -f "$BASE_DIR/nao_ai_module/nao_ai_app/nao_ai_functions.py" ]; then
    echo "nao_ai_functions.py already in place. Skipping."
else
    echo "Moving nao_ai_functions.py to nao_ai_module..."
    mv $BASE_DIR/application_integration/backend_services/python_app/nao_ai_functions.py $BASE_DIR/nao_ai_module/nao_ai_app/
fi

# Clean up old directories if they are empty
if [ -d "$BASE_DIR/application_integration/backend_services/python_app" ]; then
    echo "Cleaning up old directories..."
    rm -rf $BASE_DIR/application_integration/backend_services/python_app
fi

# Optional: Clean up other parts of application_integration if no longer needed
if [ -d "$BASE_DIR/application_integration/backend_services" ]; then
    echo "Cleaning up backend_services if no longer needed..."
    rm -rf $BASE_DIR/application_integration/backend_services
fi

# Output the new structure
echo "New project structure:"
tree $BASE_DIR/nao_ai_module

echo "Consolidation complete."
