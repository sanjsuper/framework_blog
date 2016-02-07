<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 11:01
 */
class DB {
    public $config;
    public $db_name;
    public $db_user;
    public $db_pass;
    public $db_host;
    public $db_prefix;
    private $mysqli;

    public function __construct(){
        $this->config = new Config();
        $this->db_host = config::$db_host;
        $this->db_name = config::$db_name;
        $this->db_pass = config::$db_pass;
        $this->db_user = config::$db_user;
        $this->db_prefix = config::$db_prefix;
        $this->mysqli = new Mysqli($this->db_host,$this->db_user,$this->db_pass,$this->db_name);
        if ($this->mysqli->connect_errno) exit("Ошибка соединения с базой данных");
        $this->mysqli->set_charset("utf-8");
    }

    public function insertid(){
        return $this->mysqli->insert_id;
    }

    public function select($table_name,$fields,$where = "",$and = "",$orderby = "",$up = "",$limit = ""){
        /*Если две таблицы ерез запятую, пареттерном присваиваем таблицам два префикса и берем в ``*/
        if(preg_match("#.*,.*#",$table_name)){
            $pattern1 = "#(.*),(.*)#";
            $replacement = "`$this->db_prefix$1`,`$this->db_prefix$2`";
            $table_name = preg_replace($pattern1,$replacement,$fields);
        }else{
            $table_name = "`".$this->db_prefix.$table_name."`";
        }
        /* Если ячейка не равна * и не равна любым функциям мускул(COUNT(),MAX(),MIN()) то берем содержимое функции в ``*/
        if($fields !== "*" && !preg_match("#(.*)\((.*)\)#",$fields)) $fields = "`".$fields."`";
        $replace = '$1(`$2`)';
        $fields = preg_replace("#(.*)\((.*)\)#",$replace,$fields);/* Функции мускула, обрабатываем `` кавычками. Например MAX(`fields`) */


        $query = "SELECT ".$fields." FROM ".$table_name;
        /* Если есть WHERE и оно не перечислено через запятую и имеет > или < то мы просто выводим его */
        if($where && preg_match("#.*[<>].*#",$where)){
            $query .=" WHERE ".$where;
            /* Если через запятую два параметра, то мы обрабатываем `` и "" и заменяем , на = . Например запрос "id,2" видоизменится и будет WHERE `id`="2"*/
        }elseif(preg_match("#.*,.*#",$where)){
            $pattern_where = "#(.*),(.*)#";
            $replace_where = '`$1`="$2"';
            $where = preg_replace($pattern_where,$replace_where,$where);
            $query .=" WHERE ".$where;
        }
        /* запрос and должен быть вида `key`="value" */
        if($and){
            $query .=" AND ".$and;
        }
        /* сортировка строк. передается параметр 'fields' обрабатывается и получается `fields` */
        if($orderby){
            $query .= " ORDER BY `$orderby` ";
            /* По умолчанию сортирует по нарастанию */
            if($up){
                /* Если передадим DESC отсортирует по убыванию */
                $query .= $up;
            }
        }
        /* Лимит задается смещение и кол-во через запятую 1,5 если передается одно число, то просто выводит кол-во выбраных без смещения */
        if($limit){
            $query .= " LIMIT $limit";
        }

        $res = $this->query($query);
        if(!$res) return false;
        $i = 0;
        $data = array();
        while ($row = $res->fetch_assoc()){
            $data[$i] = $row;
            $i++;
        }
        return $data;

    }

    public function insert($table_name,$row){
        //print_r($row);
        if(!$row) return false;
        $table_name = "`".$this->db_prefix.$table_name."`";
        $fields = "(";
        $values = "VALUES (";
        unset($row['sub']); // если передаем массив пост, то удаляем параметр sub(кнопка) не обязательно
        foreach($row as $k=>$v){
            $fields .="`".$k."`,";
            $values .="'".$this->mres($v)."',";
        }

        $fields = substr($fields,0,-1);
        $values = substr($values,0,-1);
        $fields .=")";
        $values .=")";
        $query = "INSERT INTO $table_name $fields $values";
        // echo $query;
        $success = $this->query($query);
        if(!$success) return false;
        return true;
    }

    public function update($table_name,$row,$k=false,$v=false,$and = false){
        if(!$row) return false;
        $table_name = "`".$this->db_prefix.$table_name."`";
        unset($row['sub']);
        $query = "UPDATE $table_name SET ";
        foreach($row as $key=>$value){
            if(!preg_match("#`.*`#",$value)){
                $query .= '`'.$key.'` = "'.$this->mres($value).'", ';
            }else{
                $query .= '`'.$key.'` = '.$this->mres($value).', ';
            }

        }
        $query = substr($query,0,-2);
        if((!$k) || (!$v)) echo "Error do not where key or values";
        $query .= ' WHERE `'.$k.'`="'.$v.'"';
        if($and){
            $query .=" AND".$and;
        }
        //echo $query;
        $success = $this->mysqli->query($query);
        //$xz = $this->mysqli->affected_rows;
        if($this->mysqli->affected_rows == 0) return false;
        return true;
    }

    public function delete($table_name,$where_key = false,$where_value = false){
        $table_name = "`".$this->db_prefix.$table_name."`";
        $query = "DELETE FROM ".$table_name;
        if($where_key === false || $where_value === false) return false;

        $query .= ' WHERE '.'`'.$where_key.'`'.'='.'"'.$where_value.'"';
        $success = $this->query($query);
        return $success;
    }

    private function query($query){
        $success = $this->mysqli->query($query);
        if(!$success) return false;
        return $success;
    }

    public function mres($value){
        $value = $this->mysqli->real_escape_string($value);
        $value = trim($value);
        return $value;
    }

    public function __destruct(){
        if(($this->mysqli) && (!$this->mysqli->connect_errno)) $this->mysqli->close();
    }
}