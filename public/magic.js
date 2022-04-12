$(document).ready(function() {
    $("form#changeQuote").on('submit', function(e) {
        e.preventDefault();
        var data = $('input[name=quote]').val();
        console.log("data:", data);
        console.dir(data);

        $.ajax({
                type: 'post',
                url: '/ajax',
                data: data,
                dataType: 'text'
            })
            .done(function(data) {
                console.log("data:", data);
                console.dir(data);

                $('h1').html(data.quote);
            });
    });
});