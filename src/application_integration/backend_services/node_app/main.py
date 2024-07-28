import os
import sys
from flask import Flask, jsonify, request
import openai

# Add the directory of your Flask app to the Python path
backend_services_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(backend_services_path)

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify(message="Welcome to the NAO-AI Backend Services!")

@app.route('/api/generate', methods=['POST'])
def generate_text():
    data = request.get_json()
    prompt = data.get('prompt')
    if not prompt:
        return jsonify({"error": "No prompt provided"}), 400

    response = openai.Completion.create(
        model="text-davinci-003",
        prompt=prompt,
        max_tokens=100
    )
    return jsonify({"response": response.choices[0].text.strip()})

if __name__ == '__main__':
    # Use the environment variables or defaults
    host = os.environ.get('FLASK_RUN_HOST', '0.0.0.0')
    port = int(os.environ.get('FLASK_RUN_PORT', 5000))
    debug = os.environ.get('FLASK_DEBUG', 'true').lower() in ['true', '1', 't']

    app.run(host=host, port=port, debug=debug)
