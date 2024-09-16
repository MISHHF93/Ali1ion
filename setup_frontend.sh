#!/bin/bash

# Set the frontend directory path
FRONTEND_DIR="frontend/widget"

# Create necessary directories if they don't exist
echo "Creating necessary directories..."
mkdir -p $FRONTEND_DIR/css
mkdir -p $FRONTEND_DIR/js
mkdir -p $FRONTEND_DIR/images

# Create index.html with the consolidated text and image generation functionality
echo "Creating index.html..."
cat > $FRONTEND_DIR/index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAO-AI: Text & Image Generation</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>NAO-AI Widget</h1>
        <img src="images/logo.png" alt="NAO-AI Logo">
    </header>

    <section id="text-generation">
        <h2>Generate Text</h2>
        <textarea id="text-input" placeholder="Enter prompt"></textarea>
        <button id="generate-text">Generate Text</button>
        <p id="text-output"></p>
    </section>

    <section id="image-generation">
        <h2>Generate Image</h2>
        <input type="text" id="image-input" placeholder="Enter image prompt">
        <button id="generate-image">Generate Image</button>
        <div id="image-output">
            <img id="generated-image" src="" alt="Generated Image" style="display:none;">
        </div>
    </section>

    <script src="js/app.js"></script>
</body>
</html>
EOL

# Create styles.css for styling the front-end
echo "Creating styles.css..."
cat > $FRONTEND_DIR/css/styles.css <<EOL
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    text-align: center;
}

header {
    background-color: #4A90E2;
    padding: 20px;
    color: white;
}

h1 {
    font-size: 2em;
}

section {
    margin: 20px auto;
    padding: 20px;
    max-width: 600px;
    border: 1px solid #ddd;
    background-color: #f9f9f9;
}

textarea, input {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    font-size: 1.2em;
}

button {
    padding: 10px 20px;
    font-size: 1.2em;
    background-color: #4A90E2;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #357ABD;
}

#image-output img {
    max-width: 100%;
    margin-top: 10px;
}
EOL

# Create app.js for handling the interaction and API calls
echo "Creating app.js..."
cat > $FRONTEND_DIR/js/app.js <<EOL
// Handle Text Generation
document.getElementById('generate-text').addEventListener('click', async () => {
    const prompt = document.getElementById('text-input').value;

    const response = await fetch('http://localhost:5000/api/generate', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ prompt })
    });

    const data = await response.json();
    document.getElementById('text-output').innerText = data.response;
});

// Handle Image Generation
document.getElementById('generate-image').addEventListener('click', async () => {
    const prompt = document.getElementById('image-input').value;

    const response = await fetch('http://localhost:5000/api/generate-image', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ prompt })
    });

    const data = await response.json();
    const imageElement = document.getElementById('generated-image');
    imageElement.src = data.response;  // URL from the API response
    imageElement.style.display = 'block';
});
EOL

# Add the logo image if not present
if [ ! -f "$FRONTEND_DIR/images/logo.png" ]; then
    echo "Downloading logo.png..."
    curl -o $FRONTEND_DIR/images/logo.png https://via.placeholder.com/150  # You can replace this URL with your own logo image
fi

# Output the completion message
echo "Front-end setup completed successfully."
