--
-- База данных: `shop`
--

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(128) NOT NULL UNIQUE,
    `title` varchar(128) NOT NULL,
    `synopsis` varchar(1024) NOT NULL,
    `cover` varchar(256) NOT NULL,
    `cover_text` varchar(64) NOT NULL,
    `author` varchar(64) NULL,

    `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX `articles_name_idx` (`name`(16)),
    INDEX `articles_title_idx` (`title`(8)),
    INDEX `articles_author_idx` (`author`(8))
) ENGINE=InnoDB COMMENT='Статьи';

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `name`, `title`, `cover`, `cover_text`, `author`, `created_at`, `updated_at`, `synopsis`) VALUES
(1, 'izmeneniya-v-apple-music-apple-sup-i-dr', 'Изменения в Apple Music, Apple, SUP и др.', '/assets/img/blog/img3.jpg', 'Apple Music', 'Админ', '2016-11-29 09:42:13', '2016-11-29 09:42:13',
 'Воскресенье - День матери. Подожди, ты забыл? Что ж, благодаря Apple, вы можете записать видео «Снято на iPhone» ко Дню матери, используя этот сайт. Загрузите изображение, введите свое имя, а затем просто опубликуйте, чтобы мама могла насладиться.'),
(2, 'obzor-hp-chromebook', 'Обзор HP Chromebook', '/assets/img/blog/img4.jpg', 'HP Chromebook', 'Админ', '2016-12-02 12:13:58', '2016-12-02 12:13:58',
 'Chromebook 11 G4 от HP ($199) имеет тускло-серую цвет корпуса, которая кричит: «Купите оптом в образовательные учреждения» больше, чем «купите меня». Однако, именно по-этому эта ориентированная на школу модель может валяться в рюкзаках, она может научить своих владельцев обращать больше внимания на качество сборки.'),
(3, 'macbook-pro-sovershenno-novyj-dlya-biznesa', 'MacBook Pro - совершенно новый для бизнеса', '/assets/img/blog/img2.jpg', 'Кофе', 'Админ', '2016-12-05 09:35:44', '2016-12-05 09:35:44',
 'Организации во всем мире осознают потенциал, который Mac дает их сотрудникам, предоставляя им свободу в использовании инструментов, которые они уже знают и любят. Программное и аппаратное обеспечение созданы друг для друга. Поскольку Apple разрабатывает как программное обеспечение, так и аппаратное, каждый Mac обеспечивает максимальное удобство для сотрудников.'),
(4, 'populyarnye-posty-v-bloge', 'Популярные посты в блоге', '/assets/img/blog/img1.jpg', 'Устройства Apple', 'Админ', '2016-12-07 09:38:29', '2016-12-07 09:38:29',
 'Оригинальный iPhone познакомил мир с Multi-Touch, навсегда изменив восприятие технологий людьми. С помощью 3D Touch появилась возможность делать то, что раньше было невозможно. Он чувствует с каким усилием вы нажимаете на дисплей, позволяя Вам делать любые необходимые операции быстрее и проще. Это дает Вам отклик в режиме реального времени в виде легких нажатий от совершенно нового движка Taptic.'),
(5, 'izmeneniya-v-apple-music-apple-sup-i-dr-copy', 'Изменения в Apple Music, Apple, SUP и др., copy', '/assets/img/blog/img3.jpg', 'Apple Music', 'Админ', '2016-12-29 09:42:13', '2016-12-29 09:42:13',
    'Воскресенье - День матери. Подожди, ты забыл? Что ж, благодаря Apple, вы можете записать видео «Снято на iPhone» ко Дню матери, используя этот сайт. Загрузите изображение, введите свое имя, а затем просто опубликуйте, чтобы мама могла насладиться.'),
(6, 'obzor-hp-chromebook-copy', 'Обзор HP Chromebook, copy', '/assets/img/blog/img4.jpg', 'HP Chromebook', 'Админ', '2017-01-02 12:13:58', '2017-01-02 12:13:58',
    'Chromebook 11 G4 от HP ($199) имеет тускло-серую цвет корпуса, которая кричит: «Купите оптом в образовательные учреждения» больше, чем «купите меня». Однако, именно по-этому эта ориентированная на школу модель может валяться в рюкзаках, она может научить своих владельцев обращать больше внимания на качество сборки.'),
(7, 'macbook-pro-sovershenno-novyj-dlya-biznesa-copy', 'MacBook Pro - совершенно новый для бизнеса, copy', '/assets/img/blog/img2.jpg', 'Кофе', 'Админ', '2017-01-05 09:35:44', '2017-01-05 09:35:44',
    'Организации во всем мире осознают потенциал, который Mac дает их сотрудникам, предоставляя им свободу в использовании инструментов, которые они уже знают и любят. Программное и аппаратное обеспечение созданы друг для друга. Поскольку Apple разрабатывает как программное обеспечение, так и аппаратное, каждый Mac обеспечивает максимальное удобство для сотрудников.'),
(8, 'populyarnye-posty-v-bloge-copy', 'Популярные посты в блоге, copy', '/assets/img/blog/img1.jpg', 'Устройства Apple', 'Админ', '2017-01-07 09:38:29', '2017-01-07 09:38:29',
    'Оригинальный iPhone познакомил мир с Multi-Touch, навсегда изменив восприятие технологий людьми. С помощью 3D Touch появилась возможность делать то, что раньше было невозможно. Он чувствует с каким усилием вы нажимаете на дисплей, позволяя Вам делать любые необходимые операции быстрее и проще. Это дает Вам отклик в режиме реального времени в виде легких нажатий от совершенно нового движка Taptic.');

-- --------------------------------------------------------

--
-- Структура таблицы `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
    `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(64) NOT NULL UNIQUE,
    `title` varchar(64) NOT NULL
) ENGINE=InnoDB COMMENT='Типы товаров';

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `product_type` (`id`, `name`, `title`) VALUES
(1, 'desktop', 'Настольные компьютеры'),
(2, 'laptops', 'Ноутбуки'),
(3, 'tablets', 'Планшеты'),
(4, 'hybrids', 'Ноутбуки-трансформеры'),
(5, 'servers', 'Серверы');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
    `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(64) NOT NULL UNIQUE,
    `title` varchar(64) NOT NULL,

    INDEX `manufacturers_name_idx` (`name`(8))
) ENGINE=InnoDB COMMENT='Производители';

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `manufacturers` (`id`, `name`, `title`) VALUES
(1, 'apple', 'Apple'),
(2, 'xiaomi', 'Xiaomi'),
(3, 'asus', 'Asus'),
(4, 'lenovo', 'Lenovo'),
(5, 'microsoft', 'Microsoft'),
(6, 'hp', 'HP'),
(7, 'dell', 'Dell');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(128) NOT NULL UNIQUE,
    `title` varchar(128) NOT NULL,
    `cover` varchar(256) NOT NULL,
    `cover_text` varchar(64) NOT NULL,
    `product_type_id` smallint UNSIGNED NOT NULL,
    `manufacturer_id` smallint UNSIGNED NOT NULL,
    `screen` varchar(8) NOT NULL,
    `price` decimal(7,2),
    `sale` decimal(7,2),

    `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX `goods_name_idx` (`name`(16)),
    INDEX `goods_title_idx` (`title`(8)),
    INDEX `goods_type_idx` (`product_type_id`)
) ENGINE=InnoDB COMMENT='Товары';

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `title`, `cover`, `cover_text`, `product_type_id`, `manufacturer_id`, `screen`, `price`, `sale`, `created_at`, `updated_at`) VALUES
(1, 'mi-pad-2', 'Mi Pad 2', '/assets/img/products/mi-pad-2.jpg', 'Xiaomi Mi Pad 2', 3, 2, '8"', 899.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(2, 'apple-ipad-air', 'Apple iPad Air', '/assets/img/products/ipad-air.jpg', 'Apple iPad Air', 3, 1, '11"', 1099.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(3, 'asus-transformer', 'Asus Transformer', '/assets/img/products/asus-transformer.jpg', 'Asus Transformer', 3, 3, '14"', 987.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(4, 'lenovo-yoga-900', 'Lenovo Yoga 900', '/assets/img/products/lenovo-yoga.jpg', 'Lenovo Yoga 900', 4, 4, '13"', 1899.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(5, 'microsoft-surface-pro', 'Microsoft Surface Pro', '/assets/img/products/surface-pro.jpg', 'Surface Pro', 4, 5, '11"', 2099.99, 2499.99, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(6, 'hp-spectre-x360', 'HP Spectre x360', '/assets/img/products/hp-spectre-x360.jpg', 'HP Spectre x360', 4, 6, '16"', 2994.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(7, 'dell-inspiron-7000', 'Dell Inspiron 7000', 'assets/img/products/dell-inspiron-2in1.jpg', 'Dell Inspiron 7000 2-in-1', 4, 7, '16"', 1994.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(8, 'imac-27-retina', 'iMac 27 Retina', '/assets/img/products/apple-imac-27-retina.jpg', 'Apple iMac 27 Retina', 1, 1, '27"', 2099.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(9, 'surface-studio', 'Surface Studio', '/assets/img/products/microsoft-surface-studio.jpg', 'Microsoft Surface Studio', 1, 5, '28"', 3749.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(10, 'dell-inspion-23', 'Dell Inspion 23', '/assets/img/products/dell-inspiron-23.jpg', 'Dell Inspion 23', 1, 7, '23"', 2100.99, 1987.99, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(11, 'lenovo-ideacenter', 'Lenovo IdeaCenter', '/assets/img/products/lenovo-ideacenter.jpg', 'Lenovo IdeaCenter', 1, 4, '27"', 2487.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(12, 'ipad-mini', 'iPad Mini', '/assets/img/products/ipad-mini.jpg', 'iPad Mini', 3, 1, '8"', 399.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(13, 'hp-chromebook-11', 'HP Chromebook 11', '/assets/img/products/chrome-book-11.jpg', 'HP Chromebook 11', 2, 6, '11"', 279.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00'),
(14, 'hp-chromebook-14', 'HP Chromebook 14', '/assets/img/products/chrome-book-14.jpg', 'HP Chromebook 14', 2, 6, '14"', 309.99, NULL, '2017-01-01 00:00:00', '2017-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` varchar(128) UNIQUE NOT NULL,
    `password` varchar(128) NOT NULL,
    `firstname` varchar(64) NOT NULL,
    `lastname` varchar(64),
    `country` varchar(128),
    `city` varchar(128),
    `street` varchar(128),
    `building` varchar(8),
    `corpus` varchar(8),
    `house` smallint UNSIGNED,
    `flat` int UNSIGNED,
    `zip` int UNSIGNED,
    `admin` bit(1) DEFAULT b'0',

    `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX `users_email_idx` (`email`(16)),
    INDEX `users_firstname_idx` (`firstname`(8)),
    INDEX `users_country_idx` (`country`),
    INDEX `users_city_idx` (`city`)
) ENGINE=InnoDB COMMENT='Пользователи';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `country`, `city`, `street`, `building`, `corpus`, `house`, `flat`, `zip`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'andreev.msk@ya.ru', '$2y$10$5b8jQc77aj2v/dKbEuUcd.yXw.LqXppZkDfqvT2tXVaf1Rgg/MIIW', 'Анатолий', 'Андреев', null, null, null, null, null, null, null, null, b'0', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 'bobrikov.spb@ya.ru', '$2y$10$JYrZe5Wmis2iHrnFylXKcOHLfckr/wrSwYaylYFANwz1DpzaBtaGi', 'Алексей', 'Бобриков', null, null, null, null, null, null, null, null, b'1', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 'astryakova.chr@ya.ru', '$2y$10$5b8jQc77aj2v/dKbEuUcd.yXw.LqXppZkDfqvT2tXVaf1Rgg/MIIW', 'Марина', 'Астрякова', null, null, null, null, null, null, null, null, b'0', '2021-02-27 12:13:58', '2021-02-27 12:13:58');

-- --------------------------------------------------------






--
-- Структура таблицы `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Отзывы о товарах';

