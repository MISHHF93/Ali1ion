#!/usr/bin/env python3
import unittest
from src.data_privacy.data_anonymization_tool import anonymize_data

class TestDataAnonymization(unittest.TestCase):

    def test_anonymize_data(self):
        """
        Simulates data anonymization and checks if sensitive fields are anonymized.
        """
        user_data = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "phone": "+1234567890",
            "address": "123 Main St",
            "purchase_history": ["item1", "item2", "item3"]
        }
        print(f"Anonymizing data for user: {user_data['name']}")
        anonymized_data = anonymize_data(user_data)
        self.assertEqual(anonymized_data['name'], "ANONYMIZED")
        self.assertEqual(anonymized_data['email'], "ANONYMIZED")
        self.assertEqual(anonymized_data['phone'], "ANONYMIZED")
        self.assertNotEqual(anonymized_data['address'], "ANONYMIZED")


if __name__ == "__main__":
    unittest.main()
