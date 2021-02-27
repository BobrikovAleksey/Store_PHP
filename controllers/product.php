<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Проверяет полученные данные от пользователя
 * @return bool
 */
function checkData(): bool {
    if (empty($_SESSION['product'])) return false;

    foreach ($_SESSION['product'] as $field) {
        if (empty($field)) return false;
    }

    return true;
}

/**
 * Возвращает сохраненные в сессии данные о товаре
 * @return array
 */
function getOldData(): array {
    return [
        'name' => !empty($_SESSION['product']['name']) ? $_SESSION['product']['name'] : '',
        'title' => !empty($_SESSION['product']['title']) ? $_SESSION['product']['title'] : '',
        'description' => !empty($_SESSION['product']['description']) ? $_SESSION['product']['description'] : '',
        'image' => !empty($_SESSION['product']['image']) ? $_SESSION['product']['image'] : '',
        'price' => !empty($_SESSION['product']['price']) ? $_SESSION['product']['price'] : '',
        'images' => (isset($_SESSION['product']['images']) and count($_SESSION['product']['images']) > 0) ?
            implode(PHP_EOL, $_SESSION['product']['images']) : '',
    ];
}

/**
 * Сохраняет в сессии полученные данные о товаре
 * @param array $data
 */
function setData(array $data): void {
    unset($_SESSION['product']['id']);
    $_SESSION['product']['name'] = !empty($data['name']) ? $data['name'] : null;
    $_SESSION['product']['title'] = !empty($data['title']) ? $data['title'] : null;
    $_SESSION['product']['description'] = !empty($data['description']) ? $data['description'] : null;
    $_SESSION['product']['image'] = !empty($data['image']) ? $data['image'] : null;
    $_SESSION['product']['price'] = !empty($data['price']) and is_numeric($data['price'])
        ? floatval($data['price']) : null;
    $_SESSION['product']['images'] = (isset($data['images'])) ? explode(PHP_EOL, $data['images']) : [''];
}

/**
 * Возвращает список комментариев к товару
 * @param int $id
 * @return array
 */
function getFeedbacks(int $id): array {
    $sql = <<<QUERY
        SELECT `name`, `email`, `comment`
        FROM `feedbacks`
        WHERE `id_product` = { $id }
        ORDER BY `id` DESC
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает список изображений товара
 * @param int $id
 * @return array
 */
function getImages(int $id): array {
    $sql = <<<QUERY
        SELECT `link`
        FROM `images`
        WHERE `id_product` = { $id }
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    return [];
}

/**
 * Возвращает товар
 * @param int $id
 * @return bool|string[]|null
 */
function getProduct(int $id) {
    $sql = <<<QUERY
        SELECT `id`, `name`, `title`, `description`, `image`, `price`
        FROM `goods`
        WHERE `id` = { $id }
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        return mysqli_fetch_assoc($result);
    }

    return false;
}

/** ***********************************************
 *                 A C T I O N S                  *
 ************************************************ */

/**
 * Возвращает страницу с товаром
 */
function default_action(): void {
    $id = getProductID();
    if (!$product = getProduct($id)) {
        redirect('/?p=goods');
        return;
    }

    echo render('product/index.php', [
        'title' => 'Товар',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/product.css?t=' . POSTFIX . '">',
        'product' => $product,
        'images' => getImages($id),
        'feedbacks' => getFeedbacks($id),
    ]);
}

/**
 * Удаляет товар из базы и возвращает на страницу вызова или каталог товаров
 */
function delete_action(): void {
    if (!isAdmin()) {
        redirect('/?p=goods');
        return;
    }

    if ($id = getProductID() < 0) {
        redirect();
        return;
    }

    $sql = <<<QUERY
        DELETE FROM `goods`
        WHERE `id` = {$id}
QUERY;

    mysqli_query(getDatabase(), $sql);
    redirect();
}

/**
 * GET - возвращает страницу для добавления товара или каталог товаров
 * POST - добавляет товар в базу и возвращает таблицу с товарами с возможностью редактирования (админка)
 */
