==============================
 Clear Cell Value In Google Sheet By App Scripts  
==============================
var sheet = ss.getSheetByName("Question&aacute;rio DQSA");     var range = sheet.getRange("F1");   range.deleteCells(SpreadsheetApp.Dimension.COLUMNS);//F2 becomes the new F1 
  
==============================
177 at  2021-10-29T15:22:52.000Z
==============================
