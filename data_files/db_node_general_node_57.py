==============================
ajax good requete et bad message avec show et hide d une div ajout d html et du css avec jquery  
==============================
$(function() {
        $("#contact_modal_form").submit(function(event) {
            var form = $(this);
            //console.log(form);
            $.ajax({
                type: form.attr('method'),
                url: form.attr('action'),
                data: form.serialize(),
                dataType: 'json',
                success: function(data) {
                    //console.log(data);
                    if(data.error == true) {
                        var error = $("#example_form_error");
                        error.css("color", "red");
                        error.html("Not " + data.msg + ". Please enter a different name.");
                        //console.log(error);
                    } else {
                        
                        // $("#example_form_enter").hide();
                        $("#example_form_enter").show();
                        $("#example_form_error").hide();
                        $("#example_form_confirmation").show();

                        var success = $("#example_form_success");
                        success.css("color", "green");
                        success.html("Success! You submitted the name " + data.hist + ".");
                        success.html("Success! You submitted the name " + data.exec_ls_lart + ".");
                    }
                }
            });
            event.preventDefault();
        });
    });  
==============================
57 at  2021-10-29T15:22:52.000Z
==============================
