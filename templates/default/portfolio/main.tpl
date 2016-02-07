


<!--Breadcrumbs ==================================================
================================================== -->
<div class="breadcrumbs">
    <div class="container">
        <header>
            <h3>Portfolio Page</h3>
        </header>
    </div>
    <!-- container ends here -->
    <hr class="separator1">
</div>
<!-- breadcrumbs ends here -->
<!-- Portfolio ==================================================
================================================== -->
<div class="container portfolio">
<?php
    $n = 0;
    for($i = 0;$i<count($res);$i++){
        $n = ++$n;
        if($n % 3 == 0){
            echo '<div class="one_third lastcolumn shadow">';
            //unset($n);
        }else{
            echo '<div class="one_third shadow">';
            //unset($n);
        }
        echo '<div class="view view-first">';
        echo '<img src="http://'.$_SERVER['SERVER_NAME'].$res[$i]['image'].'" alt="'.$res[$i]['title'].'" height="200px" width="280px" />';
        echo '<div class="mask">';
        echo '<a rel="prettyPhoto[group1]" title="'.$res[$i]['title'].'" href="http://'.$_SERVER['SERVER_NAME'].$res[$i]['image'].'"><button class="btn btn-primary"> Open</button></a>';
        echo '</div>';
        echo ' </div>';
        echo '</div>';
    }

?>

</div>
<!-- container ends here -->
