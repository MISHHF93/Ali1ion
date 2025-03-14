import openai
import os
import logging
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Set up logging
log_file_path = 'src/ali1ion_module/logs/debug.log'
os.makedirs(os.path.dirname(log_file_path), exist_ok=True)
logging.basicConfig(filename=log_file_path, level=logging.DEBUG, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Load OpenAI API key from environment variables
openai.api_key = os.getenv('OPENAI_API_KEY')  # Correct environment variable

def generate_text(prompt):
    """
    Generates text using the GPT-4 model.
    
    Parameters:
        prompt (str): The input prompt to generate a response from.
        
    Returns:
        str: The generated response from GPT-4.
    
    Raises:
        ValueError: If the prompt is empty.
        Exception: For other errors during the API call.
    """
    if not prompt:
        raise ValueError("Prompt is required to generate text.")
    
    try:
        logging.info(f"Generating text with prompt: {prompt}")
        response = openai.ChatCompletion.create(
            model="gpt-4",  # Ensure you're using the correct model
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": prompt}
            ],
            max_tokens=150
        )
        
        result = response['choices'][0]['message']['content'].strip()
        logging.info(f"Generated text: {result}")
        return result

    except Exception as e:
        logging.error(f"Error generating text: {e}")
        raise

def generate_image(prompt, size="1024x1024"):
    """
    Generates an image based on the prompt using the DALL-E API.
    
    Parameters:
        prompt (str): The input prompt for the image generation.
        size (str): The size of the generated image (default is "1024x1024").
        
    Returns:
        str: URL of the generated image.
    
    Raises:
        ValueError: If the prompt is empty or an invalid size is provided.
        Exception: For errors during the API call.
    """
    if not prompt:
        raise ValueError("Prompt is required to generate an image.")
    if size not in ["1024x1024", "512x512", "256x256"]:
        raise ValueError(f"Invalid size: {size}. Choose from 1024x1024, 512x512, or 256x256.")

    try:
        logging.info(f"Generating image with prompt: {prompt} and size: {size}")
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
    Creates an embedding for the given text using OpenAI's text-embedding-ada-002 model.
    
    Parameters:
        text (str): The input text for which to generate the embedding.
        
    Returns:
        list: The embedding vector for the input text.
    
    Raises:
        ValueError: If the input text is empty.
        Exception: For errors during the API call.
    """
    if not text:
        raise ValueError("Text is required to create an embedding.")
    
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
