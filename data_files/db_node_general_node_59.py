==============================
example du fameux read more ... ou show more avec jquery  
==============================
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery Add Read More Link</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
    var maxLength = 300;
    $(".show-read-more").each(function(){
        var myStr = $(this).text();

        if($.trim(myStr).length > maxLength){
            var newStr = myStr.substring(0, maxLength);
            var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
            $(this).empty().html(newStr);
            $(this).append(' <a href="javascript:void(0);" class="read-more">read more...</a>');
            $(this).append('<span class="more-text">' + removedStr + '</span>');
        }
    });
    $(".read-more").click(function(){
        $(this).siblings(".more-text").contents().unwrap();
        $(this).remove();
    });
});
</script>
<style>
    .show-read-more .more-text{
        display: none;
    }
</style>
</head>
<body>    
    <p>This is a paragraph.</p>
    <p>This is another paragraph.</p>
    <p class="show-read-more">
    This is a very long paragraph
  This is a very long paragraph
This is a very long paragraph
This is a very long paragraphThis is a very long paragraph
This is a very long paragraph
This is a very long paragraph
This is a very long paragraph
This is a very long paragraph...</p>
</body>
</html>  
==============================
59 at  2021-10-29T15:22:52.000Z
==============================
