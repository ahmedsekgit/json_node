==============================
php strpos funcion example pour comprendre comment strpos fonctionne  
==============================
$string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla felis diam, mattis id elementum eget, ullamcorper et purus.";
$keyword = "Nulla";
$index_deb_keyword = strpos($string, $keyword);
$index_fin_keyword = strpos($string, $keyword) + strlen($keyword);
$before_keyword = substr($string,$index_deb_keyword-20, 20);
$after_keyword = substr($string, $index_fin_keyword, 20);
  
==============================
65 at  2021-10-29T15:22:52.000Z
==============================
