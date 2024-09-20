#!/usr/bin/env python3
import unittest
from src.engagement.chatbot_integration import chatbot_response, log_chat_interaction

class TestChatbotIntegration(unittest.TestCase):

    def test_chatbot_response(self):
        """
        Simulates chatbot response to a user message and checks if the correct response is generated.
        """
        user_message = "Tell me about the latest campaign."
        print(f"Testing chatbot response to user message: {user_message}")
        response = chatbot_response(user_message)
        self.assertIn("asking about campaigns", response)

    def test_log_chat_interaction(self):
        """
        Simulates logging chatbot interaction and ensures the log entry is printed.
        """
        user_message = "Tell me about the latest campaign."
        bot_response = "I see you're asking about campaigns."
        print(f"Testing log of chatbot interaction for message: {user_message}")
        result = log_chat_interaction(user_message, bot_response)
        self.assertIsNone(result)


if __name__ == "__main__":
    unittest.main()
