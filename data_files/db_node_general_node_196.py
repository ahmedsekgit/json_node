==============================
 Email validation using javascript  
==============================
function checkEmail() {      var email = document.getElementById('txtEmail');     var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;      if (!filter.test(email.value)) {     alert('Please provide a valid email address');     email.focus;     return false;  } }  - Call the function on Email textbox
<!DOCTYPE html> <html lang="en"> <head> <meta charset="utf-8"> <title>JavaScript form validation - checking email</title> <link rel='stylesheet' href='form-style.css' type='text/css' />       </head> <body onload='document.form1.text1.focus()'> <div class="mail"> <h2>Input an email and Submit</h2> <form name="form1" action="#">  <ul> <li><input type='text' name='text1'/></li> <li> </li> <li class="submit"><input type="submit" name="submit" value="Submit" onclick="ValidateEmail(document.form1.text1)"/></li> <li> </li> </ul> </form> </div> <script src="email-validation.js"></script> </body> </html>  
  
==============================
196 at  2021-10-29T15:22:52.000Z
==============================
