-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 11 avr. 2026 à 20:54
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecotech_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `banktransactions`
--

DROP TABLE IF EXISTS `banktransactions`;
CREATE TABLE IF NOT EXISTS `banktransactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_transaction` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `banktransactions`
--

INSERT INTO `banktransactions` (`id`, `id_client`, `description`, `montant`, `date_transaction`) VALUES
(1, 32, 'Achat EcoTechShop', -306.00, '2026-02-15 19:04:30'),
(2, 32, 'Achat EcoTechShop', -306.00, '2026-02-16 08:57:45'),
(3, 51, 'Achat EcoTechShop', -1049.00, '2026-02-18 20:57:58'),
(4, 68, 'Achat EcoTechShop', -899.00, '2026-03-14 13:32:59'),
(5, 68, 'Achat EcoTechShop', -1846.00, '2026-03-14 16:25:06'),
(6, 68, 'Achat EcoTechShop', -2312.70, '2026-03-14 16:30:35'),
(7, 68, 'Achat EcoTechShop', -2312.70, '2026-03-14 18:13:33'),
(8, 68, 'Achat EcoTechShop', -874.30, '2026-03-14 18:16:31'),
(9, 70, 'Achat EcoTechShop', -719.20, '2026-03-14 18:19:59'),
(10, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:29:34'),
(11, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:31:58'),
(12, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:34:01'),
(13, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.20, '2026-03-14 18:35:57'),
(14, 71, 'Achat EcoTechShop (Auto-vérifié)', -857.40, '2026-03-14 20:18:40'),
(15, 71, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-14 20:19:50'),
(16, 70, 'Achat EcoTechShop (Auto-vérifié)', -719.10, '2026-03-15 11:09:46'),
(17, 68, 'Achat EcoTechShop (Auto-vérifié)', -321.40, '2026-03-17 13:25:45'),
(18, 68, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-17 16:14:28'),
(19, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 19:57:54'),
(20, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:01:07'),
(21, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:08:47'),
(22, 87, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:14:53'),
(23, 88, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:17:31'),
(24, 88, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 20:23:35'),
(25, 89, 'Achat EcoTechShop (Auto-vérifié)', -1393.50, '2026-03-18 21:47:38'),
(26, 89, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:11:38'),
(27, 89, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-18 22:14:06'),
(28, 89, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:24:22'),
(29, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:34:01'),
(30, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:36:33'),
(31, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:56:46'),
(32, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 22:59:32'),
(33, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:04:51'),
(34, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:10:49'),
(35, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:15:10'),
(36, 90, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-18 23:23:30'),
(37, 90, 'Achat EcoTechShop (Auto-vérifié)', -2489.90, '2026-03-18 23:41:21'),
(38, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 12:22:22'),
(39, 91, 'Achat EcoTechShop (Auto-vérifié)', -1465.75, '2026-03-19 12:24:46'),
(40, 91, 'Achat EcoTechShop (Auto-vérifié)', -1198.60, '2026-03-19 12:26:22'),
(41, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 13:27:51'),
(42, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 13:58:42'),
(43, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:04:24'),
(44, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:05:01'),
(45, 91, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-19 14:09:51'),
(46, 91, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 14:10:32'),
(47, 92, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 16:22:40'),
(48, 92, 'Achat EcoTechShop (Auto-vérifié)', -1445.85, '2026-03-19 16:24:36'),
(49, 92, 'Achat EcoTechShop (Auto-vérifié)', -1445.85, '2026-03-19 16:33:17'),
(50, 92, 'Achat EcoTechShop (Auto-vérifié)', -1884.70, '2026-03-19 16:40:27'),
(51, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:15:10'),
(52, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:18:13'),
(53, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:20:01'),
(54, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:21:54'),
(55, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-19 19:26:06'),
(56, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-19 19:37:36'),
(57, 90, 'Achat EcoTechShop (Auto-vérifié)', -135.00, '2026-03-19 22:16:37'),
(58, 93, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-20 17:45:18'),
(59, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-20 18:28:14'),
(60, 94, 'Achat EcoTechShop (Auto-vérifié)', -696.75, '2026-03-21 08:01:00'),
(61, 90, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 20:24:23'),
(62, 90, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 20:41:54'),
(63, 90, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 20:42:39'),
(64, 90, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 20:45:31'),
(65, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 21:00:59'),
(66, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-21 21:23:36'),
(67, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-21 21:46:33'),
(68, 92, 'Achat EcoTechShop (Auto-vérifié)', -74.90, '2026-03-22 14:00:30'),
(69, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-22 16:38:30'),
(70, 93, 'Achat EcoTechShop (Auto-vérifié)', -45.00, '2026-03-22 16:51:11'),
(71, 93, 'Achat EcoTechShop (Auto-vérifié)', -74.90, '2026-03-22 16:53:42'),
(72, 93, 'Achat EcoTechShop (Auto-vérifié)', -59.80, '2026-03-22 17:01:32'),
(73, 53, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-23 13:59:19'),
(74, 93, 'Achat EcoTechShop (Auto-vérifié)', -29.90, '2026-03-23 22:32:46'),
(75, 93, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 22:55:02'),
(76, 93, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 22:56:26'),
(77, 95, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 23:19:35'),
(78, 95, 'Achat EcoTechShop Multicatégorie', -49.80, '2026-03-23 23:25:46'),
(79, 95, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-23 23:30:25'),
(80, 95, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-23 23:39:22'),
(81, 95, 'Achat EcoTechShop Multicatégorie', -90.00, '2026-03-23 23:41:16'),
(82, 97, 'Achat EcoTechShop Multicatégorie', -1262.55, '2026-03-25 13:31:12'),
(83, 99, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 18:58:45'),
(84, 99, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 19:05:00'),
(85, 101, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-03-26 19:08:21'),
(86, 94, 'Achat EcoTechShop Multicatégorie', -902.00, '2026-03-26 23:07:32'),
(87, 99, 'Achat EcoTechShop Multicatégorie', -269.10, '2026-03-29 15:01:50'),
(88, 99, 'Achat EcoTechShop Multicatégorie', -135.00, '2026-03-29 15:02:48'),
(89, 98, 'Achat EcoTechShop Multicatégorie', -781.35, '2026-03-30 21:17:56'),
(90, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:19:25'),
(91, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:21:56'),
(92, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:24:12'),
(93, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:26:01'),
(94, 98, 'Achat EcoTechShop Multicatégorie', -696.75, '2026-03-30 21:29:45'),
(95, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:30:10'),
(96, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:48:46'),
(97, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:51:27'),
(98, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:55:11'),
(99, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 21:57:43'),
(100, 98, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:14:11'),
(101, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:19:34'),
(102, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:22:55'),
(103, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:25:41'),
(104, 103, 'Achat EcoTechShop Multicatégorie', -719.20, '2026-03-30 22:26:26'),
(105, 103, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:29:17'),
(106, 103, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:38:59'),
(107, 94, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:53:39'),
(108, 98, 'Achat EcoTechShop Multicatégorie', -45.00, '2026-03-30 22:58:40'),
(109, 97, 'Achat EcoTechShop Multicatégorie', -2039.15, '2026-03-31 09:22:33'),
(110, 105, 'Achat EcoTechShop Multicatégorie', -90.00, '2026-03-31 16:34:05'),
(111, 112, 'Achat EcoTechShop Multicatégorie', -29.90, '2026-04-09 17:34:01'),
(112, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:09:43'),
(113, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:13:18'),
(114, 113, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:16:41'),
(115, 112, 'Paiement externe : Achat Test Local', -100.00, '2026-04-09 20:21:15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
