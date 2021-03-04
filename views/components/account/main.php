<!--suppress HtmlFormInputWithoutLabel -->
<h2>Основные данные</h2>

<div class="row group">
    <div class="col-sm-3"><h3 class="h4">E-mail</h3></div>
    <div class="col-sm-9">
        <input class="form-control" type="email" name="email"
               placeholder="<?= getUser('email') ?? 'Введите ваш E-mail' ?>" value="" >
    </div>
</div>

<div class="row group">
    <div class="col-sm-3"><h3 class="h4">Имя</h3></div>
    <div class="col-sm-9">
        <input type="text" class="form-control" name="firstname"
               placeholder="<?= getUser('firstname') ?? 'Введите ваше имя' ?>" value="">
    </div>
</div>

<div class="row group">
    <div class="col-sm-3"><h3 class="h4">Фамилия</h3></div>
    <div class="col-sm-9">
        <input type="text" class="form-control" name="lastname"
               placeholder="<?= getUser('lastname') ?? 'Введите вашу фамилию' ?>" value="">
    </div>
</div>

<div class="row group">
    <div class="col-sm-3"><h3 class="h4">Пароль</h3></div>
    <div class="col-sm-6">
        <input class="form-control" type="password" name="old-password"
               placeholder="Введите текущий пароль" value="" required>
    </div>
    <div class="col-sm-3">
        <button class="btn btn-primary pull-right" type="submit">Изменить</button>
    </div>
</div>
