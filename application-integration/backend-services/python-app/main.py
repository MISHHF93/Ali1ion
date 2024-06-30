# main.py

from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to the NAO-AI Backend Service!"

@app.route('/process', methods=['POST'])
def process():
    data = request.json
    # Add your data processing logic here
    response = {
        "message": "Data processed successfully!",
        "input_data": data
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
