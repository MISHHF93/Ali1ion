
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to the NAO-AI Backend and Cloud Service!'

@app.route('/process', methods=['POST'])
def process():
    data = request.json
    response = {
        'message': 'Data processed successfully!',
        'input_data': data
    }
    return jsonify(response)

@app.route('/hello', methods=['GET'])
def hello_world():
    return jsonify(message='Hello from NAO-AI Cloud Function!'), 200

def main(request):
    with app.test_request_context(environ_base=request.environ):
        return hello_world()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

