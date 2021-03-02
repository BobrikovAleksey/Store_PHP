<?php
/** @noinspection PhpIncludeInspection */
?>

<hr class="offset-top">

<?php include_once getComponentPath('catalog/tags'); ?>

<div class="container">
    <div class="row">
    <?php
        include_once getComponentPath('catalog/filter');

        include_once getComponentPath('catalog/goods');
    ?>
    </div>
</div>
