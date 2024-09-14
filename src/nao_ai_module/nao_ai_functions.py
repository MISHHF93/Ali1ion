import openai
import os
import logging
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Set up logging
log_file_path = 'src/nao_ai_module/logs/debug.log'
os.makedirs(os.path.dirname(log_file_path), exist_ok=True)
logging.basicConfig(filename=log_file_path, level=logging.DEBUG)

# Load OpenAI API key from environment variables
openai.api_key = os.getenv('OPENAI_API_KEY')

def generate_text(prompt):
    """
    Generates text using GPT-4o model.
    """
    try:
        logging.info(f"Generating text with prompt: {prompt}")
        
        response = openai.ChatCompletion.create(
            model="gpt-4o",  # Ensure GPT-4o is used
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": prompt}
            ],
            max_tokens=150
        )
        
        # Extracting the content from the response
        result = response['choices'][0]['message']['content'].strip()
        logging.info(f"Generated text: {result}")
        return result

    except Exception as e:
        logging.error(f"Error generating text: {e}")
        raise

def generate_image(prompt, size="1024x1024"):
    """
    Generates an image based on a given prompt and size using DALL-E API.
    """
    try:
        logging.info(f"Generating image with prompt: {prompt} and size: {size}")
        
        # Assuming OpenAI's DALL-E API for image generation
        response = openai.Image.create(
            prompt=prompt,
            n=1,
            size=size
        )
        
        image_url = response['data'][0]['url']
        logging.info(f"Generated image URL: {image_url}")
        return image_url

    except Exception as e:
        logging.error(f"Error generating image: {e}")
        raise

def create_embedding(text):
    """
    Creates an embedding for the given text using OpenAI's embedding model.
    """
    try:
        logging.info(f"Creating embedding for text: {text}")
        
        response = openai.Embedding.create(
            model="text-embedding-ada-002",
            input=text
        )
        
        embedding = response['data'][0]['embedding']
        logging.info(f"Created embedding: {embedding}")
        return embedding

    except Exception as e:
        logging.error(f"Error creating embedding: {e}")
        raise
