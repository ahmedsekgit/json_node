==============================
 Enable All CORS Requests  
==============================
var express = require('express') var cors = require('cors') var app = express()  app.use(cors())  app.get('/products/:id', function (req, res, next) {   res.json({msg: 'This is CORS-enabled for all origins!'}) })  app.listen(80, function () {   console.log('CORS-enabled web server listening on port 80') }) 
var express = require('express') var cors = require('cors')  //use this var app = express()  app.use(cors()) //and this  app.get('/user/:id', function (req, res, next) {   res.json({user: 'CORS enabled'}) })  app.listen(5000, function () {   console.log('CORS-enabled web server listening on port 5000') })
  
==============================
197 at  2021-10-29T15:22:52.000Z
==============================
