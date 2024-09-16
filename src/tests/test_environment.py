import os
import unittest

class TestEnvironment(unittest.TestCase):

    def test_environment_variables(self):
        """Check if all required environment variables are set."""
        required_env_vars = ['PROJECT_ID', 'VPC_NAME', 'SUBNET_NAME', 'BUCKET_NAME', 'NAO_AI_INSTANCE']
        for var in required_env_vars:
            self.assertIsNotNone(os.getenv(var), f"{var} is not set")

    def test_gcloud_installed(self):
        """Check if gcloud CLI is installed."""
        self.assertEqual(os.system('which gcloud > /dev/null 2>&1'), 0, "gcloud is not installed")

    def test_gcloud_authenticated(self):
        """Check if gcloud is authenticated."""
        self.assertEqual(os.system('gcloud auth list --filter=status:ACTIVE --format="value(account)" > /dev/null 2>&1'), 0, "gcloud is not authenticated")

    def test_bigtable_setup(self):
        """Check if Bigtable instance exists."""
        instance_name = os.getenv('NAO_AI_INSTANCE', 'nao-ai-instance')
        self.assertEqual(os.system(f'gcloud bigtable instances describe {instance_name} > /dev/null 2>&1'), 0, f"Bigtable instance {instance_name} does not exist")

    def test_bucket_exists(self):
        """Check if the Cloud Storage bucket exists."""
        bucket_name = os.getenv('BUCKET_NAME')
        self.assertIsNotNone(bucket_name, "BUCKET_NAME is not set")
        self.assertEqual(os.system(f'gsutil ls gs://{bucket_name} > /dev/null 2>&1'), 0, f"Cloud Storage bucket {bucket_name} does not exist")

if __name__ == '__main__':
    unittest.main()
