<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 18:01
 */
$USER_FILE = "userfile.txt.";

$challenge = $_GET['challenge'];
$domain = $_GET['domain'];


if (strlen($challenge) == 0 || !file_exists($USER_FILE . $challenge) || strlen($domain) == 0) {
    http_response_code(404);
    die("Not found credential");
}

$data = json_decode(file_get_contents($USER_FILE . $challenge), true);
if (array_key_exists($domain, $data)){
    echo json_encode(array('data'=>$data[$domain]));
}else{
    http_response_code(404);
}