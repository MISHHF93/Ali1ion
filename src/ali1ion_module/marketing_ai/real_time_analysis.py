#!/usr/bin/env python3

def analyze_campaign_performance(campaign_name, clicks, impressions, conversions):
    """
    Simulates real-time analysis of a marketing campaign.
    """
    print(f"Analyzing real-time performance for campaign: {campaign_name}")
    
    ctr = (clicks / impressions) * 100 if impressions > 0 else 0
    conversion_rate = (conversions / clicks) * 100 if clicks > 0 else 0

    print(f"Click-Through Rate (CTR): {ctr:.2f}%")
    print(f"Conversion Rate: {conversion_rate:.2f}%")
    print(f"Total Clicks: {clicks}")
    print(f"Total Impressions: {impressions}")
    print(f"Total Conversions: {conversions}\n")

    print("Real-time analysis complete.\n")


if __name__ == "__main__":
    # Simulate data for a live campaign
    campaign_name = "Winter Holiday Promo"
    clicks = 7860
    impressions = 7860
    conversions = 180

    # Echo the real-time analysis
    analyze_campaign_performance(campaign_name, clicks, impressions, conversions)
