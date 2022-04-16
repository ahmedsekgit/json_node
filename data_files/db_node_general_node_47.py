==============================
submit un insert form with ajax   
==============================
$(document).on('submit','#userForm',function(e){ //call du submit form

        e.preventDefault();
        
        $.ajax({
        method:"POST",
        url: "php-script.php",
        data:$(this).serialize(),//on serialise toute les valeurs
        success: function(data){
      
        $('#msg').html(data);
        $('#userForm').find('textarea').val('');//remet a vide les champs
        $('#userForm').find('input').val('');
    }})
;});  
==============================
47 at  2021-10-29T15:22:52.000Z
==============================
