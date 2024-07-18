# pubsub_listener.py

import os
from google.cloud import pubsub_v1

# Set Google Cloud credentials
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/path/to/your/credentials.json"

# Define Pub/Sub project and subscription
project_id = "your-project-id"
subscription_id = "your-subscription-id"

def callback(message):
    print(f"Received message: {message.data}")
    if message.attributes:
        print("Attributes:")
        for key, value in message.attributes.items():
            print(f"{key}: {value}")
    # Acknowledge the message
    message.ack()

def listen_for_messages():
    subscriber = pubsub_v1.SubscriberClient()
    subscription_path = subscriber.subscription_path(project_id, subscription_id)

    streaming_pull_future = subscriber.subscribe(subscription_path, callback=callback)
    print(f"Listening for messages on {subscription_path}...")

    try:
        streaming_pull_future.result()
    except KeyboardInterrupt:
        streaming_pull_future.cancel()

if __name__ == "__main__":
    listen_for_messages()
