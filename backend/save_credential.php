<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 18:06
 */


$USER_FILE = "userfile.txt.";

$challenge = $_GET['challenge'];
$domain = $_GET['domain'];


if (strlen($challenge) == 0 || strlen($domain) == 0) {
    http_response_code(404);
    die("Not found credential");
}

if (!file_exists($USER_FILE . $challenge)) {
    file_put_contents($USER_FILE . $challenge, "[]");
}

$data = json_decode(file_get_contents($USER_FILE . $challenge), true);
$data[$domain] = $_POST;

file_put_contents($USER_FILE . $challenge, json_encode($data));
echo json_encode($data);