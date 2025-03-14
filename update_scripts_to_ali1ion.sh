#!/bin/bash

# create_update_scripts.sh - Script to update all Ali1ion references in scripts to Ali1ion

echo "Starting script update process..."

# 1. Create a backup of scripts if not already done
if [ ! -d "./scripts_backup" ]; then
  echo "Creating backup of scripts directory..."
  cp -r ./scripts ./scripts_backup
  if [ -f "./setup_frontend_structure.sh" ]; then
    cp ./setup_frontend_structure.sh ./setup_frontend_structure.sh.backup
  fi
  echo "Backup created."
fi

# 2. Update all script files specifically
echo "Updating script files..."
find . -name "*.sh" | xargs grep -l "nao[-_]ai\|NAO[-_]AI" | while read file; do
  echo "Processing $file..."
  sed -i 's/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g' "$file"
done

# 3. Check for any Python or JavaScript import statements that might reference the old module
echo "Updating import statements in scripts..."
find . -name "*.sh" | xargs grep -l "ali1ion_module\|Ali1ion_MODULE" | while read file; do
  echo "Updating imports in $file..."
  sed -i 's/ali1ion_module/ali1ion_module/g; s/Ali1ion_MODULE/Ali1ion_MODULE/g' "$file"
done

# 4. Check for any Docker or Kubernetes references
echo "Checking for container references in scripts..."
find . -name "*.sh" | xargs grep -l "ali1ion\|Ali1ion" | while read file; do
  echo "Updating container references in $file..."
  sed -i 's/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g' "$file"
done

echo "Script update process completed successfully."