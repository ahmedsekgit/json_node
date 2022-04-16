==============================
 Disable Multiple Form Submits with Vanilla JavaScript  
==============================
var form = document.getElementById('formID'); var submitButton = document.getElementById('submitID');  form.addEventListener('submit', function() {     // Disable the submit button    submitButton.setAttribute('disabled', 'disabled');     // Change the "Submit" text    submitButton.value = 'Please wait...'; 			 }, false);
  
==============================
189 at  2021-10-29T15:22:52.000Z
==============================
