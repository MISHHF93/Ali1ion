import unittest
from src.nao_ai_module.nao_ai_functions import openai_request

class TestNaoAiFunctions(unittest.TestCase):
    def test_openai_request(self):
        prompt = "Say hello"
        response = openai_request(prompt)
        self.assertIsNotNone(response)
        self.assertIsInstance(response, str)

if __name__ == '__main__':
    unittest.main()
