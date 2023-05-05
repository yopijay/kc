// Libraries
const { Router } = require('express');

// Variables
const query = require('../queries/warehouse');
const router = Router();

router.get('/schedule/:date', (req, res) => { query.schedule(req.params.date).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); } );

module.exports = router;