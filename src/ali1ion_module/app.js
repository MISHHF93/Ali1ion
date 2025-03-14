const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 7860;

// Serve static files from the frontend assets
app.use('/assets', express.static(path.join(__dirname, '../../frontend/assets')));

// Serve the Gradio interface HTML
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../../frontend/gradio_interface/index.html'));
});

// Handle any additional API routes here
app.post('/api/naoai/generate-text', (req, res) => {
    // Sample text generation API response
    res.json({ response: 'Sample generated text from GPT-4.' });
});

// You can add more routes as needed for other features like image generation, feedback, etc.
// Example: app.post('/api/naoai/generate-image', ...

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
