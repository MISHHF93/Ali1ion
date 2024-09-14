#!/bin/bash

# Define paths for widget module organization
WIDGET_MODULE_PATH="./src/widget_module"
STATIC_PATH="$WIDGET_MODULE_PATH/static"
TEMPLATES_PATH="$WIDGET_MODULE_PATH/templates/widget"
WIDGET_STATIC_CSS="$STATIC_PATH/css"
WIDGET_STATIC_JS="$STATIC_PATH/js"
WIDGET_STATIC_IMAGES="$STATIC_PATH/images"

# Ensure directory structure for widget module
echo "Creating widget module directory structure..."
mkdir -p "$TEMPLATES_PATH"
mkdir -p "$WIDGET_STATIC_CSS"
mkdir -p "$WIDGET_STATIC_JS"
mkdir -p "$WIDGET_STATIC_IMAGES"

# Move widget static files to their new location
echo "Moving static files for the widget..."
mv "./static/widget/css/styles.css" "$WIDGET_STATIC_CSS/"
mv "./static/widget/js/app.js" "$WIDGET_STATIC_JS/"
mv "./static/widget/images/logo.png" "$WIDGET_STATIC_IMAGES/"

# Move widget template files
echo "Moving widget template..."
mv "./src/nao_ai_module/templates/widget/index.html" "$TEMPLATES_PATH/"

# Ensure __init__.py in widget_module
if [ ! -f "$WIDGET_MODULE_PATH/__init__.py" ]; then
    echo "Creating __init__.py for widget module..."
    touch "$WIDGET_MODULE_PATH/__init__.py"
fi

# Add views.py for widget_module if it doesn't exist
if [ ! -f "$WIDGET_MODULE_PATH/views.py" ]; then
    echo "Creating views.py for widget module..."
    cat <<EOL > "$WIDGET_MODULE_PATH/views.py"
from django.shortcuts import render

def widget_view(request):
    return render(request, 'widget/index.html', {})
EOL
fi

# Clean up old static/widget directory
echo "Cleaning up old widget static directory..."
rm -rf "./static/widget"

# Final message
echo "Widget module organization complete!"
