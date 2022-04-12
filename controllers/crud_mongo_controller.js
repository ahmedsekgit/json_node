var crud_mongo_model = require('../models/crud_mongo_model');
console.log("crud_mongo_model");
console.dir(crud_mongo_model);
module.exports = {
    userForm: function(req, res) {
        res.render('crud_mongo_form')
    },
    createData: function(req, res) {
        var inputData = req.body;

        crud_mongo_model.createData(inputData, function(data) {
            res.render('crud_mongo_form')
            console.log(" record was created");
        });
    },
    fetchData: function(req, res) {

        crud_mongo_model.fetchData(function(data) {
            res.render('crud_mongo_list', {
                userData: data
            });
        })
    },
    editData: function(req, res) {
        var editId = req.params.id;
        crud_mongo_model.editData(editId, function(data) {
            res.render('crud_mongo_form', {
                userData: data
            });
        })
    },
    updateData: function(req, res) {
        var inputData = req.body;
        var editId = req.params.id;
        crud_mongo_model.updateData(inputData, editId, function(data) {
            res.redirect('/crud_mongo/data-list_mongo')
            console.log(" record was updated");
        });
    },
    deleteData: function(req, res) {

        var deleteId = req.params.id;
        crud_mongo_model.deleteData(deleteId, function(data) {
            res.redirect('/crud_mongo/data-list_mongo')
            console.log(" record was deleted");
        });
    }

}