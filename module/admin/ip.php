<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 04.02.16
 * Time: 15:57
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Статистика";
$db = new DB;
$res = $db->select("stats_ip","*","id_user,".$_GET['key1']);
//print_r($res);