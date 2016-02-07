
<!-- Portfolio ==================================================
================================================== -->

    <a href="/admin/addimage"> <button class="btn btn-primary center-block">Добавить Изображение</button></a><br>
    <? if(!isset($_SESSION['del_error'])) : ?>
    <?php
    echo @$_SESSION['not_image'];
    for($i = 0;$i<count($res);$i++){
        echo '<div class="grids">';
            echo '<div class="image_grids">';
                echo '<img src="http://'.$_SERVER['SERVER_NAME'].$res[$i]['image'].'" alt="'.$res[$i]['title'].'" height="200px" width="200px" />';
                echo '<div class="mask">';
                echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/admin/portfolio-edit/'.$res[$i]['id'].'" onclick="return confirm(\'Удалить файл?\')"><button class="btn btn-primary"> Delete</button></a>';
                echo '</div>';
            echo ' </div>';
        echo '</div>';
    }
    ?>
    <? else : ?>
    <?=$_SESSION['del_error']; unset($_SESSION['del_error']); ?>
    <a href ="http://<?=$_SERVER['SERVER_NAME']?>/admin/portfolio-edit">Назад к редактированию</a>
    <? endif ;?>

<!-- container ends here -->
