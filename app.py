import os
import requests
import gradio as gr
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.staticfiles import StaticFiles
from gtts import gTTS  # Google Text-to-Speech
from openai import OpenAI
import logging

# Setup Logging for better debugging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Fetch API details from environment variables or hardcoded values
MODEL_API_KEY = os.getenv('MODEL_API_KEY', 'your_default_api_key_here')  # Use actual key or environment variable

# Initialize OpenAI client after fetching the API key
if not MODEL_API_KEY or MODEL_API_KEY == 'your_default_api_key_here':
    logger.error("OpenAI API key is missing. Please set the 'MODEL_API_KEY' environment variable.")
    raise ValueError("OpenAI API key is missing.")
else:
    client = OpenAI(api_key=MODEL_API_KEY)
    logger.info("OpenAI client initialized.")

from src.ali1ion_module.ali1ion_functions import generate_embeddings, moderate_content

# FastAPI app setup
app = FastAPI()

# CORS configuration
origins = ["*"]  # Adjust this according to your needs in production
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Header setup for OpenAI API calls
headers = {
    'Authorization': f'Bearer {MODEL_API_KEY}',
    'Content-Type': 'application/json'
}

### GPT-4 Text Generation Functions ###

def chat_completion(prompt, system_message="You are Ali1ion, a helpful assistant."):
    logger.info(f"Processing chat completion for prompt: {prompt}")
    try:
        data = {
            "model": "gpt-4",
            "messages": [
                {"role": "system", "content": system_message},
                {"role": "user", "content": prompt}
            ],
            "max_tokens": 150
        }
        response = requests.post('https://api.openai.com/v1/chat/completions', headers=headers, json=data)
        response.raise_for_status()
        return response.json()['choices'][0]['message']['content']
    except requests.RequestException as e:
        logger.error(f"Error in chat completion: {e}")
        return f"Error: {e}"

def text_completion(prompt):
    logger.info(f"Processing text completion for prompt: {prompt}")
    try:
        data = {
            "model": "gpt-4",
            "prompt": prompt,
            "max_tokens": 100
        }
        response = requests.post('https://api.openai.com/v1/completions', headers=headers, json=data)
        response.raise_for_status()
        return response.json()['choices'][0]['text']
    except requests.RequestException as e:
        logger.error(f"Error in text completion: {e}")
        return f"Error: {e}"

### DALL-E Image Generation ###

def image_generation(prompt):
    logger.info(f"Processing image generation for prompt: {prompt}")
    try:
        response = client.images.generate(
            prompt=prompt,
            n=1,
            size="1024x1024"
        )
        if response.data:
            image_url = response.data[0].url
            return image_url
        else:
            logger.error("No data returned from image generation.")
            return "Error: No data returned from image generation"
    except Exception as e:
        logger.error(f"Error in image generation: {e}")
        return f"Error: {e}"

### Audio Functions (Speech-to-Text and Text-to-Speech) ###

def speech_to_text(audio_file):
    """Convert speech to text using OpenAI's Whisper API."""
    logger.info(f"Processing speech-to-text for file: {audio_file}")
    if audio_file is not None:
        try:
            with open(audio_file.name, "rb") as audio:
                response = client.audio.transcribe("whisper-1", audio)
            return response.get("text", "No transcription available.")
        except Exception as e:
            logger.error(f"Error in speech-to-text: {e}")
            return f"Error in transcription: {e}"
    else:
        return "No audio file provided."

def text_to_speech(text):
    """Convert text to speech using Google Text-to-Speech."""
    logger.info(f"Processing text-to-speech for text: {text}")
    tts = gTTS(text)
    audio_path = "output.mp3"
    tts.save(audio_path)
    return audio_path  # Return the path to the generated audio file

### Gradio Interface for Multiple Functions ###

def multi_function_interface(option, input_data=None, input_file=None):
    logger.info(f"Executing function: {option}")
    if option == "Chat Completion":
        return chat_completion(input_data)
    elif option == "Text Completion":
        return text_completion(input_data)
    elif option == "Generate Embeddings":
        return generate_embeddings(input_data)
    elif option == "Moderate Content":
        return moderate_content(input_data)
    elif option == "Image Generation":
        return image_generation(input_data)
    elif option == "Speech-to-Text":
        return speech_to_text(input_file)
    elif option == "Text-to-Speech":
        audio_path = text_to_speech(input_data)
        return f"Audio saved: {audio_path}"
    else:
        logger.warning(f"Invalid option selected: {option}")
        return "Invalid option selected."

### Gradio UI ###

with gr.Blocks() as demo:
    gr.Markdown("# Ali1ion GPT-4 Powered AI Assistant")

    # Dropdown for selecting function
    function_choice = gr.Dropdown(
        choices=[
            "Chat Completion", 
            "Text Completion", 
            "Generate Embeddings", 
            "Moderate Content", 
            "Image Generation", 
            "Speech-to-Text", 
            "Text-to-Speech"
        ],
        label="Select GPT-4o Function"
    )

    # Input for text or prompt
    user_input = gr.Textbox(label="Enter your text prompt (or leave blank for file uploads)")

    # Input for file (for speech-to-text functionality)
    file_input = gr.File(label="Upload an audio file for speech-to-text")

    # Output Box for text or image URLs
    output = gr.Textbox(label="Output or Image URL")

    # Submit Button
    submit_btn = gr.Button("Submit")

    # Function that executes on button click
    submit_btn.click(
        fn=multi_function_interface, 
        inputs=[function_choice, user_input, file_input], 
        outputs=output
    )

# Serve static files (CSS, JS, etc.)
app.mount("/static", StaticFiles(directory="frontend/static"), name="static")

# Mount Gradio interface at root "/"
app = gr.mount_gradio_app(app, demo, path="/")

if __name__ == "__main__":
    import uvicorn
    logger.info("Starting Ali1ion application on port 7860")
    uvicorn.run(app, host="0.0.0.0", port=7860)