--
-- Дамп данных таблицы `feedbacks`
--

INSERT INTO `feedbacks` (`id_user`, `id_product`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 6, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 7, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(1, 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 6, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 7, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 9, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2021-02-27 12:13:58', '2021-02-27 12:13:58');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Изображения товаров';

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `link`, `id_product`, `created_at`, `updated_at`) VALUES
(1, 'https://avatars.mds.yandex.net/get-mpic/1360852/img_id2508126924791923402.jpeg/orig', 1, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 'https://avatars.mds.yandex.net/get-mpic/1363071/img_id4618435699647098574.jpeg/orig', 1, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 'https://avatars.mds.yandex.net/get-mpic/932277/img_id8895455767670829773.jpeg/orig', 1, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(4, 'https://avatars.mds.yandex.net/get-mpic/1056698/img_id928265425244961193.jpeg/orig', 1, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(5, 'https://avatars.mds.yandex.net/get-mpic/1644362/img_id7639771822857696854.png/orig', 2, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(6, 'https://avatars.mds.yandex.net/get-mpic/1644362/img_id3874083265819140661.jpeg/orig', 2, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(7, 'https://avatars.mds.yandex.net/get-mpic/1862611/img_id3875664305237307428.jpeg/orig', 2, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(8, 'https://avatars.mds.yandex.net/get-mpic/1525215/img_id2134311285036447010.jpeg/orig', 2, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(9, 'https://avatars.mds.yandex.net/get-mpic/1901647/img_id6102094781164549117.jpeg/orig', 3, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(10, 'https://avatars.mds.yandex.net/get-mpic/1767083/img_id2551798935058468322.jpeg/orig', 3, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(11, 'https://avatars.mds.yandex.net/get-mpic/1707869/img_id3182441690383315907.jpeg/orig', 3, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(12, 'https://avatars.mds.yandex.net/get-mpic/1924580/img_id6208666797214031108.jpeg/orig', 3, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(13, 'https://avatars.mds.yandex.net/get-mpic/1859063/img_id7318842660252674730.jpeg/orig', 4, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(14, 'https://avatars.mds.yandex.net/get-mpic/1860966/img_id573911146118293618.png/orig', 4, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(15, 'https://avatars.mds.yandex.net/get-mpic/1888674/img_id902705695145552678.jpeg/orig', 4, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(16, 'https://avatars.mds.yandex.net/get-mpic/1525999/img_id4800216579421406330.jpeg/orig', 4, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(17, 'https://avatars.mds.yandex.net/get-mpic/1602935/img_id2703560629284691572.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(18, 'https://avatars.mds.yandex.net/get-mpic/1626700/img_id3955340713105595325.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(19, 'https://avatars.mds.yandex.net/get-mpic/1680954/img_id9022509729845770990.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(20, 'https://avatars.mds.yandex.net/get-mpic/1614201/img_id678035074593505463.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(21, 'https://avatars.mds.yandex.net/get-mpic/1750207/img_id6196316363880704562.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(22, 'https://avatars.mds.yandex.net/get-mpic/1571888/img_id392541451731750298.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(23, 'https://avatars.mds.yandex.net/get-mpic/1602935/img_id4355780092450000253.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(24, 'https://avatars.mds.yandex.net/get-mpic/1680954/img_id5104251515953080652.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(25, 'https://avatars.mds.yandex.net/get-mpic/1526692/img_id3234332064997764140.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(26, 'https://avatars.mds.yandex.net/get-mpic/1571888/img_id7627887873820581882.jpeg/orig', 5, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(27, 'https://avatars.mds.yandex.net/get-marketpic/1889466/market_p_s7ewEbKuGoz0glAy2mfQ/orig', 6, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(28, 'https://avatars.mds.yandex.net/get-mpic/1673800/img_id4964892947089529380.jpeg/orig', 7, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(29, 'https://avatars.mds.yandex.net/get-mpic/1928572/img_id5596996292477658643.jpeg/orig', 8, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(30, 'https://avatars.mds.yandex.net/get-mpic/1600461/img_id8279945597083630939.png/orig', 8, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(31, 'https://avatars.mds.yandex.net/get-mpic/1860966/img_id4902835705429036766.png/orig', 8, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(32, 'https://avatars.mds.yandex.net/get-mpic/1568604/img_id2093558588649100865.png/orig', 8, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(33, 'https://avatars.mds.yandex.net/get-mpic/1912105/img_id8797165219946347638.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(34, 'https://avatars.mds.yandex.net/get-mpic/1592349/img_id3549506975302442589.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(35, 'https://avatars.mds.yandex.net/get-mpic/1886039/img_id4204168739547981246.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(36, 'https://avatars.mds.yandex.net/get-mpic/1591646/img_id1779011427587443357.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(37, 'https://avatars.mds.yandex.net/get-mpic/1680954/img_id2867390851530924787.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(38, 'https://avatars.mds.yandex.net/get-mpic/1912105/img_id5020027682169209072.jpeg/orig', 9, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(39, 'https://avatars.mds.yandex.net/get-mpic/1574389/img_id7221206224327369720.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(40, 'https://avatars.mds.yandex.net/get-mpic/2014136/img_id8113023170412147877.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(41, 'https://avatars.mds.yandex.net/get-mpic/1644362/img_id1237417284337445177.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(42, 'https://avatars.mds.yandex.net/get-mpic/1574389/img_id8669033687526147880.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(43, 'https://avatars.mds.yandex.net/get-mpic/1862701/img_id1146250919835510757.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(44, 'https://avatars.mds.yandex.net/get-mpic/1603927/img_id1280382501587481916.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(45, 'https://avatars.mds.yandex.net/get-mpic/1909520/img_id5122175376736201781.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(46, 'https://avatars.mds.yandex.net/get-mpic/1943683/img_id8578529576381264134.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(47, 'https://avatars.mds.yandex.net/get-mpic/1909520/img_id5259673942808462098.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(48, 'https://avatars.mds.yandex.net/get-mpic/1750349/img_id1831212060581582267.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(49, 'https://avatars.mds.yandex.net/get-mpic/1574389/img_id3968606725648835038.jpeg/orig', 10, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(50, 'https://avatars.mds.yandex.net/get-mpic/1767151/img_id376121241719262991.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(51, 'https://avatars.mds.yandex.net/get-mpic/1865723/img_id1174991054009578490.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(52, 'https://avatars.mds.yandex.net/get-mpic/1865652/img_id8765768265701742687.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(53, 'https://avatars.mds.yandex.net/get-mpic/1886039/img_id3011222253414400848.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(54, 'https://avatars.mds.yandex.net/get-mpic/1865543/img_id7165577844189977000.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(55, 'https://avatars.mds.yandex.net/get-mpic/1597983/img_id6267913866842491771.jpeg/orig', 11, '2021-02-27 12:13:58', '2021-02-27 12:13:58');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `status` set('Передан на обработку','Формируется к отправке','Подготовлен счет на оплату','Ждите звонка от оператора','Едет в пункт выдачи','Ожидаем поставку товара','Отменен','Готов к получению','Передан в отдел доставки','Передан курьеру','Передан в транспортную компанию','Нам не удалось с Вами связаться','Выполнен') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы пользователей';

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(4, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(5, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(6, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(7, 1, 'Ждите звонка от оператора', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(8, 2, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(9, 2, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(10, 2, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(11, 2, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(12, 2, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(13, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(14, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(15, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(16, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(17, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(18, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(19, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(20, 3, 'Отменен', '2021-02-27 12:13:58', '2021-02-27 12:13:58');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id_order` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товары в заказах';

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id_order`, `id_product`, `price`, `quantity`) VALUES
(1, 1, '49890.00', 1),
(7, 1, '47779.00', 2),
(2, 2, '52990.00', 5),
(8, 2, '47779.00', 1),
(15, 2, '47779.00', 5),
(4, 3, '47779.00', 4),
(11, 3, '47779.00', 5),
(18, 3, '47779.00', 4),
(1, 4, '47779.00', 2),
(7, 4, '47779.00', 3),
(3, 5, '47779.00', 1),
(9, 5, '47779.00', 2),
(15, 5, '47779.00', 1),
(5, 6, '47779.00', 5),
(12, 6, '47779.00', 1),
(19, 6, '47779.00', 5),
(2, 7, '108980.00', 3),
(8, 7, '47779.00', 4),
(14, 7, '47779.00', 3),
(4, 8, '47779.00', 2),
(10, 8, '47779.00', 3),
(16, 8, '47779.00', 2),
(6, 9, '47779.00', 1),
(13, 9, '47779.00', 2),
(20, 9, '43650.00', 1),
(2, 10, '49890.00', 4),
(8, 10, '47779.00', 5),
(14, 10, '47779.00', 4),
(4, 11, '47779.00', 3),
(11, 11, '47779.00', 4),
(17, 11, '47779.00', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id_user`,`id_product`),
  ADD KEY `feedbacks_product_user_idx` (`id_product`,`id_user`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `goods_price_idx` (`price`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `images_product_idx` (`id_product`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `orders_id_user_idx` (`id_user`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id_product`,`id_order`),
  ADD KEY `order_product_orders_fk` (`id_order`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `users_firstname_lastname_idx` (`firstname`(8),`lastname`(8)),
  ADD KEY `users_lastname_firstname_idx` (`lastname`(8),`firstname`(8));

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_goods_fk` FOREIGN KEY (`id_product`) REFERENCES `goods` (`id`),
  ADD CONSTRAINT `feedbacks_users_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_goods_fk` FOREIGN KEY (`id_product`) REFERENCES `goods` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_users_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_goods_fk` FOREIGN KEY (`id_product`) REFERENCES `goods` (`id`),
  ADD CONSTRAINT `order_product_orders_fk` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
