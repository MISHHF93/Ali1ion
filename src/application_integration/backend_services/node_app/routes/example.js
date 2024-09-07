const express = require('express');
const router = express.Router();
const axios = require('axios'); // For making API requests to the NAO-AI model
require('dotenv').config(); // Load environment variables for the model API URL and key

// Example POST route for querying the model
router.post('/nao-ai', async (req, res) => {
  const userQuery = req.body.query;

  if (!userQuery) {
    return res.status(400).json({ error: 'Query is required' });
  }

  try {
    // Send request to the NAO-AI model
    const modelResponse = await axios.post(process.env.MODEL_API_URL, {
      query: userQuery,
    }, {
      headers: {
        'Authorization': `Bearer ${process.env.MODEL_API_KEY}`, // Pass API key if required
        'Content-Type': 'application/json'
      }
    });

    // Send the model response back to the frontend
    res.json({ response: modelResponse.data });
  } catch (error) {
    console.error('Error querying the model:', error);
    res.status(500).json({ error: 'Error occurred while processing the model request' });
  }
});

module.exports = router;
