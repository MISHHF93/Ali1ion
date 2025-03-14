# 1. First, create a backup of your project
cp -r ./project_directory ./project_directory_backup

# 2. Replace in file contents (case-insensitive to catch all variations)
find . -type f -not -path "*/\.*" -not -path "*/node_modules/*" -not -path "*/build/*" -not -path "*/dist/*" | xargs grep -l "nao[-_]ai\|NAO[-_]AI" | xargs sed -i 's/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g'

# 3. Rename directories (starting with deepest paths to avoid renaming issues)
find . -depth -type d -name "*ali1ion*" -o -name "*Ali1ion*" -o -name "*ali1ion*" -o -name "*Ali1ion*" | sort -r | while read dir; do
  newdir=$(echo "$dir" | sed 's/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g')
  mv "$dir" "$newdir"
done

# 4. Rename files
find . -type f -name "*ali1ion*" -o -name "*Ali1ion*" -o -name "*ali1ion*" -o -name "*Ali1ion*" | while read file; do
  newfile=$(echo "$file" | sed 's/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g; s/ali1ion/ali1ion/g; s/Ali1ion/Ali1ion/g')
  mv "$file" "$newfile"
done

# 5. Fix specific config file - this is based on seeing a specific config in your tree structure
if [ -f ./configs/cloud/ali1ion-config.yaml ]; then
  mv ./configs/cloud/ali1ion-config.yaml ./configs/cloud/ali1ion-config.yaml
fi