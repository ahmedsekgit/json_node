var express = require('express');
var searchController = require('../controllers/search-controller');
var router = express.Router();

// to search data get
router.get('/search', searchController.display_search_Data);
router.get('/data_files/:name', searchController.send_to_file);

router.post('/search_term_key', searchController.search_term_Data);
// to search post
//router.post('/search/:id', searchController.search_term_Data);


router.post('/query_search', function(req, res) {
    var obj = {};
    console.log('body: ' + JSON.stringify(req.body));
    res.send(req.body);
});


module.exports = router;