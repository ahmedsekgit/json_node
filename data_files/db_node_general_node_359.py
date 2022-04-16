==============================
nodejs express trying to implement helpers  
==============================
to keep your code DRY you can keep all your repeating functions into helper modules.

The structure can be something like this:

controllers  
├── helpers  
    └── index.js  
├── controller1.js   
└── controller2.js  

In the "index.js" helper module you can include your function like this:

exports.yourFunction = function(args){
...
};

And you can call it in the controllers like this:

var helpers = require("./helpers");
...
helpers.yourFunction();

Also, you can find other related answers in this thread:

Javascript - Best way to structure helpers functions in NodeJS    

To provide an example of what a text.js file made up of text-based utility functions might look like:

module.exports = {
    cleanText:function(text) {
        // clean it and return
    },

    isWithinRange(text, min, max) {
        // check if text is between min and max length
    }
}

Alternatively, you could do it this way:

exports.cleanText = function(text) {
    // clean it and return
}

exports.isWithinRange = function (text, min, max) {
    // check if text is between min and max length
}

Structuring utility category files to make a larger utility library

As far as organizing the utility methods, Luca's example is nice. I've organized some similarly like this:

utils-module/
    lib/
        text.js  <-- this is the example file shown above
        twitter.js
    test/
    index.js

Where index.js does something like

var textUtils = require('./lib/text');

exports.Text = textUtils;

Then when I want to use the util lib in say some User model in my node API, it's simply:

/*
 * Dependencies
 */
var textUtils = require('path/to/lib').Text;

/*
 * Model
 */
function User() {}

/*
 * Instance Methods
 */
User.prototype.setBio = function(data) {
    this.bio = textUtils.cleanText(data);
}

module.exports = User;

Hope that helps. When I was first learning it was very helpful to look at popular, well-respected libraries to see how more experienced node/javascript devs were doing things. There are so many good (and bad) ones out there!



You can see a utils library example with lodash.

Lodash is an utility lib like underscorejs. This library have file sustem structure like your.

It divides the functions in categories. Each category is a folder with an index.js file that includes into a namespace (literal object) each functions for that category!

Lodash/
   Objects/
       Function1.js
       Functions2.js
       ....
       Index.js
   Array/
       Function1.js
       ...
       Index.js

Then in your code you can do this:

var objectsUtils = require("lodash/objects");
var foreach = require("lodash/array/each");

You can create a similar file system structure in order to have more flexibility. You can require the entire lib, only one namespace or a single function.  
==============================
359 at  2021-10-29T19:05:23.000Z
==============================
