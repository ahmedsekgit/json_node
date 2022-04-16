==============================
 How to parse POST requests with express nodejs  
==============================
const express = require('express'); const bodyParser = require('body-parser');  const app = express(); app.use(bodyParser.urlencoded({ extended: true }));  app.post('/post-test', (req, res) => {     console.log('Got body:', req.body);     res.sendStatus(200); });  app.listen(8080, () => console.log(`Started server at http://localhost:8080!`));
  
==============================
249 at  2021-10-29T15:22:52.000Z
==============================
