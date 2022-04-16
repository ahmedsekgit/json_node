==============================
un submit d un form avec ajax en recuperant les val non pas avec serialise  
==============================
$(document).on('submit','#updateForm',function(e){
        e.preventDefault();
         
         var id= $("input[name='id']").val();               
         var title= $("textarea[name='title']").val();               
         var description= $("textarea[name='description']").val(); 

        $.ajax({
        method:"POST",
        url: "update-data.php",
        data:{
          Search: 'Search',
          updateId:id,
          title:title,
          description:description

        },
        success: function(data){ ...  
==============================
50 at  2021-10-29T15:22:52.000Z
==============================
