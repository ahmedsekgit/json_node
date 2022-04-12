$(document).ready(function() {
    console.log("reading crud_form js file");

    var multipleFields = document.querySelectorAll('.auto-resize');
    for (var i = 0; i < multipleFields.length; i++) {

        multipleFields[i].addEventListener('input', autoResizeHeight, 0);
    }
    // auto resize multiple textarea
    function autoResizeHeight() {
        this.style.height = "auto";
        this.style.height = this.scrollHeight + "px";
        this.style.borderColor = "green";
    }

}); /* fin de document ready */