==============================
 How to insert an element after another element in JavaScript without using a library?  
==============================
//insert new Element after some reference Element  function insertAfter(newElement, referenceElement) {      referenceElement.parentNode.insertBefore(newElement, referenceElement.nextSibling);  }    //example usage  var newElement = document.createElement("div");      newElement.innerHTML = "my New Div Text";  var myCurrentElement= document.getElementById("myElementID");      insertAfter(newElement, myCurrentElement);
//Where referenceNode is the node you want to put newNode after. If referenceNode is the last child within its parent element, that's fine, because referenceNode.nextSibling will be null and insertBefore handles that case by adding to the end of the list.  //So:  function insertAfter(newNode, referenceNode) {     referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling); } You can test it using the following snippet:  function insertAfter(referenceNode, newNode) {   referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling); }  var el = document.createElement("span"); el.innerHTML = "test"; var div = document.getElementById("foo"); insertAfter(div, el); <div id="foo">Hello</div>
  
==============================
245 at  2021-10-29T15:22:52.000Z
==============================
