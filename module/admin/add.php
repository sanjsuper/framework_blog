<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 04.02.16
 * Time: 16:28
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Добавить статью";
if(isset($_POST['sub'])){
    $db = new DB;
    $success = $db->insert("articles",$_POST);
    if(isset($success)){
        $_SESSION['article_success'] = "Статья успешно добавлена";
    }
    unset($db);
}