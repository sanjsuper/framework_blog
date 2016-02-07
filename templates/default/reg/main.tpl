<br><div class="form_block"><div class="form_center">
<?php if(!isset($_SESSION['success'])): ?>
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
    <button type="submit" class="btn btn-primary" name="sub">Submit</button>
    <button type="reset" class="btn btn-primary">Clear</button>

</form>
<?php else: ?>
        <?=$_SESSION['success']; unset($_SESSION['success']);?>
        <a href="http://<?=$_SERVER['SERVER_NAME']?>/">На главную</a>
<?php endif; ?>
</div>
</div>