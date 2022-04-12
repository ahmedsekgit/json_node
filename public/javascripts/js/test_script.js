$( document ).ready(function() {
   console.log( "ready!" ); 

let data = "<br> \"database.php\" Connection to database established successfully <br> <br>{\"id\":\"3\",\"firstname\":null,\"lastname\":null,\"email\":null,\"title\":\"difference between  PDO::exec() and PDO::query()\",\"description\":\"\\r\\n    PDO::exec() - \\\"Execute an SQL statement and return the number of affected rows\\\"\\r\\n    PDO::query() - \\\"Executes an SQL statement, returning a result set as a PDOStatement object\\\"\\r\\n\",\"link\":null,\"reg_date\":\"2021-09-15 10:22:13\"}";
alert("data");
alert(typeof data);
let prefix = "<br> \"database.php\" Connection to database established successfully <br> <br>";
data = data.replace(prefix,"");
alert(data);
var person={"first_name":"Tony","last_name":"Hawk","age":31};
var personJSONString=JSON.stringify(person);
var jsonPerson = '{"first_name":"billy", "age":23}';
var personObject = JSON.parse(jsonPerson); //parse json string into JS object

        
});
