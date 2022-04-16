==============================
confirm with javascript before delete, confirmer avec javascript avant suppression  
==============================
1- one line code
<a href="#" title="delete" class="delete" 
onclick="return confirm('Are you sure you want to delete this item')">
Delete</a>

2- 
var result = confirm("Want to delete?");
//result is true or false (alert(result) returning true or false
if (result) {
    //Logic to delete the item
}
3-
unction ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}


<input type="button" onclick="ConfirmDelete()">

4-
<a href="/delete" class="delete" data-confirm="Are you sure to delete this item?">Delete</a>

This is pure vanilla JS, compatible with IE 9+:

var deleteLinks = document.querySelectorAll('.delete');

for (var i = 0; i < deleteLinks.length; i++) {
  deleteLinks[i].addEventListener('click', function(event) {
      event.preventDefault();

      var choice = confirm(this.getAttribute('data-confirm'));

      if (choice) {
        window.location.href = this.getAttribute('href');
      }
  });
}

  
==============================
24 at  2021-10-29T15:22:52.000Z
==============================
