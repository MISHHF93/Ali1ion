#!/usr/bin/env python3
import unittest
from src.campaign_management.campaign_creation import create_campaign

class TestCampaignCreation(unittest.TestCase):

    def test_create_campaign(self):
        """
        Simulates creating a campaign and checks the output.
        """
        campaign_name = "Test Campaign"
        budget = "$7860"
        target_audience = "Age 18-35, Tech Enthusiasts"
        print(f"Creating campaign with name: {campaign_name}, budget: {budget}, target: {target_audience}")
        result = create_campaign(campaign_name, budget, target_audience)
        self.assertIn("Campaign has been created", result)


if __name__ == "__main__":
    unittest.main()
