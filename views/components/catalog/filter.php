<?php
/**
 * @var array $manufacturers
 * @var array $prices
 * @var array $screens
 * @var array $types
 */
?>

<!--suppress HtmlFormInputWithoutLabel, HtmlUnknownAnchorTarget -->
<div class="col-sm-4 col-md-3">
    <hr class="offset-lg">

    <div class="filter">
        <div class="item">
            <div class="title">
                <a class="down" href="#open" data-action="open"><i class="ion-android-arrow-dropdown"></i></a>
                <a href="#clear" data-action="clear"><i class="ion-ios-trash-outline"></i></a>
                <h1 class="h4">Тип</h1>
            </div>

            <div class="controls">
                <?php foreach ($types as $row) :?>

                    <div class="checkbox-group" data-status="inactive">
                        <div class="checkbox"><i class="ion-android-done"></i></div>
                        <div class="label" data-value="<?= $row['id'] ?>"><?= $row['title'] ?></div>
                        <input type="checkbox" name="checkbox" value="<?= $row['id'] ?>">
                    </div>

                <?php endforeach; ?>
            </div>
        </div>
        <br>

        <div class="item">
            <div class="title">
                <a class="down" href="#open" data-action="open"> <i class="ion-android-arrow-dropdown"></i></a>
                <a href="#clear" data-action="clear"> <i class="ion-ios-trash-outline"></i></a>
                <h1 class="h4">Дисплей</h1>
            </div>

            <div class="controls grid">
                <?php foreach ($screens as $row) :?>

                    <div class="checkbox-group" data-status="inactive">
                        <div class="checkbox"><i class="ion-android-done"></i></div>
                        <div class="label" data-value="<?= $row['screen'] ?>"><?= $row['screen'] ?></div>
                        <input type="checkbox" name="checkbox" value="<?= $row['screen'] ?>">
                    </div>

                <?php endforeach; ?>
            </div>
        </div>
        <br>

        <div class="item">
            <div class="title">
                <a class="down" href="#open" data-action="open"><i class="ion-android-arrow-dropdown"></i></a>
                <a href="#clear" data-action="clear-price"><i class="ion-ios-trash-outline"></i></a>
                <h1 class="h4">Цена</h1>
            </div>

            <div class="controls">
                <br>
                <div id="slider-price"></div>
                <br>
                <p id="amount"></p>
            </div>
        </div>
        <br>

        <div class="item lite">
            <div class="title">
                <a class="down" href="#open" data-action="open"><i class="ion-android-arrow-dropdown"></i></a>
                <a href="#clear" data-action="clear"><i class="ion-ios-trash-outline"></i></a>
                <h1 class="h4">Производители</h1>
            </div>

            <div class="controls">
                <?php foreach ($manufacturers as $row) :?>

                    <div class="checkbox-group" data-status="inactive">
                        <div class="checkbox"><i class="ion-android-done"></i></div>
                        <div class="label" data-value="<?= $row['id'] ?>"><?= $row['title'] ?></div>
                        <input type="checkbox" name="checkbox" value="<?= $row['id'] ?>">
                    </div>

                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>
