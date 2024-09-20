#!/usr/bin/env python3

def anonymize_data(user_data):
    """
    Simulates data anonymization by masking sensitive fields.
    """
    print("Starting data anonymization process...")
    
    anonymized_data = {}
    for key, value in user_data.items():
        if key in ["name", "email", "phone"]:
            anonymized_data[key] = "ANONYMIZED"
        else:
            anonymized_data[key] = value

    print("Anonymization complete:")
    print(anonymized_data)
    print("\nData anonymization finished successfully.\n")
    return anonymized_data


if __name__ == "__main__":
    # Simulate a user data dictionary that needs to be anonymized
    user_data = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "phone": "+1234567890",
        "address": "123 Main St",
        "purchase_history": ["item1", "item2", "item3"]
    }

    # Echo the anonymization process
    anonymize_data(user_data)
