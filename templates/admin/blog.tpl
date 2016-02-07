<a href="/admin/add"><button class="btn btn-primary">Добавить новую запись</button></a>
<br>
    <div class="ten columns alpha">
        <h1 class="center-block">Все посты в категории Блог</h1>
        <? for($i = 0;$i<count($res);$i++)
            {
            echo '<hr>';
            echo '<article class="post">';
            echo '<h3><a href="/admin/edit/'.$res[$i]['id'].'">'.$res[$i]['title'].'</a></h3>';
            echo '<img class="shadow" src="'.$res[$i]['images'].'" alt="'.$res[$i]['title'].'"/>';
            echo    '<div class="entry-date">
                        <div class="number">'.$res[$i]['date'].'</div>
                     </div>';
            echo '<p>'.$res[$i]['desc_text'].'</p>';
            echo '</article>';
            echo '<hr>';
            }
        ?>

    </div>