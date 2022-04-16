==============================
le fameux file parser d un fichier qui m affiche les commande historique  
==============================
<?php
function parcour($a)
{
	foreach ($a as $k => $v) {
	echo "<br>";
    echo "\$a[$k] => $v\n";
	}
}
// Defining a callback function
function myFilter($var){
    return ($var !== NULL && $var !== FALSE && trim($var) !== "");
}

function parcourVal($a)
{
	$array= array();
	$i = 0;
	foreach ($a as $k => $v) {
	//echo "<br>";
    //echo "\$a[$k] => $v\n";
    $array[$i] = $v;
    $i++;
	}
return $array;	
}
$a = array(
    "un" => 1,
    "deux" => 2,
    "trois" => 3,
    "dix-sept" => 17
);

foreach ($a as $k => $v) {
    echo "\$a[$k] => $v\n";
}

$mystring = 'abca';
$findme   = 'a';
$pos = strpos($mystring, $findme);

// The !== operator can also be used.  Using != would not work as expected
// because the position of 'a' is 0. The statement (0 != false) evaluates
// to false.
if ($pos !== false) {
     echo "The string '$findme' was found in the string '$mystring'";
         echo " and exists at position $pos";
} else {
     echo "The string '$findme' was not found in the string '$mystring'";
}
echo "<br>";
echo "<br>";


function nettoyage($array,$pattern,$case)
{
	 $nb_cmds = 0;
	 $arrayReturn = array();
	 foreach ($array as $k => $v) {
	 $str = $v;
	 $returned =  preg_match($pattern, $str); // Outputs 1

	 switch ($case) {
	 			case 1:
				    if(!$returned)
					{
						
						echo "<br>";
						echo "la commande numero ".$nb_cmds;
						echo "<br>";
							echo "\$a[$k] => $v\n";
						echo "<br>";
						$arrayReturn[$nb_cmds] = $v;
						$nb_cmds++;	
					}
				    break;
				case 2:
				    if($returned)
				    {
				    	
					 	echo "<br> str is :";
					 	echo $str;
					 	echo "<br> str modified is :";
					 	$needle = preg_replace('/^[^A-Za-z]+/', '', $str);
					 	echo $needle;
					 	echo "<br> returned is :";
					 	echo $returned;
					 	$arrayReturn[$nb_cmds] = $needle;
					 	$nb_cmds++;
				 	}
				    break;
				case 3:
				    echo "case equals 3";
				    break;
				default:
				   $nb_cmds++;	
				   echo "<br>";
				   echo "\$a[$k] => $v\n";
				}
				
	 
    
	}
	echo "le nombre de commande est de :".$nb_cmds;
	//parcour(array_unique($arrayReturn));
return array_unique($arrayReturn);
}


echo "<br>";
echo "<br>";

$GlobalArr=array();
$Arr1 = array();
$Arr2 = array();
$Arr3 = array();
$Arr4 = array();
$Arr5 = array();
$Arr6 = array();

$pattern1 = "/^#([0-9]{5,11})$/i";
$pattern2 = "/^(.*?)[A-Za-z]/i";
$pattern2 = "/^[^A-Za-z]+/i";

$lines1 = file('history/new_history.php');
$lines1 = array_unique($lines1);
$Arr1 = nettoyage($lines1,$pattern2,2);
$Arr1 = array_unique($Arr1);


$lines2 = file('history/history_2_4-07-2021.sh');
$lines2 = array_unique($lines2);
$Arr2 = nettoyage($lines2,$pattern2,2);
$Arr2 = array_unique($Arr2);

$lines3 = file('history/hist.txt');
$lines3 = array_unique($lines3);
$Arr3 = nettoyage($lines3,$pattern1,1);
$Arr3 = array_unique($Arr3);

$lines4 = file('history/history_28_08_2008.sh');
$Arr4 = array_unique($lines4);

$lines5 = file('history/history_tmp.sh');
$Arr5 = array_unique($lines5);

$lines6 = file('history/new_history_new.php');
$lines6 = array_unique($lines6);
$Arr6 = nettoyage($lines6,$pattern2,2);
$Arr6 = array_unique($Arr6);


echo "<br>";
echo "<br>";
echo "<br>";
echo "le resultat pour le fichier new_history.php  <br>";
parcour($Arr1);

echo "<br>";
echo "<br>";
echo "<br>";
echo " le resultat pour le fichier history_2_4-07-2021.sh  <br>";
parcour($Arr2);

echo "<br>";
echo "<br>";
echo "<br>";
echo " le resultat pour le fichier hist.txt  <br>";
echo "<br>";
parcour($Arr3);


echo "<br>";
echo "<br>";
echo "<br>";
echo " le resultat pour le fichier history_28_08_2008.sh ; <br>";
echo "<br>";
parcour($Arr4);

echo "<br>";
echo "<br>";
echo "<br>";
echo " le resultat pour le fichier history_tmp.sh; <br>";
echo "<br>";
parcour($Arr5);

echo "<br>";
echo "<br>";
echo "<br>";
echo "le resultat pour le fichier new_history_new.php  <br>";
parcour($Arr6);


//$GlobalArr = $Arr1+$Arr2+$Arr3+$Arr4+$Arr5+$Arr6;
$GlobalArr = array_merge($Arr1,$Arr2,$Arr3,$Arr4,$Arr5,$Arr6);
$GlobalArr = array_filter($GlobalArr, "myFilter");     
$GlobalArr = array_unique($GlobalArr);

echo "<br>";
echo "<br>";
echo "<br>";
echo " le resultat final Global <br>";
echo "<br>";
$ArrFinal = array();
$ArrFinal = parcourVal($GlobalArr);
parcour($ArrFinal);

file_put_contents('history/history_Commands.txt', implode($ArrFinal));
//echo "<pre>".print_r($lines)."</pre>";
//file_put_contents('hist2.txt', implode($lines));
//echo "<pre>$lines</pre>";
?>
  
==============================
55 at  2021-10-29T15:22:52.000Z
==============================
