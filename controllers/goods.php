<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает список товаров
 * @return array
 */
function getGoods(): array {
    $sql = <<<QUERY
        SELECT *
        FROM `goods`
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/** ***********************************************
 *                 A C T I O N S                  *
 ************************************************ */

/**
 * Возвращает каталог товаров
 */
function default_action(): void {
    $goods = getGoods();
    echo render('goods/index.php', [
        'title' => 'Товары',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/goods.css?t=' . POSTFIX . '">',
        'goods' => $goods,
        'noGoods' => count($goods) == 0,
    ]);
}

/**
 * Возвращает каталог товаров в табличном представлении с возможностью редактирования (админка)
 */
function table_action(): void {
    if (!$_SESSION['login'] or !$_SESSION['admin']) {
        redirect('/?p=goods');
        return;
    }

    $goods = getGoods();
    echo render('goods/table.php', [
        'title' => 'Товары',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/goods.css?t=' . POSTFIX . '">',
        'goods' => $goods,
        'noGoods' => count($goods) == 0,
    ]);
}
