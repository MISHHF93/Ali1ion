#!/usr/bin/env python3

def create_campaign(campaign_name, budget, target_audience):
    """
    Simulates campaign creation process.
    """
    print(f"Creating campaign: {campaign_name}")
    print(f"Budget allocated: {budget}")
    print(f"Target audience: {target_audience}")
    
    # Return a success message instead of just printing it
    return "Campaign has been created successfully."


if __name__ == "__main__":
    # Simulate user inputs for campaign creation
    campaign_name = "Super Summer Sale"
    budget = "$7860"
    target_audience = "Age 18-35, Tech Enthusiasts"

    # Echo the creation process
    result = create_campaign(campaign_name, budget, target_audience)
    print(result)
