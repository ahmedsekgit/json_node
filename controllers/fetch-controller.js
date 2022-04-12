var fetchModel = require('../models/fetch-model');


module.exports = {

    fetchData: function(req, res) {

        fetchModel.fetchData(function(data) {

            res.render('links-list', {
                title: 'links List',
                linkData: data
            });
            /*
            res.render('user-table', {
                userData: data
            });*/
        });
    }
}