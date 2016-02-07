<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 31.01.16
 * Time: 10:17
 */
error_reporting(-1);
session_start();

function __autoload($name){
    $name = mb_strtolower($name);
    include_once 'lib/'.$name.'_class.php';
}
//comment


$config = new Config;

include_once 'variable.php';
$link = $_SERVER['REQUEST_URI'];
//print_r($_SERVER['REQUEST_URI']);

include_once './module/'.$_GET['module'].'/'.$_GET['page'].'.php';
include_once './templates/'.$config::$template.'/index.tpl';
$stats = new Stats($_SERVER['REMOTE_ADDR'],$link);
//print_r($_SESSION);
//echo $_COOKIE['auth'];
