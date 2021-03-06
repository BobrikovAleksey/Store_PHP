<!--suppress HtmlFormInputWithoutLabel, HtmlUnknownAnchorTarget -->
<div class="modal fade" id="Modal-SignIn" tabindex="-1" role="dialog">
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
                            <h2 class="modal-title text-center">Войти</h2>
                            <br>

                            <form class="signin" action="/?p=account&a=login" method="post">
                                <input class="form-control" type="email" name="email" placeholder="E-mail" required
                                       value="" ><br>

                                <input class="form-control" type="password" name="password" placeholder="Пароль"
                                       required value=""><br>

                                <button class="btn btn-primary" type="submit">Отправить</button>
                                <a href="#forgot-password" data-action="Forgot-Password">Восстановить пароль ></a>
                            </form>
                            <br>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer"></div>
        </div>
    </div>
</div>
