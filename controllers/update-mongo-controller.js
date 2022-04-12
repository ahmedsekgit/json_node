var update_mongo_Model = require('../models/update-mongo-model');
module.exports = {

    editData: function(req, res) {
        var editId = req.params.id;
        update_mongo_Model.editData(editId, function(data) {
            res.render('user-mongo-form', {
                userData: data
            });
        })
    },
    updateData: function(req, res) {
        var inputData = req.body;
        var editId = req.params.id;
        update_mongo_Model.updateData(inputData, editId, function(data) {
            res.redirect('/user/data-list')
            console.log(data.affectedRows + " record was updated");
        });
    }

}