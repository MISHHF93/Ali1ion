#!/usr/bin/env python3

def respond_to_customer(customer_query):
    """
    Simulates a customer engagement bot responding to queries.
    """
    print(f"Customer query: {customer_query}")
    
    # Simulate a response based on customer query
    if "discount" in customer_query.lower():
        response = "We have a 20% discount on our latest offers! Would you like to know more?"
    elif "help" in customer_query.lower():
        response = "I'm here to help! How can I assist you today?"
    else:
        response = "Thank you for reaching out! Can I help you with information about our current campaigns or promotions?"

    print(f"Bot response: {response}\n")
    return response


def log_engagement(customer_query, bot_response):
    """
    Simulates logging the customer engagement for future analysis.
    """
    print(f"Logging customer engagement: Query: {customer_query}, Response: {bot_response}")
    print("Engagement logged successfully.\n")


if __name__ == "__main__":
    # Simulate a customer query
    customer_query = "Can you tell me about any discounts?"

    # Respond to the customer and log the interaction
    bot_response = respond_to_customer(customer_query)
    log_engagement(customer_query, bot_response)
