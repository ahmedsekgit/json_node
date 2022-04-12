    
$(document).on('submit','#userForm',function(e){

        e.preventDefault();
        e.stopImmediatePropagation();
        
        $.ajax({
        method:"POST",
        url: "php-script.php",
        data:$(this).serialize(),
        dataType: 'json',
        success: function(data){

         var nb_keys = Object.keys(data).length ;
         var those_keys = Object.keys(data);

        if(data.nb_similair_1>1) 
        {
        var simila = $("#msg");
            simila.css("background-color", "black");
            simila.css("color", "white");
            simila.append("Similarity! You have some similar records to  " + data.candidate_1 + ".");
            for (var i = 1; i < Object.keys(data).length; i++) 
            {
                if(data.hasOwnProperty("nb_similair_"+i))
                {
                    var link = data["compared_ref_"+i];
                    
                    simila.append(" Check for : " + link + ".");
                }

            }
        }   
        else
        {
         $('#msg').html("no Similarity");       
        }
        
        
        $('#userForm').find('textarea').val('');
        $('#userForm').find('input').val('');
    }})
;});

function divide() {
    //alert("divide");
    var txt;
    txt = document.getElementById('a').value;
    //console.log("txt");
    //console.log(txt);
    var text = txt.split("\n");
    //console.log("text");
    //console.log(text);

    var str = text.join('.</br>');
    //console.log("str");
    //console.log(str);
    //alert(str);
    document.getElementById('a').value = str;
    //document.write(str);

}