const express = require("express");
const router = express.Router();
const csvController = require("../controllers/csv-controller");
const csvjsonController = require("../controllers/csvjson-controller");
const upload = require("../middlewares/upload");

  router.get("/upload",csvController.upload);
  /*router.post("/upload", upload.single("file"), csvController.upload);*/
  router.get("/csvs", csvController.getTutorials);
  router.get("/csv-download", csvjsonController.download);

module.exports = router;
