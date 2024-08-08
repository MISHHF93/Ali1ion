const express = require('express');
const router = express.Router();

// Example GET route
router.get('/', (req, res) => {
  res.send('This is an example endpoint');
});

module.exports = router;
