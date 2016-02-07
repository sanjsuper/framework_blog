<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 02.02.16
 * Time: 13:49
 */
//echo 12359651516584651;
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Главная";
//$stats = new Stats($_SERVER['REMOTE_ADDR'],$link);
$db = new DB;
$res = $db->select("stats","*");
//print_r($res);
if(isset($_GET['key1'])){

}
unset($db);