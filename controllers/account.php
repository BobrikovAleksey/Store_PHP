<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает личный кабинет или форму входа в личный кабинет
 */
function default_action(): void {
    if (empty($_SESSION['login']) or !$_SESSION['login']) {
        redirect('/?p=account&a=login');
        return;
    }

    $admin = $_SESSION['admin'] ? 'присутствуют' : 'отсутствуют';
    echo render('account/index.php', [
        'title' => 'Личный кабинет',
        'styles' => '<link rel="stylesheet" type="text/css" href="/css/account.css?t=' . POSTFIX . '">',
        'admin' => $admin,
    ]);
}

/**
 * GET - возвращает форму создания личного кабинета
 * POST - создает и возвращает личный кабинет
 * @param bool $admin
 */
function create_action(bool $admin = false): void {
    if ($_SERVER['REQUEST_METHOD'] != 'POST') {
        echo render('account/create.php', [
            'title' => 'Создание аккаунта',
            'styles' => '<link rel="stylesheet" type="text/css" href="/css/account.css?t=' . POSTFIX . '">',
        ]);
        return;
    }

    if (empty($_POST['name']) or empty($_POST['email']) or empty($_POST['password'])) {
        logout();
        redirect('/?p=account&a=create');
        return;
    }

    $password = password_hash(joinSol($_POST['password']), PASSWORD_DEFAULT);
    $admin = $admin ? 1 : 0;

    $sql = <<<QUERY
        INSERT INTO `users` (`name`, `email`, `password`, `admin`)
        VALUES ('{$_POST['name']}', '{$_POST['email']}', '{$password}', {$admin})
QUERY;

    if ($result = mysqli_query(getDatabase(), $sql)) {
        login($_POST['name'], $_POST['email']);
        redirect('/?p=account');
        return;
    }

    logout();
    redirect('/?p=account&a=create');
}

/**
 * GET - возвращает форму входа в личный кабинет
 * POST - выполняет вход и возвращает личный кабинет
 */
function login_action(): void {
    if ($_SERVER['REQUEST_METHOD'] != 'POST') {
        echo render('account/login.php', [
            'title' => 'Вход в аккаунт',
            'styles' => '<link rel="stylesheet" type="text/css" href="/css/account.css?t=' . POSTFIX . '">',
        ]);
        return;
    }

    if (empty($_POST['email']) or empty($_POST['password'])) {
        logout();
        redirect('/?p=account&a=login');
        return;
    }

    if ($result = verifyPassword($_POST['email'], $_POST['password'])) {
        login($result['name'], $result['email'], $result['admin'] > 0);
        redirect('/?p=account');
        return;
    }

    redirect('/?p=account&a=login');
}

/**
 * Выполняет выход
 */
function logout_action(): void {
    logout();
    redirect();
}
