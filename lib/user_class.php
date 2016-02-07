<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 11:07
 */
class User {
    public $db;
    public $config;

    public function __construct(){
        $this->db = new DB;
        $this->config = new Config();
    }

    public function get_user($user = array()){
        //print_r($user);
        if(!is_array($user)) return false;
        $login = $this->check_login($user['login']);
        $pass = $this->check_password($user['password']);
        //print_r($pass);
        $email = $this->check_email($user['email']);
        //print_r($email);
        if($login === false || $pass === false || $email === false) return false;
        $row = array();
        $row['login'] = $login;
        $row['password'] = $pass;
        $row['email'] = $email;
        $row['activ_code'] = md5($login.$pass);
        $row['date_reg'] = date("Y-m-d H:i:s");
        $success = $this->db->insert("user",$row);
        if($success){
            $this->sendmail($row);
            $_SESSION['success'] = "Регистрация прошла успешно. На Ваш почтовый ящик <b>$email</b> отправлено письмо с инструкцией для активации аккаунта. Спасибо за регистрацию!";
        }

    }

    public function update_user($user = array()){
        if(!is_array($user)) return false;
        $user = array_map("strip_tags",$user);
        $row = array();
        $row['login'] = $user['login'];
        $key = "password";
        $value = $user['password'];

        $success = $this->db->update("user",$row,$key,$value);
        if(!$success) return false;
        $_SESSION['user']['login'] = $row['login']; //добавим в сессию новый логин
        return true;
    }

    public function update_pass($pass = array()){
        if(!is_array($pass)) return false;
        $row = array();
        $row['password'] = $pass['pass'];
        $key = "login";
        $value = $pass['login'];
        print_r($pass);
        $success = $this->db->update("user",$row,$key,$value);
        if(!$success) return false;
        $_SESSION['user']['password'] = $row['password']; //добавим в сессию новый pass
        return true;
    }

    private function sendmail($row){
        $to      = $row['email'];
        $subject = 'Подтверждение регистрации на сайте '.config::$url;
        $message = 'Здравствуйте '.$row['login'].' вы проходили регистрацию на сайте'.config::$url.' для завершения регистрации перейдите по ссылке '.config::$url.'reg/regactivate/'.$row['activ_code'].' . Спасибо за регистрацию.';
        $headers = 'From: sanjsuper@mail.ru' . "\r\n" .
            'Reply-To: webmaster@example.com' . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

        mail($to, $subject, $message, $headers);
    }

    public function check_login($login){
        if(!isset($login) || $login == ""){
            $_SESSION['reg_error_login'] = "Введите логин";
            return false;
        }
        $login = $this->db->mres(strip_tags($login));
        $res = $this->db->select("user","*","login,".$login);
        if($res){
            $_SESSION['reg_error_login'] = "Такой логин уже существует";
            return false;
        }else {
            return $login;
        }

    }

    private function check_email($email){
        $res = $this->db->select("user","*","email,".$email);
        if(filter_var($email, FILTER_VALIDATE_EMAIL === false)){
            $_SESSION['reg_error_email'] = "Введите корректный E-Mail";
            return false;
        }elseif($res){
            $_SESSION['reg_error_email'] = "Такой E-Mail уже зарегистрирован";
            return false;
        }else{
            return $email;
        }
    }

    public function check_password($pass){
        //print_r($pass);
        if(strlen($pass) <= 5 || strlen($pass) >16){
            $_SESSION['reg_error_pass'] = "Пароль должен быть от 6 до 16 символов";
            return false;
        }else{
            $pass = md5(config::$salt.$pass.config::$salt_end);
            return $pass;
        }
    }

}