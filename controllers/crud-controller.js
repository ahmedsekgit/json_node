var crudModel = require('../models/crud-model');
module.exports = {

    crudForm: function(req, res) {
        res.render('crud-operation');
    },
    createCrud: function(req, res) {

        const createData = crudModel.createCrud();
        res.send('<h1>' + createData + '</h1>');

    },
    fetchCrud: function(req, res) {

        const fetchData = crudModel.fetchCrud();
        res.send('<h1>' + fetchData + '</h1>');

    },
    editCrud: function(req, res) {

        const editId = req.params.id;
        const editData = crudModel.editCrud(editId);
        res.render('crud-operation', {
            editData: editData,
            editId: editId
        });
    },
    UpdateCrud: function(req, res) {

        const updateId = req.params.id;
        const updateData = crudModel.UpdateCrud(updateId);
        res.send('<h1>' + updateData + '</h1>');

    },
    deleteCrud: function(req, res) {

        const deleteId = req.params.id;
        const deleteData = crudModel.deleteCrud(deleteId);
        res.send('<h1>' + deleteData + '</h1>');

    }

}