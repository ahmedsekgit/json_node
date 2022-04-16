==============================
 (node:14800) DeprecationWarning: collection.ensureIndex is deprecated. Use createIndexes instead. (Use `node --trace-deprecation ...` to show where the warning was created)  
==============================
mongoose.set('useCreateIndex', true);
mongoose   .connect(process.env.DB_CONNECTION, {     useNewUrlParser: true,     useUnifiedTopology: true,     dbName: "business",     useCreateIndex: true   })
/*As of this edit, Mongoose is now at v5.4.13. Per their docs, these are the fixes for the deprecation warnings..*/ mongoose.set('useNewUrlParser', true); mongoose.set('useFindAndModify', false); mongoose.set('useCreateIndex', true);
mongoose.set('useNewUrlParser', true); mongoose.set('useFindAndModify', false); mongoose.set('useCreateIndex', true);
  
==============================
135 at  2021-10-29T15:22:52.000Z
==============================
