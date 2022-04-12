var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/dashboard', function(req, res, next) {
    if (req.session.loggedinUser) {
    		if (req.session.return_to) 
    		{
    			res.redirect(req.session.return_to);
    		}
    		else
    		{
        		res.render('dashboard', 
        		{
            	email: req.session.emailAddress
        		})
    	}
    } else {
        res.redirect('/login');
    }
});
module.exports = router;