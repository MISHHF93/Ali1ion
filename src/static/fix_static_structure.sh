#!/bin/bash

# Navigate to the /workspaces/NAO-AI/src/static directory
cd /workspaces/NAO-AI/src/static || exit

echo "Cleaning and restructuring static directory..."

# Remove unnecessary nested directories and files
rm -rf widget/css/widget
rm -f widget/images/README.md
rm -f widget/images/manage_images.sh
rm -f static_tree.txt

# Ensure all necessary directories exist
mkdir -p widget/css
mkdir -p widget/js
mkdir -p widget/images

# Move files to correct locations
if [ -f "widget/css/widget/css/styles.css" ]; then
  mv widget/css/widget/css/styles.css widget/css/styles.css
fi

if [ -f "widget/js/widget/js/app.js" ]; then
  mv widget/js/widget/js/app.js widget/js/app.js
fi

if [ -f "widget/images/widget/images/logo.png" ]; then
  mv widget/images/widget/images/logo.png widget/images/logo.png
fi

if [ -f "widget/images/widget/images/placeholder.png" ]; then
  mv widget/images/widget/images/placeholder.png widget/images/placeholder.png
fi

# Remove any empty directories that are no longer needed
rmdir widget/css/widget 2>/dev/null
rmdir widget/images/widget 2>/dev/null
rmdir widget/js/widget 2>/dev/null

# Optionally, remove cdn_cgi if it is not required (uncomment the line below if necessary)
# rm -rf cdn_cgi

echo "Static directory has been successfully cleaned and restructured."
