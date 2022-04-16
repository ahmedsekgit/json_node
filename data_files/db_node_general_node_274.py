==============================
 Javascript Generate Random Colo  
==============================
function generateRandomColor() {    var letters = '0123456789ABCDEF';    var color = '#';    for (var i = 0; i < 6; i++) {      color += letters[Math.floor(Math.random() * 16)];    }    return color;  }    var randomColor=generateRandomColor();//"#F10531"
  
==============================
274 at  2021-10-29T15:22:52.000Z
==============================
