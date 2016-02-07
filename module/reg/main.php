<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 13:22
 */
config::$page = "Регистрация";
$config::$menu = "reg";
if(isset($_POST['sub']) && $_POST['captcha'] == $_SESSION['captcha']){
    $user = new User;
    $user->get_user($_POST);
}elseif(isset($_POST['sub']) && (!$_POST['captcha'] == $_SESSION['captcha'])){
    $_SESSION['reg_error_captcha'] = "Не верный код капчи";
}
