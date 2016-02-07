<br><h2 style="text-align: center"><?=$_SESSION['user']['login']?></h2><hr>

<div class="center-block">

    <br><div class="form_block"><div class="form_center">
            <?php if(!isset($_SESSION['success'])): ?>
            <a href="#" onclick="openbox('box')"><h3 id="login"><button class="btn btn-default btn-block">Сменить логин</button> </h3></a>
            <div style="display: <?php if(isset($_SESSION['user_error_login']) || isset($_SESSION['user_error_password']) || isset($_SESSION['user_error_captcha'])) echo 'block';else echo "none";?>; margin: 0 auto" id="box">

            <form action="" method="post">
                <fieldset class="form-group-sm" style="margin-bottom: 10px; margin-top: 20px">
                    <label>Новый логин *</label>
                    <?php if(isset($_SESSION['user_error_login'])) echo '<small class="text-muted">'.$_SESSION['user_error_login'].'</small>'; unset($_SESSION['user_error_login']);?>
                    <input type="text" name="login" class="form-control" placeholder="Enter login" value="<?=@$_POST['login']?>">
                </fieldset>
                <fieldset class="form-group-sm" style="margin-bottom: 10px">
                    <label>Пароль *</label>
                    <?php if(isset($_SESSION['user_error_pass'])) echo '<small class="text-muted">'.$_SESSION['user_error_pass'].'</small>';unset($_SESSION['user_error_pass']);?>
                    <input type="password" class="form-control" placeholder="Password" name="password">
                </fieldset>
                <fieldset class="form-group-sm" style="margin-bottom: 10px">
                    <label>Повторите пароль *</label>
                    <?php if(isset($_SESSION['user_error_pass'])) echo '<small class="text-muted">'.$_SESSION['user_error_pass'].'</small>';unset($_SESSION['user_error_pass']);?>
                    <input type="password" class="form-control" placeholder="Confirm Password" name="password1">
                </fieldset>
                <div class="form-group-sm" style="margin-bottom: 10px">
                    <label class="sr-only" for="exampleInputPassword3">Captcha</label>
                    <?php if(isset($_SESSION['user_error_captcha'])) echo '<small class="text-muted">'.$_SESSION['user_error_captcha'].'</small>';unset($_SESSION['user_error_captcha']);?>
                    <label><img src="http://<?=$_SERVER['SERVER_NAME']?>/captcha.php" alt="Captcha" id="img_id"> <a href="#" onclick="$('#img_id').attr('src', 'http://<?=$_SERVER['SERVER_NAME']?>/captcha.php?r=' + Math.random());"><img src="http://<?=$_SERVER['SERVER_NAME']?>/images/refresh.png" alt="Reload"></a></label>
                    <input type="text" class="form-control" id="exampleInputPassword3" placeholder="Enter code" name="captcha">
                </div>
                <button type="submit" class="btn btn-primary" name="sub">Сменить</button>
                <button type="reset" class="btn btn-primary">Clear</button>

            </form>
            <?php else: ?>
            <?=$_SESSION['success']; unset($_SESSION['success']);?>
            <a href="http://<?=$_SERVER['SERVER_NAME']?>/reg/user/<?=$_SESSION['user']['login']?>">К профилю</a>
            <?php endif; ?>
            </div>
        </div>
    </div>
    <!-- Reset Password -->
<br><div class="form_block"><div class="form_center">
        <?php if(!isset($_SESSION['success_pass'])): ?>
        <a href="#" onclick="openbox('box1')"><h3 id="login"><button class="btn btn-default btn-block">Сменить пароль</button> </h3></a>
        <div style="display: <?php if(isset($_SESSION['user_error_new_pass']) || isset($_SESSION['user_error_old_pass']) || isset($_SESSION['user_error_pass_captcha'])) echo 'block';else echo "none";?>; margin: 0 auto" id="box1">

        <form action="" method="post">
            <fieldset class="form-group-sm" style="margin-bottom: 10px; margin-top: 20px">
                <label>Новый пароль *</label>
                <?php if(isset($_SESSION['user_error_new_pass'])) echo '<small class="text-muted">'.$_SESSION['user_error_new_pass'].'</small>'; unset($_SESSION['user_error_new_pass']);?>
                <input type="password" name="new_pass" class="form-control" placeholder="Enter New Password" >
            </fieldset>
            <fieldset class="form-group-sm" style="margin-bottom: 10px">
                <label>Старый Пароль *</label>
                <?php if(isset($_SESSION['user_error_old_pass'])) echo '<small class="text-muted">'.$_SESSION['user_error_old_pass'].'</small>';?>
                <input type="password" class="form-control" placeholder="Password" name="password_old">
            </fieldset>
            <fieldset class="form-group-sm" style="margin-bottom: 10px">
                <label>Повторите старый пароль *</label>
                <?php if(isset($_SESSION['user_error_old_pass'])) echo '<small class="text-muted">'.$_SESSION['user_error_old_pass'].'</small>';unset($_SESSION['user_error_old_pass']);?>
                <input type="password" class="form-control" placeholder="Confirm Password" name="password1_old">
            </fieldset>
            <div class="form-group-sm" style="margin-bottom: 10px">
                <label class="sr-only" >Captcha</label>
                <?php if(isset($_SESSION['user_error_pass_captcha'])) echo '<small class="text-muted">'.$_SESSION['user_error_pass_captcha'].'</small>';unset($_SESSION['user_error_pass_captcha']);?>
                <label><img src="http://<?=$_SERVER['SERVER_NAME']?>/captcha.php" alt="Captcha" id="img_id"> <a href="#" onclick="$('#img_id').attr('src', 'http://<?=$_SERVER['SERVER_NAME']?>/captcha.php?r=' + Math.random());"><img src="http://<?=$_SERVER['SERVER_NAME']?>/images/refresh.png" alt="Reload"></a></label>
                <input type="text" class="form-control" id="exampleInputPassword3" placeholder="Enter code" name="captcha_pass">
            </div>
            <button type="submit" class="btn btn-primary" name="sub_pass">Сменить</button>
            <button type="reset" class="btn btn-primary">Clear</button>

        </form>
        <?php else: ?>
        <?=$_SESSION['success_pass']; unset($_SESSION['success_pass']);?>
        <a href="http://<?=$_SERVER['SERVER_NAME']?>/reg/user/<?=$_SESSION['user']['login']?>">К профилю</a>
        <?php endif; ?>
    </div>
</div>

</div>
<!-- end password-->
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
