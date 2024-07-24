# /home/mishari_borah/nao-ai-function/application-integration/backend-services/python-app/nao_ai_functions.py

import openai
import json

# Initialize the OpenAI client with your API key
openai.api_key = "sk-proj-UgyvOY6W4dOe16ogKcZWT3BlbkFJk70y2k9tCs21Ry27oAq4"

# Define placeholder functions
def transcribe_audio(audio_path):
    return "Transcribed text"

def synthesize_speech_basic(text, voice=None):
    return "URL to basic synthesized speech"

def synthesize_speech_hd(text, voice=None):
    return "URL to HD synthesized speech"

def generate_image(prompt, size="1024x1024"):
    return "URL to generated image"

def generate_text(prompt, max_tokens=100):
    return "Generated text"

def create_embedding(text, size="small"):
    return "Generated embedding"

# Your assistant ID
assistant_id = "asst_8Q8CNm5hzJi2ynbC9mSmSOHf"

def handle_function_calls():
    user_query = "What's the weather in San Francisco today and the stock price of AAPL?"
    
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "user", "content": user_query}
        ],
        functions=[
            {
                "name": "transcribe_audio",
                "description": "Transcribe audio file to text",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "audio_path": {"type": "string", "description": "Path to the audio file"}
                    },
                    "required": ["audio_path"]
                }
            },
            {
                "name": "synthesize_speech_basic",
                "description": "Convert text to basic speech",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "text": {"type": "string", "description": "Text to synthesize"},
                        "voice": {"type": "string", "description": "Voice to use", "default": None}
                    },
                    "required": ["text"]
                }
            },
            {
                "name": "synthesize_speech_hd",
                "description": "Convert text to HD speech",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "text": {"type": "string", "description": "Text to synthesize"},
                        "voice": {"type": "string", "description": "Voice to use", "default": None}
                    },
                    "required": ["text"]
                }
            },
            {
                "name": "generate_image",
                "description": "Generate an image based on a prompt",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "prompt": {"type": "string", "description": "Description of the image"},
                        "size": {"type": "string", "enum": ["1024x1024", "256x256"], "description": "Size of the image", "default": "1024x1024"}
                    },
                    "required": ["prompt"]
                }
            },
            {
                "name": "generate_text",
                "description": "Generate text based on a prompt",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "prompt": {"type": "string", "description": "Prompt to generate text"},
                        "max_tokens": {"type": "integer", "description": "Maximum number of tokens", "default": 100}
                    },
                    "required": ["prompt"]
                }
            },
            {
                "name": "create_embedding",
                "description": "Create an embedding from text",
                "parameters": {
                    "type": "object",
                    "properties": {
                        "text": {"type": "string", "description": "Text to create embedding from"},
                        "size": {"type": "string", "enum": ["small", "large"], "description": "Size of the embedding", "default": "small"}
                    },
                    "required": ["text"]
                }
            }
        ],
        function_call="auto"
    )

    results = []
    for choice in response.choices:
        if "function_call" in choice["message"]:
            func_name = choice["message"]["function_call"]["name"]
            args = json.loads(choice["message"]["function_call"]["arguments"])
            if func_name == "transcribe_audio":
                result = transcribe_audio(**args)
            elif func_name == "synthesize_speech_basic":
                result = synthesize_speech_basic(**args)
            elif func_name == "synthesize_speech_hd":
                result = synthesize_speech_hd(**args)
            elif func_name == "generate_image":
                result = generate_image(**args)
            elif func_name == "generate_text":
                result = generate_text(**args)
            elif func_name == "create_embedding":
                result = create_embedding(**args)
            else:
                result = {}

            results.append({func_name: result})

    return results

if __name__ == "__main__":
    print(handle_function_calls())
