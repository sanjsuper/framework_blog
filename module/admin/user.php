<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 07.02.16
 * Time: 0:43
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Пользователи";
$db = new DB;
$res = $db->select("user","*","","","login","ASC");

if(isset($_GET['key1'])){
    $res = $db->select("user","*","permissions,".$_GET['key1'],"","login","ASC");
}
if(isset($_POST['sub_user']) && $_POST['captcha'] == $_SESSION['captcha']){
    $user = new User;
    $success = $user->get_user($_POST);
    if($success !== false){
        header("location: /admin/user");
        exit();
    }
}elseif(isset($_POST['sub_user']) && (!$_POST['captcha'] == $_SESSION['captcha'])){
    $_SESSION['reg_error_captcha'] = "Не верный код капчи";
}

unset($db);