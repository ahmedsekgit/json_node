var insertModel = require('../models/user-model');

module.exports = {
    userForm: function(req, res) {
        res.render('user-form')
    },
    createData: function(req, res) {
        var inputData = req.body;
        insertModel.createData(inputData, function(data) {
            res.render('user-form')
            console.log(" record was created");
        });
    }
}