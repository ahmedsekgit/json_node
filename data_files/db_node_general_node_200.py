==============================
 Error: Expected "payload" to be a plain object. at validate  
==============================
const token = jwt.sign(user.toJSON(), config.secret, {   expiresIn: 604800 // 1 week }); 
  
==============================
200 at  2021-10-29T15:22:52.000Z
==============================
