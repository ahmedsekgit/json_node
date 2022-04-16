==============================
How to get Schema of mongoose database which defined in another model  
==============================
to get the table : var userTable = mongoose.model('users');
to get the schema : var userTable = mongoose.model('users').schema;

25

This is my folder structure:

+-- express_example
|---- app.js
|---- models
|-------- songs.js
|-------- albums.js
|---- and another files of expressjs

My code in file songs.js

var mongoose = require('mongoose')
, Schema = mongoose.Schema
, ObjectId = Schema.ObjectId;

var SongSchema = new Schema({
name: {type: String, default: 'songname'}
, link: {type: String, default: './data/train.mp3'}
, date: {type: Date, default: Date.now()}
, position: {type: Number, default: 0}
, weekOnChart: {type: Number, default: 0}
, listend: {type: Number, default: 0}
});

module.exports = mongoose.model('Song', SongSchema);

And here is my code in file albums.js

var mongoose = require('mongoose')
, Schema = mongoose.Schema
, ObjectId = Schema.ObjectId;

var AlbumSchema = new Schema({
name: {type: String, default: 'songname'}
, thumbnail: {type:String, default: './images/U1.jpg'}
, date: {type: Date, default: Date.now()}
, songs: [SongSchema]
});

module.exports = mongoose.model('Album', AlbumSchema);


How can I make albums.js know SongSchema to be defined AlbumSchema


Answer 


You can get models defined elsewhere directly with Mongoose:

require('mongoose').model(name_of_model)

To get the schema in your example in albums.js you can do this:

var SongSchema = require('mongoose').model('Song').schema



  
==============================
91 at  2021-10-29T15:22:52.000Z
==============================
