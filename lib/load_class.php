<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 05.02.16
 * Time: 16:27
 */

class load {
    public $db;
    public $title;
    public $table_name;
    public $dir;
    public $file;
    public $types = array('image/jpeg',
        'image/gif',
        'image/png');

    public function __construct($dir = false,$file,$title = false,$table_name = false){
        $this->db = new DB;
        $this->title = $title;
        $this->table_name = $table_name;
        $this->dir = $dir;
        $this->file = $file;
        $this->uploadFile($file,$dir);

        //print_r($file);


    }

    private function uploadFile($file = array(),$dir){
        if($this->dir === "" || $this->title === "" || $this->table_name === "") {
            $_SESSION['upload'] = "Заполните все поля!";
            return false;
        }
        //print_r($file);
        if(!$this->isSecur($file)) return false;
        $extension = strtolower(substr(strrchr($file['img']['name'], '.'), 1));
        $uploadfile = $dir."/".uniqid().".".$extension;
        $success = move_uploaded_file($file['img']['tmp_name'], $uploadfile);
        if($success){
            $uploadfile = substr($uploadfile,1);
            $row = array();
            $row['image'] = $uploadfile;
            $row['title'] = $this->title;
            $this->db->insert($this->table_name,$row);
            $_SESSION['upload'] = "Файл загружен на сервер в папку".$dir;
        }else{
            $_SESSION['upload'] = "Ошибка при загрузке";
        }

    }
    protected function isSecur($file){
        $black = array("php","html","php3","php4","htm");
        foreach($black as $item){
            if(preg_match("/$item\$/",$file['img']['name'])) return false;
        }
        $size = $file['img']['size'];
        if($size > 20480000) return false;
        $type = $file['img']['type'];
        for($i=0;$i<count($this->types);$i++){
            if($type == $this->types[$i]) break;
            if($i+1==count($this->types)) return false;
        }
        return true;
    }

}