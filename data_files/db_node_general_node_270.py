==============================
 JavaScript does not protect the property name hasOwnProperty  
==============================
// hasOwnProperty &ndash; JavaScript does not protect var foo = {     // overriding foo's default hasOwnProperty method     hasOwnProperty: function() {         return false;     },     bar: 'data' }; foo.hasOwnProperty('bar'); // false always  // Hence, to prevent this, use Object.prototype.hasOwnProperty as follows- Object.prototype.hasOwnProperty.call(foo, 'bar'); // true
  
==============================
270 at  2021-10-29T15:22:52.000Z
==============================
