// Libraries
const { Router } = require('express');

// Variables
const query = require('../queries/warehouse');
const router = Router();

router.get('/schedule/:date', (req, res) => { query.schedule(req.params.date).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/login', (req, res) => { query.login(req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/profile/:id', (req, res) => { query.profile(req.params.id).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/logout', (req, res) => { query.logout(req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/list/:table', (req, res) => { query.list(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/dropdown/:table', (req, res) => { query.dropdown(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/save/:table', (req, res) => { query.save(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/update/:table', (req, res) => { query.update(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/specific/:table/:data', (req, res) => { query.specific(req.params.table, req.params.data).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/series/:table', (req, res) => { query.series(req.params.table).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/counts/:data', (req, res) => { query.counts(req.params.data).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/search/:table', (req, res) => { query.search(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });

module.exports = router;