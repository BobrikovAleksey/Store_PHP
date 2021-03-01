<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

session_start();
define('ROOT_DIR', dirname(__DIR__));
define('POSTFIX', microtime(true).rand());

/** ***********************************************
 *                D A T E B A S E                 *
 ************************************************ */

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
 *                  C H E C K S                   *
 ************************************************ */

/**
 * Проверяет наличие заказа
 * @param int $id
 * @return bool
 */
function hasOrder(int $id): bool {
    $userId = getUserID();

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
 * Проверяет произведен ли вход
 * @return bool
 */
function isLogin(): bool {
    if (empty($_SESSION['user']) or empty($_SESSION['user']['name']) or empty($_SESSION['user']['email'])) {
        logout();
        return false;
    }

    return true;
}

/**
 * Проверяет наличие прав администратора
 * @return bool
 */
function isAdmin(): bool {
    return isLogin() and $_SESSION['admin'];
}

/** ***********************************************
 *       D A T A   F R O M   S E S S I O N        *
 ************************************************ */

/**
 * Возвращает идентификатор пользователя из сессии
 * @return int|null
 */
function getUserId(): ?int {
    static $id;
    if (empty($_SESSION['user']) or empty($_SESSION['user']['email'])) {
        $id = null;
    } elseif (empty($id)) {
        $sql = <<<QUERY
            SELECT `id`
            FROM `users`
            WHERE `email` = '{$_SESSION['user']['email']}'
QUERY;

        $result = mysqli_query(getDatabase(), $sql);
        $row = mysqli_fetch_assoc($result);
        $id = (int)$row['id'];
    }

    return $id;
}

/** ***********************************************
 *      D A T A   F R O M   G E T / P O S T       *
 ************************************************ */

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

/** ***********************************************
 *                     A P P                      *
 ************************************************ */

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
    if ($userId = getUserID() < 0) return 0;

    $sql = <<<QUERY
        SELECT COUNT(*) AS count
        FROM `orders`
        WHERE `id_user` = { $userId } AND `status` NOT IN ('Отменен', 'Выполнен')
QUERY;

    $result = mysqli_query(getDatabase(), $sql);
    $row = mysqli_fetch_assoc($result);
    return (int)$row['count'];
}

/**
 * Возвращает путь к компоненту
 * @param string $component
 * @return string
 */
function getComponentPath(string $component): string {
    return ROOT_DIR . "/views/components/{$component}.php";
}

/**
 * Возвращает путь к контроллеру
 * @param string $controller
 * @return string
 */
function getControllerPath(string $controller): string {
    return ROOT_DIR . "/controllers/{$controller}.php";
}

/**
 * Возвращает относительный путь к макету
 * @param string $layout
 * @return string
 */
function getLayoutPath(string $layout): string {
    return "/layouts/{$layout}";
}

/**
 * Возвращает путь к шаблону
 * @param string $template
 * @return string
 */
function getViewPath(string $template): string {
    return ROOT_DIR . "/views/{$template}";
}

define('MENU', [
    'admin.goods' => [ 'title' => 'Работа с <br> товарами', 'link' => '/?p=goods&a=table' ],
    'admin.orders' => [ 'title' => 'Работа с <br> заказами', 'link' => '/?p=orders&a=table' ],
    'cart' => [ 'title' => 'Корзина', 'link' => '/?p=cart' ],
    'store' => [ 'title' => 'Магазин', 'link' => '/?p=store' ],
    'home' => [ 'title' => 'Главная', 'link' => '/?p=home' ],
    'orders' => [ 'title' => 'Заказы', 'link' => '/?p=orders' ],
    'user.account' => [ 'title' => $_SESSION['user']['name'], 'link' => '/?p=account' ],
    'user.login' => [ 'title' => 'Войти', 'link' => '/?p=account&a=login' ],
    'user.logout' => [ 'title' => 'Выйти', 'link' => '/?p=account&a=logout' ],
]);

/**
 * Возвращает главное меню
 * @return array
 */
function getMenu(): array {
    $result['home'] = MENU['home'];
    $result['store'] = MENU['store'];
    if (isLogin()) {
        $result['orders'] = MENU['orders'];
        if ($orders = countOrders() > 0) $result['orders']['title'] .= " ({$orders})";
    }
    $result['cart'] = MENU['cart'];
    if ($cart = countCart() > 0) $result['cart']['title'] .= " ({$cart})";
    if (isAdmin()) {
        $result['admin.goods'] = MENU['admin.goods'];
        $result['admin.orders'] = MENU['admin.orders'];
    }
    if (isLogin()) {
        $result['user.account'] = MENU['user.account'];
        $result['user.logout'] = MENU['user.logout'];
    } else {
        $result['user.login'] = MENU['user.login'];
    }

    return $result;
}

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

/** ********************************************* */

/**
 * Подключает шаблон
 * @param string $template
 * @param array $params
 * @return string
 */
function renderTemplate(string $template, array $params = []): string {
    $view = getViewPath($template);
    ob_start();
    extract($params);
    if (file_exists($view)) {
        /** @noinspection PhpIncludeInspection */
        include_once $view;
    }
    return ob_get_clean();
}

/**
 * Выводит страницу
 * @param string $template
 * @param array $params
 * @param string $layout
 * @return string
 */
function render(string $template, array $params = [], string $layout = 'main.php'): string {
    $title = 'Интернет-магазин';
    if (!empty($params['title'])) $title = $params['title'];

    return renderTemplate(getLayoutPath($layout), [
        'page' => $params['page'],
        'title' => $title,
        'content' => renderTemplate($template, $params),
        'menu' => getMenu(),
    ]);
}

/**
 * Запускает приложение
 */
function run(): void {
    $controller = getControllerPath('index');
    if (isset($_GET['p']) and is_file(getControllerPath($_GET['p']))) {
        $controller = getControllerPath($_GET['p']);
    }

    if (file_exists($controller)) {
        /** @noinspection PhpIncludeInspection */
        include_once $controller;
    }

    $action = 'default_action';
    if (isset($_GET['a']) and function_exists($actionFromGet = "{$_GET['a']}_action")) {
        $action = $actionFromGet;
    }
    $action();
}
