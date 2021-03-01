<?php
/** @noinspection PhpUnused, SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает список статей
 * @return array
 */
function getArticles(): array {
    $sql = <<<QUERY
        SELECT *
        FROM `articles`
        ORDER BY `id` DESC LIMIT 2
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список товаров
 * @param string $type
 * @param int $quantity
 * @return array
 */
function getTopGoods(string $type = '', int $quantity = 4): array {
    $where = !empty($type) ? "WHERE pt.`name` = '{$type}'" : '';
    $sql = <<<QUERY
        SELECT g.*, pt.title AS product_type_title
        FROM `product_type` AS pt
            LEFT JOIN `goods` AS g ON g.`product_type_id` = pt.`id`
        {$where} LIMIT {$quantity}
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
 * Возвращает домашнюю страницу
 */
function default_action() {
    echo render('home.php', [
        'page' => 'home',
        'title' => 'Главная страница',
        'lastArticles' => getArticles(),
        'topDesktop' => getTopGoods('desktop'),
        'topHybrids' => getTopGoods('hybrids'),
        'topTablets' => getTopGoods('tablets'),
    ]);
}
