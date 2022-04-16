==============================
best sample example php  response  
==============================

<?php
/*$output = shell_exec('cd ../dashboard && ls -lart');
//$output = shell_exec('history');
//echo "<pre>".print_r($output)."</pre>";
echo "<pre>$output</pre>";*/

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
    $return = array();
    $return['error'] = FALSE;
    $return['name'] = $name;
    //$return['exec_ls_lart'] ="<pre>".shell_exec('cd ../dashboard && ls -lart')."</pre>";

    $Arr=array();
    $lines=array();

    $lines = file('history/history_Commands.txt');

    $results = array();

    foreach ($lines as $value) {

      if (strpos($value, $name) !== false) { $results[] = $value; }

    }

    if( empty($results) ) { $str_commands =  'No matches found.'; }
    else { $str_commands =  $name." was found in: <br> " . implode('<br> ', $results); }
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
  
==============================
63 at  2021-10-29T15:22:52.000Z
==============================
