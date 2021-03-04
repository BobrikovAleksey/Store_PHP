<!--suppress HtmlUnknownAnchorTarget -->
<div class="toplinks">
    <?php if(isLogin()) :?>
        <a href="/?p=account"><i class="ion-person"></i> <?= getUser('firstname') ?></a>

        <a href="/?p=account&a=logout"><i class="ion-locked"></i> Выйти</a>
    <?php else :?>open<ion-icon name="enter-outline"></ion-icon>
        <a href="#registration" data-toggle="modal" data-target="#Modal-Registration">
            <i class="ion-person"></i> Регистрация
        </a>

        <a href="#sign-in" data-toggle="modal" data-target="#Modal-SignIn"><i class="ion-unlocked"></i> Войти</a>
    <?php endif ?>

    <a href="/"><i class="ion-ios-heart"></i> Избранное</a>

    <a href="tel:+88121234567" class="hidden-xs"><i class="ion-android-call"></i> 8 (812) 123-45-67</a>
</div>
