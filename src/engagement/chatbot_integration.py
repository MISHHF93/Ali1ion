#!/usr/bin/env python3

def chatbot_response(user_message):
    """
    Simulates a chatbot generating a response based on user input.
    """
    print(f"User message: {user_message}")
    
    # Simulating a response based on the input message
    if "campaign" in user_message.lower():
        response = "I see you're asking about campaigns. How can I assist you with campaign management today?"
    elif "analytics" in user_message.lower():
        response = "I can provide real-time analytics. What specific data would you like to see?"
    else:
        response = "I'm here to help! You can ask me about campaigns, analytics, or marketing insights."

    print(f"Chatbot response: {response}\n")
    return response


def log_chat_interaction(user_message, bot_response):
    """
    Simulates logging the chatbot interaction for future reference or analytics.
    """
    print(f"Logging interaction: User Message: {user_message}, Bot Response: {bot_response}")
    print("Interaction logged successfully.\n")


if __name__ == "__main__":
    # Simulate a user input to the chatbot
    user_message = "Can you show me the latest campaign performance?"

    # Generate and log the chatbot's response
    bot_response = chatbot_response(user_message)
    log_chat_interaction(user_message, bot_response)
