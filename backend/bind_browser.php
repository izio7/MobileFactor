<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 11:55
 */
$CHALL_FILE = "challenge.txt.";

$challenge = $_GET['challenge'];
$browser = $_SERVER['HTTP_USER_AGENT'];

$CHALL_FILE = $CHALL_FILE . $challenge;

file_put_contents($CHALL_FILE, json_encode(array('challenge' => $challenge, 'browser' => $browser)));

echo "OK";
