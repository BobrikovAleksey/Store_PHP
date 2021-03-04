<?php
/** @noinspection PhpIncludeInspection */

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
    if (file_exists($view)) include_once $view;
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
    if (file_exists($controller)) include_once $controller;
    $action = 'default_action';
    if (isset($_GET['a']) and function_exists($actionFromGet = "{$_GET['a']}_action")) $action = $actionFromGet;
    $action();
}
