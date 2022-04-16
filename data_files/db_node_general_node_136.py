==============================
 (node:3168) DeprecationWarning: collection.ensureIndex is deprecated. Use createIndexes instead. (Use `node --trace-deprecation ...` to show where the warning was created)  
==============================
mongoose.set('useCreateIndex', true);
mongoose   .connect(process.env.DB_CONNECTION, {     useNewUrlParser: true,     useUnifiedTopology: true,     dbName: "business",     useCreateIndex: true   })
  
==============================
136 at  2021-10-29T15:22:52.000Z
==============================
