-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 20. 11:38
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `okospanzio`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roles` varchar(20) NOT NULL,
  `code` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `roles`, `code`, `created_at`, `updated_at`) VALUES
(1, 'admin', 9999, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(2, 'staff', 1234, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(3, 'restaurant', 2222, '2023-04-14 05:39:21', '2023-04-14 05:39:21');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `logins`
--

CREATE TABLE `logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `pictureURL` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `price`, `type`, `pictureURL`, `created_at`, `updated_at`) VALUES
(1, 'Húsleves gazdagon', 'Cérnametélt, sárgarépa, zeller, borsó, csirkehús', 1890, 'Leves', 'http://www.palffyetterem.hu/kepek/etlap/5/husleves-gazdagon.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(2, 'Fokhagymakrémleves', 'Fokhagyma, cipóban', 1490, 'Leves', 'https://fw.photos/SDHYN1pS4WoJVD5YPL3LerZ7aGc=/400x300/https%3A%2F%2Fwww.terciarestaurants.hu%2Fuploads%2Ffiles%2F1-61e3ec12a608d.png', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(3, 'Paradicsomleves', 'Paradicsomleves betűtésztával', 1590, 'Leves', 'https://kep.cdn.indexvas.hu/1/0/1578/15784/157848/15784873_991c065eb37bbb1365d1bc3b831a26e8_wm.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(4, 'Gulyásleves', 'Sertéshús, burgonya', 2090, 'Leves', 'https://cdn.hellovidek.hu/images/site/articles/lead/2020/01/1580294768-dsK50Aofj_md.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(5, 'Spagetti Carbonara', 'Carbonara olasz módra', 3290, 'Tészta', 'http://www.palffyetterem.hu/kepek/etlap/7/9/carbonara_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(6, 'Bolognai spagetti', 'Pariatur tempore praesentium.', 3190, 'Tészta', 'http://www.palffyetterem.hu/kepek/etlap/2/3/bolognai-spagetti_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(7, 'Fogasfilé roston remoulad mártással, petrezselymes burgonyával', 'Porro unde dolor ea.', 5190, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/7/fogasfile-roston-remouladmartassal-petrezselymes-burgonyaval_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(8, 'Lazacfilé roston, grillzöldségekkel', 'Laborum voluptatibus tenetur.', 5990, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/9/lazacfile-roston_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(9, 'Tintahal karikák rántva, friss salátaágyon', 'Sint sint culpa.', 4590, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/8/0/tintahalkarikak_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(10, 'Fekete tőkehal filé rántva, petrezselymes burgonyával', 'Similique quo autem omnis.', 5190, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/6/fekete-tokehal-file-rantva_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(11, 'Sokmagvas kéregben sült csirkemell filé jázmin rizzsel, pikáns szósszal', 'Tempore tempore a.', 4890, 'Szárnyas', 'http://www.palffyetterem.hu/kepek/etlap/3/2/sokmagvas-keregben-sult-csirkemell-file-grillzoldseges-rizzsel-pikans-szosszal_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(12, 'Pulyka Cordon bleu hasábbal', 'Excepturi necessitatibus.', 4090, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/3/6/pulyka-cordon-bleu_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(13, 'Cigánypecsenye steakburgonyával', 'Inventore quia ducimus.', 4190, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/8/1/ciganypecsenye_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(14, 'Szűzérmék baconkalodában, tejszínes zöldborsmártással, pesztós gnocchival', 'Suscipit iste consequatur.', 4990, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/3/9/szuzermek-kalodaban_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(15, 'Rántott sertéskaraj hasábburgonyával', 'Ut impedit ut nulla.', 3590, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/4/0/rantott-serteskaraj_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(16, 'Marhapofa vörösboros mártással, szalvétagombóccal', 'Sit sunt sint aliquam.', 5590, 'Marha', 'http://www.palffyetterem.hu/kepek/etlap/5/1/szaftos-marhapofa-pennevel_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(17, 'Marhapörkölt házi tarhonyával', 'Aut pariatur sed tenetur.', 4490, 'Marha', 'http://www.palffyetterem.hu/kepek/etlap/5/5/marhaporkolt-tarhonyaval_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(18, 'Kemencés libamáj steakburgonyáva', 'Blanditiis fugiat deleniti.', 8990, 'Szárnyas', 'http://www.palffyetterem.hu/kepek/etlap/5/3/kemences-libamaj_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(19, 'Olasz Tiramisu', 'Qui voluptatum.', 1890, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/2/tiramisu_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(20, 'Somlói galuska idénygyümölcsökkel', 'Explicabo harum distinctio.', 1890, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/5/8/somloi-galuska-idenygyumolcsokkel_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(21, 'Palacsinta (lekváros, kakaós, nutellás)', 'Nisi dolores deserunt vero.', 1790, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/3/palacsinta_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(22, 'Házi túros rétes friss és bogyós gyümölccsel', 'Molestiae qui odio tempora consequatur.', 1790, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/4/turos_retes_gyumolcs_580x427t2_ic.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(23, 'Párolt rizs', 'Facere incidunt quam.', 890, 'Köret', 'https://borralfozok.hu/wp-content/uploads/2021/03/Parolt-rizs-talban-scaled.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(24, 'Hasábburgonya', 'Quas tenetur.', 890, 'Köret', 'https://www.topreceptek.hu/upload/94044787_4b633bb8fa32f5_full.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(25, 'Grillezett zöldség', 'Architecto perspiciatis iusto.', 790, 'Köret', 'https://www.mindmegette.hu/images/334/Social/lead_Social_grillezett-zoldsegek-(1).jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(26, 'Szentkirályi ásványvíz (0,33l)', 'In aut.', 590, 'Ital', 'https://spiritdrink.hu/image/cache/catalog/products/211400-450x450w.png', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(27, 'Coca Cola', 'Quod atque expedita.', 790, 'Ital', 'https://c-pi.niceshops.com/upload/image/product/large/default/45793_bd4c1314.1024x1024.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(28, 'Fanta', 'Consequatur quia quaerat vel.', 790, 'Ital', 'https://turbopizza.hu/image/catalog/italok/fanta033.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(29, 'Staropramen sör', 'Debitis autem id optio.', 890, 'Ital', 'https://spiritdrink.hu/image/cache/catalog/products/111162-450x450h.png', '2023-03-30 04:44:49', '2023-03-30 04:44:49'),
(30, 'Villányi bor', 'Debitis animi soluta a.', 890, 'Ital', 'http://boutiquehungaricum.com/image/cache/data/product/p112_1-450x450.jpg', '2023-03-30 04:44:49', '2023-03-30 04:44:49');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_02_07_132058_create_tasks_table', 1),
(3, '2023_02_17_100937_create_users_table', 1),
(4, '2023_02_21_130138_create_logins_table', 1),
(5, '2023_02_28_112341_create_rooms_table', 1),
(6, '2023_02_28_122846_create_menus_table', 1),
(7, '2023_02_28_124910_create_admin_codes_table', 1),
(8, '2023_03_02_083124_create_restaurant_orders_table', 1),
(9, '2023_03_03_091841_create_tables_table', 1),
(10, '2023_03_03_103925_create_reservations_table', 1),
(11, '2023_04_19_101756_create_services_table', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 25, 'API TOKEN', 'eebe8bc4d88d16ee9b6b5ce484574c7c960f85f5a93dca012e2261bbbdc8199e', '[\"guest\"]', NULL, NULL, '2023-04-14 05:41:22', '2023-04-14 05:41:22'),
(2, 'App\\Models\\User', 21, 'API TOKEN', '04600da6704619f183eae5dd8d695a76cd4b7e5822a9ecdda62909df143ed90e', '[\"admin\"]', NULL, NULL, '2023-04-14 05:43:39', '2023-04-14 05:43:39'),
(3, 'App\\Models\\User', 23, 'API TOKEN', 'da978bce89732ad78e3f15ea14a5bffbdf2c5f8bf362b3728155e043ecaaf937', '[\"staff\"]', NULL, NULL, '2023-04-14 05:44:03', '2023-04-14 05:44:03'),
(4, 'App\\Models\\User', 21, 'API TOKEN', 'b8a416756f23a01f07295b8208e870091b937ecb3d5081235734c8f6b757b446', '[\"admin\"]', NULL, NULL, '2023-04-14 05:44:48', '2023-04-14 05:44:48'),
(5, 'App\\Models\\User', 22, 'API TOKEN', '578d6d7adf90db20ad95c4bb834dc41b4c2d3c3339231e797250571f61d592f6', '[\"admin\"]', NULL, NULL, '2023-04-18 17:36:18', '2023-04-18 17:36:18'),
(6, 'App\\Models\\User', 21, 'API TOKEN', '1b67d92463530396bdf01be2cf84df96ef359438255c93a7557c457044d1115b', '[\"admin\"]', NULL, NULL, '2023-04-19 05:57:57', '2023-04-19 05:57:57'),
(7, 'App\\Models\\User', 21, 'API TOKEN', '63729b5209183d5ece1c8e66080010be8a0fde4b66bffc855584d4bfed23bcc5', '[\"admin\"]', NULL, NULL, '2023-04-20 06:50:53', '2023-04-20 06:50:53');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roomId` bigint(20) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `mainUserId` bigint(20) UNSIGNED NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`users`)),
  `balance` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `restaurant_orders`
--

CREATE TABLE `restaurant_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `foodId` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `actualPrice` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tableId` tinyint(4) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `restaurant_orders`
--

INSERT INTO `restaurant_orders` (`id`, `foodId`, `quantity`, `actualPrice`, `status`, `tableId`, `userId`, `created_at`, `updated_at`) VALUES
(1, 29, 7, 24993, 'waiting', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:45:02'),
(2, 6, 7, 12963, 'waiting', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(3, 12, 4, 5171, 'sent', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(4, 22, 8, 24366, 'out', 7, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(5, 28, 6, 7059, 'cooking', 4, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(6, 11, 3, 6251, 'out', 1, NULL, '2023-04-14 05:39:20', '2023-04-20 07:33:53'),
(7, 19, 3, 21130, 'cooking', 8, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(8, 14, 7, 13795, 'sent', 2, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(9, 20, 8, 13543, 'waiting', 2, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(10, 15, 5, 5259, 'waiting', 7, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(11, 11, 7, 12270, 'confirmed', 6, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(12, 5, 7, 2189, 'sent', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(13, 29, 7, 17225, 'confirmed', 7, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(14, 29, 6, 5876, 'out', 8, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(15, 27, 7, 15770, 'sent', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(16, 8, 7, 18598, 'out', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(17, 18, 4, 22829, 'waiting', 1, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(18, 27, 1, 1238, 'cooking', 6, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(19, 20, 7, 13781, 'sent', 3, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(20, 6, 1, 19160, 'confirmed', 3, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(21, 21, 5, 23877, 'cooking', 3, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(22, 13, 2, 19292, 'waiting', 3, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(23, 8, 3, 24338, 'waiting', 7, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(24, 3, 1, 3201, 'waiting', 2, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(25, 30, 3, 9603, 'cooking', 7, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` smallint(6) NOT NULL,
  `type` varchar(20) NOT NULL,
  `beds` tinyint(4) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `IMG` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `rooms`
--

INSERT INTO `rooms` (`id`, `number`, `type`, `beds`, `price`, `description`, `qrcode`, `IMG`, `created_at`, `updated_at`) VALUES
(1, 1, 'Normal', 2, 32000, 'Két személyre szóló szoba, saját fürdővel, konyhával. A konyha és a hálószoba a folyópartra nyújt kilátást.', NULL, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(2, 2, 'Normal', 3, 45000, 'Három fő részére egy kiváló nyugodt, letisztult, csendes szoba saját konyhával fürdővel. ', NULL, 'https://media.nomadicmatt.com/2021/hoteltips2.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(3, 3, 'Normal', 2, 32000, 'Egy kisebb szoba franciaággyal vidéki stílusú dekorációval. A természetet szeretőknek ajánljuk.', NULL, 'https://www.rwlasvegas.com/wp-content/uploads/2022/05/crockfords-las-vegas-standard-deluxe-bedroom_1000x880.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(4, 4, 'VIP', 4, 65000, 'Egy modern felszereltséggel, hatalmas hellyel rendelkező szoba. Egy franciaágy mellett két vendégágy is rendelkezésre áll.', NULL, 'https://www.italianbark.com/wp-content/uploads/2018/01/hotel-room-design-trends-italianbark-interior-design-blog.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(5, 5, 'Penthouse', 6, 160000, 'Hotelunk luxusfelszereltésgű lakosztálya rendelkezik erkéllyel, minibárral, jakuzzival mindemellett a hotel összes szolgáltatása is igénybevehető.', NULL, 'https://img1.10bestmedia.com/Images/Photos/378649/Park-Hyatt-New-York-Manhattan-Sky-Suite-Master-Bedroom-low-res_54_990x660.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 'Konditerem', 1500, NULL, NULL),
(3, 'Szauna', 1000, NULL, NULL),
(4, 'Uszoda', 1200, NULL, NULL),
(5, 'Thai masszázs (igen az)', 32767, NULL, NULL),
(6, 'Seggtörlés', 500, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tables`
--

CREATE TABLE `tables` (
  `tableId` bigint(20) UNSIGNED NOT NULL,
  `isOccupied` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `tables`
--

INSERT INTO `tables` (`tableId`, `isOccupied`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(2, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(3, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(4, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(5, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(6, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(7, 1, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(8, 1, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(9, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(10, 0, '2023-04-14 05:39:21', '2023-04-14 05:39:21');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `code` smallint(6) DEFAULT NULL,
  `roles` varchar(20) NOT NULL,
  `nfc` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `gender`, `email`, `phone`, `password`, `code`, `roles`, `nfc`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ut', 'eius', 'deer', 'koss.julianne@bernhard.com', '(931) 535-6207', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(2, 'nisi', 'exercitationem', 'deer', 'maia13@hotmail.com', '570-390-4094', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(3, 'quo', 'illum', 'deer', 'hlegros@gmail.com', '585.707.2307', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(4, 'nostrum', 'molestiae', 'deer', 'mabel.nienow@hotmail.com', '+16206341739', NULL, NULL, 'guest', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(5, 'magnam', 'est', 'helicopter', 'mayert.ezekiel@wiegand.com', '956-828-1764', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(6, 'accusamus', 'esse', 'helicopter', 'pagac.nya@hyatt.com', '252.516.3868', NULL, NULL, 'guest', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(7, 'fuga', 'quibusdam', 'male', 'ahmed.jacobs@hotmail.com', '+1-434-390-6582', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(8, 'dolorem', 'nisi', 'helicopter', 'oleta.macejkovic@paucek.com', '847-775-6223', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(9, 'nam', 'sed', 'female', 'zachery.wintheiser@yahoo.com', '682.583.1881', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(10, 'impedit', 'similique', 'deer', 'hayley80@stanton.org', '+1-774-990-5123', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(11, 'voluptates', 'vero', 'helicopter', 'fletcher.herman@veum.com', '986-473-2570', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(12, 'modi', 'est', 'deer', 'santina.cartwright@huel.com', '1-575-700-9233', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(13, 'doloremque', 'atque', 'deer', 'dovie20@wunsch.com', '1-678-726-1009', NULL, NULL, 'guest', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(14, 'quia', 'delectus', 'deer', 'stroman.darron@waelchi.com', '+1.573.621.9372', NULL, NULL, 'guest', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(15, 'sunt', 'enim', 'deer', 'douglas.nickolas@yahoo.com', '+1-803-914-6080', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(16, 'iusto', 'vero', 'deer', 'tyler.purdy@huels.com', '925.572.5007', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(17, 'dolores', 'eum', 'male', 'asha22@wuckert.com', '+1-651-670-8229', NULL, NULL, 'staff', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(18, 'sunt', 'a', 'male', 'troy.deckow@hotmail.com', '+1 (786) 368-6856', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(19, 'provident', 'id', 'female', 'willis03@walter.com', '(930) 293-8609', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(20, 'aperiam', 'eum', 'helicopter', 'mckenna.sporer@rath.com', '+16122188543', NULL, NULL, 'admin', NULL, NULL, '2023-04-14 05:39:20', '2023-04-14 05:39:20'),
(21, 'Maresz', 'Maresz', 'deer', 'mareszadmin@maresz.com', '123', '$argon2i$v=19$m=65536,t=4,p=1$S1Q0VlpJQ3k2VEhCc21CLw$7VtdDJrdSmiGIJaRQVhXgGo5dd3qG+ixrVGtBgDPfXA', 9999, 'admin', NULL, NULL, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(22, 'admin', 'admin', 'generic discord admin', 'admin@admin.com', '124', '$argon2i$v=19$m=65536,t=4,p=1$bWt1SVdUa0tDLi9lV2NsbQ$1/LqN75Nv0JZii3i+IIqHQj1JSFjFRMe9Y/mzwM90o0', 9999, 'admin', NULL, NULL, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(23, 'staff', 'staff', 'male', 'staff@staff.com', '125', '$argon2i$v=19$m=65536,t=4,p=1$WFh2TTdKNlJEN1JUU3VaSw$SJfIkuYK5I/m3V+nqRBqmiJQNswqgky3YED/r9TepiQ', 1234, 'staff', NULL, NULL, '2023-04-14 05:39:21', '2023-04-14 05:39:21'),
(24, 'restaurant', 'restaurant', 'helicopter', 'restaurant@restaurant.com', '126', '$argon2i$v=19$m=65536,t=4,p=1$VXV4UzVEamdNMFFNLktscw$gQoeoSrZcc69Rs0T5csaDQ18nOPLAWyJsFBxPS2ZbWQ', 2222, 'restaurant', NULL, NULL, '2023-04-14 05:39:21', '2023-04-14 05:39:21');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logins_userid_foreign` (`userId`);

--
-- A tábla indexei `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_roomid_foreign` (`roomId`),
  ADD KEY `reservations_mainuserid_foreign` (`mainUserId`);

--
-- A tábla indexei `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_orders_foodid_foreign` (`foodId`);

--
-- A tábla indexei `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`tableId`);

--
-- A tábla indexei `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `logins`
--
ALTER TABLE `logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `tables`
--
ALTER TABLE `tables`
  MODIFY `tableId` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `logins_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_mainuserid_foreign` FOREIGN KEY (`mainUserId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_roomid_foreign` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`id`);

--
-- Megkötések a táblához `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD CONSTRAINT `restaurant_orders_foodid_foreign` FOREIGN KEY (`foodId`) REFERENCES `menus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
