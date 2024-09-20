import unittest
import os
import subprocess

class TestInstallation(unittest.TestCase):

    def test_python_version(self):
        """Test if the correct Python version is installed."""
        python_version = subprocess.check_output(["python3", "--version"]).decode("utf-8").strip()
        self.assertTrue(python_version.startswith("Python 3.12"), f"Expected Python 3.12, but got {python_version}")

    def test_pip_dependencies(self):
        """Test if required Python packages are installed."""
        required_packages = [
            "Django", "requests", "numpy", "psycopg2-binary"
            # Add other critical packages here
        ]
        installed_packages = subprocess.check_output(["pip", "freeze"]).decode("utf-8").strip().split("\n")
        installed_packages = [pkg.split("==")[0] for pkg in installed_packages]
        
        for package in required_packages:
            self.assertIn(package, installed_packages, f"{package} is not installed")

    def test_environment_variables(self):
        """Test if critical environment variables are set."""
        required_vars = ["ENVIRONMENT", "APP_NAME", "DATABASE_URL"]
        for var in required_vars:
            self.assertIn(var, os.environ, f"Environment variable {var} is not set")

    def test_essential_files(self):
        """Test if essential files are present in the project."""
        # Update paths based on your current workspace
        essential_files = [
            "/workspaces/NAO-AI/requirements.txt",
            "/workspaces/NAO-AI/manage.py",
            "/workspaces/NAO-AI/src/application_integration/backend_services/node_app/app.js"
            # Add other essential files here
        ]
        for file_path in essential_files:
            self.assertTrue(os.path.exists(file_path), f"Essential file {file_path} is missing")

    def test_database_connection(self):
        """Test if the application can connect to the database."""
        # Assuming Django is used and settings are correctly configured
        manage_py_path = "/workspaces/NAO-AI/manage.py"
        if os.path.exists(manage_py_path):
            try:
                subprocess.check_output(["python3", manage_py_path, "migrate"])
            except subprocess.CalledProcessError as e:
                self.fail(f"Database migration failed with error: {e}")
        else:
            self.skipTest("manage.py not found; skipping database connection test.")

    def test_server_startup(self):
        """Test if the server starts up without issues."""
        # Skip server startup test in environments without systemd
        if os.environ.get('CODESPACES') or not os.path.exists("/usr/bin/systemctl"):
            self.skipTest("Skipping server startup test in non-systemd environments")
        
        try:
            subprocess.check_output(["sudo", "systemctl", "start", "my_app.service"])
            status = subprocess.check_output(["sudo", "systemctl", "status", "my_app.service"]).decode("utf-8")
            self.assertIn("active (running)", status, "The server is not running as expected")
        except subprocess.CalledProcessError as e:
            self.fail(f"Server startup failed with error: {e}")

if __name__ == "__main__":
    unittest.main()
