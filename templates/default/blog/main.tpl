<!--Breadcrumbs ==================================================
================================================== -->
<div class="breadcrumbs">
    <div class="container">
        <header>
            <h3>Blog Page</h3>
        </header>
    </div>
    <!-- container ends here -->
    <hr class="separator1">
</div>
<!-- breadcrumbs ends here -->
<!-- Blog ==================================================
================================================== -->
<div class="container">
    <div class="ten columns alpha">
        <?php
            for($i=0;$i<count($res);$i++){
                echo '<article class="post">';
                echo    '<a href="/blog/article/'.$res[$i]['id'].'"><h2>'.$res[$i]['title'].' </h2></a>';
                echo    '<a href="http://'.$_SERVER['SERVER_NAME'].$res[$i]['images'].'" class="prettyPhoto[gal]"><img class="shadow" src="http://'.$_SERVER['SERVER_NAME'].$res[$i]['images'].'" alt="'.$res[$i]['title'].'"/></a>';
                echo        '<div class="number">'.$res[$i]['date'].'</div>';
                echo    '<p>'.$res[$i]['desc_text'].'</p>';
                echo    '<a href="singleblog.html">more <span>+</span></a>';
                echo    '</article>';
            }
        ?>

    </div>
    <!-- ten columns ends here -->

    <aside class="six columns omega shadow1">
        <section class="recentnews">
            <h4 class="sidebarheader">Recent News</h4>
            <ul class="tabs">
                <li><a class="active" href="#trends">Trends</a></li>
                <li><a class="" href="#fashion">Fashion</a></li>
                <li><a class="" href="#shows">Shows</a></li>
            </ul>
            <ul class="tabs-content">
                <li class="active" id="trends">
                    <p>Lorem ipsum dolor sit amet, proscriptum videt ulteriori. Filiam sunt amore nec est cum autem est se in. Cellam sanctissima coniunx in lucem exempli paupers coniunx rex cum autem quod ait regem Ardalio. Filiam sunt amore nec est cum autem est se in.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam,feugiat vitae, ultricies eget, tempor sit amet, ante.</p>
                </li>
                <li id="fashion">
                    <p>Lorem ipsum dolor sit amet, proscriptum videt ulteriori. Filiam sunt amore nec est cum autem est se in. Cellam sanctissima coniunx in lucem exempli paupers coniunx rex cum autem quod ait regem Ardalio. Filiam sunt amore nec est cum autem est se in.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
                </li>
                <li id="shows">
                    <p>Lorem ipsum dolor sit amet, proscriptum videt ulteriori. Filiam sunt amore nec est cum autem est se in. Cellam sanctissima coniunx in lucem exempli paupers coniunx rex cum autem quod ait regem Ardalio. Filiam sunt amore nec est cum autem est se in.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam,feugiat vitae, ultricies eget, tempor sit amet, ante.</p>
                </li>
            </ul>
        </section>
        <!--end recent news-->
        <section class="latestphotos">
            <h4 class="sidebarheader">Latest Photos</h4>
            <div class="one_half"> <img class="shadow" src="images/images/work1.jpg" alt="work1" /> </div>
            <div class="one_half lastcolumn"> <img class="shadow" src="images/images/work2.jpg" alt="work2" /> </div>
            <div class="one_half"> <img class="shadow" src="images/images/work3.jpg" alt="work3" /> </div>
            <div class="one_half lastcolumn"> <img class="shadow" src="images/images/work4.jpg" alt="work4" /> </div>
        </section>
        <!--end latestphotos-->

        <section class="categorie">
            <h4 class="sidebarheader">Categories</h4>
            <ul class="categories">
                <li><a href="#">Fashion</a></li>
                <li><a href="#">Beauty</a></li>
                <li><a href="#">Charity</a></li>
                <li><a href="#">Fashion Shows</a></li>
            </ul>
        </section>
        <!--end categories-->
    </aside>
    <!--end six columns-->
</div>
<!-- container ends here -->