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
-- Structure de la table `api_orders`
--

DROP TABLE IF EXISTS `api_orders`;
CREATE TABLE IF NOT EXISTS `api_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_token` varchar(64) DEFAULT NULL,
  `buyer_id` int NOT NULL,
  `seller_id` int DEFAULT NULL,
  `amount_total` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `return_url` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_token` (`order_token`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `api_orders`
--

INSERT INTO `api_orders` (`id`, `order_token`, `buyer_id`, `seller_id`, `amount_total`, `description`, `status`, `return_url`, `created_at`) VALUES
(1, '1d8ce7d10805708ae021b236a9f2880d', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:14:03'),
(2, 'f165a7d5206a196288897b6a684fa2ff', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:22:10'),
(3, '6731639fe682a3c4ffe716cffe2aa30b', 0, 4, 100.00, 'Achat Test Local', 'pending', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:53:32'),
(4, 'ca28dc86c9ac48aee07700502212ed31', 113, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/simulateur_marchand/merci.php', '2026-04-09 17:54:19'),
(5, 'ac0e0f37b9cf83dd4e5ae8e1ef8b062a', 113, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/ecotechnologie/ecotechbank-api-fr/merci.php', '2026-04-09 18:15:45'),
(6, '5d293d2df5131bb2d6a21a9bfc4c5d3d', 112, 4, 100.00, 'Achat Test Local', 'success', 'http://localhost/ecotechnologie/ecotechbank-api-fr/merci.php', '2026-04-09 18:20:29');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
