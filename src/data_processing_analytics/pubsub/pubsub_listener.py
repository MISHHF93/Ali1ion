import os
from google.cloud import pubsub_v1

# Set up environment variable for authentication
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/path/to/your/service-account-file.json"

# Initialize Pub/Sub client
subscriber = pubsub_v1.SubscriberClient()

# Define subscription path
subscription_path = 'projects/your-project-id/subscriptions/your-subscription-name'

def callback(message):
    print(f'Received message: {message.data}')
    message.ack()

# Subscribe to the subscription and listen for messages
streaming_pull_future = subscriber.subscribe(subscription_path, callback=callback)
print(f'Listening for messages on {subscription_path}...')

try:
    streaming_pull_future.result()
except KeyboardInterrupt:
    streaming_pull_future.cancel()
