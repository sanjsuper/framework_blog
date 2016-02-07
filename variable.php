<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 31.01.16
 * Time: 10:19
 */
if(isset($_GET['route'])){
    $temp = explode('/',$_GET['route']);
    if($temp[0] == 'admin') {
        $_GET['module'] = "admin";
        Config::$template = 'admin';
        //if(!isset($_GET['module'])){
        //$_GET['module'] = 'home';
        //}
        unset($temp[0]);
    }
    foreach($temp as $k=>$v){
        if($k == 0){
            $_GET['module'] = $v;
        }
        elseif($k == 1){
            $_GET['page'] = $v;
        }
        else {
            $_GET['key'.($k-1)] = $v;
        }
    }

    unset($_GET['route']);
}
if(!isset($_GET['module']) || $_GET['module'] == ""){
    $_GET['module']="main";
}
if(!isset($_GET['page']) || $_GET['page'] == ''){
    $_GET['page'] = 'main';
}

$arrays = array("main","about","blog","contact","portfolio","error","reg","admin");
if(!in_array($_GET['module'],$arrays)){
    header("Location: /error");
    exit();
}
if(isset($_COOKIE['auth'])){// Проверяем куку у пользователя с чекбоксом запомнить менz
    //print_r($_COOKIE['auth']);
    if(!isset($_SESSION['user'])){
        $browser = get_browser(null, true);
        $text_cookie =md5($browser['parent']);
        $auth = $_COOKIE['auth'];
        $pattern_auth = "#^(\d*\+)#";
        $replace_auth = "";
        $auth = preg_replace($pattern_auth,$replace_auth,$auth);//так как в куке мы передаем еще и id, то для проверки на соответствие системным параметрам затираем его
        if($auth == $text_cookie){ // если у пришедшего пользователя есть кука и эта кука сходится с его браузером и системой, но в сессиях пусто, извлекаем инфу по id в куке из базы и записываем в сессию.
            $pattern_auth_cookie = "#^(\d*)\+.*#";
            $replace_auth_cookie = "$1";
            $id = preg_replace($pattern_auth_cookie,$replace_auth_cookie,$_COOKIE['auth']);
            $db = new DB;
            $auth_sess = $db->select("user","*","id,".$id);
            $_SESSION['user'] = $auth_sess[0];
        }else{
            setcookie("auth","", time()-3600); //Если куку украли и пытаются войти не под той системой с кукой, затираем куку.
        }
    }
}