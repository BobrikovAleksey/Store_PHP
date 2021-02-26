<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает список товаров в заказе
 * @param int $order
 * @return array
 */
function getGoods(int $order): array {
    $sql = <<<QUERY
        SELECT o.`id` AS `order`, o.`status` AS `status`, g.`id` AS `product`, g.`name` AS `name`, g.`title` AS `title`,
               g.`image` AS `image`, op.`price` AS `price`, op.`quantity` AS `quantity`
        FROM `orders` AS O
            LEFT JOIN `order_product` AS op ON op.`id_order` = o.`id`
            LEFT JOIN `goods` AS g ON g.`id` = op.`id_product`
        WHERE o.`id` = {$order}
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список заказов пользователя
 * @param bool $all
 * @return array
 */
function getOrders(bool $all = false): array {
    $where = !$all ? 'WHERE `id_user` = ' . getUserID() : '';
    $sql = <<<QUERY
        SELECT o.`id` AS `order`, u.`email` AS `user`, o.`status` AS `status`, SUM(op.`price`) AS `cost`,
               SUM(op.`quantity`) AS `quantity`, COUNT(op.`quantity`) AS `count`
        FROM `orders` AS o
            LEFT JOIN `order_product` AS op ON op.`id_order` = o.`id`
            LEFT JOIN `users` AS u ON u.`id` = o.`id_user`
        {$where}
        GROUP BY o.`id` ORDER BY o.`id` DESC
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список возможных статусов заказа
 * @return array
 */
function getStatusList(): array {
    $sql = <<<QUERY
        SHOW COLUMNS
        FROM `orders`
        LIKE 'status'
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        $types = mysqli_fetch_assoc($result)['Type'];
        $types = explode('\'', $types);
        $result = [];
        for ($i = 1; $i < count($types); $i += 2) {
            $result[] = $types[$i];
        }
        return $result;
    }

    return [];
}

/** ***********************************************
 *                 A C T I O N S                  *
 ************************************************ */

/**
 * Возвращает список заказов или каталог товаров
 */
function default_action(): void {
    if ($userId = getUserID() < 0) {
        changeLocation('/?p=goods');
        return;
    }

    $orderList = getOrders();
    echo render('orders/index.php', [
        'title' => 'Заказы',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/orders.css?t=' . POSTFIX . '">',
        'orderList' => $orderList,
        'noOrders' => count($orderList) == 0,
    ]);
}

/**
 * Отменяет заказ (статус "Отменен")
 */
function cancel_action(): void {
    $userId = getUserID();
    $orderId = getOrderID();

    $sql = <<<QUERY
        UPDATE `orders`
        SET `status` = 'Отменен'
        WHERE `id` = {$orderId} and `id_user` = {$userId}
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        changeLocation('/?p=orders');
        return;
    }

    changeLocation();
}

/**
 * Изменяет статус заказа
 */
function change_action(): void {
    if (!$_SESSION['login'] or !$_SESSION['admin']) {
        changeLocation('/?p=goods');
        return;
    }

    if (empty($_GET['id']) or !is_numeric($_GET['id']) or empty($_GET['status'])) {
        changeLocation();
        return;
    }

    $id = (int)$_GET['id'];
    $status = $_GET['status'];
    if (!in_array($status, getStatusList())) {
        changeLocation();
        return;
    }

    $sql = <<<QUERY
        UPDATE `orders`
        SET `status` = '{$status}'
        WHERE `id` = {$id}
QUERY;

    mysqli_query(getDatabase(), $sql);
    changeLocation();
}

/**
 * Создает заказ и возвращает список заказов или содержимое корзины
 */
function make_action(): void {
    if (count($_SESSION['cart']) === 0) {
        changeLocation('/?p=cart');
        return;
    }

    $userId = getUserID();
    $sql = <<<QUERY
        INSERT INTO `orders` (`id_user`, `status`)
        VALUES ({$userId}, 'Передан на обработку')
QUERY;
    if ($result = mysqli_query(getDatabase(), $sql)) {
        $orderId = mysqli_insert_id(getDatabase());
        foreach ($_SESSION['cart'] as $id => $quantity) {
            $sql = <<<QUERY
                SELECT `price`
                FROM `goods`
                WHERE `id` = {$id}
QUERY;

            $result = mysqli_query(getDatabase(), $sql);
            $price = mysqli_fetch_assoc($result)['price'];

            $sql = <<<QUERY
                INSERT INTO `order_product` (`id_order`, `id_product`, `price`, `quantity`)
                VALUES ({$orderId}, {$id}, '{$price}', {$quantity})
QUERY;

            mysqli_query(getDatabase(), $sql);
        }

        unset($_SESSION['cart']);
        changeLocation('/?p=orders');
        return;
    }

    changeLocation();
}

/**
 * Возвращает список заказов в табличном представлении с возможностью редактирования статуса (админка)
 */
function table_action(): void {
    if (!$_SESSION['login'] or !$_SESSION['admin']) {
        changeLocation('/?p=goods');
        return;
    }

    $statuses = getStatusList();
    $orders = getOrders(true);
    echo render('orders/table.php', [
        'title' => 'Товары',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/orders.css?t=' . POSTFIX . '">',
        'orders' => $orders,
        'statuses' => $statuses,
        'noOrders' => count($orders) == 0,
    ]);
}

/**
 * Возвращает содержимое заказа
 */
function view_action(): void {
    $userId = getUserID();
    if ($orderId = getOrderID() < 0 or $userId < 0) {
        changeLocation('/?p=orders');
        return;
    }

    $goods = getGoods($orderId);
    echo render('orders/order.php', [
        'title' => "Заказ №{$orderId}",
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/orders.css?t=' . POSTFIX . '">',
        'goods' => $goods,
    ]);
}
