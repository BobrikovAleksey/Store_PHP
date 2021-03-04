<?php
/** @noinspection SqlResolve */

/**
 * Возвращает соединение с базой данных
 * @return mysqli
 */
function getDatabase(): mysqli {
    static $database;
    if (empty($database)) {
        $database = mysqli_connect(
            'localhost',
            'root',
            'root',
            'shop',
            '3366'
        );
    }
    return $database;
}

/** ***********************************************
 *                 Q U E R I E S                  *
 ************************************************ */

$queries = [
    'Articles' => <<<QUERY
           SELECT *
             FROM `articles`
QUERY,
    'Goods' => <<<QUERY
           SELECT g.*, pt.title AS `product_type_title`
             FROM `goods` AS g
        LEFT JOIN `product_type` AS pt ON pt.`id` = g.`product_type_id`
QUERY,
    'Manufacturers' => <<<QUERY
           SELECT m.*, COUNT(*) AS `product_count`
             FROM `goods` AS g
        LEFT JOIN `manufacturers` AS m ON m.`id` = g.`manufacturer_id`
         GROUP BY g.`manufacturer_id`
           HAVING `product_count` > 0
QUERY,
    'Prices' => <<<QUERY
           SELECT MIN(`price`) AS `min`, MAX(`price`) AS `max`
             FROM `goods`
QUERY,
    'Screens' => <<<QUERY
           SELECT `screen`
             FROM `goods`
         GROUP BY `screen`
         ORDER BY CONVERT(`screen`, SIGNED INTEGER)
QUERY,
    'Types' => <<<QUERY
           SELECT pt.*, COUNT(*) AS `product_count`
             FROM `goods` AS g
        LEFT JOIN `product_type` AS pt ON pt.`id` = g.`product_type_id`
         GROUP BY g.`product_type_id`
           HAVING `product_count` > 0
QUERY,
    'Users' => <<<QUERY
        SELECT *
        FROM `users`
QUERY,
];

$queries['LastArticles'] = "{$queries['Articles']} ORDER BY `created_at` DESC";
$queries['LastGoods'] = [
    'All' => "{$queries['Goods']} ORDER BY `created_at` DESC",
    'Desktop' => "{$queries['Goods']} WHERE pt.`name` = 'desktop' ORDER BY `created_at` DESC",
    'Laptops' => "{$queries['Goods']} WHERE pt.`name` = 'laptops' ORDER BY `created_at` DESC",
    'Tablets' => "{$queries['Goods']} WHERE pt.`name` = 'tablets' ORDER BY `created_at` DESC",
    'Hybrids' => "{$queries['Goods']} WHERE pt.`name` = 'hybrids' ORDER BY `created_at` DESC",
    'Servers' => "{$queries['Goods']} WHERE pt.`name` = 'servers' ORDER BY `created_at` DESC",
];

/** ***********************************************
 *            R E P O S I T O R I E S             *
 ************************************************ */

/**
 * Возвращает список товаров
 * @param array $config
 * @param int $limit
 * @return array
 */
function getCatalog(array $config = [], int $limit = 9): array {
    global $queries;
    $limit = $limit > 0 ? "LIMIT {$limit}" : '';
    $query = "{$queries['Goods']} {$limit}";
    if ($result = mysqli_query(getDatabase(), $query)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}

/**
 * Возвращает список последних статей
 * @param int $limit
 * @return array
 */
function getLastArticles(int $limit = 2): array {
    global $queries;
    $limit = $limit > 0 ? "LIMIT {$limit}" : '';
    if ($result = mysqli_query(getDatabase(), "{$queries['LastArticles']} {$limit}")) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}

/**
 * Возвращает список последних товаров в категории
 * @param string $type
 * @param int $limit
 * @return array
 */
function getLastGoods(string $type = '', int $limit = 4): array {
    global $queries;
    $type = $queries['LastGoods'][$type] ? $type : 'All';
    $limit = $limit > 0 ? "LIMIT {$limit}" : '';
    if ($result = mysqli_query(getDatabase(), "{$queries['LastGoods'][$type]} {$limit}")) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}

/**
 * Возвращает список производителей
 * @return array
 */
function getManufacturers(): array {
    global $queries;
    if ($result = mysqli_query(getDatabase(), $queries['Manufacturers'])) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}

/**
 * Возвращает диапазон цен
 * @return array
 */
function getPrices(): array {
    global $queries;
    if ($result = mysqli_query(getDatabase(), $queries['Prices'])) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC)[0];
    }
    return [];
}

/**
 * Возвращает список размеров дисплеев
 * @return array
 */
function getScreens(): array {
    global $queries;
    if ($result = mysqli_query(getDatabase(), $queries['Screens'])) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}

/**
 * Возвращает список типов товаров
 * @return array
 */
function getTypes(): array {
    global $queries;
    if ($result = mysqli_query(getDatabase(), $queries['Types'])) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    return [];
}
