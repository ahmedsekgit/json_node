==============================
javascript example function qui convertit les \n en <br> fait comme nl2br du php  
==============================
function divide() {
    //alert("divide");
    var txt;
    txt = document.getElementById('a').value;

    var text = txt.split("\n");

    var str = text.join('.</br>');

    document.getElementById('a').value = str;
    
//document.write(str);

}  
==============================
48 at  2021-10-29T15:22:52.000Z
==============================
