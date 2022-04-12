# fly-json-ql
[![NPM](https://nodei.co/npm/fly-json-ql.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/fly-json-ql/)
[![js-semistandard-style](https://raw.githubusercontent.com/standard/semistandard/master/badge.svg)](https://github.com/standard/semistandard)  
  
[![npm version](https://img.shields.io/npm/v/fly-json-ql.svg?style=flat-square)](https://www.npmjs.org/package/fly-json-ql)
[![Build Status](https://travis-ci.com/aalfiann/fly-json-ql.svg?branch=master)](https://travis-ci.com/aalfiann/fly-json-ql)
[![Coverage Status](https://coveralls.io/repos/github/aalfiann/fly-json-ql/badge.svg?branch=master)](https://coveralls.io/github/aalfiann/fly-json-ql?branch=master)
[![Known Vulnerabilities](https://snyk.io//test/github/aalfiann/fly-json-ql/badge.svg?targetFile=package.json)](https://snyk.io//test/github/aalfiann/fly-json-ql?targetFile=package.json)
![License](https://img.shields.io/npm/l/fly-json-ql)
![NPM download/month](https://img.shields.io/npm/dm/fly-json-ql.svg)
![NPM download total](https://img.shields.io/npm/dt/fly-json-ql.svg)
[![](https://data.jsdelivr.com/v1/package/npm/fly-json-ql/badge)](https://www.jsdelivr.com/package/npm/fly-json-ql)  
Query Json on the fly with JsonQL for NodeJS and Browser.  

JsonQL will make your query more cleaner. Because sometimes query using function is harder to read.

### Install using NPM
```bash
$ npm install fly-json-ql
```
**Or simply use in Browser with CDN**
```html
<!-- Always get the latest version -->
<!-- Not recommended for production sites! -->
<script src="https://cdn.jsdelivr.net/npm/fly-json-ql/dist/flyjsonql.min.js"></script>

<!-- Get minor updates and patch fixes within a major version -->
<script src="https://cdn.jsdelivr.net/npm/fly-json-ql@1/dist/flyjsonql.min.js"></script>

<!-- Get patch fixes within a minor version -->
<script src="https://cdn.jsdelivr.net/npm/fly-json-ql@1.2/dist/flyjsonql.min.js"></script>

<!-- Get a specific version -->
<!-- Recommended for production sites! -->
<script src="https://cdn.jsdelivr.net/npm/fly-json-ql@1.2.1/dist/flyjsonql.min.js"></script>
```

### Usage
```javascript
const FlyJsonQL = require('fly-json-ql');  // In browser doesn't need this line
const jsonql = new FlyJsonQL();

// example data
var data1 = [
    {user_id:1,name:'budi',age:10},
    {user_id:5,name:'wawan',age:20},
    {user_id:3,name:'tono',age:30}
];

// simple select query
var q = [
    {
        select:{
            fields:['user_id','name','age'],
            from:data1,
            where: [
                ['name','==','wawan']
            ]
        }
    }
];

// with callback
jsonql.query(q).exec(function(err, data) {
    console.log(data);
});

// or with promise
jsonql.query(q).promise().then(data => {
    console.log(data);
});
```

### Documentation
Documentation is available in our [Wiki](https://github.com/aalfiann/fly-json-ql/wiki).

### Unit Test
If you want to play around with unit test.
```bash
$ npm test
```