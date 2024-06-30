# main.py

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    """HTTP Cloud Function.
    Returns a greeting.
    """
    return jsonify(message="Hello from NAO-AI Cloud Function!"), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
