<!--suppress HtmlFormInputWithoutLabel -->
<div class="col-md-6">
    <h2>Контакты</h2>

    <div class="row group">
        <div class="col-sm-3"><h3 class="h4">Телефон</h3></div>
        <div class="col-sm-9">
            <input class="form-control" type="text" name="phone"
                   placeholder="<?= getUser('phone') ?? 'Введите номер Вашего телефона' ?>" value="">
        </div>
    </div>

    <div class="row group">
        <div class="col-sm-3"><h3 class="h4">Страна</h3></div>
        <div class="col-sm-9">
            <div class="group-select justify" tabindex='1'>
                <input class="form-control select" id="country" name="country"
                       placeholder="" value="" />

                <ul class="dropdown">
                    <li data-value="1">Россия</li>
                </ul>

                <div class="arrow bold"><i class="ion-chevron-down"></i></div>
            </div>
        </div>
    </div>

    <div class="row group">
        <div class="col-sm-3"><h3 class="h4">Город</h3></div>
        <div class="col-sm-9">
            <input class="form-control" type="text" name="city"
                   placeholder="" value="">
        </div>
    </div>

    <div class="row group">
        <div class="col-sm-8">
            <h3 class="h4">Улица</h3>

            <input class="form-control" type="text" name="street"
                   placeholder="" value="" />
        </div>

        <div class="col-sm-4">
            <h3 class="h4">Индекс</h3>

            <input class="form-control" type="text" name="zip"
                   placeholder="" value="" />
        </div>
    </div>

    <div class="row group">
        <div class="col-sm-3">
            <h3 class="h4">Строение</h3>

            <input class="form-control" type="text" name="building"
                   placeholder="" value="" />
        </div>

        <div class="col-sm-3">
            <h3 class="h4">Корпус</h3>

            <input class="form-control" type="text" name="corpus"
                   placeholder="" value="" />
        </div>

        <div class="col-sm-3">
            <h3 class="h4">Дом</h3>

            <input class="form-control" type="text" name="house"
                   placeholder="" value="" />
        </div>

        <div class="col-sm-3">
            <h3 class="h4">Квартира</h3>

            <input class="form-control" type="text" name="flat"
                   placeholder="" value="" />
        </div>
        <hr class="offset-lg">
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
    <hr class="offset-lg visible-xs visible-sm">
    <hr class="offset-lg visible-xs">
</div>
