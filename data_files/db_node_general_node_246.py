==============================
 How to insert an element after another element in JavaScript without using a library  
==============================
//insert new Element after some reference Element  function insertAfter(newElement, referenceElement) {      referenceElement.parentNode.insertBefore(newElement, referenceElement.nextSibling);  }    //example usage  var newElement = document.createElement("div");      newElement.innerHTML = "my New Div Text";  var myCurrentElement= document.getElementById("myElementID");      insertAfter(newElement, myCurrentElement);
  
==============================
246 at  2021-10-29T15:22:52.000Z
==============================
