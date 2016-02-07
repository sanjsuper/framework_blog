<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 04.02.16
 * Time: 16:14
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Редактор блога";
$db = new DB;
$res = $db->select("articles","*");
unset($db);