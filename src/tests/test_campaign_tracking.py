#!/usr/bin/env python3
import unittest
from src.campaign_management.campaign_tracking import track_campaign

class TestCampaignTracking(unittest.TestCase):

    def test_track_campaign(self):
        """
        Simulates tracking a campaign and checks the tracking report.
        """
        campaign_name = "Super Summer Sale"
        status = "Active"
        clicks = 7860
        conversions = 237
        print(f"Tracking campaign: {campaign_name} with status: {status}")
        result = track_campaign(campaign_name, status, clicks, conversions)
        self.assertIn("Campaign tracking update completed", result)


if __name__ == "__main__":
    unittest.main()
