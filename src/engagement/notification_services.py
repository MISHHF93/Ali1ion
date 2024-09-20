#!/usr/bin/env python3

def send_email_notification(recipient, subject, message):
    """
    Simulates sending an email notification.
    """
    print(f"Sending email to: {recipient}")
    print(f"Subject: {subject}")
    print(f"Message: {message}")
    print("Email sent successfully.\n")


def send_sms_notification(phone_number, message):
    """
    Simulates sending an SMS notification.
    """
    print(f"Sending SMS to: {phone_number}")
    print(f"Message: {message}")
    print("SMS sent successfully.\n")


def send_push_notification(device_id, message):
    """
    Simulates sending a push notification.
    """
    print(f"Sending push notification to device: {device_id}")
    print(f"Message: {message}")
    print("Push notification sent successfully.\n")


if __name__ == "__main__":
    # Simulate sending different types of notifications

    # Email notification
    send_email_notification(
        recipient="john.doe@example.com",
        subject="New Campaign Launched!",
        message="Check out our latest marketing campaign."
    )

    # SMS notification
    send_sms_notification(
        phone_number="+1234567890",
        message="Your campaign analytics are available."
    )

    # Push notification
    send_push_notification(
        device_id="device1234",
        message="You have new campaign insights available."
    )
