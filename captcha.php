<?php
/**
 * Created by PhpStorm.
 * User: Alexandr
 * Date: 29.01.16
 * Time: 23:36
 */
session_start();
$fonts = "fonts/tnr.ttf";
header ('Content-Type: image/png');
function generate_captcha($number)
{
    $arr = array('a','b','c','d','e','f',
        'g','h','i','j','k','l',
        'm','n','o','p','r','s',
        't','u','v','x','y','z',
        'A','B','C','D','E','F',
        'G','H','I','J','K','L',
        'M','N','O','P','R','S',
        'T','U','V','X','Y','Z',
        '1','2','3','4','5','6',
        '7','8','9','0');
    // Генерируем пароль
    $pass = "";
    for($i = 0; $i < $number; $i++)
    {
        // Вычисляем случайный индекс массива
        $index = rand(0, count($arr) - 1);
        $pass .= $arr[$index];
    }
    return $pass;
}
$_SESSION['captcha'] = generate_captcha(5);

$im = @imagecreatetruecolor(100, 50)
    or die('Невозможно инициализировать GD поток');
$text_color = imagecolorallocate($im, 233, 14, 91);
$white = imagecolorallocate($im, 255, 255, 255);
imagettftext($im, 18, 0, 15, 35, $white, $fonts, $_SESSION['captcha']);
imagegif($im);
imagedestroy($im);