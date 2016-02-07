<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 27.01.16
 * Time: 21:00
 */

config::$page = "Подтверждение кода активации";
if(isset($_GET['key1'])){
    $res = array();
    $res['activate'] = 1;
    $db = new DB;
    $activate = $db->update("user",$res,"activ_code",$_GET['key1']);
    if($activate){
        $_SESSION['active'] = "Account Activate!";
    }else{
        $_SESSION['active'] = "Произошла ошибка при активации";
    }
    if(isset($_SESSION['active'])){
        header("Location: /reg/regactivate");
        exit();
    }
}