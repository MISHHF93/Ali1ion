# /home/mishari_borah/nao-ai-project/src/tests/test_install.py

import importlib.metadata
import openai

def test_versions():
    flask_version = importlib.metadata.version("flask")
    print("Flask version:", flask_version)
    
    openai_version = openai.__version__
    print("OpenAI version:", openai_version)

# Call the test function
if __name__ == "__main__":
    test_versions()
