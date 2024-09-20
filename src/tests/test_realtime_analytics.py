#!/usr/bin/env python3
import unittest
from src.campaign_management.realtime_analytics import generate_realtime_analytics

class TestRealTimeAnalytics(unittest.TestCase):

    def test_generate_realtime_analytics(self):
        """
        Simulates generating real-time analytics and checks the result.
        """
        campaign_name = "Winter Holiday Promo"
        engagement_rate = 15.2
        ctr = 3.5
        roi = 125.4
        print(f"Generating real-time analytics for: {campaign_name}")
        result = generate_realtime_analytics(campaign_name, engagement_rate, ctr, roi)
        self.assertIn("Real-time analytics generation completed", result)


if __name__ == "__main__":
    unittest.main()
