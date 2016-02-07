<? if(!isset($_SESSION['article_success'])) : ?>
<form role="form" action="" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1">Заголовок статьи</label>
        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter title" name="title">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Автор</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="author" value="<?=$_SESSION['user']['login']?>" name="author">
    </div>
    <div class="form-group">
        <label>Короткое описание(до 200 символов)</label>
        <textarea class="form-control" rows="2" name="desc_text"></textarea>
    </div>
    <div class="form-group">
        <label>Текст статьи</label>
        <textarea  class="form-control" rows="5" name="text_article" id="editor1"></textarea>
        <script>
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            CKEDITOR.replace( 'editor1' );
        </script>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Путь к картинке</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="/images/*" name="images">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Теги(Через запятую)</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="тег1, тег2" name="tags">
    </div>
    <button type="submit" class="btn btn-default" name="sub">Отправить</button>
</form>
<? else : ?>
<?=$_SESSION['article_success'];unset($_SESSION['article_success']);?>
<br>
<a href="/admin/blog"><button class="btn btn-primary">В редактор блога</button></a>
<? endif; ?>