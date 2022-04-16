==============================
 Javascript remove all child elements  
==============================
var myDiv = document.getElementById("myDivID");      myDiv.innerHTML = "";//remove all child elements inside of myDiv
// Get the <ul> element with id="myList" let list = document.getElementById("myList");  // As long as <ul> has a child node, remove it while (list.hasChildNodes()) {     list.removeChild(list.firstChild); }
function deleteChild() {          let e = document.querySelector("ul");                   //e.firstElementChild can be used.          let child = e.lastElementChild;           while (child) {              e.removeChild(child);              child = e.lastElementChild;          }      }      let btn = document.getElementById(      "btn").onclick = function() {          deleteChild();      } 
document.getElementById("myDivID").innerHTML = "";
document.getElementById("myId").innerHTML = '';
  
==============================
300 at  2021-10-29T15:22:52.000Z
==============================
