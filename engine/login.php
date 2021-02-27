<?php
/** @noinspection SqlNoDataSourceInspection, SqlResolve */

/**
 * Возвращает пароль с солью
 * @param string $password
 * @return string
 */
function joinSol(string $password): string {
    return "FR4jO8mH4yAe$password";
}

/**
 * Выполняет вход
 * @param string $name
 * @param string $email
 * @param bool $admin
 */
function login(string $name, string $email, bool $admin = false): void {
    $_SESSION['admin'] = $admin;
    $_SESSION['user']['name'] = $name;
    $_SESSION['user']['email'] = $email;
}

function logout(): void {
    $_SESSION['admin'] = false;
    unset($_SESSION['user']);
}

/**
 * Проверяет соответствие пароля у пользователя
 * @param string $login
 * @param string $password
 * @return bool|string[]|null
 */
function verifyPassword(string $login, string $password) {
    if (empty($login) || empty($password)) return false;

    $sql = <<<QUERY
        SELECT `id`, `name`, `email`, `password`, `admin`
        FROM `users`
        WHERE `email` = '{$login}'
QUERY;

    if (!$result = mysqli_query(getDatabase(), $sql)) return false;

    $row = mysqli_fetch_assoc($result);
    if (!password_verify(joinSol($password), $row['password'])) return false;

    return $row;
}
