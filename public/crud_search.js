$(document).ready(function() {
    console.log("reading crud_search js file");

}); /* fin de document ready */

$('#select_link').click(function(e) {
    e.preventDefault();
    console.log('select_link clicked');

    var data = {};
    data.title = "title";
    data.message = "message";

    $.ajax({
        type: 'POST',
        data: JSON.stringify(data),
        contentType: 'application/json',
        url: $('#site_address_port').val() + '/endpoint',
        success: function(data) {
            console.log('success');
            console.log(JSON.stringify(data));
        }
    });

});