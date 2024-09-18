#!/bin/bash

# Define source and target paths
SRC_DIR="./frontend/widget"
TARGET_DIR="./frontend/nao-ai-widget"

# Create the new folder structure
echo "Creating new folder structure for NAO-AI..."
mkdir -p $TARGET_DIR/assets/css
mkdir -p $TARGET_DIR/assets/fonts
mkdir -p $TARGET_DIR/assets/images
mkdir -p $TARGET_DIR/assets/js
mkdir -p $TARGET_DIR/templates
mkdir -p $TARGET_DIR/components
mkdir -p $TARGET_DIR/config

# Move CSS files
echo "Moving CSS files..."
mv $SRC_DIR/css/*.css $TARGET_DIR/assets/css/

# Move Fonts files
echo "Moving font files..."
mv $SRC_DIR/fonts/* $TARGET_DIR/assets/fonts/

# Move Images
echo "Moving image files..."
mv $SRC_DIR/images/* $TARGET_DIR/assets/images/

# Move JavaScript files
echo "Moving JS files..."
mv $SRC_DIR/js/*.js $TARGET_DIR/assets/js/

# Move HTML templates
echo "Moving HTML template files..."
mv $SRC_DIR/generate_widget.html $TARGET_DIR/templates/
mv $SRC_DIR/index.html $TARGET_DIR/templates/
mv $SRC_DIR/generate_text.html $TARGET_DIR/templates/
mv $SRC_DIR/generate_image.html $TARGET_DIR/templates/

# Create common components (header, footer, sidebar)
echo "Creating component HTML files..."
echo "<!-- Header HTML -->" > $TARGET_DIR/components/header.html
echo "<!-- Footer HTML -->" > $TARGET_DIR/components/footer.html
echo "<!-- Sidebar HTML -->" > $TARGET_DIR/components/sidebar.html

# Create config file for API settings
echo "Creating config file..."
echo "// API configuration for NAO-AI" > $TARGET_DIR/config/api_config.js
echo "const API_ENDPOINT = 'https://api.openai.com/v1';" >> $TARGET_DIR/config/api_config.js
echo "const API_KEY = 'YOUR_OPENAI_API_KEY';" >> $TARGET_DIR/config/api_config.js

# Remove empty old directories if they exist
echo "Cleaning up old directories..."
rm -rf $SRC_DIR/css
rm -rf $SRC_DIR/fonts
rm -rf $SRC_DIR/images
rm -rf $SRC_DIR/js

# Final message
echo "Frontend restructuring complete! The new structure is ready in $TARGET_DIR"
