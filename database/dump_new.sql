-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 24. 11:35
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
(1, 'admin', 9999, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(2, 'staff', 1234, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(3, 'restaurant', 2222, '2023-04-24 06:26:36', '2023-04-24 06:26:36');

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
(1, 'Húsleves gazdagon', 'Cérnametélt, sárgarépa, zeller, borsó, csirkehús', 1890, 'Leves', 'http://www.palffyetterem.hu/kepek/etlap/5/husleves-gazdagon.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(2, 'Fokhagymakrémleves', 'Fokhagyma, cipóban', 1490, 'Leves', 'https://fw.photos/SDHYN1pS4WoJVD5YPL3LerZ7aGc=/400x300/https%3A%2F%2Fwww.terciarestaurants.hu%2Fuploads%2Ffiles%2F1-61e3ec12a608d.png', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(3, 'Paradicsomleves', 'Paradicsomleves betűtésztával', 1590, 'Leves', 'https://kep.cdn.indexvas.hu/1/0/1578/15784/157848/15784873_991c065eb37bbb1365d1bc3b831a26e8_wm.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(4, 'Gulyásleves', 'Sertéshús, burgonya', 2090, 'Leves', 'https://cdn.hellovidek.hu/images/site/articles/lead/2020/01/1580294768-dsK50Aofj_md.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(5, 'Spagetti Carbonara', 'Carbonara olasz módra', 3290, 'Tészta', 'http://www.palffyetterem.hu/kepek/etlap/7/9/carbonara_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(6, 'Bolognai spagetti', 'Pariatur tempore praesentium.', 3190, 'Tészta', 'http://www.palffyetterem.hu/kepek/etlap/2/3/bolognai-spagetti_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(7, 'Fogasfilé roston remoulad mártással, petrezselymes burgonyával', 'Porro unde dolor ea.', 5190, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/7/fogasfile-roston-remouladmartassal-petrezselymes-burgonyaval_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(8, 'Lazacfilé roston, grillzöldségekkel', 'Laborum voluptatibus tenetur.', 5990, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/9/lazacfile-roston_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(9, 'Tintahal karikák rántva, friss salátaágyon', 'Sint sint culpa.', 4590, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/8/0/tintahalkarikak_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(10, 'Fekete tőkehal filé rántva, petrezselymes burgonyával', 'Similique quo autem omnis.', 5190, 'Hal', 'http://www.palffyetterem.hu/kepek/etlap/2/6/fekete-tokehal-file-rantva_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(11, 'Sokmagvas kéregben sült csirkemell filé jázmin rizzsel, pikáns szósszal', 'Tempore tempore a.', 4890, 'Szárnyas', 'http://www.palffyetterem.hu/kepek/etlap/3/2/sokmagvas-keregben-sult-csirkemell-file-grillzoldseges-rizzsel-pikans-szosszal_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(12, 'Pulyka Cordon bleu hasábbal', 'Excepturi necessitatibus.', 4090, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/3/6/pulyka-cordon-bleu_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(13, 'Cigánypecsenye steakburgonyával', 'Inventore quia ducimus.', 4190, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/8/1/ciganypecsenye_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(14, 'Szűzérmék baconkalodában, tejszínes zöldborsmártással, pesztós gnocchival', 'Suscipit iste consequatur.', 4990, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/3/9/szuzermek-kalodaban_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(15, 'Rántott sertéskaraj hasábburgonyával', 'Ut impedit ut nulla.', 3590, 'Sertés', 'http://www.palffyetterem.hu/kepek/etlap/4/0/rantott-serteskaraj_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(16, 'Marhapofa vörösboros mártással, szalvétagombóccal', 'Sit sunt sint aliquam.', 5590, 'Marha', 'http://www.palffyetterem.hu/kepek/etlap/5/1/szaftos-marhapofa-pennevel_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(17, 'Marhapörkölt házi tarhonyával', 'Aut pariatur sed tenetur.', 4490, 'Marha', 'http://www.palffyetterem.hu/kepek/etlap/5/5/marhaporkolt-tarhonyaval_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(18, 'Kemencés libamáj steakburgonyáva', 'Blanditiis fugiat deleniti.', 8990, 'Szárnyas', 'http://www.palffyetterem.hu/kepek/etlap/5/3/kemences-libamaj_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(19, 'Olasz Tiramisu', 'Qui voluptatum.', 1890, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/2/tiramisu_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(20, 'Somlói galuska idénygyümölcsökkel', 'Explicabo harum distinctio.', 1890, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/5/8/somloi-galuska-idenygyumolcsokkel_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(21, 'Palacsinta (lekváros, kakaós, nutellás)', 'Nisi dolores deserunt vero.', 1790, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/3/palacsinta_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(22, 'Házi túros rétes friss és bogyós gyümölccsel', 'Molestiae qui odio tempora consequatur.', 1790, 'Desszert', 'http://www.palffyetterem.hu/kepek/etlap/8/4/turos_retes_gyumolcs_580x427t2_ic.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(23, 'Párolt rizs', 'Facere incidunt quam.', 890, 'Köret', 'https://borralfozok.hu/wp-content/uploads/2021/03/Parolt-rizs-talban-scaled.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(24, 'Hasábburgonya', 'Quas tenetur.', 890, 'Köret', 'https://www.topreceptek.hu/upload/94044787_4b633bb8fa32f5_full.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(25, 'Grillezett zöldség', 'Architecto perspiciatis iusto.', 790, 'Köret', 'https://www.mindmegette.hu/images/334/Social/lead_Social_grillezett-zoldsegek-(1).jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(26, 'Szentkirályi ásványvíz (0,33l)', 'In aut.', 590, 'Ital', 'https://spiritdrink.hu/image/cache/catalog/products/211400-450x450w.png', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(27, 'Coca Cola', 'Quod atque expedita.', 790, 'Ital', 'https://c-pi.niceshops.com/upload/image/product/large/default/45793_bd4c1314.1024x1024.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(28, 'Fanta', 'Consequatur quia quaerat vel.', 790, 'Ital', 'https://turbopizza.hu/image/catalog/italok/fanta033.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(29, 'Staropramen sör', 'Debitis autem id optio.', 890, 'Ital', 'https://spiritdrink.hu/image/cache/catalog/products/111162-450x450h.png', '2023-03-30 02:44:49', '2023-03-30 02:44:49'),
(30, 'Villányi bor', 'Debitis animi soluta a.', 890, 'Ital', 'http://boutiquehungaricum.com/image/cache/data/product/p112_1-450x450.jpg', '2023-03-30 02:44:49', '2023-03-30 02:44:49');

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
(11, '2023_04_19_101756_create_services_table', 1);

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
(1, 'App\\Models\\User', 21, 'API TOKEN', '142af06e4965b49f8cf977d9d379157e07f37ce7b58cdc11b6a3647f497e3e31', '[\"admin\"]', NULL, NULL, '2023-04-24 07:15:56', '2023-04-24 07:15:56'),
(2, 'App\\Models\\User', 30, 'API TOKEN', 'a3cdd8ee1cff81d8e29604b5c69cc33370e545f95f5ad3b139de9d843f3bc1ca', '[\"guest\"]', NULL, NULL, '2023-04-24 07:29:09', '2023-04-24 07:29:09'),
(3, 'App\\Models\\User', 32, 'API TOKEN', '703a4adec1a3ada3581abb50e2826381761328c8803c8e0ebff15084ee0a5639', '[\"guest\"]', NULL, NULL, '2023-04-24 07:32:06', '2023-04-24 07:32:06');

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
(1, 14, 3, 3476, 'cooking', 3, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(2, 26, 7, 15443, 'waiting', 7, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(3, 15, 2, 22929, 'sent', 8, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(4, 21, 3, 13151, 'waiting', 4, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(5, 3, 7, 14374, 'sent', 4, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(6, 17, 8, 8269, 'sent', 2, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(7, 6, 1, 15144, 'sent', 7, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(8, 23, 1, 11514, 'waiting', 8, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(9, 6, 4, 6522, 'sent', 5, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(10, 3, 4, 1819, 'waiting', 4, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(11, 5, 6, 6563, 'sent', 3, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(12, 24, 2, 18750, 'waiting', 5, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(13, 3, 2, 5885, 'sent', 8, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(14, 3, 6, 10105, 'cooking', 2, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(15, 14, 4, 21766, 'waiting', 5, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(16, 29, 7, 8852, 'waiting', 8, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(17, 19, 6, 10117, 'confirmed', 3, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(18, 30, 7, 4389, 'out', 2, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(19, 30, 8, 4113, 'cooking', 7, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(20, 13, 3, 10166, 'sent', 3, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(21, 23, 8, 22138, 'out', 4, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(22, 9, 8, 7950, 'cooking', 5, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(23, 18, 2, 16602, 'out', 7, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(24, 24, 5, 6252, 'sent', 1, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(25, 13, 8, 3992, 'cooking', 7, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36');

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
(1, 1, 'Normal', 2, 32000, 'Két személyre szóló szoba, saját fürdővel, konyhával. A konyha és a hálószoba a folyópartra nyújt kilátást.', NULL, 'https://images.unsplash.com/photo-1631049307264-da0ec9d70304', '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(2, 2, 'Normal', 3, 45000, 'Három fő részére egy kiváló nyugodt, letisztult, csendes szoba saját konyhával fürdővel.', NULL, 'https://media.nomadicmatt.com/2021/hoteltips2.jpg', '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(3, 3, 'Normal', 2, 32000, 'Egy kisebb szoba franciaággyal vidéki stílusú dekorációval. A természetet szeretőknek ajánljuk.', NULL, 'https://www.rwlasvegas.com/wp-content/uploads/2022/05/crockfords-las-vegas-standard-deluxe-bedroom_1000x880.jpg', '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(4, 4, 'VIP', 2, 65000, 'Egy modern felszereltséggel, hatalmas hellyel rendelkező szoba. Egy franciaágy mellett két vendégágy is rendelkezésre áll.', NULL, 'https://www.italianbark.com/wp-content/uploads/2018/01/hotel-room-design-trends-italianbark-interior-design-blog.jpg', '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(5, 5, 'Penthouse', 6, 160000, 'Hotelunk luxusfelszereltésgű lakosztálya rendelkezik erkéllyel, minibárral, jakuzzival mindemellett a hotel összes szolgáltatása is igénybevehető.', NULL, 'https://img1.10bestmedia.com/Images/Photos/378649/Park-Hyatt-New-York-Manhattan-Sky-Suite-Master-Bedroom-low-res_54_990x660.jpg', '2023-04-24 06:26:36', '2023-04-24 06:26:36');

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
(1, 1, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(2, 0, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(3, 0, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(4, 0, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(5, 1, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(6, 1, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(7, 0, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(8, 0, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(9, 1, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(10, 1, '2023-04-24 06:26:36', '2023-04-24 06:26:36');

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
(1, 'beatae', 'nam', 'helicopter', 'barrett50@upton.biz', '+1-504-602-4897', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(2, 'voluptas', 'accusamus', 'female', 'renner.nikki@yahoo.com', '+1-757-890-8172', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(3, 'exercitationem', 'eveniet', 'female', 'alfreda.stamm@yahoo.com', '+1-469-483-4225', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(4, 'cum', 'accusantium', 'male', 'meredith08@leffler.info', '1-918-335-4269', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(5, 'neque', 'quis', 'helicopter', 'telly.wolf@zulauf.com', '+16418942648', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(6, 'consectetur', 'vero', 'deer', 'juana77@yahoo.com', '+1-845-504-4642', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(7, 'est', 'nihil', 'male', 'freda66@yahoo.com', '+1 (615) 482-5772', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(8, 'consequatur', 'et', 'helicopter', 'andrew80@rutherford.com', '1-540-302-7874', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(9, 'veniam', 'voluptas', 'helicopter', 'rschiller@hahn.com', '1-361-570-4057', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(10, 'atque', 'vitae', 'deer', 'ewelch@gmail.com', '704-662-1489', NULL, NULL, 'guest', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(11, 'dignissimos', 'et', 'helicopter', 'maryjane91@jerde.biz', '+19124228263', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(12, 'nostrum', 'ut', 'helicopter', 'brandi94@yahoo.com', '(440) 376-1727', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(13, 'ut', 'accusamus', 'male', 'francesca20@prohaska.com', '(443) 917-1441', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(14, 'temporibus', 'sed', 'female', 'ydubuque@yahoo.com', '+19306422912', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(15, 'consequuntur', 'eos', 'helicopter', 'nrutherford@cartwright.org', '+1.725.501.3147', NULL, NULL, 'guest', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(16, 'ut', 'deleniti', 'male', 'zachery89@hotmail.com', '1-706-548-2143', NULL, NULL, 'staff', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(17, 'vitae', 'quia', 'helicopter', 'jwisozk@gmail.com', '212-291-6412', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(18, 'et', 'eum', 'female', 'saige.armstrong@gmail.com', '364-569-6163', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(19, 'molestiae', 'aliquam', 'deer', 'dabshire@yundt.info', '+1.626.505.9252', NULL, NULL, 'guest', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(20, 'quae', 'ea', 'helicopter', 'lwalker@west.com', '+1 (229) 698-9232', NULL, NULL, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(21, 'Maresz', 'Maresz', 'deer', 'mareszadmin@maresz.com', '123', '$2y$12$tcG7ipwzqrKBEMcviTRxU.GnEQa//MtmVz4urye7pA4EeRxPgyUT2', 9999, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(22, 'admin', 'admin', 'generic discord admin', 'admin@admin.com', '124', '$2y$12$BW97lShA7qr43zuG/N7y5OduCjf2ramWZU4b.ycNTAHqkYqDqOTa.', 9999, 'admin', NULL, NULL, '2023-04-24 06:26:36', '2023-04-24 06:26:36'),
(23, 'staff', 'staff', 'male', 'staff@staff.com', '125', '$2y$12$qG6C1iQmjUT.iWMPok72JOixV/XRJRpEbo4zSW9ELSNMNVNHwTMHC', 1234, 'staff', NULL, NULL, '2023-04-24 06:26:37', '2023-04-24 06:26:37'),
(24, 'restaurant', 'restaurant', 'helicopter', 'restaurant@restaurant.com', '126', '$2y$12$AOLYTh.KealxgpQBb8MPju.5f4zPXcCncizmIUNfQRvsIGn2VGxTu', 2222, 'restaurant', NULL, NULL, '2023-04-24 06:26:37', '2023-04-24 06:26:37'),
(32, 'sdafd', 'jhfhd', 'male', 'kj@kj.com', '235', '$2y$12$0NTWsp7/LnZLH7yutRuSEutEGYQUIOVjM6n9/tuUG55SaLJmdg0p6', 0, 'guest', NULL, NULL, '2023-04-24 07:32:00', '2023-04-24 07:32:00');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
