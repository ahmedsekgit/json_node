const db = require('../models/sequelize-model');
const Tutorial = db.tutorials;
//const Tutorial_bkp = db.tutorials;
const Tutorial_bkp = db.tutorials_bkp;

const fs = require("fs");
const chalk = require("chalk");
const csv = require("fast-csv");
var config = require('./../config');

const upload = async (req, res) => {
  try 
  {
    let tutorials = [];
    let path = __basedir + "/db_bkps/CSVs";
    let filename = '';
    let db_name = config.database.db;
    let db_table = config.database.table;
  
    fileObjs = fs.readdirSync(path, { withFileTypes: true });
    for (let key in fileObjs) 
    {
        var fileObj = fileObjs[key];
        if (fileObj.name.includes(db_table)) 
        {
            filename = fileObj.name;
        }
    }
    path = path+'/'+filename;
    console.log(chalk.yellow('path'));
    console.log('path');
    console.dir(path);

    /*
    //traitement en cas de post voir csv-route post route in comment
    //router.post("/upload", upload.single("file"), csvController.upload);

    if (req.file == undefined) 
    {
      return res.status(400).send("Please upload a CSV file!");
    }
    let tutorials = [];
    let path = __basedir + "/extra/uploads/csvs" + req.file.filename;
    */

    fs.createReadStream(path)
      .pipe(csv.parse({ headers: true }))
      .on("error", (error) => {
        throw error.message;
      })
      .on("data", (row) => 
      {
        tutorials.push(row);
      })
      .on("end", () => {
        Tutorial_bkp.bulkCreate(tutorials)
          .then(() => {
            res.status(200).send({
              message:
                "Uploaded the file successfully: " + filename,
            });
          })
          .catch((error) => {
            res.status(500).send({
              message: "Fail to import data into database!",
              error: error.message,
            });
          });
      });
  } catch (error) {
    console.log(error);
    res.status(500).send({
      message: "Could not upload the file: " + filename,
    });
  }
};

const getTutorials = (req, res) => {
  Tutorial_bkp.findAll()
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials.",
      });
    });
};

module.exports = {
  upload,
  getTutorials
};
