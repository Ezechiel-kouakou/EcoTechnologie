-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 12 avr. 2026 à 11:57
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
-- Structure de la table `ecotech_feedbacks`
--

DROP TABLE IF EXISTS `ecotech_feedbacks`;
CREATE TABLE IF NOT EXISTS `ecotech_feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ecotech_feedbacks`
--

INSERT INTO `ecotech_feedbacks` (`id`, `user_id`, `rating`, `created_at`) VALUES
(1, 0, 3, '2026-03-21 19:27:46'),
(2, 0, 3, '2026-03-21 19:42:08'),
(3, 0, 1, '2026-03-21 19:43:13'),
(4, 0, 3, '2026-03-21 20:00:03'),
(5, 0, 5, '2026-03-21 20:01:18'),
(6, 0, 5, '2026-03-21 20:24:07'),
(7, 0, 4, '2026-03-21 20:46:44'),
(8, 0, 4, '2026-03-22 13:00:50'),
(9, 0, 4, '2026-03-22 15:38:45'),
(10, 0, 4, '2026-03-22 15:38:46'),
(11, 0, 5, '2026-03-22 15:51:39'),
(12, 0, 5, '2026-03-22 15:54:18'),
(13, 0, 5, '2026-03-23 12:59:56'),
(14, 0, 1, '2026-03-23 21:33:02'),
(15, 0, 1, '2026-03-23 21:57:14'),
(16, 0, 1, '2026-03-23 22:19:50'),
(17, 0, 1, '2026-03-23 22:25:57'),
(18, 0, 2, '2026-03-23 22:41:28'),
(19, 0, 5, '2026-03-25 12:31:28'),
(20, 0, 1, '2026-03-26 17:59:14'),
(21, 0, 1, '2026-03-26 18:08:36'),
(22, 0, 1, '2026-03-26 18:08:58'),
(23, 0, 5, '2026-03-26 22:07:45'),
(24, 0, 5, '2026-03-29 13:02:03'),
(25, 0, 1, '2026-03-29 13:03:06'),
(26, 0, 1, '2026-03-30 19:24:23'),
(27, 0, 4, '2026-03-30 19:26:10'),
(28, 0, 5, '2026-03-30 19:29:54'),
(29, 0, 5, '2026-03-30 19:30:20'),
(30, 0, 5, '2026-03-30 19:57:54'),
(31, 103, 5, '2026-03-30 20:48:15'),
(32, 94, 1, '2026-03-30 20:53:49'),
(33, 98, 3, '2026-03-30 20:58:53'),
(34, 97, 5, '2026-03-31 07:22:55'),
(35, 105, 5, '2026-03-31 14:34:50'),
(36, 112, 4, '2026-04-09 15:34:20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
