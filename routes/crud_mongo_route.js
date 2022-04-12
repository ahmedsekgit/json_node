var express = require('express');
var router = express.Router();
var crud_mongo_controller = require('../controllers/crud_mongo_controller');

/* GET users listing. */
router.get('/', crud_mongo_controller.userForm);
router.post('/create_mongo', crud_mongo_controller.createData);
router.get('/data-list_mongo', crud_mongo_controller.fetchData);
router.get('/edit_mongo/:id', crud_mongo_controller.editData);
router.post('/edit_mongo/:id', crud_mongo_controller.updateData);
router.get('/delete_mongo/:id', crud_mongo_controller.deleteData);
module.exports = router;