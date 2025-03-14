import unittest
from unittest.mock import patch
from src.ali1ion_module.ali1ion_functions import generate_text

class TestNaoAiFunctions(unittest.TestCase):

    @patch('src.ali1ion_module.ali1ion_functions.openai.ChatCompletion.create')
    def test_openai_request(self, mock_chat_completion):
        """
        Tests the generate_text (openai_request) function with a mock API response.
        """
        # Arrange
        prompt = "Say hello"
        mock_chat_completion.return_value = {
            'choices': [
                {'message': {'content': 'Hello, how can I help you?'}}
            ]
        }

        # Act
        response = generate_text(prompt)

        # Assert
        self.assertIsNotNone(response, "The response should not be None")
        self.assertIsInstance(response, str, "The response should be a string")
        self.assertEqual(response, 'Hello, how can I help you?', "The response should be 'Hello, how can I help you?'")

if __name__ == '__main__':
    unittest.main()
