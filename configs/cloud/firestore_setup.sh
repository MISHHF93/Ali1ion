cat << 'EOF' > /home/mishari_borah/nao_ai_project/configs/cloud/firestore_setup.sh
#!/bin/bash

# Variables
PROJECT_ID="proverbial-will-427815-r9"
COLLECTION_NAME="sample_collection"
DOCUMENT_NAME="sample_document"

# Enable Firestore API
echo "Enabling Firestore API..."
gcloud services enable firestore.googleapis.com --project=$PROJECT_ID

# Check if the Firestore database already exists
echo "Checking if Firestore database exists..."
if gcloud firestore databases describe --project=$PROJECT_ID --format="value(name)" > /dev/null 2>&1; then
  echo "Firestore database already exists."
else
  echo "Creating Firestore database..."
  gcloud firestore databases create --location=me-central1 --project=$PROJECT_ID
fi

# Create Firestore collection and add a sample document using Python
echo "Creating Firestore collection and adding a sample document..."
python3 /home/mishari_borah/nao_ai_project/src/storage_databases/firestore/add_sample_document.py

echo "Firestore setup complete."

# Function to create Firestore indexes
create_indexes() {
  echo "Creating Firestore indexes..."
  # Example of creating an index
  gcloud firestore indexes composite create --collection-group="YOUR_COLLECTION" \
    --field-config field-path="YOUR_FIELD_PATH",order="ASCENDING" \
    --field-config field-path="ANOTHER_FIELD_PATH",order="DESCENDING"
}

# Function to set up Firestore rules
setup_rules() {
  echo "Setting up Firestore rules..."
  # Example of setting rules from a local file
  gcloud firestore security-rules update /path/to/your/firestore.rules
}

# Function to add initial data to Firestore
add_initial_data() {
  echo "Adding initial data to Firestore..."
  # Example of adding a document
  gcloud firestore documents create YOUR_COLLECTION/DOCUMENT_ID \
    --data '{"key1": "value1", "key2": "value2"}'
}

# Main script execution
echo "Starting Firestore setup..."
create_indexes
setup_rules
add_initial_data
echo "Firestore setup completed successfully."
EOF
