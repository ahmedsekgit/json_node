==============================
 DATE UTC END OF MONTH  
==============================
  //TODAY is the 16th of OCTOBER 2020   var date = new Date();   var year = date.getMonth() < 11 ? date.getFullYear() : date.getFullYear() + 1;   var month = date.getMonth() < 11 ? date.getMonth() + 1 : 0;    // toUTCString() to display a local time in utc string   console.log(new Date(Date.UTC(year, month)).toUTCString()); 		//Sun, 01 Nov 2020 00:00:00 GMT   var utcYear = date.getUTCMonth() < 11 ? date.getUTCFullYear() : date.getUTCFullYear() + 1;   var utcMonth = date.getUTCMonth() < 11 ? date.getUTCMonth() + 1 : 0;      // toString() do not change datetime   console.log(new Date(utcYear, utcMonth));   		//22 Sun Nov 01 2020 00:00:00 GMT+0100 (Ora standard dell&rsquo;Europa centrale)
  
==============================
185 at  2021-10-29T15:22:52.000Z
==============================
