
#!/bin/bash

# Ensure the script is run from the correct directory
if [ ! -d "frontend" ]; then
  echo "Please run this script from the root of the project directory."
  exit 1
fi

# Backup the current structure before making final changes
if [ ! -d "backup_final_frontend_optimization" ]; then
  echo "Creating backup of current frontend structure..."
  cp -r frontend backup_final_frontend_optimization
  echo "Backup created at 'backup_final_frontend_optimization'."
else
  echo "Backup already exists."
fi

# Removing unnecessary JS files
echo "Removing unnecessary JS files..."
rm frontend/nao-ai-widget/assets/js/autocomplete.js
rm frontend/nao-ai-widget/assets/js/unusable_password_field.js

# Optionally remove theme.js if it is not used
if grep -q 'theme.js' frontend/nao-ai-widget/templates/index.html; then
  echo "'theme.js' is in use, keeping it in the project."
else
  echo "'theme.js' is not in use, removing it..."
  rm frontend/nao-ai-widget/assets/js/theme.js
fi

echo "Final structure optimization completed successfully!"