function insert_action(): void {
    if (!isAdmin()) {
        redirect('/?p=goods');
        return;
    }

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        $page = [
            'id' => null,
            'action' => '/?p=product&a=insert',
            'button' => 'Добавить',
        ];
        echo render('product/edit.php', [
            'title' => 'Добавление товара',
            'styles' => '<link rel="stylesheet" type="text/css" href="/css/product.css?t=/' . POSTFIX . '">',
            'page' => $page,
            'data' => getOldData(),
        ]);
        return;
    }

    setData($_POST);
    if (!checkData()) {
        redirect('/?p=product&a=insert');
        return;
    }

    $sql = <<<QUERY
        INSERT INTO `goods` (`name`, `title`, `description`, `image`, `price`)
        VALUES ('{$_SESSION['product']['name']}', '{$_SESSION['product']['title']}',
                '{$_SESSION['product']['description']}', '{$_SESSION['product']['image']}',
                {$_SESSION['product']['price']})
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        $id = mysqli_insert_id(getDatabase());
        foreach ($_SESSION['product']['images'] as $image) {
            if (empty($image)) continue;

            $sql = <<<QUERY
                INSERT INTO `images` (`link`, `id_product`)
                VALUES ('{$image}', '{$id}')
QUERY;

            mysqli_query(getDatabase(), $sql);
        }
        unset($_SESSION['product']);
        redirect('/?p=goods&a=table');
        return;
    }

    redirect();
}

/**
 * GET - возвращает страницу для редактирования товара или каталог товаров
 * POST - добавляет товар в базу и возвращает таблицу с товарами с возможностью редактирования (админка)
 */
function update_action(): void {
    if (!isAdmin()) {
        redirect('/?p=goods');
        return;
    }

    $id = getProductID();
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        $page = [
            'id' => $id,
            'action' => "/?p=product&a=update&id={$id}",
            'button' => 'Изменить',
        ];
        if (!$product = getProduct($id)) {
            redirect();
            return;
        }

        $images['images'] = getImages($id);
        foreach ($images['images'] as &$image) {
            $image = $image['link'];
        }
        $product['images'] = implode(PHP_EOL, $images);
        echo render('product/edit.php', [
            'title' => 'Редактирование товара',
            'styles' => '<link rel="stylesheet" type="text/css" href="/css/product.css?t=' . POSTFIX . '">',
            'page' => $page,
            'data' => $product,
        ]);
        return;
    }

    setData($_POST);
    if (!checkData()) {
        redirect('/?p=product&a=update');
        return;
    }

    $sql = <<<QUERY
        UPDATE `goods`
        SET `name` = '{$_SESSION['product']['name']}', `title` = '{$_SESSION['product']['title']}',
            `description` = '{$_SESSION['product']['description']}', `image` = '{$_SESSION['product']['image']}',
            `price` = '{$_SESSION['product']['price']}'
        WHERE `id` = {$id}
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        $sql = <<<QUERY
            SELECT `id`, `link`
            FROM `images`
            WHERE `id_product` = {$id}
QUERY;

        $result = mysqli_query(getDatabase(), $sql);
        $images = mysqli_fetch_all($result, MYSQLI_ASSOC);
        foreach ($images as $key => $image) {
            if (in_array($image['link'], $_SESSION['product']['images'])) continue;

            $sql = <<<QUERY
                DELETE FROM `images`
                WHERE `id` = {$image['id']}
QUERY;
            mysqli_query(getDatabase(), $sql);
            $images[$key] = $image['link'];
        }

        foreach ($_SESSION['product']['images'] as $image) {
            if (in_array($image, $images)) continue;

            $sql = <<<QUERY
                INSERT INTO `images` (`link`, `id_product`)
                VALUES ('{$image}', '{$id}')
QUERY;

            mysqli_query(getDatabase(), $sql);
        }
        unset($_SESSION['product']);
        redirect('/?p=goods&a=table');
        return;
    }

    redirect();
}
