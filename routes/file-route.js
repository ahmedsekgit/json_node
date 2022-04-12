var express = require('express');
var fileController = require('../controllers/file-controller');
var router = express.Router();
// to display data 

router.get('/files', fileController.readData);
router.get('/store', fileController.storeData);
router.get('/checkData', fileController.checkData);

module.exports = router;