import requests
import json

# Replace with your actual API key
HUBSPOT_API_KEY = 'YOUR_HUBSPOT_API_KEY'

class HubSpotIntegration:
    def __init__(self, api_key):
        self.api_key = api_key
        self.base_url = "https://api.hubapi.com"

    def get_headers(self):
        return {
            "Content-Type": "application/json",
            "Authorization": f"Bearer {self.api_key}"
        }

    def create_contact(self, email, first_name, last_name):
        url = f"{self.base_url}/contacts/v1/contact"
        data = {
            "properties": [
                {"property": "email", "value": email},
                {"property": "firstname", "value": first_name},
                {"property": "lastname", "value": last_name}
            ]
        }
        response = requests.post(url, headers=self.get_headers(), data=json.dumps(data))
        return response.json()

    def update_contact(self, contact_id, properties):
        url = f"{self.base_url}/contacts/v1/contact/vid/{contact_id}/profile"
        data = {"properties": properties}
        response = requests.post(url, headers=self.get_headers(), data=json.dumps(data))
        return response.json()

    def get_contact_by_email(self, email):
        url = f"{self.base_url}/contacts/v1/contact/email/{email}/profile"
        response = requests.get(url, headers=self.get_headers())
        return response.json()

    def delete_contact(self, contact_id):
        url = f"{self.base_url}/contacts/v1/contact/vid/{contact_id}"
        response = requests.delete(url, headers=self.get_headers())
        return response.status_code

    def get_contacts(self):
        url = f'{self.base_url}/contacts/v1/lists/all/contacts/all?hapikey={self.api_key}'
        response = requests.get(url)
        if response.status_code == 200:
            contacts = response.json()
            return contacts
        else:
            print(f"Error: {response.status_code}")
            return None

    def create_contact_api_key(self, email, first_name, last_name):
        url = f'{self.base_url}/contacts/v1/contact?hapikey={self.api_key}'
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

    def update_contact_api_key(self, contact_id, email=None, first_name=None, last_name=None):
        url = f'{self.base_url}/contacts/v1/contact/vid/{contact_id}/profile?hapikey={self.api_key}'
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

    def delete_contact_api_key(self, contact_id):
        url = f'{self.base_url}/contacts/v1/contact/vid/{contact_id}?hapikey={self.api_key}'
        response = requests.delete(url)
        if response.status_code == 204:
            print("Contact deleted successfully.")
            return True
        else:
            print(f"Error: {response.status_code}")
            return False

if __name__ == "__main__":
    hubspot = HubSpotIntegration(HUBSPOT_API_KEY)

    # Example usage
    contacts = hubspot.get_contacts()
    if contacts:
        print("Contacts retrieved successfully.")
    contact = hubspot.create_contact_api_key("newemail@example.com", "New", "Contact")
    if contact:
        print("New contact created:", contact)
    updated = hubspot.update_contact_api_key(contact['vid'], first_name="Updated")
    if updated:
        print("Contact updated.")
    deleted = hubspot.delete_contact_api_key(contact['vid'])
    if deleted:
        print("Contact deleted.")
