<?php
/** @noinspection PhpUnused, SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает каталог товаров
 */
function default_action(): void {
    if (empty($_GET['cfg']) or ($config = ($_GET['cfg']) and json_last_error() > 0)) $config = [];

    $goods = getCatalog($config);
    $types = getTypes();
    echo render('catalog.php', [
        'page' => 'catalog',
        'title' => 'Каталог',
        'goods' => $goods,
        'emptyCatalog' => count($goods) === 0,
        'manufacturers' => getManufacturers(),
        'prices' => getPrices(),
        'screens' => getScreens(),
        'tags' => $types,
        'types' => $types,
    ]);
}
