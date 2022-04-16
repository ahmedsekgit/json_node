==============================
best sample example ajax request  
==============================
<!-- <link type="text/css" rel="stylesheet" href="css/search_style.css"/> -->
        <link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.min.css">
        <link rel="stylesheet" href="css/dark_css.css" />


        <script src="js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="css/main.css" />
        <script type="text/javascript" src="js/main.js"></script>
      <script type="text/javascript" src="js/ajax-script.js"></script>


        <title>REF - SEARCH Notebook</title>
    </head>
    
<button onclick="myFunction()">Toggle dark mode</button>
<h2>
<a href="ref_insert_data.php">inserting data</a>
<a href="index.php">Try Again</a>
<a href="ref_update_data.php">updating data</a>
<a href="index.php">Try Again</a>
<a href="ref_search_engine.php">simple search engine</a>
<!-- <a href="index.php">Try Again</a>
<a href="out_shell_exec.php">exemple de shell_exec php</a>
<a href="index.php">Try Again</a>
<a href="indep_data_flow.php">Data Flow </a>
<a href="indep_file_parser.php">file parser</a>
<a href="index.php">Try Again</a> -->
<a href="ref_search_commands.php">search command</a>
</h2>





<!-- This div will be populated with error messages -->
<div id="example_form_error"></div>

<!-- Here is your form -->
<div id="example_form_enter">
    <form id="contact_modal_form" method='post' action='post_search_commands.php'>
            <label for="Name">Enter Your Name (Not "Adam"):</label> <input class='textbox' name='Name' type='text' size='25' required />
            <button class='contact_modal_button' type='submit'>Send</button>
    </form>
</div>

<!-- This div will be populated with success messages -->
<div id="example_form_success"></div>

<!-- This div contains a section that is hidden initially, but displayed when the form is submitted successfully -->
<div id="example_form_confirmation" style="display: none">
    <p>
        Additional static div displayed on success.
        <br>
        <br>
        <a href="index.php">Try Again</a>
    </p>
</div>

<br>

<!-- Below is the jQuery function that process form submission and receives back results -->
<script>
    $(function() {
        $("#contact_modal_form").submit(function(event) {
            var form = $(this);
            console.log(form);
            $.ajax({
                type: form.attr('method'),
                url: form.attr('action'),
                data: form.serialize(),
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    if(data.error == true) {
                        var error = $("#example_form_error");
                        error.css("color", "red");
                        error.html("Not " + data.msg + ". Please enter a different name.");
                        console.log(error);
                    } else {
                        
                        // $("#example_form_enter").hide();
                        $("#example_form_enter").show();
                        $("#example_form_error").hide();
                        $("#example_form_confirmation").show();

                        var success = $("#example_form_success");
                        success.css("color", "green");
                        success.html("Success! You submitted the name " + data.name + ".");
                        success.html(" " + data.str_commands + " ");
                    }
                }
            });
            event.preventDefault();
        });
    });
</script>

  
==============================
62 at  2021-10-29T15:22:52.000Z
==============================
