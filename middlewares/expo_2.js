const mysql = require("mysql");
const createCsvWriter = require("csv-writer").createObjectCsvWriter;

// Create a connection to the database
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "123",
  database: "db_test"
});

// open the MySQL connection
connection.connect(error => {
  if (error) throw error;

  // query data from MySQL
  connection.query("SELECT * FROM general_test", function(error, data, fields) {
    if (error) throw error;

    const jsonData = JSON.parse(JSON.stringify(data));
    console.log("jsonData", jsonData);

    const csvWriter = createCsvWriter({
      path: "bezkoder_mysql_csvWriter.csv",
      header: [
        { id: "id", title: "id" },
        { id: "keyword", title: "keyword" },
        { id: "link", title: "link" },
        { id: "title", title: "title" },
        { id: "description", title: "description" },
        { id: "reg_date", title: "reg_date" }
      ]
    });

    csvWriter
      .writeRecords(jsonData)
      .then(() =>
        console.log("Write to bezkoder_mysql_csvWriter.csv successfully!")
      );
  });
});
