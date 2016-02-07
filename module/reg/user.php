<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 06.02.16
 * Time: 15:41
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['activate'] !== "1"){
    header("Location: /main");
    exit();
}
config::$page = "Профиль пользователя ".$_SESSION['user']['login'];
//Смена логина
if(isset($_POST['sub']) && $_POST['captcha'] == $_SESSION['captcha']){
    $update_login = new User();
    $passwords = $update_login->check_password($_POST['password']);
    if($_POST['password'] !== $_POST['password1'] || $_SESSION['user']['password'] !== $passwords){
        $_SESSION['user_error_pass'] = "Пароли не совпадают или пароль введен не верно";
        return false;
    }
    $login = $update_login->check_login($_POST['login']);
    if($login === false){
        $_SESSION['user_error_login'] = "Такой логин уже существует";
        return false;
    }



    $row = array();
    $row['login'] = $_POST['login'];
    $row['password'] = $passwords;
    $success = $update_login->update_user($row);
    unset($update_login);
    if($success === false) {
        $_SESSION['success'] = "Ошибка при обновлении";
        return false;
    }else {
        $_SESSION['success'] = "Логин успешно обновлен";
        header("Location: /reg/user/".$_SESSION['user']['login']);
        exit();
    }



}elseif(isset($_POST['sub']) && $_POST['captcha'] !== $_SESSION['captcha']){

    $_SESSION['user_error_captcha'] = "Не верный код капчи";

}

//смена пароля
if(isset($_POST['sub_pass']) && $_POST['captcha_pass'] == $_SESSION['captcha']){
    $update_pass = new User();
    $passwords = $update_pass->check_password($_POST['password_old']);
    $passwords_new = $update_pass->check_password($_POST['new_pass']);
    if($passwords_new === false) {
        $_SESSION['user_error_new_pass'] = "Пароль не подходит. Введите пароль больше 6 символов и меньше 16";
        return false;
    }

    if($_POST['password_old'] !== $_POST['password1_old']/* || $_SESSION['user']['password'] !== $passwords*/){
        $_SESSION['user_error_old_pass'] = "Пароли не совпадают или пароль введен не верно";
        return false;
    }

    $row = array();
    $row['pass'] = $passwords_new;
    $row['login'] = $_SESSION['user']['login'];
    $success = $update_pass->update_pass($row);
    unset($update_pass);
    if($success === false) {
        $_SESSION['success_pass'] = "Ошибка при обновлении";
        return false;
    }else {
        $_SESSION['success_pass'] = "Пароль успешно обновлен";
        header("Location: /reg/user/".$_SESSION['user']['login']);
        exit();
    }


}elseif(isset($_POST['sub_pass']) && $_POST['captcha_pass'] !== $_SESSION['captcha']){

    $_SESSION['user_error_pass_captcha'] = "Не верный код капчи";

}