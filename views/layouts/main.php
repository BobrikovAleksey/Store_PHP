<?php
/**
 * @noinspection PhpIncludeInspection
 * @var string $title
 * @var string $content
 */
?>

<!DOCTYPE html>
<html lang="ru">
<head>
<!-- meta -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1, width=320">

<!-- bootstrap & jquery -->
<!--suppress HtmlUnknownTarget -->
<link href="/assets/css/bootstrap.css" rel="stylesheet">
<!--suppress HtmlUnknownTarget -->
<link href="/assets/css/custom.css" rel="stylesheet">
<!--suppress HtmlUnknownTarget -->
<link href="/assets/css/carousel.css" rel="stylesheet">
<!--suppress HtmlUnknownTarget -->
<link href="/assets/ionicons-2.0.1/css/ionicons.css" rel="stylesheet">
<link href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="https://fonts.googleapis.com/css?family=Catamaran:100,300,400,700" rel="stylesheet">
<!--suppress HtmlUnknownTarget -->
<link href="/assets/css/custom-scroll/jquery.mCustomScrollbar.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- project -->
<link type="image/x-icon" href="favicon.png" rel="icon">
<title>Unistore: <?= $title ?></title>
</head>

<body>
<!-- <b>bobrikov.spb@ya.ru : qwerty123 => admin </b><br>-->
<!-- <b>123@ya.ru : 123 </b><br>-->
<!-- <b>321@ya.ru : 321 </b><br>-->

<?php include_once getComponentPath('header/index') ?>

<?= $content ?>

<hr class="offset-lg">
<hr class="offset-sm">

<?php include_once getComponentPath('footer/index') ?>

<!-- cart -->

<?php include_once getComponentPath('cart') ?>

<!-- modals -->

<?php include_once getComponentPath('modals/sign-in') ?>

<?php include_once getComponentPath('modals/registration') ?>

<?php include_once getComponentPath('modals/forgot-password') ?>

<!-- libraries -->
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/jquery-latest.min.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/bootstrap.min.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/jquery-ui-1.11.4.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/jquery.ui.touch-punch.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/jquery.touchSwipe.min.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/carousel.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/core.js"></script>
<!--suppress HtmlUnknownTarget -->
<script src="/assets/js/store.js"></script
</body>
</html>
