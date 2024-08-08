# google_ads_integration.py

import google.ads.google_ads.client

def initialize_google_ads_client(credentials_file_path):
    """
    Initializes the Google Ads client with the given credentials file.

    Args:
        credentials_file_path (str): Path to the Google Ads API credentials file.

    Returns:
        GoogleAdsClient: An initialized Google Ads client.
    """
    try:
        client = google.ads.google_ads.client.GoogleAdsClient.load_from_storage(credentials_file_path)
        print("Google Ads client initialized successfully.")
        return client
    except Exception as e:
        print(f"Error initializing Google Ads client: {e}")
        return None

def fetch_campaigns(client):
    """
    Fetches campaigns from the Google Ads account.

    Args:
        client (GoogleAdsClient): The initialized Google Ads client.

    Returns:
        list: A list of campaigns.
    """
    try:
        query = """
            SELECT
                campaign.id,
                campaign.name
            FROM
                campaign
            ORDER BY
                campaign.id
        """
        response = client.service.google_ads.search(customer_id="INSERT_CUSTOMER_ID_HERE", query=query)
        campaigns = []
        for row in response:
            campaigns.append({
                "id": row.campaign.id.value,
                "name": row.campaign.name.value,
            })
        print(f"Fetched {len(campaigns)} campaigns.")
        return campaigns
    except Exception as e:
        print(f"Error fetching campaigns: {e}")
        return []

if __name__ == "__main__":
    credentials_path = "/path/to/your/google-ads.yaml"
    client = initialize_google_ads_client(credentials_path)
    if client:
        campaigns = fetch_campaigns(client)
        for campaign in campaigns:
            print(f"Campaign ID: {campaign['id']}, Name: {campaign['name']}")
