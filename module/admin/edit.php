<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 04.02.16
 * Time: 17:29
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Редактировать статью";
$id_article = $_GET['key1'];
$db = new DB;
$res = $db->select("articles","*","id,".$id_article);
//print_r($res);
if(isset($_POST['sub'])){
    $k = "id";
    $up_article = $db->update("articles",$_POST,$k,$id_article);
    if($up_article){
        $_SESSION['up_article'] = "Статья успешно обновлена";
    }else {
        $_SESSION['up_article'] = "Ошибка при обновлении";
    }
}
unset($db);