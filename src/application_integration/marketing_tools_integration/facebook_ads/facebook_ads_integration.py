# facebook_ads_integration.py

from facebook_business.api import FacebookAdsApi
from facebook_business.adobjects.adaccount import AdAccount
from facebook_business.adobjects.campaign import Campaign

# Set up the Facebook Ads API
access_token = 'your-access-token'
ad_account_id = 'act_your-ad-account-id'
app_id = 'your-app-id'
app_secret = 'your-app-secret'

# Initialize the Facebook API
FacebookAdsApi.init(app_id, app_secret, access_token)

# Define the ad account
ad_account = AdAccount(ad_account_id)

def create_campaign():
    campaign = Campaign(parent_id=ad_account_id)
    campaign.update({
        Campaign.Field.name: 'NAO AI Campaign',
        Campaign.Field.objective: Campaign.Objective.link_clicks,
        Campaign.Field.status: Campaign.Status.paused,
    })
    
    # Create the campaign
    campaign.remote_create(params={
        'status': Campaign.Status.paused,
    })
    
    print('Campaign ID:', campaign.get_id())

if __name__ == "__main__":
    create_campaign()
