import firebase_admin
from firebase_admin import credentials, firestore

# Path to your service account key file
cred_path = "path/to/your/serviceAccountKey.json"

# Initialize the Firebase app with service account credentials
cred = credentials.Certificate(cred_path)
firebase_admin.initialize_app(cred)

# Get a reference to the Firestore service
db = firestore.client()

# Define the Firestore database name
database_name = "nao-ai-database"

# Define a sample document
sample_data = {
    "name": "John Doe",
    "email": "johndoe@example.com",
    "age": 30
}

# Add the sample document to the 'users' collection in the specified database
doc_ref = db.collection(database_name).document("john_doe")
doc_ref.set(sample_data)

print(f"Sample document added to Firestore database '{database_name}' successfully.")
