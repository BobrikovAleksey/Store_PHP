<?php
/**
 * @var array $types
 */
?>

<div class="tags">
    <div class="container">
        <div class="btn-group pull-right sorting">
            <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                <i class="ion-arrow-down-b"></i> Сортировка по наименованию
            </button>

            <ul class="dropdown-menu" style="min-width: 100%;">
                <li class="active"><a href="/"><i class="ion-arrow-down-c"></i> Наименование [А-Я]</a></li>

                <li><a href="/"><i class="ion-arrow-up-c"></i> Наименование [А-Я]</a></li>

                <li><a href="/"><i class="ion-arrow-down-c"></i> Цена</a></li>

                <li><a href="/"><i class="ion-arrow-up-c"></i> Цена</a></li>
            </ul>
        </div>

        <p>Поиск по тегам</p>

        <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-default btn-sm active">
                <input type="radio" name="options" id="tags-all" checked>Все товары
            </label>

            <?php foreach ($types as $row) :?>

                <label class="btn btn-default btn-sm">
                    <input type="radio" name="options" id="tags-<?= $row['id'] ?>"><?= $row['title'] ?>
                </label>

            <?php endforeach; ?>
        </div>
    </div>
</div>
