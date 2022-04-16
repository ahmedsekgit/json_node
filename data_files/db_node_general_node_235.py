==============================
 How do I get the number of days between two dates in JavaScript  
==============================
let today = new Date().toISOString().slice(0, 10)  const startDate  = '2021-04-15'; const endDate    = today;  const diffInMs   = new Date(endDate) - new Date(startDate) const diffInDays = diffInMs / (1000 * 60 * 60 * 24);   alert( diffInDays  );
  
==============================
235 at  2021-10-29T15:22:52.000Z
==============================
