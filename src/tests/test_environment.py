import os
import unittest

class TestEnvironment(unittest.TestCase):
    def test_environment_variables(self):
        # Check if required environment variables are set
        self.assertIsNotNone(os.getenv('PROJECT_ID'), "PROJECT_ID is not set")
        self.assertIsNotNone(os.getenv('VPC_NAME'), "VPC_NAME is not set")
        self.assertIsNotNone(os.getenv('SUBNET_NAME'), "SUBNET_NAME is not set")
        self.assertIsNotNone(os.getenv('BUCKET_NAME'), "BUCKET_NAME is not set")

    def test_gcloud_installed(self):
        # Check if gcloud is installed
        self.assertEqual(os.system('which gcloud'), 0, "gcloud is not installed")

    def test_gcloud_authenticated(self):
        # Check if gcloud is authenticated
        self.assertEqual(os.system('gcloud auth list'), 0, "gcloud is not authenticated")

    def test_bigtable_setup(self):
        # Check if Bigtable instance exists
        self.assertEqual(os.system('gcloud bigtable instances describe nao-ai-instance'), 0, "Bigtable instance nao-ai-instance does not exist")

    def test_bucket_exists(self):
        # Check if Cloud Storage bucket exists
        self.assertEqual(os.system('gsutil ls gs://$BUCKET_NAME'), 0, f"Cloud Storage bucket {os.getenv('BUCKET_NAME')} does not exist")

if __name__ == '__main__':
    unittest.main()
