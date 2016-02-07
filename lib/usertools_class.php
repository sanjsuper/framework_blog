<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 01.02.16
 * Time: 15:55
 */
class UserTools extends User {

    public function __construct(){
        parent::__construct();
    }

    public function login($auth = array()){
        //print_r($auth);
        $login = $this->db->mres(strip_tags($auth['login']));
        if(!isset($auth['pass']) || $auth['pass'] == "" || $auth['login'] == "") return false;
        $pass = $this->db->mres(strip_tags($auth['pass']));
        if(isset($auth['ok']) && $auth['ok'] !== ""){
            $auth_check = $auth['ok'];
            //print_r($auth_check);
        }
        $res = $this->check_login($login); // принимаем массив из базы по логину для сверки с паролем
        $pass = $this->check_pass($pass);
        if(!isset($res) || empty($res)  || $res == ""){
            $_SESSION['error_mess'] = "Не верный логин или пароль";
            return false;
        }
        if($res[0]['password'] == $pass ){
            if($res[0]['activate']== 1){
                if(isset($auth_check) && $auth_check == "on"){
                    $browser = get_browser(null, true);
                    $text_cookie = $res[0]['id'].'+'.md5($browser['parent']);
                    setcookie("auth",$text_cookie,0x6FFFFFFF,"/");
                    $_SESSION['user'] = $res[0];
                    header("Location: /main");
                    exit();
                }

                $_SESSION['user'] = $res[0];
                header("Location: /main");
                exit();
            }else{
                $_SESSION['error_mess'] = 'Вы не подтвердили свою почту. <a href="/reg/main/resendmail/'.$res[0]['id'].'">Запросить повторно письмо</a><br>';
            }
        }else{
            $_SESSION['error_mess'] = "Ошибка при авторизации. Не верно введен логин и/или пароль<br>";
        }
    }

    public function check_login($login){
        $res = $this->db->select("user","*","login,".$login);
        if(!isset($res)){
            return false;
        }else{
            return $res;
        }
    }

    private function check_pass($pass){
        $pass = md5(config::$salt.$pass.config::$salt_end);//получаем пасс с солью в хеше
        return $pass;
    }
    public function logout($login){
        if(isset($_SESSION['user']) && $_SESSION['user']['login'] == $login){
           // session_start();

            unset($_SESSION['user']);
            session_destroy();
            setcookie("auth","",time()-3600,"/");
            header('Location: /main');
        }
    }


}