==============================
requete ajax jquery on click on link example  
==============================
echo "<td><a href='javascript:void(0)' onclick='editData(".$id.")'>Edit</a></td>";


var editData = function(id){
   //$('#table-container').load('update-form.php');

   $('#msg').load('update-form.php'); //on load une vue form dans une div "msg"

    $.ajax({    
        type: "GET", //GET OU POST 
        url: "update-data.php", 
        data:{editId:id},            
        dataType: "html",                  
        success: function(data){
			    
          let PREFIX = '<br> \"database.php\" Connection to database established successfully <br> <br>';
			    let correct_data = data; 
          correct_data = correct_data.replace(PREFIX, ''); //on vide le json de chose non voulue

          var userData=JSON.parse(correct_data);  

          $("input[name='id']").val(userData.id);   //set le id dans le form            
          $("textarea[name='title']").val(userData.title);               
          $("textarea[name='description']").val(userData.description);  

          $('html, body').animate({ //pointe sur la div du form updateForm 
              scrollTop: $("#updateForm").offset().top
          }, 2000);  
                       
          //$("input[name='fullName']").val(userData.fullName);
          //$("input[name='emailAddress']").val(userData.emailAddress);
          //$("input[name='city']").val(userData.city);
          //$("input[name='country']").val(userData.country);
           
        }

    });
};
  
==============================
46 at  2021-10-29T15:22:52.000Z
==============================
