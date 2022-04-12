var express = require('express');
var readController = require('../controllers/read-controller');
var router = express.Router();
// to display data 

router.get('/read', readController.readData);
router.get('/read/data_files/:name', readController.send_to_file);

module.exports = router;