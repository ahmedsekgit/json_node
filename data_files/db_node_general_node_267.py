==============================
 JS search JSON  
==============================
var data=[{name:"Afghanistan",code:"AF"},{name:"&Aring;land Islands",code:"AX"},{name:"Albania",code:"AL"},{name:"Algeria",code:"DZ"}];  let country = data.find(el => el.code === "AL"); // => {name: "Albania", code: "AL"} console.log(country["name"]);
var results = []; var searchField = "name"; var searchVal = "my Name"; for (var i=0 ; i < obj.list.length ; i++) {     if (obj.list[i][searchField] == searchVal) {         results.push(obj.list[i]);     } } 
  
==============================
267 at  2021-10-29T15:22:52.000Z
==============================
