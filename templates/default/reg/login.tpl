<br><div class="form_block"><div class="form_center"><form class="form-inline" action="" method="post">
            <?php if(isset($_SESSION['error_mess'])) echo '<small class="text-muted">'.$_SESSION['error_mess'].'</small>';unset($_SESSION['error_mess']);?>
    <div class="form-group">
        <label class="sr-only" for="exampleInputLogin3">Login</label>
        <input type="login" class="form-control" id="exampleInputLogin3" placeholder="Enter login" name="login">
    </div>
    <div class="form-group">
        <label class="sr-only" for="exampleInputPassword3">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password" name="pass">
    </div>
    <div class="form-group">
        <label class="sr-only" for="exampleInputPassword3">Captcha</label>
        <?php if(isset($_SESSION['reg_error_captcha'])) echo '<small class="text-muted">'.$_SESSION['reg_error_captcha'].'</small>';unset($_SESSION['reg_error_captcha']);?>
        <label><img src="http://<?=$_SERVER['SERVER_NAME']?>/captcha.php" alt="Captcha" id="img_id"> <a href="#" onclick="$('#img_id').attr('src', 'http://<?=$_SERVER['SERVER_NAME']?>/captcha.php?r=' + Math.random());"><img src="http://<?=$_SERVER['SERVER_NAME']?>/images/refresh.png" alt="Reload"></a></label>
        <input type="text" class="form-control" id="exampleInputPassword3" placeholder="Enter code" name="captcha">
    </div>
    <div class="checkbox">
        <label>
            <input type="checkbox" name="ok"> Remember me
        </label>
    </div>
    <button type="submit" class="btn btn-primary" name="sub">Sign in</button>
</form>
<br>
<?php if(isset($_SESSION['auth_error'])) echo $_SESSION['auth_error']; unset($_SESSION['auth_error']);?>
<br>
Если у вас еще нет аккаунта <a href="http://<?=$_SERVER['SERVER_NAME']?>/reg">Регистрируйтесь прямо сейчас!</a>
</div>
</div>