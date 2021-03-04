<?php
/** @noinspection SqlNoDataSourceInspection */

/**
 * Возвращает личный кабинет или форму входа в личный кабинет
 */
function default_action(): void {
    if (!isLogin()) {
        redirect('/');
        return;
    }

    echo render('account.php', [
        'title' => 'Личный кабинет',
        'admin' => isAdmin(),
    ]);
}

/**
 * POST: Создает аккаунт и возвращает личный кабинет
 * @param bool $admin
 */
function create_action(bool $admin = false): void {
    if ($_SERVER['REQUEST_METHOD'] === 'POST'
    and isset($_POST['password']) and isset($_POST['confirm']) and $_POST['password'] === $_POST['confirm']
    and isset($_POST['name']) and isset($_POST['email'])) {
        global $queries;

        $admin = $admin ? 1 : 0;
        $password = password_hash(joinSol($_POST['password']), PASSWORD_DEFAULT);
        $query = str_replace(
            ['{{email}}', '{{password}}', '{{name}}', '{{admin}}'],
            [$_POST['email'], $password, $_POST['name'], $admin],
            $queries['AddUser']
        );

        if (mysqli_query(getDatabase(), $query) and $result = verifyPassword($_POST['email'], $_POST['password'])) {
            login($result);
            redirect('/?p=account');
            return;
        }
    }

    redirect();
}

/**
 * POST: Выполняет вход
 */
function login_action(): void {
    if ($_SERVER['REQUEST_METHOD'] === 'POST'
        and isset($_POST['email']) and isset($_POST['password'])
        and $result = verifyPassword($_POST['email'], $_POST['password'])) {
        login($result);
    }

    redirect();
}

/**
 * Выполняет выход
 */
function logout_action(): void {
    logout();
    redirect();
}
