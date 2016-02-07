<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

    <!-- Basic Page Needs ==================================================
    ================================================== -->

    <meta charset="utf-8">
    <title><?=config::$page." - ".config::$title;?></title>
    <meta name="description" content="Place to put your description text">
    <meta name="author" content="">
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Mobile Specific Metas ==================================================
    ================================================== -->

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

    <!-- CSS ==================================================
    ================================================== -->
    <link href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/base.css">
    <link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/skeleton.css">
    <link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/screen.css">
    <link rel="stylesheet" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/prettyPhoto.css" type="text/css" media="screen" />

    <!-- Favicons ==================================================
    ================================================== -->

    <link rel="shortcut icon" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/favicon.png">
    <link rel="apple-touch-icon" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/apple-touch-icon-114x114.png">

    <!-- Google Fonts ==================================================
    ================================================== -->
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Content Part ==================================================
================================================== -->
<div id="header">
    <div class="container">
        <!-- Header | Logo, Menu
            ================================================== -->
        <div class="logo"><a href="index.html"><img src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/images/logo.png" alt="" /></a></div>
        <div class="mainmenu">
            <div id="mainmenu">
                <ul class="sf-menu">
                    <li class="li_menu"><a href="/main" <?if("main" == $config::$menu) echo 'id="visited"';?> >Главная</a></li>
                    <li class="li_menu"><a href="/about" <?if($config::$menu == "about") echo 'id="visited"';?> >О нас</a></li>
                    <li class="li_menu"><a href="/portfolio" <?if($config::$menu == "portfolio") echo 'id="visited"';?> >Портфолио</a>
                        <ul>
                            <li><a href="/portfolioproject">Portfolio Project</a></li>
                        </ul>
                    </li>
                    <li class="li_menu"><a href="/blog" <?if($config::$menu == "blog") echo 'id="visited"';?> >Блог</a>
                        <ul>
                            <li><a href="singleblog.html">Single Post</a></li>
                        </ul>
                    </li>
                    <li class="li_menu"><a href="/contact" <?if($config::$menu == "contact") echo 'id="visited"';?> >Контакты</a></li>
                    <?if (!isset($_SESSION['user'])) :?><li class="li_menu"><a href="/reg/login" <?if($config::$menu == "reg") echo 'id="visited"';?> >Войти</a></li><? else : ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?=$_SESSION['user']['login']?> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="/reg/user/<?=$_SESSION['user']['login']?>"><i class="fa fa-fw fa-user"></i> Профиль</a>
                            </li>
                            <li>
                                <?if ($_SESSION['user']['permissions'] == 5) echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/admin">Админка</a>';?>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/reg/logout/<?=$_SESSION['user']['login'];?>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>

                    <? endif; ?>
                </ul>
            </div>
            <!-- mainmenu ends here -->
            <!-- Responsive Menu -->
        </div>
        <!-- mainmenu ends here -->
    </div>
    <!-- container ends here -->
</div>
<!-- header ends here -->

<?php include_once 'templates/'.$config::$template.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl'; ?>

<!-- Socialize ==================================================
================================================== -->
<hr class="separator2">
<div class="socialsblock">
    <div class="container socialize">
        <h3>Socialize with us!</h3>
        <section class="socials">
            <ul class="socials">
                <li><a href="#"><img src="images/socials/twitter.png" alt="" /></a></li>
                <li><a href="#"><img src="images/socials/facebook.png" alt="" /></a></li>
                <li><a href="#"><img src="images/socials/dribbble.png" alt="" /></a></li>
                <li><a href="#"><img src="images/socials/google+.png" alt="" /></a></li>
                <li><a href="#"><img src="images/socials/linkedin.png" alt="" /></a></li>
                <li><a href="#"><img src="images/socials/youtube.png" alt="" /></a></li>
            </ul>
        </section>
    </div>
    <!-- container ends here -->
</div>
<!-- socialsblock ends here -->
<!-- Footer ==================================================
================================================== -->
<div class="footer">
    <div class="container">
        <div class="one_fourth">
            <h3>Contact Informations</h3>
            <p><span class="orange"><strong>Address:</strong></span> <br>
                No.2 - 123678 street name City, Country</p>
            <p><span class="orange"><strong>Phone:</strong></span> <br>
                + 9 (094) 067 93567<br>
            </p>
            <p><span class="orange"><strong>Email:</strong></span> <br>
                info@yoursite.com<br>
            </p>
        </div>
        <!-- four columns ends here -->
        <div class="one_fourth">
            <h3>Blogroll</h3>
            <ul>
                <li><a href="#" title="">Development Blog</a></li>
                <li><a href="#" class="">New Freebies</a></li>
                <li><a href="#" class="">Themeforest Theme</a></li>
                <li><a href="#" class=""> Design News</a></li>
                <li><a href="#" class="">WordPress Theme</a></li>
            </ul>
        </div>
        <!-- four columns ends here -->
        <div class="one_fourth">
            <h3>Archive</h3>
            <ul>
                <li><a href="#" class=""> August 2012</a></li>
                <li><a href="#" class="">July 2012</a></li>
                <li><a href="#" class="">Juny 2012</a></li>
                <li><a href="#" class=""> May 2012</a></li>
                <li><a href="#" class="">April 2012</a></li>
            </ul>
        </div>
        <!-- four columns ends here -->
        <div class="one_fourth lastcolumn">
            <h3>About</h3>
            <p>Freebix is responsive, simple and clean template with a lot attention to detail. Get it now!</p>
            <p>Visit <a href="http://anarieldesign.com/" rel="nofollow">Anariel Design</a> and find more interesting things.</p>
        </div>
        <!-- four columns ends here -->
    </div>
    <!-- container ends here -->
</div>
<!-- footer ends here -->
<!-- Copyright ==================================================
================================================== -->
<div id="copyright">
    <div class="container">
        <p class="copyright">&copy; Copyright 2013. &quot;Freebix&quot; by <a href="http://www.anarieldesign.com/" rel="nofollow">Anariel Design</a>. All rights reserved.</p>
    </div>
    <!-- container ends here -->
</div>
<!-- copyright ends here -->
<!-- End Document
================================================== -->
<!-- Scripts ==================================================
================================================== -->
<script type="text/javascript" src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/bootstrap.js"></script>
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/jquery-1.8.0.min.js" type="text/javascript"></script>
<!-- Main js files -->
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/screen.js" type="text/javascript"></script>
<!-- Tabs -->
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/tabs.js" type="text/javascript"></script>
<!-- Include prettyPhoto -->
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/jquery.prettyPhoto.js" type="text/javascript"></script>
<!-- Include Superfish -->
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/superfish.js" type="text/javascript"></script>
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/hoverIntent.js" type="text/javascript"></script>
<!-- Flexslider -->
<script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/jquery.flexslider-min.js" type="text/javascript"></script>
<!-- Modernizr -->
<script type="text/javascript" src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/modernizr.custom.29473.js"></script>
<script>// <![CDATA[
    $(document).ready(function(){
        $("a[rel^='prettyPhoto']").prettyPhoto();
    });
    // ]]></script>
</body>
</html>