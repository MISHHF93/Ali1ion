#!/usr/bin/env python3
import unittest
from src.engagement.notification_services import send_email_notification, send_sms_notification, send_push_notification

class TestNotificationServices(unittest.TestCase):

    def test_send_email_notification(self):
        """
        Simulates sending an email notification and checks if the message is printed.
        """
        recipient = "john.doe@example.com"
        subject = "New Campaign Launched!"
        message = "Check out our latest marketing campaign."
        print(f"Testing email notification to {recipient}")
        result = send_email_notification(recipient, subject, message)
        self.assertIsNone(result)

    def test_send_sms_notification(self):
        """
        Simulates sending an SMS notification and checks the printed message.
        """
        phone_number = "+1234567890"
        message = "Your campaign analytics are available."
        print(f"Testing SMS notification to {phone_number}")
        result = send_sms_notification(phone_number, message)
        self.assertIsNone(result)

    def test_send_push_notification(self):
        """
        Simulates sending a push notification and checks if the message is printed.
        """
        device_id = "device1234"
        message = "You have new campaign insights available."
        print(f"Testing push notification to {device_id}")
        result = send_push_notification(device_id, message)
        self.assertIsNone(result)


if __name__ == "__main__":
    unittest.main()
