<?php
/** @noinspection PhpMissingBreakStatementInspection, SqlNoDataSourceInspection, SqlResolve */

/** ***********************************************
 *                 S E S S I O N                  *
 ************************************************ */

/**
 * Возвращает свойство пользователя или список свойств
 * @param array|string $props
 * @return array|string|null
 */
function getUser($props = 'all') {
    if (empty($_SESSION['user'])) return null;

    switch (gettype($props)) {
        case 'array':
            $user = [];
            foreach ($props as $prop) {
                if (isset($_SESSION['user'][$prop])) $user[$prop] = $_SESSION['user'][$prop];
            }
            return $user;

        case 'string':
            if ('string' === 'all') return $_SESSION['user'];

            if (isset($_SESSION['user'][$props])) return $_SESSION['user'][$props];

        default: return null;
    }
}

/**
 * Проверяет произведен ли вход
 * @return bool
 */
function isLogin(): bool {
    return isset($_SESSION['user']);
}

/**
 * Проверяет наличие прав администратора
 * @return bool
 */
function isAdmin(): bool {
    return isLogin() and $_SESSION['admin'];
}

/** ***********************************************
 *                     G E T                      *
 ************************************************ */


/** ***********************************************
 *                    P O S T                     *
 ************************************************ */



/** ***********************************************
 *                    M E N U                     *
 ************************************************ */

define('MENU', [
    'admin.goods' => [ 'title' => 'Работа с <br> товарами', 'link' => '/?p=goods&a=table' ],
    'admin.orders' => [ 'title' => 'Работа с <br> заказами', 'link' => '/?p=orders&a=table' ],
    'cart' => [ 'title' => 'Корзина', 'link' => '/?p=cart' ],
    'catalog' => [ 'title' => 'Каталог', 'link' => '/?p=catalog' ],
    'home' => [ 'title' => 'Главная', 'link' => '/?p=home' ],
    'orders' => [ 'title' => 'Заказы', 'link' => '/?p=orders' ],
]);

/**
 * Возвращает главное меню
 * @return array
 */
function getMenu(): array {
    $result['home'] = MENU['home'];
    $result['catalog'] = MENU['catalog'];
    if (isLogin()) {
        $result['orders'] = MENU['orders'];
        if ($orders = countOrders() > 0) $result['orders']['title'] .= " ({$orders})";
    }
    if (isAdmin()) {
        $result['admin.goods'] = MENU['admin.goods'];
        $result['admin.orders'] = MENU['admin.orders'];
    }
    return $result;
}

/** ********************************************* */

/**
 * Изменяет location в header
 * @param string $location
 */
function redirect(string $location = ''): void {
    if ($location !== '') {
        header("location: {$location}");
    } elseif (isset($_SERVER['HTTP_REFERER'])) {
        header("location: {$_SERVER['HTTP_REFERER']}");
    } else {
        header('location: /');
    }
}



/**
 * Проверяет наличие заказа
 * @param int $id
 * @return bool
 */
function hasOrder(int $id): bool {
    $userId = getUser('id');

    $sql = <<<QUERY
        SELECT COUNT(*) AS `count`
        FROM `orders`
        WHERE `id` = {$id} AND `id_user` = {$userId}
QUERY;

    $result = mysqli_query(getDatabase(), $sql);
    $row = mysqli_fetch_assoc($result);
    return (int)$row['count'] > 0;
}

/**
 * Проверяет наличие товара
 * @param int $id
 * @return bool
 */
function hasProduct(int $id): bool {
    $sql = <<<QUERY
        SELECT COUNT(*) AS `count`
        FROM `goods`
        WHERE `id` = {$id}
QUERY;

    $result = mysqli_query(getDatabase(), $sql);
    $row = mysqli_fetch_assoc($result);
    return (int)$row['count'] > 0;
}

/**
 * Возвращает идентификатор заказа из get-запроса
 * @return int|null
 */
function getOrderId(): ?int {
    if (isset($_GET['id']) and is_numeric($_GET['id'])) {
        $id = (int)$_GET['id'];
        if (hasOrder($id)) return $id;
    }

    return null;
}

/**
 * Возвращает идентификатор товара из get-запроса
 * @return int|null
 */
function getProductId(): ?int {
    if (isset($_GET['id']) and is_numeric($_GET['id'])) {
        $id = (int)$_GET['id'];
        if (hasProduct($id)) return $id;
    }

    return null;
}

/**
 * Возвращает количество товаров в корзине
 * @return int
 */
function countCart(): int {
    if (empty($_SESSION['cart'])) return 0;

    return count(array_keys($_SESSION['cart']));
}

/**
 * Возвращает количество заказов пользователя
 * @return int
 */
function countOrders(): int {
    if ($userId = getUser('id') < 0) return 0;

    $sql = <<<QUERY
        SELECT COUNT(*) AS count
        FROM `orders`
        WHERE `id_user` = { $userId } AND `status` NOT IN ('Отменен', 'Выполнен')
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        $row = mysqli_fetch_assoc($result);
        return (int)$row['count'];
    }

    return 0;
}
