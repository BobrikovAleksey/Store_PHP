<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает содержимое корзины
 * @return array
 */
function getGoods(): array {
    if (!array_key_exists('cart', $_SESSION)) return [];

    $goods = array_keys($_SESSION['cart']);
    if (count($goods) === 0) return [];

    $goodsAsStr = implode(',', $goods);
    $sql = <<<QUERY
        SELECT *
        FROM `goods`
        WHERE `id` in ({$goodsAsStr})
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        $result = mysqli_fetch_all($result, MYSQLI_ASSOC);
        foreach ($result as &$row) {
            $row['quantity'] = $_SESSION['cart'][$row['id']];
        }
        return $result;
    }

    return [];
}

/** ***********************************************
 *                 A C T I O N S                  *
 ************************************************ */

/**
 * Возвращает содержимое корзины
 */
function default_action(): void {
    $goods = getGoods();
    echo render('cart.php', [
        'title' => 'Корзина',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/cart.css?t=' . POSTFIX . '">',
        'cartItems' => $goods,
        'cartEmpty' => count($goods) == 0,
    ]);
}

/**
 * Добавляет товар в корзину
 */
function add_action(): void {
    if ($id = getProductID() < 0) {
        redirect();
        return;
    }

    if (empty($_SESSION['cart'])) $_SESSION['cart'] = [];
    if (empty($_SESSION['cart'][$id]) or $_SESSION['cart'][$id] < 0) {
        $_SESSION['cart'][$id] = 1;
    } else {
        $_SESSION['cart'][$id] += 1;
    }
    redirect();
}

/**
 * Очищает корзину
 */
function clear_action(): void {
    $_SESSION['cart'] = [];
    redirect();
}

/**
 * Убирает товар из корзины
 * @param bool $all
 */
function remove_action(bool $all = false): void {
    if ($id = getProductID() < 0) {
        redirect();
        return;
    }

    if (empty($_SESSION['cart'])) $_SESSION['cart'] = [];
    if (isset($_SESSION['cart'][$id]) and $_SESSION['cart'][$id] > 1 and !$all) {
        $_SESSION['cart'][$id] -= 1;
    } else {
        unset($_SESSION['cart'][$id]);
    }
    redirect();
}
