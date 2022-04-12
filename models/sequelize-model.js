var dbConfig = require('./../config');

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  dialect: dbConfig.dialect,
  operatorsAliases: false,

  pool: {
    max: dbConfig.pool.max,
    min: dbConfig.pool.min,
    acquire: dbConfig.pool.acquire,
    idle: dbConfig.pool.idle
  }
});
const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;

var general_table = dbConfig.database.table;
var general_table_bkp = dbConfig.database.table + `_bkps`;

const Tutorial = sequelize.define(`${general_table}`, {
     id: {
         type: Sequelize.INTEGER,
         primaryKey: true
     },
    keyword : Sequelize.TEXT,
    link : Sequelize.TEXT,
    title : Sequelize.TEXT,
    description : Sequelize.TEXT,
    reg_date: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      },
    created_at: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      },
      updated_at: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      }
}, 
{
    tableName: `${general_table}`,
    freezeTableName: true,
    timestamps: false
});

const Tutorial_bkp = sequelize.define(`${general_table_bkp}`, {
     id: {
         type: Sequelize.INTEGER,
         primaryKey: true
     },
    keyword : Sequelize.TEXT,
    link : Sequelize.TEXT,
    title : Sequelize.TEXT,
    description : Sequelize.TEXT,
    reg_date: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      },
    created_at: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      },
      updated_at: {
        type: 'TIMESTAMP',
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
        allowNull: false
      }
}
, 
{indexes: [{unique: true, fields: ['id']}]}
,
{
    tableName: `${general_table_bkp}`,
    freezeTableName: true,
    timestamps: false
});

//Tutorial.removeAttribute('id');
db.tutorials = Tutorial;
db.tutorials_bkp = Tutorial_bkp;



module.exports = db;
/*
var Foo = sequelize.define('foo', {
 // instantiating will automatically set the flag to true if not set
 flag: { type: Sequelize.BOOLEAN, allowNull: false, defaultValue: true},

 // default values for dates => current time
 myDate: { type: Sequelize.DATE, defaultValue: Sequelize.NOW },

 // setting allowNull to false will add NOT NULL to the column, which means an error will be
 // thrown from the DB when the query is executed if the column is null. If you want to check that a value
 // is not null before querying the DB, look at the validations section below.
 title: { type: Sequelize.STRING, allowNull: false},

 // Creating two objects with the same value will throw an error. The unique property can be either a
 // boolean, or a string. If you provide the same string for multiple columns, they will form a
 // composite unique key.
 someUnique: {type: Sequelize.STRING, unique: true},
 uniqueOne: { type: Sequelize.STRING,  unique: 'compositeIndex'},
 uniqueTwo: { type: Sequelize.INTEGER, unique: 'compositeIndex'}

 // The unique property is simply a shorthand to create a unique index.
 someUnique: {type: Sequelize.STRING, unique: true}
 // It's exactly the same as creating the index in the model's options.
 {someUnique: {type: Sequelize.STRING}},
 {indexes: [{unique: true, fields: ['someUnique']}]}

 // Go on reading for further information about primary keys
 identifier: { type: Sequelize.STRING, primaryKey: true},

 // autoIncrement can be used to create auto_incrementing integer columns
 incrementMe: { type: Sequelize.INTEGER, autoIncrement: true },

 // Comments can be specified for each field for MySQL and PG
 hasComment: { type: Sequelize.INTEGER, comment: "I'm a comment!" },

 // You can specify a custom field name via the "field" attribute:
 fieldWithUnderscores: { type: Sequelize.STRING, field: "field_with_underscores" },

 // It is possible to create foreign keys:
 bar_id: {
   type: Sequelize.INTEGER,

   references: {
     // This is a reference to another model
     model: Bar,

     // This is the column name of the referenced model
     key: 'id',

     // This declares when to check the foreign key constraint. PostgreSQL only.
     deferrable: Sequelize.Deferrable.INITIALLY_IMMEDIATE
   }
 }
});*/
