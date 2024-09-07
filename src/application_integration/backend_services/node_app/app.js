// app.js

const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config(); // Load environment variables

const app = express();
const port = process.env.PORT || 3000;

// Middleware setup
app.use(helmet()); // Adds security-related headers
app.use(cors()); // Enables Cross-Origin Resource Sharing
app.use(morgan('combined')); // Logs HTTP requests
app.use(bodyParser.json()); // Parses incoming JSON requests
app.use(bodyParser.urlencoded({ extended: true })); // Parses URL-encoded data

// MongoDB connection
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

mongoose.connection.on('connected', () => {
  console.log('Connected to MongoDB');
});

mongoose.connection.on('error', (err) => {
  console.error(`Error connecting to MongoDB: ${err}`);
});

// Home route
app.get('/', (req, res) => {
  res.send('Welcome to the NAO-AI Node.js Backend Service!');
});

// Example POST route to demonstrate handling POST requests
app.post('/api/data', (req, res) => {
  const data = req.body;
  console.log('Received data:', data);
  res.send(`Data received: ${JSON.stringify(data)}`);
});

// Example GET route to demonstrate handling GET requests
app.get('/api/data', (req, res) => {
  const sampleData = { message: 'Hello from NAO-AI Node.js Backend Service!' };
  res.json(sampleData);
});

// Routes for model API calls
const exampleRouter = require('./routes/example');
app.use('/api/example', exampleRouter);

// Error handling for 404 (Not Found)
app.use((req, res, next) => {
  const error = new Error('Not Found');
  error.status = 404;
  next(error);
});

// Centralized error handling
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message,
    },
  });
});

// Start the server
app.listen(port, () => {
  console.log(`NAO-AI Node.js Backend Service listening at http://localhost:${port}`);
});
