<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 14:11
 */

$BINDRES_FILE = "bindResult.txt.";
$CHALL_FILE = "challenge.txt.";

$chall = $_GET['challenge'];
$priv_key = $_POST['key'];
$email = $_POST['email'];
$token = $_POST['token'];


if (strlen($chall) == 0 || strlen($priv_key) == 0 || strlen($token) == 0 || strlen($email) == 0) {
    echo "ERROR";
    http_response_code(400);
    die();
}

if (file_exists($CHALL_FILE . $chall)) {
    //echo file_get_contents($CHALL_FILE . $chall);
    file_put_contents($BINDRES_FILE . $chall, json_encode(array('challenge' => $chall, 'privkey' => $priv_key, 'email' => $email, 'token' => $token)));
} else {
    http_response_code(401);
}
