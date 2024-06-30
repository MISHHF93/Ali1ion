# google_ads_integration.py

from google.ads.googleads.client import GoogleAdsClient
from google.ads.googleads.errors import GoogleAdsException

def main(client):
    customer_id = 'INSERT_CUSTOMER_ID_HERE'
    query = '''
        SELECT
            campaign.id,
            campaign.name,
            campaign.status
        FROM
            campaign
        ORDER BY
            campaign.id'''

    try:
        response = client.service.google_ads.search(
            customer_id=customer_id, query=query)

        for row in response:
            print(f'Campaign ID: {row.campaign.id.value}')
            print(f'Campaign Name: {row.campaign.name.value}')
            print(f'Campaign Status: {row.campaign.status.name}\n')

    except GoogleAdsException as ex:
        print(f'Request with ID "{ex.request_id}" failed with status '
              f'"{ex.error.code().name}" and includes the following errors:')
        for error in ex.failure.errors:
            print(f'\tError with message "{error.message}".')
            if error.location:
                for field_path_element in error.location.field_path_elements:
                    print(f'\t\tOn field: {field_path_element.field_name}')
        sys.exit(1)

if __name__ == '__main__':
    client = GoogleAdsClient.load_from_storage(path='google-ads.yaml')
    main(client)
