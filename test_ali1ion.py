from openai import OpenAI
from gtts import gTTS  # For text-to-speech

# Initialize the OpenAI client with your API key
client = OpenAI(api_key="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")

# GPT-4o text completion test
def test_gpt4o():
    try:
        response = client.chat.completions.create(
            model="gpt-4o",
            messages=[
                {"role": "system", "content": "You are Ali1ion, a helpful assistant."},
                {"role": "user", "content": "What is the capital of France?"}
            ],
            max_tokens=50
        )
        print("GPT-4o Response:", response.choices[0].message.content.strip())
    except Exception as e:
        print(f"Error with GPT-4o: {e}")

# GPT-3.5-turbo text completion test
def test_gpt35_turbo():
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": "What is the capital of Spain?"}
            ],
            max_tokens=50
        )
        print("GPT-3.5-turbo Response:", response.choices[0].message.content.strip())
    except Exception as e:
        print(f"Error with GPT-3.5-turbo: {e}")

# DALL-E image generation test
def test_dalle():
    try:
        response = client.images.generate(
            prompt="A futuristic city in space",
            n=1,
            size="1024x1024"
        )
        image_url = response.data[0].url  # Access the image URL correctly
        print("DALL-E Image URL:", image_url)
    except Exception as e:
        print(f"Error with DALL-E: {e}")

# Whisper speech-to-text test
def test_whisper(audio_file):
    try:
        with open(audio_file, "rb") as audio:
            # Correct function for transcription
            response = client.audio.transcriptions.create(
                model="whisper-1",
                file=audio
            )
        print("Whisper Transcription:", response.text)  # Access the transcription text
    except Exception as e:
        print(f"Error with Whisper: {e}")

# Text-to-speech using Google TTS
def test_text_to_speech(text):
    try:
        tts = gTTS(text)
        audio_path = "output.mp3"
        tts.save(audio_path)
        print(f"Text-to-Speech Audio saved to: {audio_path}")
    except Exception as e:
        print(f"Error with Text-to-Speech: {e}")

# Embedding generation test
def test_embeddings(text):
    try:
        response = client.embeddings.create(
            model="text-embedding-ada-002",
            input=[text]
        )
        embedding = response.data[0].embedding  # Correctly access the embedding
        print(f"Embedding for input '{text}':", embedding[:10], "... (truncated)")
    except Exception as e:
        print(f"Error with Embedding: {e}")

# Main testing function
if __name__ == "__main__":
    print("Starting Ali1ion Multimodal Testing...")

    # Test GPT-4o
    print("\nTesting GPT-4o...")
    test_gpt4o()

    # Test GPT-3.5-turbo
    print("\nTesting GPT-3.5-turbo...")
    test_gpt35_turbo()

    # Test DALL-E image generation
    print("\nTesting DALL-E image generation...")
    test_dalle()

    # Test Whisper speech-to-text (provide an actual file path)
    print("\nTesting Whisper speech-to-text...")
    test_whisper("/workspaces/Ali1ion/sample_audio.wav")  # Make sure this file exists

    # Test text-to-speech
    print("\nTesting Text-to-Speech...")
    test_text_to_speech("Hello, this is a test of the Ali1ion text-to-speech system.")

    # Test Embedding generation
    print("\nTesting Embedding generation...")
    test_embeddings("What is the future of artificial intelligence?")
