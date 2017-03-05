<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 18:22
 */

$email = $_GET['email'];

$rand = rand(1000,9999);
$rand = 1234;

$regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/';
if(!preg_match($regex, $email)){
    http_response_code(400);
    exit;
}

//if(mail($email, "Mobile factor account activation", "Please, activate your account with code: " . $rand, "From: webmaster@s1.shev.pro}", "-fwebmaster@{$_SERVER['SERVER_NAME']}")){
echo json_encode(array("code"=>$rand));
