const db = require('../models/sequelize-model');
var chalk = require('chalk');
const Tutorial = db.tutorials;

const CsvParser = require("json2csv").Parser;

const download = (req, res) => {
  
  Tutorial.findAll().then((objs) => {
    let tutorials = [];

    objs.forEach((obj) => {
      const { id,keyword, link, title, description, reg_date } = obj;
      tutorials.push({ id, keyword, link, title, description, reg_date });
    });

    const csvFields = ['id', 'keyword', 'link', 'title', 'description', 'reg_date' ];
    const csvParser = new CsvParser({ csvFields });

    const csvData = csvParser.parse(tutorials);

    res.setHeader("Content-Type", "text/csv");
    res.setHeader("Content-Disposition", "attachment; filename=tutorials.csv");

    res.status(200).end(csvData);
  });
};
/*
/ Find all Tutorials
Tutorial.findAll().then(Tutorials => {
  console.log("All Tutorials:", JSON.stringify(Tutorials, null, 4));
});

// Create a new Tutorial
Tutorial.create({ firstName: "Jane", lastName: "Doe" }).then(jane => {
  console.log("Jane's auto-generated ID:", jane.id);
});

// Delete everyone named "Jane"
Tutorial.destroy({
  where: {
    firstName: "Jane"
  }
}).then(() => {
  console.log("Done");
});

exports.findAll = (req, res) => {
  const title = req.query.title;
  var condition = title ? { title: { [Op.like]: `%${title}%` } } : null;

  Tutorial.findAll({ where: condition })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials."
      });
    });
};
*/
module.exports = {
  download
};

