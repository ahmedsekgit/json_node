==============================
 $ is not a function jquery  
==============================
There are quite lots of answer based on situation.  1) Try to replace '$' with "jQuery"  2) Check that code you are executed are always below the main jquery script.  <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> <script type="text/javascript"> jQuery(document).ready(function(){  }); </script> 3) Pass $ into the function and add "jQuery" as a main function like below.  <script type="text/javascript"> jQuery(document).ready(function($){  }); </script>
jQuery(document).ready(function($){   //you can now use $ as your jQuery object here }); 
  
==============================
126 at  2021-10-29T15:22:52.000Z
==============================
