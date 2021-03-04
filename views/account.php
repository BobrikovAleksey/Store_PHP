<?php
/** @noinspection PhpIncludeInspection */
?>

<!--suppress HtmlFormInputWithoutLabel -->
<hr class="offset-top">

<div class="white">
    <div class="container checkout">
        <h1>Личный кабинет</h1>
        <hr class="offset-sm">
    </div>
</div>
<hr class="offset-md">

<div class="container checkout">
    <form action="#" method="post">
        <div class="row">
            <div class="col-md-6">
                <?php include_once getComponentPath('account/main') ?>
                <hr class="offset-lg">
                <hr class="offset-lg">

                <?php include_once getComponentPath('account/password') ?>
                <hr class="offset-lg visible-xs visible-sm">
                <hr class="offset-lg visible-xs">
            </div>

            <?php include_once getComponentPath('account/contacts') ?>
        </div>
    </form>
</div>
