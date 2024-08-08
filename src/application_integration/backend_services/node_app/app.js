// app.js

const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware setup
app.use(helmet());
app.use(cors());
app.use(morgan('combined'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// MongoDB connection
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useCreateIndex: true,
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

// Sample POST route to demonstrate handling POST requests
app.post('/api/data', (req, res) => {
  const data = req.body;
  console.log('Received data:', data);
  res.send(`Data received: ${JSON.stringify(data)}`);
});

// Sample GET route to demonstrate handling GET requests
app.get('/api/data', (req, res) => {
  const sampleData = { message: 'Hello from NAO-AI Node.js Backend Service!' };
  res.json(sampleData);
});

// Example route
const exampleRouter = require('./routes/example');
app.use('/api/example', exampleRouter);

// Error handling
app.use((req, res, next) => {
  const error = new Error('Not Found');
  error.status = 404;
  next(error);
});

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
