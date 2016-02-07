<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?=config::$page." ";?>- Админка</title>

    <!-- Bootstrap Core CSS -->
    <link href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/admin/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/admin/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/admin/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/css/admin/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/ckeditor/ckeditor.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/admin">SB Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?=$_SESSION['user']['login']?> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/reg/user/<?=$_SESSION['user']['login'];?>"><i class="fa fa-fw fa-user"></i> Профиль</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="http://<?php echo $_SERVER['SERVER_NAME']; ?>/reg/logout/<?=$_SESSION['user']['login'];?>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li <?if($_GET['page']=="main") echo 'class="active"'?>>
                        <a href="/admin"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li <?if($_GET['page']=="blog") echo 'class="active"'?>>
                        <a href="/admin/blog"><i class="fa fa-fw fa-bar-chart-o"></i> Edit Blog</a>
                    </li>
                    <li <?if($_GET['page']=="portfolio-edit") echo 'class="active"'?>>
                        <a href="/admin/portfolio-edit"><i class="fa fa-fw fa-table"></i> Edit Portfolio</a>
                    </li>
                    <li <?if($_GET['page']=="user") echo 'class="active"'?>>
                    <a href="/admin/user"><i class="fa fa-fw fa-table"></i> Users</a>
                    </li>
                    <li>
                        <a href="/main"><i class="fa fa-fw fa-dashboard"></i> На главную</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <?php include_once 'templates/'.$_GET['module'].'/'.$_GET['page'].'.tpl'; ?>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/admin/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/admin/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/admin/morris/raphael.min.js"></script>
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/admin/morris.min.js"></script>
    <script src="http://<?php echo $_SERVER['SERVER_NAME']; ?>/js/admin/morris/morris-data.js"></script>

</body>

</html>
