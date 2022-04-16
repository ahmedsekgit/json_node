==============================
 DeprecationWarning: current URL string parser is deprecated, and will be removed in a future version. To use the new parser, pass option { useNewUrlParser: true } to MongoClient.connect.  
==============================
mongoose.connect("mongodb://localhost:27017/YourDB", { useNewUrlParser: true }); 
mongoose.connect("mongodb://localhost:27017/YourDB", { useNewUrlParser: true });
mongoose   .connect(DB, {     useNewUrlParser: true,     useCreateIndex: true,     useUnifiedTopology: true,     useFindAndModify: false,   })
MongoClient.connect("mongodb://localhost:27017/YourDB", { useNewUrlParser: true })
const mongoose = require('mongoose');  mongoose   .connect(connection_string, {     useNewUrlParser: true,     useUnifiedTopology: true,     useCreateIndex: true,     useFindAndModify: false,   })   .then((con) => {     console.log("connected to db");   }); 
  
==============================
188 at  2021-10-29T15:22:52.000Z
==============================
