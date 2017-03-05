<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 19:39
 */

$USER_FILE = "existsUser.txt." . $_GET['challenge'];
$challenge = $_GET['challenge'];

if (strlen($challenge) == 0 || !file_exists($USER_FILE)) {
    http_response_code(400);
    die("Not found credential");
}

$res = json_decode(file_get_contents($USER_FILE));
$rndID = $_GET['token'];

$res = json_decode(file_get_contents($USER_FILE), true);
if(array_key_exists($rndID, $res['activeRequest']) && array_key_exists('data', $res['activeRequest'][$rndID])) {
    echo json_encode($res['activeRequest'][$rndID]);
    unset($res['activeRequest']);
    file_put_contents($USER_FILE, json_encode($res));
}else{
    http_response_code(404);
}