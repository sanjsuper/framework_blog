<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 07.02.16
 * Time: 15:12
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Редактировать пользователя";
if(isset($_GET['key1'])){
    $db = new DB;
    $res = $db->select("user","*","id,".$_GET['key1']);
}

if(isset($_POST['permissions_sub'])){
    $row = array();
    $row['permissions'] = $_POST['select'];
    $db->update("user",$row,"id",$_GET['key1']);
    header("location: /admin/user-edit/".$_GET['key1']);
    exit();
}
if(isset($_POST['activate'])){
    $row = array();
    $row['activate'] = $_POST['select_activate'];
    $db->update("user",$row,"id",$_GET['key1']);
    header("location: /admin/user-edit/".$_GET['key1']);
    exit();
}


unset($db);