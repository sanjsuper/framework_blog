<? if(!isset($_SESSION['upload'])) : ?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="exampleInputEmail1">Название и фотограф</label>
        <input type="text" class="form-control" name="title">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Таблица для загрузки</label>
        <input type="text" class="form-control" name="table">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Папка для загрузки</label>
        <input type="text" class="form-control" name="cat">
    </div>
    <div class="form-group">
        <label for="exampleInputFile">File input</label>
        <input type="file" id="exampleInputFile" name="img">
    </div>
    <button type="submit" class="btn btn-primary" name="sub">Load</button>
</form>
<? else : ?>
<?=$_SESSION['upload']; unset($_SESSION['upload']);?><br>
<a href="/admin/portfolio-edit">Все изображения</a>
<button class="btn btn-primary" onclick="history.back(1)">Назад</button>
<? endif; ?>