var express = require('express');
var router = express.Router();
var insertController = require('../controllers/user-controller');

router.get('/user-form', insertController.userForm);
router.post('/create', insertController.createData);

module.exports = router;