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
 * @param array $user
 */
function login(array $user): void {
    $_SESSION['admin'] = $user['admin'] == 1;
    $_SESSION['user'] = $user;
}

/**
 * Выполняет выход
 */
function logout(): void {
    unset($_SESSION['admin']);
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

    global $queries;
    if (!$result = mysqli_query(getDatabase(), "{$queries['User']} WHERE `email` = '{$login}'")) return false;

    $row = mysqli_fetch_assoc($result);
    if (!password_verify(joinSol($password), $row['password'])) return false;
    return $row;
}
