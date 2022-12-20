// Libraries
const { Router } = require('express');

const router = Router(); // Variables

router.post('/authentication/:type', (req, res) => { console.log(req.body); });

module.exports = router;