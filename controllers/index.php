<?php
/** @noinspection PhpUnused, SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает домашнюю страницу
 */
function default_action() {
    echo render('home.php', [
        'page' => 'home',
        'title' => 'Главная страница',
        'lastArticles' => getLastArticles(),
        'lastDesktop' => getLastGoods('Desktop'),
        'lastHybrids' => getLastGoods('Hybrids'),
        'lastTablets' => getLastGoods('Tablets'),
    ]);
}
