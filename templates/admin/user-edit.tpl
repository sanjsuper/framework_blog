<table class="table table-responsive table-bordered table-hover table-striped sort" >

    <thead>
    <tr>
        <th>Пользователь</th>
        <th>Дата регистрации</th>
        <th>Права</th>
        <th>E-Mail</th>
        <th>Активация аккаунта</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    
        <td><?=$res[0]['login']?></td>
        <td><?=$res[0]['email']?></td>
        <td><?=$res[0]['date_reg']?></td>
        <td><?=$res[0]['permissions']?><a href="#" onclick="openbox('box1')"><img src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/edit.png" height="20" width="20"></a><form action="" method="post" style="display: none" id="box1"><select name="select"><option value="2">ban</option><option value="0">user</option><option value="5">admin</option></select><input type="submit" name="permissions_sub" value="Изменить права"></form></td>
        <td><?=$res[0]['activate']?><a href="#" onclick="openbox('box2')"><img src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/edit.png" height="20" width="20"></a><form action="" method="post" style="display: none" id="box2"><select name="select_activate"><option value="1">Активировать</option></select><input type="submit" name="activate" value="Активировать"></form></td>
    </tr>

    </tbody>

</table>
<br>
<a href="/admin/user"><button class="btn btn-primary">Все пользователи</button> </a>
<script type="text/javascript">

    function openbox(id){
        display = document.getElementById(id).style.display;

        if(display=='none'){
            document.getElementById(id).style.display='block';
        }else{
            document.getElementById(id).style.display='none';
        }
    }

</script>