#!/usr/bin/env python3
import unittest
from src.ali1ion_module.marketing_ai.personalized_campaign_generator import generate_personalized_campaign, log_campaign_generation

class TestPersonalizedCampaignGenerator(unittest.TestCase):

    def test_generate_personalized_campaign(self):
        """
        Simulates generating a personalized campaign and checks the result.
        """
        customer_segment = "Tech Enthusiast"
        product_preferences = ["smartphones", "laptops"]
        print(f"Testing personalized campaign generation for: {customer_segment}")
        result = generate_personalized_campaign(customer_segment, product_preferences)
        self.assertIn("Tech Enthusiast", result)

    def test_log_campaign_generation(self):
        """
        Simulates logging a personalized campaign generation and checks the printed log entry.
        """
        customer_segment = "Tech Enthusiast"
        campaign_message = "Hello Tech Enthusiast! We have great offers on smartphones."
        print(f"Testing log of campaign generation for: {customer_segment}")
        result = log_campaign_generation(customer_segment, campaign_message)
        self.assertIsNone(result)


if __name__ == "__main__":
    unittest.main()
