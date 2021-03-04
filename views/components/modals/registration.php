<!--suppress HtmlFormInputWithoutLabel, HtmlUnknownAnchorTarget -->
<div class="modal fade" id="Modal-Registration" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="ion-android-close"></i></span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                            <h2 class="modal-title text-center">Регистрация</h2>
                            <br>

                            <form class="join" action="/?p=account&a=create" method="post">
                                <input class="form-control" type="text" name="name" placeholder="Введите Ваше имя"
                                       value="" required>
                                <br>

                                <input class="form-control" type="email" name="email" placeholder="E-mail" value=""
                                       required>
                                <br>

                                <input class="form-control" type="password" name="password" placeholder="Введите пароль"
                                       value="" required>
                                <br>

                                <input class="form-control" type="password" name="confirm"
                                       placeholder="Введите пароль повторно" value="" required>
                                <br>

                                <button class="btn btn-primary btn-sm" type="submit" >Отправить</button> &nbsp;&nbsp;
                                <a href="#terms">Условия ></a>
                                <br><br>

                                <p class="text">
                                    Создав учетную запись, Вы сможете делать покупки быстрее и будете в курсе состояния
                                    заказа. Также появится возможность отслеживать ранее сделанные заказы.
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer"></div>
        </div>
    </div>
</div>
