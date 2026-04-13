-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 avr. 2026 à 12:19
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
-- Structure de la table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
CREATE TABLE IF NOT EXISTS `merchants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(100) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `commission_rate` decimal(4,2) DEFAULT '0.05',
  `total_revenue` decimal(15,2) DEFAULT '0.00',
  `total_commissions` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `merchants`
--

INSERT INTO `merchants` (`id`, `owner_name`, `site_name`, `api_key`, `created_at`, `email`, `password`, `commission_rate`, `total_revenue`, `total_commissions`) VALUES
(1, 'ezechiel', 'ezechshop', '7260ae0826972ee2f09915e00eda52ad', '2026-04-08 20:36:11', 'ezechshop@gmail.com', '', 0.05, 0.00, 0.00),
(3, 'eze', 'ezechielshop', 'ad01b95e5cacb2c016ee47e071831ae5', '2026-04-09 15:13:06', 'user8@gmail.com', '$2y$10$uNTPL28momS0LwUdTOGse.ztyuVTlXkP0M..KjuzCp1ESuF4PNY/q', 0.05, 0.00, 0.00),
(4, 'Ezechiel', 'Ecotech-filiale', '9d4b4e36e28bdac67139ff98d097bc78', '2026-04-09 15:55:39', 'user5@gmail.com', '$2y$10$1Zh7poyl0Zipo/pHycirK.ThWC6R0WpSOh0jMAOK7d9m3WwyL8EJq', 0.05, 0.00, 0.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
