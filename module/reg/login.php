<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 13:44
 */
$config::$menu = "login";
config::$page = "Авторизация";
if(isset($_POST['sub']) && $_POST['captcha'] == $_SESSION['captcha']){
    $login = new UserTools();
    $login->login($_POST);
}elseif(isset($_POST['sub']) && ($_POST['captcha'] !== $_SESSION['captcha'])){
    $_SESSION['reg_error_captcha'] = "Не верный код капчи";
}
//echo $_COOKIE['auth'];