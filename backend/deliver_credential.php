<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 19:31
 */


$USER_FILE = "existsUser.txt." . $_GET['challenge'];

$rndID = $_GET['token'];

$res = json_decode(file_get_contents($USER_FILE), true);
if(array_key_exists($rndID, $res['activeRequest'])){
    $res['activeRequest'][$rndID]['data']=$_POST;
    file_put_contents($USER_FILE, json_encode($res));
    echo "OK";
}else{
    http_response_code(400);
}
