var express = require('express');
var router = express.Router();
var update_mongo_Controller = require('../controllers/update-mongo-controller');

router.get('/edit/:id', update_mongo_Controller.editData);
router.post('/edit/:id', update_mongo_Controller.updateData);

module.exports = router;