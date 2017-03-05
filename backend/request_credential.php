<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 19:25
 */
$USER_FILE = "existsUser.txt." . $_GET['challenge'];


$challenge = $_GET['challenge'];
$domain = $_GET['domain'];


if (strlen($challenge) == 0 || strlen($domain) == 0 || !file_exists($USER_FILE)) {
    http_response_code(400);
    die("Required field are empty");
}

$res = json_decode(file_get_contents($USER_FILE), true);
$token = $res['token']; // PUSH A NOTIFICATION

$rndID=rand(1, 9999999);
$rndID=123123;
$res['activeRequest'][$rndID]=array('domain'=>$domain);
file_put_contents($USER_FILE, json_encode($res));


echo json_encode(array('token'=>$rndID));
