// Libraries
const { Router } = require('express');

// Variables
const query = require('../queries');
const router = Router();

router.post('/login', (req, res) => { query.login(req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/logout', (req, res) => { query.logout(req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/profile/:id', (req, res) => { query.profile(req.params.id).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/dashboard/:table', (req, res) => { query.dashboard(req.params.table).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/list/:table', (req, res) => { query.list(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/specific/:table/:id', (req, res) => { query.specific(req.params.table, req.params.id).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/save/:table', (req, res) => { query.save(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/update/:table', (req, res) => { query.update(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/dropdown/:table', (req, res) => { query.dropdown(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/series/:table', (req, res) => { query.series(req.params.table).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/search/:table', (req, res) => { query.search(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/excel/:table/:type', (req, res) => { query.excel(req.params.table, req.params.type, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/upload/:table', (req, res) => { query.upload(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/assettag/:table', (req, res) => { query.assettag(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/filter/:table', (req, res) => { query.filter(req.params.table, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.get('/component/:id', (req, res) => { query.component(req.params.id).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });
router.post('/evaluate/:table/:type', (req, res) => { query.evaluate(req.params.table, req.params.type, req.body).then(response => res.status(200).send(response)).catch(error => res.status(200).send(error)); });

module.exports = router;