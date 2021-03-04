<?php

session_start();
define('ROOT_DIR', dirname(__DIR__));
define('POSTFIX', microtime(true).rand());

include_once 'database.php';
include_once 'service.php';
include_once 'login.php';
include_once 'app.php';

run();
