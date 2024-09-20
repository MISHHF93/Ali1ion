const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const PORT = 8000;

app.use(bodyParser.json());
app.use(cors());

// API for text generation
app.post('/api/generate', (req, res) => {
  const { prompt } = req.body;
  res.json({ response: `Generated text for: ${prompt}` });
});

// API for image generation
app.post('/api/generate-image', (req, res) => {
  const { prompt } = req.body;
  res.json({ response: 'https://via.placeholder.com/150' });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
