<div class="row">
    <table class="table table-responsive table-bordered table-hover table-striped sort" >

        <thead>
        <tr>
            <th>Ссылка</th>
            <td><b>Сколько раз был на странице</b></td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <? for($i=0;$i<count($res);$i++){
                    echo '<td><a href="http://'.$_SERVER['SERVER_NAME'].$res[$i]['link'].'">'.$res[$i]['link'].'</a></td>';
            echo '<td>'.$res[$i]['count'].'</td></tr>';
        }?>

        </tbody>
    </table>
</div>
<button class="btn btn-primary" onclick="history.back(1)">Назад</button>