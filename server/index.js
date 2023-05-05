// Libraries
const express = require('express');
const cors = require('cors');
const client = require('./routes/client');
const warehouse = require('./routes/warehouse');

// Variables
const app = express();
const port = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json({ limit: '50mb' }));

// Routes
app.use('/', client);
app.use('/warehouse', warehouse);

app.listen(port, () => console.log(`App running on port ${port}`) );