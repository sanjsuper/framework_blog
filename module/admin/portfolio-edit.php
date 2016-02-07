<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 05.02.16
 * Time: 11:22
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Редактировать портфолио";
$db = new DB;
$res = $db->select("portfolio","*");
if(empty($res)){
    $_SESSION['not_image'] = "Not image";
}else{
    unset($_SESSION['not_image']);
}
if(isset($_GET['key1'])){
    $success = $db->delete("portfolio","id",$_GET['key1']);
    if($success === false){
        $_SESSION['del_error'] = "Ошибка при удалиении";
        header("Location: /admin/portfolio-edit");
        exit();
    }else {
        $_SESSION['del_error'] = "Успешно удалено";
        header("Location: /admin/portfolio-edit");
        exit();
    }
}



unset($db);