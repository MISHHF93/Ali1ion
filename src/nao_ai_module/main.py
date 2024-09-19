from flask import Flask

# Create a Flask app instance
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def home():
    return "NAO-AI Flask Server Running!"

# Run the app if this file is executed
if __name__ == "__main__":
    print("NAO-AI Flask server is starting...")
    app.run(host="0.0.0.0", port=8000)
