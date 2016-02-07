<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 18:03
 */
if(isset($_GET['key1'])){
    $logout = new UserTools();
    $logout->logout($_GET['key1']);
}