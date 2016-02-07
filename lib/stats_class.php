<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 04.02.16
 * Time: 11:35
 */
class stats {
    public $db;
    public $ip;
    public $link;

    public function __construct($ip,$link){
        $this->db = new DB();
        $this->ip = $ip;
        $this->link = $link;
        $this->addToDb($ip,$link);
        //print_r($ip);
    }

    private function addToDb($ip,$link){
        $row = array();
        $row['ip'] = $ip;
        $res_ip = $this->db->insert("stats",$row); //вставляем запись ИП нового пользователя
        $last_id = $this->db->insertid();

        if($res_ip){
            $row_link['id_user'] = $last_id;
            $row_link['link'] = $this->link;
            $this->db->insert("stats_ip",$row_link); //если пользователь первый раз зашел, добавляем страницу захода
        }else{
            $row = array();
            $row['count'] = "`count` +1";
            $k = "ip";
            $v = $this->ip;
            $this->db->update("stats",$row,$k,$v); // Если пользователь совершил повторный заход(Обновил страницу, перешел на новую страницу) обновляем число переходов
            $last_ip = $this->db->select("stats","*","ip,$this->ip"); //получаем по ИП пользователя его ИД
            $last_ip = $last_ip[0]['id']; //ИД последнего пользователя
            $row_links = array();
            $row_links['id_user'] = $last_ip;
            $row_links['link'] = $this->link;
            $res = $this->db->select("stats_ip","*","link,$this->link","`id_user` = ".$last_ip); //проверяем есть ли такая страницы, с таким ИП
            //print_r($res);
            if($res){
                $rows = array();
                $rows['count'] = "`count` +1";
                $k = "link";
                $v = $this->link;
                $this->db->update("stats_ip",$rows,$k,$v,"`id_user` = ".$last_ip); //страница есть, обновляем количество посещений страницы
            }else{
                $row = array();
                $row['id_user'] = $last_ip;
                $row['link'] = $this->link;
                $this->db->insert("stats_ip",$row);// страницы нет, добавляем страницу
            }

            //$insert_link = $this->db->insert("stats_ip",$row_links);

        }
    }
}