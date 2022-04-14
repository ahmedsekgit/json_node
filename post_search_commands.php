
<?php
/*$output = shell_exec('cd ../dashboard && ls -lart');
//$output = shell_exec('history');
//echo "<pre>".print_r($output)."</pre>";
echo "<pre>$output</pre>";*/


// Defining a callback function
function filtrage($var){
    return ($var !== NULL && $var !== FALSE && trim($var) !== "");
}

function parcour($a)
{
    foreach ($a as $k => $v) {
    echo "<br>";
    echo "\$a[$k] => $v\n";
    }
}

// Request Post Variable
$name = $_REQUEST['Name'];

// Validation
if($name == 'Adam') {
echo json_error($name);
} else {
echo json_success($name);
};

// Return Success Function
function json_success($name) {
    //$name = 'grep';
    $name = trim(strtolower($name));
    $return = array();
    $return['error'] = false;
    $return['name'] = $name;
    //$return['exec_ls_lart'] ="<pre>".shell_exec('cd ../dashboard && ls -lart')."</pre>";
    
    
    $Arr=array();
    $lines=array();

    $lines = file('history/SHELL_GLOBAL.txt');
    //$lines = array_filter($lines, "filtrage");     
    $lines = array_unique($lines);/*array_unique unset even the key and value*/
    $results = array();


    foreach ($lines as $key => $value) {

        $value = trim(strtolower($value));

      
        if(strpos($value, $name) !== false && strpos($value, '__?') === false)  
        {
            if(array_key_exists($key-1, $lines))
            {
                $results[] = $lines[$key-1]." <br>".$value; 
           }
           else
            {
                $results[] = $value; 
            }
        }

    }

    if( empty($results) ) { $str_commands =  'No matches found.'; }
    else 
    { 
        /*reduction de nombre d elements affiche*/
        $arrTemp = array();
        for ($i=0; $i < 30; $i++) 
        { 
            $arrTemp[$i] = $results[$i];
        }
        $results = array();
        $results = $arrTemp;

        
        $arrRender = array();
        $str_commands = "<table class=\"table  table-active\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\" style=\"width: 67%; margin: 0 auto 2em auto;\">
        <thead>
          <tr>
            <th scope=\"col\">Command Line</th>
            <th scope=\"col\">Copy</th>
          </tr>
        </thead>";
        $str_commands .= "<tbody>";
        foreach ($results as $key_line => $command) 
        {
            $td1 = "<p><pre><code id=\"text__".$key_line."\">".$command."</pre></code></p>";
            $td2 = "<button type=\"button\" class=\"btn btn-success btn-sm\" onclick=\"copyToClipboard('#text__".$key_line."')\">Copy</button>";

            $td1 = nl2br($td1);
            //$td1 = str_replace('#', '<br>#', $td1);
            //$td1 = str_replace('$', '<br>$', $td1);
            
            $str_commands .= "<tr id=\"filter_global\" class=\"table-active\"></tr>" ;
            $str_commands .= "<tr>".$td1."</tr>" ;
            $str_commands .= "<tr>".$td2."</tr>" ;
            $str_commands .= "<tr></tr>" ;
            

            //$arrRender[$key_line]=$output_command;
        }
        $str_commands .= "</tbody>
      </table>" ;
        //$str_commands =  $name." was found in: <br> " . implode(' ', $arrRender).""; 
    }
    $return['str_commands'] = $str_commands;
    //parcour($return);


    //$return['exec'] = implode('', $return['exec']);
    return json_encode($return, JSON_PRETTY_PRINT);
    //return json_encode($return);
}

// Return Error Function
function json_error($msg) {
    $return = array();
    $return['error'] = TRUE;
    $return['msg'] = $msg;
    return json_encode($return);
}

?>
