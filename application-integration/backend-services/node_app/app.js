// app.js

const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Home route
app.get('/', (req, res) => {
    res.send('Welcome to the NAO-AI Node.js Backend Service!');
});

// Sample route to demonstrate handling POST requests
app.post('/api/data', (req, res) => {
    const data = req.body;
    console.log('Received data:', data);
    res.send(`Data received: ${JSON.stringify(data)}`);
});

// Sample route to demonstrate handling GET requests
app.get('/api/data', (req, res) => {
    const sampleData = { message: 'Hello from NAO-AI Node.js Backend Service!' };
    res.json(sampleData);
});

// Start the server
app.listen(port, () => {
    console.log(`NAO-AI Node.js Backend Service listening at http://localhost:${port}`);
});
