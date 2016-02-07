<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 31.01.16
 * Time: 10:29
 */
$config::$menu = "portfolio";
config::$page = "Портфолио";
$db = new DB;
$res = $db->select("portfolio","*");
unset($db);