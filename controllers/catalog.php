<?php
/** @noinspection PhpUnused, SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает список товаров
 * @param array $config
 * @return array
 */
function getGoods(array $config = []): array {
    $sql = <<<QUERY
        SELECT g.*, pt.title AS product_type_title
        FROM `goods` AS g
            LEFT JOIN `product_type` AS pt ON pt.`id` = g.`product_type_id`
        LIMIT 9
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список типов товаров
 * @return array
 */
function getManufacturers(): array {
    $sql = <<<QUERY
        SELECT m.*, COUNT(*) AS `product_count`
        FROM `goods` AS g
            LEFT JOIN `manufacturers` AS m ON m.`id` = g.`manufacturer_id`
        GROUP BY g.`manufacturer_id`
        HAVING `product_count` > 0
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает диапазон цен
 * @return array
 */
function getPrices(): array {
    $sql = <<<QUERY
        SELECT MIN(`price`) AS `min`, MAX(`price`) AS `max`
        FROM `goods`
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC)[0];
    }

    return [];
}

/**
 * Возвращает список размеров дисплеев
 * @return array
 */
function getScreens(): array {
    $sql = <<<QUERY
        SELECT `screen`
        FROM `goods`
        GROUP BY `screen`
        ORDER BY CONVERT(`screen`, SIGNED INTEGER)
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список типов товаров
 * @return array
 */
function getTypes(): array {
    $sql = <<<QUERY
        SELECT pt.*, COUNT(*) AS `product_count`
        FROM `goods` AS g
            LEFT JOIN `product_type` AS pt ON pt.`id` = g.`product_type_id`
        GROUP BY g.`product_type_id`
        HAVING `product_count` > 0
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
    if (empty($_GET['cfg']) or ($config = ($_GET['cfg']) and json_last_error() > 0)) $config = [];

    $goods = getGoods($config);
    echo render('catalog.php', [
        'page' => 'catalog',
        'title' => 'Каталог',
        'goods' => $goods,
        'emptyCatalog' => count($goods) === 0,
        'manufacturers' => getManufacturers(),
        'prices' => getPrices(),
        'screens' => getScreens(),
        'tags' => getTypes(),
        'types' => getTypes(),
    ]);
}
