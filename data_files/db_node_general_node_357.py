==============================
using promise  to properly return a result from mysql with Node?  
==============================



I guess what you really want to do here is returning a Promise object with the results. This way you can deal with the async operation of retrieving data from the DBMS: when you have the results, you make use of the Promise resolve function to somehow "return the value" / "resolve the promise".

Here's an example:

getEmployeeNames = function(){
  return new Promise(function(resolve, reject){
    connection.query(
        "SELECT Name, Surname FROM Employee", 
        function(err, rows){                                                
            if(rows === undefined){
                reject(new Error("Error rows is undefined"));
            }else{
                resolve(rows);
            }
        }
    )}
)}

On the caller side, you use the then function to manage fulfillment, and the catch function to manage rejection.

Here's an example that makes use of the code above:

getEmployeeNames()
.then(function(results){
  render(results)
})
.catch(function(err){
  console.log("Promise rejection error: "+err);
})

At this point you can set up the view for your results (which are indeed returned as an array of objects):

render = function(results){ for (var i in results) console.log(results[i].Name) }

Edit I'm adding a basic example on how to return HTML content with the results, which is a more typical scenario for Node. Just use the then function of the promise to set the HTTP response, and open your browser at http://localhost:3001

require('http').createServer( function(req, res){
if(req.method == 'GET'){
    if(req.url == '/'){
        res.setHeader('Content-type', 'text/html');
        getEmployeeNames()
        .then(function(results){
          html = "<h2>"+results.length+" employees found</h2>"
          html += "<ul>"
          for (var i in results) html += "<li>" + results[i].Name + " " +results[i].Surname + "</li>";
          html += "</ul>"
          res.end(html);
        })
        .catch(function(err){
          console.log("Promise rejection error: "+err);
          res.end("<h1>ERROR</h1>")
        })
    }
}
}).listen(3001)


                      
==============================
357 at  2021-10-29T15:22:52.000Z
==============================
