<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 07.02.16
 * Time: 16:44
 */
if(isset($_GET['key1'])){
    $db = new DB;
    $res = $db->select("articles","*","id,".$_GET['key1']);
}
config::$page = $res[0]['title'];