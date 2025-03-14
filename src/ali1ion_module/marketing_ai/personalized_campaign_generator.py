#!/usr/bin/env python3

def generate_personalized_campaign(customer_segment, product_preferences):
    """
    Simulates generating a personalized campaign based on customer segment and preferences.
    """
    print(f"Generating a personalized campaign for customer segment: {customer_segment}")
    
    campaign_message = f"Hello {customer_segment} customer! Based on your interest in {', '.join(product_preferences)}, we have the perfect offer for you!"
    
    print(f"Personalized Campaign Message: {campaign_message}\n")
    print("Personalized campaign generation complete.\n")
    return campaign_message


def log_campaign_generation(customer_segment, campaign_message):
    """
    Simulates logging the campaign generation for review or analytics.
    """
    print(f"Logging campaign generation: Segment: {customer_segment}, Message: {campaign_message}")
    print("Campaign generation logged successfully.\n")


if __name__ == "__main__":
    # Simulate customer segment and preferences
    customer_segment = "Tech Enthusiast"
    product_preferences = ["smartphones", "laptops", "gadgets"]

    # Generate and log a personalized campaign
    campaign_message = generate_personalized_campaign(customer_segment, product_preferences)
    log_campaign_generation(customer_segment, campaign_message)
