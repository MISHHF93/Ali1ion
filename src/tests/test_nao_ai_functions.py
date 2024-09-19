import unittest
from src.nao_ai_module.nao_ai_functions import openai_request

class TestNaoAiFunctions(unittest.TestCase):
    def test_openai_request(self):
        # Arrange
        prompt = "Say hello"
        
        # Act
        response = openai_request(prompt)
        
        # Assert
        self.assertIsNotNone(response, "The response should not be None")
        self.assertIsInstance(response, str, "The response should be a string")

if __name__ == '__main__':
    unittest.main()
