<?php
/**
 * Created by PhpStorm.
 * User: sergio
 * Date: 05/03/2017
 * Time: 14:06
 */
$BINDRES_FILE = "bindResult.txt.".$_GET['challenge'];

if (file_exists($BINDRES_FILE)) {
    $res = json_decode(file_get_contents($BINDRES_FILE), true);
    file_put_contents("existsUser.txt.".$_GET['challenge'], json_encode($res));
    echo json_encode($res);
    unlink($BINDRES_FILE);
} else {
    http_response_code(404);
}
