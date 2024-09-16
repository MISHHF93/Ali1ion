import os
from flask import Flask, jsonify, request
from nao_ai_module.nao_ai_app.nao_ai_functions import generate_text, transcribe_audio

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify(message="Welcome to the NAO-AI Backend Services!")

@app.route('/api/generate', methods=['POST'])
def generate_text_api():
    try:
        data = request.get_json()
        prompt = data.get('prompt')
        if not prompt:
            return jsonify({"error": "No prompt provided"}), 400

        # Generate the text using the function from nao_ai_functions
        response = generate_text(prompt)
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": f"Failed to generate text: {str(e)}"}), 500

@app.route('/api/transcribe', methods=['POST'])
def transcribe_audio_api():
    try:
        data = request.get_json()
        audio_path = data.get('audio_path')
        if not audio_path:
            return jsonify({"error": "No audio path provided"}), 400

        # Transcribe the audio using the function from nao_ai_functions
        response = transcribe_audio(audio_path)
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": f"Failed to transcribe audio: {str(e)}"}), 500

if __name__ == '__main__':
    host = os.environ.get('FLASK_RUN_HOST', '0.0.0.0')
    port = int(os.environ.get('FLASK_RUN_PORT', 8000))
    debug = os.environ.get('FLASK_DEBUG', 'true').lower() in ['true', '1', 't']
    app.run(host=host, port=port, debug=debug)
