import requests

# Replace with your actual API key
HUBSPOT_API_KEY = 'YOUR_HUBSPOT_API_KEY'

def get_contacts():
    url = f'https://api.hubapi.com/contacts/v1/lists/all/contacts/all?hapikey={HUBSPOT_API_KEY}'
    response = requests.get(url)
    if response.status_code == 200:
        contacts = response.json()
        return contacts
    else:
        print(f"Error: {response.status_code}")
        return None

def create_contact(email, first_name, last_name):
    url = f'https://api.hubapi.com/contacts/v1/contact?hapikey={HUBSPOT_API_KEY}'
    data = {
        "properties": [
            {
                "property": "email",
                "value": email
            },
            {
                "property": "firstname",
                "value": first_name
            },
            {
                "property": "lastname",
                "value": last_name
            }
        ]
    }
    response = requests.post(url, json=data)
    if response.status_code == 200:
        print("Contact created successfully.")
        return response.json()
    else:
        print(f"Error: {response.status_code}")
        return None

def update_contact(contact_id, email=None, first_name=None, last_name=None):
    url = f'https://api.hubapi.com/contacts/v1/contact/vid/{contact_id}/profile?hapikey={HUBSPOT_API_KEY}'
    properties = []
    if email:
        properties.append({"property": "email", "value": email})
    if first_name:
        properties.append({"property": "firstname", "value": first_name})
    if last_name:
        properties.append({"property": "lastname", "value": last_name})
    
    data = {"properties": properties}
    response = requests.post(url, json=data)
    if response.status_code == 204:
        print("Contact updated successfully.")
        return True
    else:
        print(f"Error: {response.status_code}")
        return False

def delete_contact(contact_id):
    url = f'https://api.hubapi.com/contacts/v1/contact/vid/{contact_id}?hapikey={HUBSPOT_API_KEY}'
    response = requests.delete(url)
    if response.status_code == 204:
        print("Contact deleted successfully.")
        return True
    else:
        print(f"Error: {response.status_code}")
        return False

if __name__ == "__main__":
    # Example usage
    contacts = get_contacts()
    if contacts:
        print("Contacts retrieved successfully.")
    contact = create_contact("newemail@example.com", "New", "Contact")
    if contact:
        print("New contact created:", contact)
    updated = update_contact(contact['vid'], first_name="Updated")
    if updated:
        print("Contact updated.")
    deleted = delete_contact(contact['vid'])
    if deleted:
        print("Contact deleted.")
