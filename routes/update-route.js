var express = require('express');
var updateController = require('../controllers/update-controller');
var router = express.Router();

// to edit data 
router.get('/edit/:id', updateController.editData);
// to update data 
router.post('/update/:id', updateController.updateData);

router.post('/endpoint', function(req, res) {
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);
});

module.exports = router;