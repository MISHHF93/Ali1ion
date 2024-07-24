import firebase_admin
from firebase_admin import credentials, firestore

# Path to your service account key file
SERVICE_ACCOUNT_KEY = "/path/to/your/service-account-file.json"

# Initialize the Firestore client
cred = credentials.Certificate(SERVICE_ACCOUNT_KEY)
firebase_admin.initialize_app(cred)

# Create a Firestore client
db = firestore.client()

# Variables
COLLECTION_NAME = "sample_collection"
DOCUMENT_NAME = "sample_document"

# Add a sample document
doc_ref = db.collection(COLLECTION_NAME).document(DOCUMENT_NAME)
doc_ref.set({
    'name': 'NAO-AI',
    'description': 'Sample Firestore document'
})

print(f"Document {DOCUMENT_NAME} added to collection {COLLECTION_NAME}")
