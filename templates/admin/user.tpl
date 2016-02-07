<br>
<h3 style="text-align: center"><b>Все пользователи</b></h3>
<hr>
<br>
<a href="/admin/user/0"><button class="btn btn-primary">Пользователи</button> </a>
<a href="/admin/user/5"><button class="btn btn-primary">Админы</button> </a>
<a href="/admin/user/2"><button class="btn btn-primary">Забаненые</button> </a>
<a href="/admin/user"><button class="btn btn-primary">Все</button> </a>
<br>
<table class="table table-responsive table-bordered table-hover table-striped sort" >

    <thead>
    <tr>
        <th>Пользователь</th>
        <th>E-Mail</th>
        <th>Дата регистрации</th>
        <th>Права</th>
        <th>Активация аккаунта</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <? for($i=0;$i<count($res);$i++){
        if($res[$i]['permissions'] == 0){
            $res[$i]['permissions'] = "user";
        }elseif($res[$i]['permissions'] == 5){
            $res[$i]['permissions'] = "admin";
        }else {
            $res[$i]['permissions'] = "ban";
        }
        echo '<td><a href="http://'.$_SERVER['SERVER_NAME'].'/admin/user-edit/'.$res[$i]['id'].'">'.$res[$i]['login'].'</a></td>';
        echo '<td>'.$res[$i]['email'].'</td>';
        echo '<td>'.$res[$i]['date_reg'].'</td>';
        echo '<td>'.$res[$i]['permissions'].'</td>';
        echo '<td>'.$res[$i]['activate'].'</td></tr>';

    }?>

    </tbody>
</table>
<a href="#" onclick="openbox('box')"><button class="btn btn-primary">Добавить пользователя</button></a>
<br>
<div style="display: none; margin-top: 20px" id="box">
    <div class="block">
    <form action="" method="post">
        <fieldset class="form-group">
            <label>Login *</label>
            <?php if(isset($_SESSION['reg_error_login'])) echo '<small class="text-muted">'.$_SESSION['reg_error_login'].'</small>'; unset($_SESSION['reg_error_login']);?>
            <input type="text" name="login" class="form-control" placeholder="Enter login">
        </fieldset>
        <fieldset class="form-group">
            <label>Password *</label>
            <?php if(isset($_SESSION['reg_error_pass'])) echo '<small class="text-muted">'.$_SESSION['reg_error_pass'].'</small>';unset($_SESSION['reg_error_pass']);?>
            <input type="password" class="form-control" placeholder="Password" name="password">
        </fieldset>
        <fieldset class="form-group">
            <label>E-mail *</label>
            <?php if(isset($_SESSION['reg_error_email'])) echo '<small class="text-muted">'.$_SESSION['reg_error_email'].'</small>';unset($_SESSION['reg_error_email']);?>
            <input type="text" class="form-control" placeholder="E-Mail" name="email">
        </fieldset>
        <div class="form-group">
            <label class="sr-only" for="exampleInputPassword3">Captcha</label>
            <?php if(isset($_SESSION['reg_error_captcha'])) echo '<small class="text-muted">'.$_SESSION['reg_error_captcha'].'</small>';unset($_SESSION['reg_error_captcha']);?>
            <label><img src="http://<?=$_SERVER['SERVER_NAME']?>/captcha.php" alt="Captcha" id="img_id"> <a href="#" onclick="$('#img_id').attr('src', 'http://<?=$_SERVER['SERVER_NAME']?>/captcha.php?r=' + Math.random());"><img src="http://<?=$_SERVER['SERVER_NAME']?>/images/refresh.png" alt="Reload"></a></label>
            <input type="text" class="form-control" id="exampleInputPassword3" placeholder="Enter code" name="captcha">
        </div>
        <button type="submit" class="btn btn-primary" name="sub_user">Submit</button>
        <button type="reset" class="btn btn-primary">Clear</button>

    </form>
    </div>

</div>


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