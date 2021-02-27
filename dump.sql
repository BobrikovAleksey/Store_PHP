-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3366
-- Время создания: Фев 27 2021 г., 12:15
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

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
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товары';

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `title`, `description`, `image`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Apple iPhone Xr 128gb', 'Смартфон Apple iPhone Xr 128GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 1, 50360, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 'Apple iPhone 11 128gb', 'Смартфон Apple iPhone 11 128GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 5, 54900, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 'Apple iPphone 11 Pro Max 256gb', 'Смартфон Apple iPhone 11 Pro Max 256GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 9, 93800, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(4, 'Apple iPhone 12 128GB', 'Смартфон Apple iPhone 12 128GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 13, 84990, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(5, 'Huawei P30 Pro 8/256gb', 'Смартфон HUAWEI P30 Pro 8/256GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 17, 49990, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(6, 'HUAWEI P40 Pro 8/256gb', 'Смартфон HUAWEI P40 Pro 8 ГБ + 256 ГБ Насыщенный синий', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 27, 64990, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(7, 'OnePlus 7T Pro 8/256gb', 'Смартфон OnePlus 7T Pro 8/256GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 28, 48950, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(8, 'OnePlus 8 8/128gb', 'Смартфон OnePlus 8 8/128GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 29, 41480, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(9, 'Samsung Galaxy A71 6/128gb', 'Смартфон Samsung Galaxy A71 6/128GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 33, 22700, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(10, 'Samsung Galaxy Note 10+ 12/256gb', 'Смартфон Samsung Galaxy Note 10+ 12/256GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 39, 63490, '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(11, 'Samsung Galaxy S20 Ultra 5G 12/256gb', 'Смартфон Samsung Galaxy S20 Ultra 5G 12/256GB', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium', 50, 80990, '2021-02-27 12:13:58', '2021-02-27 12:13:58');

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

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` bit(1) DEFAULT b'0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `password`, `email`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Анатолий', 'Андреев', '$2y$10$Q3nbTrKBLB/IoCm4b4E7UeYzNV1zEnsjHWz2.m9cWx/edVCaPfoEu', 'andreev.msk@ya.ru', b'0', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(2, 'Алексей', 'Бобриков', '$2y$10$JYrZe5Wmis2iHrnFylXKcOHLfckr/wrSwYaylYFANwz1DpzaBtaGi', 'bobrikov.spb@ya.ru', b'1', '2021-02-27 12:13:58', '2021-02-27 12:13:58'),
(3, 'Марина', 'Астрякова', '$2y$10$fn6Ogh8J638WSlUPtSixLekLkfN7X0zOjXZFK2WXr/BJB1RSaGB7i', 'astryakova.chr@ya.ru', b'0', '2021-02-27 12:13:58', '2021-02-27 12:13:58');

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
