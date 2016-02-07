<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 31.01.16
 * Time: 10:29
 */
$config::$menu = "blog";
config::$page = "Блог";
$db = new DB;

$res = $db->select("articles","*");


unset($db);