<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 05.02.16
 * Time: 16:21
 */
if(!isset($_SESSION['user']) || $_SESSION['user']['permissions'] !== "5"){
    header("Location: /main");
    exit();
}
config::$page = "Добавить изображение";
if(isset($_POST['sub']) && isset($_FILES)){
    $files = $_FILES;
    //print_r($files);
    $file = new load($_POST['cat'],$files,$_POST['title'],$_POST['table']);
    unset($file);
}