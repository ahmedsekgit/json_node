==============================
recuperation des valeurs d un ($this).serialize via ajax  
==============================
 $title     = legal_input($_POST['title']);
 $description = legal_input($_POST['description']);

avec function legal_input($value) {
    //$value = trim($value);
    //$value = stripslashes($value);
    //$value = htmlspecialchars($value);
    $value = addslashes($value);
    return $value;
}  
==============================
51 at  2021-10-29T15:22:52.000Z
==============================
