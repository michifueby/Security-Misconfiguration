-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 27. Mai 2023 um 12:51
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `versex-home-automation-db`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_Actor`
--

CREATE TABLE `TBL_Actor` (
  `ActorId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_Actor`
--

INSERT INTO `TBL_Actor` (`ActorId`, `UserId`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_Device`
--

CREATE TABLE `TBL_Device` (
  `DeviceId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_Device`
--

INSERT INTO `TBL_Device` (`DeviceId`, `Name`, `State`, `Value`) VALUES
(1, 'Light Living Room', 1, 60),
(2, 'AC', 1, 25),
(3, 'Heater', 1, 23),
(4, 'Water Heater', 0, 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_Log`
--

CREATE TABLE `TBL_Log` (
  `LogId` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_Log`
--

INSERT INTO `TBL_Log` (`LogId`, `TimeStamp`, `Message`) VALUES
(1, '2023-05-17 08:33:17', 'The user Test User has successfully logged in with the password!'),
(2, '2023-05-17 08:33:18', 'Generate successfully the JWT token for userid 1!'),
(3, '2023-05-17 09:47:00', 'The user Test User has successfully logged in with the password!'),
(4, '2023-05-17 09:47:00', 'Generate successfully the JWT token for userid 1!'),
(5, '2023-05-17 09:53:31', 'The user Test User has successfully logged in with the password!'),
(6, '2023-05-17 09:53:31', 'Generate successfully the JWT token for userid 1!'),
(7, '2023-05-17 09:54:34', 'Get all users from the database!'),
(8, '2023-05-17 09:54:51', 'Get all users from the database!'),
(9, '2023-05-17 09:55:11', 'Get all users from the database!'),
(10, '2023-05-17 09:55:35', 'Get all users from the database!'),
(11, '2023-05-17 09:55:42', 'Get all users from the database!'),
(12, '2023-05-17 10:00:33', 'Get all users from the database!'),
(13, '2023-05-17 10:01:32', 'Get all users from the database!'),
(14, '2023-05-17 10:02:12', 'Get all users from the database!'),
(15, '2023-05-17 10:02:41', 'Get all users from the database!'),
(16, '2023-05-17 10:03:04', 'Get all users from the database!'),
(17, '2023-05-17 10:03:10', 'Get all users from the database!'),
(18, '2023-05-17 10:03:24', 'Get all users from the database!'),
(19, '2023-05-17 10:03:32', 'Get all users from the database!'),
(20, '2023-05-17 10:03:40', 'Get all users from the database!'),
(21, '2023-05-17 10:03:54', 'Get all users from the database!'),
(22, '2023-05-17 10:04:08', 'Get all users from the database!'),
(23, '2023-05-17 10:04:16', 'Get all users from the database!'),
(24, '2023-05-17 10:05:17', 'Get all users from the database!'),
(25, '2023-05-17 10:05:45', 'Get all users from the database!'),
(26, '2023-05-17 10:05:48', 'Get all users from the database!'),
(27, '2023-05-17 10:06:20', 'Get all users from the database!'),
(28, '2023-05-17 10:06:25', 'Get all users from the database!'),
(29, '2023-05-17 10:06:31', 'Get all users from the database!'),
(30, '2023-05-17 10:06:52', 'Get all users from the database!'),
(31, '2023-05-17 10:06:59', 'Get all users from the database!'),
(32, '2023-05-17 10:07:46', 'Get all users from the database!'),
(33, '2023-05-17 10:08:04', 'Get all users from the database!'),
(34, '2023-05-17 10:08:09', 'Get all users from the database!'),
(35, '2023-05-17 10:08:12', 'Get all users from the database!'),
(36, '2023-05-17 10:08:39', 'Get all users from the database!'),
(37, '2023-05-17 10:08:41', 'Get all users from the database!'),
(38, '2023-05-17 10:08:47', 'Get all users from the database!'),
(39, '2023-05-17 10:09:38', 'Get all users from the database!'),
(40, '2023-05-17 10:09:49', 'Get all users from the database!'),
(41, '2023-05-17 10:10:25', 'Get all users from the database!'),
(42, '2023-05-17 10:10:55', 'Get all users from the database!'),
(43, '2023-05-17 10:11:19', 'Get all users from the database!'),
(44, '2023-05-17 10:12:20', 'Get all users from the database!'),
(45, '2023-05-17 10:12:21', 'Get all users from the database!'),
(46, '2023-05-17 10:13:08', 'Get all users from the database!'),
(47, '2023-05-17 10:13:41', 'Get all users from the database!'),
(48, '2023-05-17 10:14:20', 'Get all users from the database!'),
(49, '2023-05-17 10:15:13', 'Get all users from the database!'),
(50, '2023-05-17 10:15:48', 'Get all users from the database!'),
(51, '2023-05-17 10:16:11', 'Get all users from the database!'),
(52, '2023-05-17 10:16:16', 'Get all users from the database!'),
(53, '2023-05-17 10:17:03', 'Get all users from the database!'),
(54, '2023-05-17 10:17:04', 'Get all users from the database!'),
(55, '2023-05-17 10:17:31', 'Get all users from the database!'),
(56, '2023-05-17 10:59:44', 'Get all users from the database!'),
(57, '2023-05-17 11:13:19', 'Get all users from the database!'),
(58, '2023-05-17 11:19:17', 'Get all users from the database!'),
(59, '2023-05-17 12:31:32', 'Get all users from the database!'),
(60, '2023-05-17 12:31:43', 'Get all users from the database!'),
(61, '2023-05-17 12:32:01', 'Get all users from the database!'),
(62, '2023-05-17 12:32:53', 'The user Test User has successfully logged in with the password!'),
(63, '2023-05-17 12:32:53', 'Generate successfully the JWT token for userid 1!'),
(64, '2023-05-17 12:33:36', 'Get all users from the database!'),
(65, '2023-05-17 13:04:23', 'The user Test User has successfully logged in with the password!'),
(66, '2023-05-17 13:04:27', 'Generate successfully the JWT token for userid 1!'),
(67, '2023-05-17 13:07:03', 'The user Test User has successfully logged in with the password!'),
(68, '2023-05-17 13:07:03', 'The user Test User has successfully logged in with the password!'),
(69, '2023-05-17 13:07:03', 'The user Test User has successfully logged in with the password!'),
(70, '2023-05-17 13:07:03', 'Generate successfully the JWT token for userid 1!'),
(71, '2023-05-17 13:07:03', 'Generate successfully the JWT token for userid 1!'),
(72, '2023-05-17 13:07:03', 'Generate successfully the JWT token for userid 1!'),
(73, '2023-05-17 13:08:46', 'The user Test User has successfully logged in with the password!'),
(74, '2023-05-17 13:08:46', 'Generate successfully the JWT token for userid 1!'),
(75, '2023-05-17 13:10:00', 'Get all users from the database!'),
(76, '2023-05-17 13:10:02', 'Get all users from the database!'),
(77, '2023-05-17 13:11:04', 'Get all users from the database!'),
(78, '2023-05-17 13:12:09', 'The user Test User has successfully logged in with the password!'),
(79, '2023-05-17 13:12:09', 'Generate successfully the JWT token for userid 1!'),
(80, '2023-05-17 13:12:21', 'Get all users from the database!'),
(81, '2023-05-17 13:14:20', 'Get all users from the database!'),
(82, '2023-05-17 13:14:52', 'Get all users from the database!'),
(83, '2023-05-17 13:15:06', 'Get all users from the database!'),
(84, '2023-05-17 13:17:13', 'The user Test User has successfully logged in with the password!'),
(85, '2023-05-17 13:17:13', 'Generate successfully the JWT token for userid 1!'),
(86, '2023-05-17 13:19:00', 'Get all users from the database!'),
(87, '2023-05-17 13:19:35', 'Get all users from the database!'),
(88, '2023-05-17 13:19:46', 'Get all users from the database!'),
(89, '2023-05-17 13:21:43', 'The user Test User has successfully logged in with the password!'),
(90, '2023-05-17 13:21:43', 'Generate successfully the JWT token for userid 1!'),
(91, '2023-05-17 13:21:45', 'Get all users from the database!'),
(92, '2023-05-17 13:23:22', 'Create a new user dfgdfg dfgdfg and saves the user in the database!'),
(93, '2023-05-17 13:23:26', 'Get all users from the database!'),
(94, '2023-05-17 13:24:49', 'Get all users from the database!'),
(95, '2023-05-17 13:25:18', 'Create a new user Max Mustermann and saves the user in the database!'),
(96, '2023-05-17 13:25:18', 'Get all users from the database!'),
(97, '2023-05-17 13:26:35', 'The user Max Mustermann has successfully logged in with the password!'),
(98, '2023-05-17 13:26:35', 'Generate successfully the JWT token for userid 10!'),
(99, '2023-05-17 13:26:41', 'Get all users from the database!'),
(100, '2023-05-17 13:38:16', 'The user Max Mustermann has successfully logged in with the password!'),
(101, '2023-05-17 13:38:16', 'Generate successfully the JWT token for userid 10!'),
(102, '2023-05-17 13:48:49', 'The user Max Mustermann has successfully logged in with the password!'),
(103, '2023-05-17 13:48:49', 'Generate successfully the JWT token for userid 10!'),
(104, '2023-05-17 13:55:09', 'The user Test User has successfully logged in with the password!'),
(105, '2023-05-17 13:55:09', 'Generate successfully the JWT token for userid 1!'),
(106, '2023-05-17 13:57:05', 'Get all users from the database!'),
(107, '2023-05-17 13:59:06', 'Get all users from the database!'),
(108, '2023-05-17 14:00:55', 'Get all users from the database!'),
(109, '2023-05-17 14:00:58', 'Get all users from the database!'),
(110, '2023-05-17 14:01:35', 'Get all users from the database!'),
(111, '2023-05-17 14:01:45', 'Get all users from the database!'),
(112, '2023-05-17 14:01:46', 'Get all users from the database!'),
(113, '2023-05-17 14:01:50', 'Get all users from the database!'),
(114, '2023-05-17 14:02:15', 'Get all users from the database!'),
(115, '2023-05-17 14:02:16', 'Get all users from the database!'),
(116, '2023-05-17 14:02:36', 'Get all users from the database!'),
(117, '2023-05-17 14:02:38', 'Get all users from the database!'),
(118, '2023-05-17 14:02:51', 'Get all users from the database!'),
(119, '2023-05-17 14:02:53', 'Get all users from the database!'),
(120, '2023-05-17 14:03:29', 'Get all users from the database!'),
(121, '2023-05-17 14:10:23', 'The user Test User has successfully logged in with the password!'),
(122, '2023-05-17 14:10:23', 'Generate successfully the JWT token for userid 1!'),
(123, '2023-05-17 14:10:35', 'Get all users from the database!'),
(124, '2023-05-17 14:10:37', 'Get all users from the database!'),
(125, '2023-05-17 14:11:03', 'Get all users from the database!'),
(126, '2023-05-17 14:11:06', 'Get all users from the database!'),
(127, '2023-05-17 14:11:52', 'Get all users from the database!'),
(128, '2023-05-17 14:11:56', 'Get all users from the database!'),
(129, '2023-05-17 14:12:13', 'Get all users from the database!'),
(130, '2023-05-17 14:12:18', 'Get all users from the database!'),
(131, '2023-05-17 14:14:59', 'Get all users from the database!'),
(132, '2023-05-17 14:16:16', 'Get all users from the database!'),
(133, '2023-05-17 14:16:26', 'The user Test User has successfully logged in with the password!'),
(134, '2023-05-17 14:16:26', 'Generate successfully the JWT token for userid 1!'),
(135, '2023-05-17 14:16:29', 'Get all users from the database!'),
(136, '2023-05-17 14:16:45', 'The user Test User has successfully logged in with the password!'),
(137, '2023-05-17 14:16:45', 'Generate successfully the JWT token for userid 1!'),
(138, '2023-05-17 14:16:48', 'Get all users from the database!'),
(139, '2023-05-17 14:17:32', 'Get all users from the database!'),
(140, '2023-05-17 14:17:58', 'Get all users from the database!'),
(141, '2023-05-17 14:18:39', 'Get all users from the database!'),
(142, '2023-05-17 14:19:01', 'Get all users from the database!'),
(143, '2023-05-17 14:20:19', 'Get all users from the database!'),
(144, '2023-05-17 14:20:34', 'Get all users from the database!'),
(145, '2023-05-17 14:22:29', 'Get all users from the database!'),
(146, '2023-05-17 14:23:33', 'Get all users from the database!'),
(147, '2023-05-17 14:23:40', 'Get all users from the database!'),
(148, '2023-05-17 14:24:06', 'Get all users from the database!'),
(149, '2023-05-17 14:25:26', 'Get all users from the database!'),
(150, '2023-05-17 14:25:47', 'Get all users from the database!'),
(151, '2023-05-17 14:27:28', 'Get all users from the database!'),
(152, '2023-05-17 14:28:05', 'Get all users from the database!'),
(153, '2023-05-17 14:28:30', 'Get all users from the database!'),
(154, '2023-05-17 14:31:18', 'Get all users from the database!'),
(155, '2023-05-17 14:31:25', 'Get all users from the database!'),
(156, '2023-05-17 14:31:49', 'Get all users from the database!'),
(157, '2023-05-17 14:32:53', 'Get all users from the database!'),
(158, '2023-05-17 14:36:18', 'Get all users from the database!'),
(159, '2023-05-17 14:40:58', 'Get all users from the database!'),
(160, '2023-05-17 14:41:20', 'Get all users from the database!'),
(161, '2023-05-17 14:42:15', 'Get all users from the database!'),
(162, '2023-05-17 14:42:17', 'Get all users from the database!'),
(163, '2023-05-17 14:42:44', 'Get all users from the database!'),
(164, '2023-05-17 14:43:07', 'Get all users from the database!'),
(165, '2023-05-17 14:43:23', 'Update user Max Mustermann and saves the updated user in the database!'),
(166, '2023-05-17 14:43:23', 'Get all users from the database!'),
(167, '2023-05-17 14:43:31', 'Update user Max Mustermann and saves the updated user in the database!'),
(168, '2023-05-17 14:43:31', 'Get all users from the database!'),
(169, '2023-05-17 14:44:21', 'Get all users from the database!'),
(170, '2023-05-17 14:44:30', 'Change password from user Max Mustermann and saves the updated password in the database!'),
(171, '2023-05-17 14:44:30', 'Get all users from the database!'),
(172, '2023-05-17 14:44:41', 'Change password from user Max Mustermann and saves the updated password in the database!'),
(173, '2023-05-17 14:44:41', 'Get all users from the database!'),
(174, '2023-05-17 14:45:02', 'Get all users from the database!'),
(175, '2023-05-17 14:47:13', 'The user Max Mustermann has entered an invalid password!'),
(176, '2023-05-17 14:47:28', 'The user Max Mustermann has entered an invalid password!'),
(177, '2023-05-17 14:47:48', 'The user Max Mustermann has entered an invalid password!'),
(178, '2023-05-17 14:48:15', 'The user Test User has successfully logged in with the password!'),
(179, '2023-05-17 14:48:15', 'Generate successfully the JWT token for userid 1!'),
(180, '2023-05-17 14:48:31', 'The user Max Mustermann has entered an invalid password!'),
(181, '2023-05-17 14:49:12', 'The user Test User has successfully logged in with the password!'),
(182, '2023-05-17 14:49:12', 'Generate successfully the JWT token for userid 1!'),
(183, '2023-05-17 14:49:20', 'Get all users from the database!'),
(184, '2023-05-17 14:49:36', 'Get all users from the database!'),
(185, '2023-05-17 14:52:47', 'The user Max Mustermann has entered an invalid password!'),
(186, '2023-05-17 14:53:37', 'The user Max Mustermann has entered an invalid password!'),
(187, '2023-05-17 14:53:41', 'The user Max Mustermann has entered an invalid password!'),
(188, '2023-05-17 14:53:52', 'The user Test User has successfully logged in with the password!'),
(189, '2023-05-17 14:53:52', 'Generate successfully the JWT token for userid 1!'),
(190, '2023-05-17 14:53:55', 'Get all users from the database!'),
(191, '2023-05-17 14:54:00', 'Delete user Max Mustermann from the database!'),
(192, '2023-05-17 14:54:00', 'Get all users from the database!'),
(193, '2023-05-17 14:59:56', 'Create a new user Max Mustermann and saves the user in the database!'),
(194, '2023-05-17 14:59:56', 'Get all users from the database!'),
(195, '2023-05-17 16:35:20', 'The user Test User has successfully logged in with the password!'),
(196, '2023-05-17 16:35:20', 'Generate successfully the JWT token for userid 1!'),
(197, '2023-05-17 16:37:35', 'The user Max Mustermann has successfully logged in with the password!'),
(198, '2023-05-17 16:37:35', 'Generate successfully the JWT token for userid 11!'),
(199, '2023-05-17 16:39:47', 'The user Test User has successfully logged in with the password!'),
(200, '2023-05-17 16:39:47', 'Generate successfully the JWT token for userid 1!'),
(201, '2023-05-17 16:39:50', 'Get all users from the database!'),
(202, '2023-05-17 16:39:55', 'Get all users from the database!'),
(203, '2023-05-17 16:45:51', 'Get all users from the database!'),
(204, '2023-05-17 16:45:55', 'Get all users from the database!'),
(205, '2023-05-17 16:45:57', 'Get all users from the database!'),
(206, '2023-05-17 16:46:15', 'Get all users from the database!'),
(207, '2023-05-17 16:46:16', 'Get all users from the database!'),
(208, '2023-05-17 16:46:51', 'Get all users from the database!'),
(209, '2023-05-17 16:46:54', 'Get all users from the database!'),
(210, '2023-05-17 16:47:28', 'Get all users from the database!'),
(211, '2023-05-17 16:47:38', 'Get all users from the database!'),
(212, '2023-05-17 16:47:41', 'Get all users from the database!'),
(213, '2023-05-17 16:48:32', 'Get all users from the database!'),
(214, '2023-05-17 16:48:35', 'Get all users from the database!'),
(215, '2023-05-17 16:48:53', 'The user Test User has successfully logged in with the password!'),
(216, '2023-05-17 16:48:53', 'Generate successfully the JWT token for userid 1!'),
(217, '2023-05-17 16:48:56', 'Get all users from the database!'),
(218, '2023-05-17 16:48:58', 'Get all users from the database!'),
(219, '2023-05-17 16:49:14', 'The user Test User has successfully logged in with the password!'),
(220, '2023-05-17 16:49:14', 'Generate successfully the JWT token for userid 1!'),
(221, '2023-05-17 16:49:17', 'Get all users from the database!'),
(222, '2023-05-17 16:49:20', 'Get all users from the database!'),
(223, '2023-05-17 16:49:29', 'Get all users from the database!'),
(224, '2023-05-17 16:49:33', 'Get all users from the database!'),
(225, '2023-05-17 16:49:44', 'Get all users from the database!'),
(226, '2023-05-17 16:49:47', 'Get all users from the database!'),
(227, '2023-05-17 16:50:34', 'Get all users from the database!'),
(228, '2023-05-17 16:50:36', 'Get all users from the database!'),
(229, '2023-05-17 16:51:42', 'Get all users from the database!'),
(230, '2023-05-17 16:51:49', 'Get all users from the database!'),
(231, '2023-05-17 16:52:36', 'Get all users from the database!'),
(232, '2023-05-17 16:52:39', 'Get all users from the database!'),
(233, '2023-05-17 16:52:41', 'Get all users from the database!'),
(234, '2023-05-17 16:52:48', 'Get all users from the database!'),
(235, '2023-05-17 16:53:17', 'Get all users from the database!'),
(236, '2023-05-17 16:53:22', 'Get all users from the database!'),
(237, '2023-05-17 16:53:51', 'Get all users from the database!'),
(238, '2023-05-17 16:54:01', 'Get all users from the database!'),
(239, '2023-05-17 16:54:03', 'Get all users from the database!'),
(240, '2023-05-17 16:54:40', 'Get all users from the database!'),
(241, '2023-05-17 16:54:43', 'Get all users from the database!'),
(242, '2023-05-17 16:54:45', 'Get all users from the database!'),
(243, '2023-05-17 16:55:18', 'Get all users from the database!'),
(244, '2023-05-17 16:57:19', 'Get all users from the database!'),
(245, '2023-05-17 16:57:36', 'Get all users from the database!'),
(246, '2023-05-17 16:57:38', 'Get all users from the database!'),
(247, '2023-05-17 16:57:59', 'Get all users from the database!'),
(248, '2023-05-17 16:58:15', 'Get all users from the database!'),
(249, '2023-05-17 16:58:17', 'Get all users from the database!'),
(250, '2023-05-17 16:59:29', 'Get all users from the database!'),
(251, '2023-05-17 16:59:30', 'Get all users from the database!'),
(252, '2023-05-17 17:06:03', 'Get all users from the database!'),
(253, '2023-05-17 17:08:02', 'Get all users from the database!'),
(254, '2023-05-17 17:08:23', 'Get all users from the database!'),
(255, '2023-05-17 17:08:26', 'Get all users from the database!'),
(256, '2023-05-17 17:08:29', 'Get all users from the database!'),
(257, '2023-05-17 17:08:35', 'Get all users from the database!'),
(258, '2023-05-17 17:09:52', 'Get all users from the database!'),
(259, '2023-05-17 17:09:55', 'Get all users from the database!'),
(260, '2023-05-17 17:10:08', 'The user Test User has successfully logged in with the password!'),
(261, '2023-05-17 17:10:08', 'Generate successfully the JWT token for userid 1!'),
(262, '2023-05-17 17:10:11', 'Get all users from the database!'),
(263, '2023-05-17 17:10:12', 'Get all users from the database!'),
(264, '2023-05-17 17:10:13', 'Get all users from the database!'),
(265, '2023-05-17 17:10:14', 'Get all users from the database!'),
(266, '2023-05-17 17:10:14', 'Get all users from the database!'),
(267, '2023-05-17 17:10:36', 'Get all users from the database!'),
(268, '2023-05-17 17:10:43', 'Get all users from the database!'),
(269, '2023-05-17 17:10:46', 'Get all users from the database!'),
(270, '2023-05-17 17:10:46', 'Get all users from the database!'),
(271, '2023-05-17 17:10:47', 'Get all users from the database!'),
(272, '2023-05-17 17:10:47', 'Get all users from the database!'),
(273, '2023-05-17 17:10:48', 'Get all users from the database!'),
(274, '2023-05-17 17:10:52', 'Get all users from the database!'),
(275, '2023-05-17 17:11:10', 'Get all users from the database!'),
(276, '2023-05-17 17:11:12', 'Get all users from the database!'),
(277, '2023-05-17 17:11:13', 'Get all users from the database!'),
(278, '2023-05-17 17:11:18', 'Get all users from the database!'),
(279, '2023-05-17 17:11:20', 'Get all users from the database!'),
(280, '2023-05-17 17:11:21', 'Get all users from the database!'),
(281, '2023-05-17 17:11:32', 'Get all users from the database!'),
(282, '2023-05-17 17:11:34', 'Get all users from the database!'),
(283, '2023-05-17 17:11:43', 'Get all users from the database!'),
(284, '2023-05-17 17:11:47', 'Get all users from the database!'),
(285, '2023-05-17 17:11:57', 'Get all users from the database!'),
(286, '2023-05-17 17:12:00', 'Get all users from the database!'),
(287, '2023-05-17 17:12:02', 'Get all users from the database!'),
(288, '2023-05-17 17:12:03', 'Get all users from the database!'),
(289, '2023-05-17 17:12:03', 'Get all users from the database!'),
(290, '2023-05-17 17:12:04', 'Get all users from the database!'),
(291, '2023-05-17 17:12:31', 'Get all users from the database!'),
(292, '2023-05-17 17:12:32', 'Get all users from the database!'),
(293, '2023-05-17 17:12:33', 'Get all users from the database!'),
(294, '2023-05-17 17:12:33', 'Get all users from the database!'),
(295, '2023-05-17 17:13:42', 'Get all users from the database!'),
(296, '2023-05-17 17:13:48', 'Get all users from the database!'),
(297, '2023-05-17 17:13:52', 'Get all users from the database!'),
(298, '2023-05-17 17:15:27', 'Get all users from the database!'),
(299, '2023-05-17 17:15:29', 'Get all users from the database!'),
(300, '2023-05-17 17:15:30', 'Get all users from the database!'),
(301, '2023-05-17 17:16:38', 'Get all users from the database!'),
(302, '2023-05-17 17:17:32', 'Get all users from the database!'),
(303, '2023-05-17 17:17:35', 'Get all users from the database!'),
(304, '2023-05-17 17:18:06', 'Get all users from the database!'),
(305, '2023-05-17 17:18:43', 'Get all users from the database!'),
(306, '2023-05-17 17:18:45', 'Get all users from the database!'),
(307, '2023-05-17 17:18:51', 'Get all users from the database!'),
(308, '2023-05-17 17:18:53', 'Get all users from the database!'),
(309, '2023-05-17 17:18:59', 'Get all users from the database!'),
(310, '2023-05-17 17:19:01', 'Get all users from the database!'),
(311, '2023-05-17 17:19:02', 'Get all users from the database!'),
(312, '2023-05-17 17:19:05', 'Get all users from the database!'),
(313, '2023-05-17 17:20:42', 'Get all users from the database!'),
(314, '2023-05-17 17:20:53', 'Get all users from the database!'),
(315, '2023-05-17 17:20:58', 'Get all users from the database!'),
(316, '2023-05-17 17:21:10', 'Get all users from the database!'),
(317, '2023-05-17 17:21:29', 'Get all users from the database!'),
(318, '2023-05-17 17:21:31', 'Get all users from the database!'),
(319, '2023-05-17 17:22:05', 'Get all users from the database!'),
(320, '2023-05-17 17:22:42', 'Get all users from the database!'),
(321, '2023-05-17 17:23:17', 'Get all users from the database!'),
(322, '2023-05-17 17:23:18', 'Get all users from the database!'),
(323, '2023-05-17 17:23:50', 'Get all users from the database!'),
(324, '2023-05-17 17:23:51', 'Get all users from the database!'),
(325, '2023-05-17 17:24:06', 'Get all users from the database!'),
(326, '2023-05-17 17:24:27', 'Get all users from the database!'),
(327, '2023-05-17 17:24:57', 'Get all users from the database!'),
(328, '2023-05-17 17:24:59', 'Get all users from the database!'),
(329, '2023-05-17 17:25:00', 'Get all users from the database!'),
(330, '2023-05-17 17:25:08', 'Get all users from the database!'),
(331, '2023-05-17 17:25:10', 'Get all users from the database!'),
(332, '2023-05-17 17:25:10', 'Get all users from the database!'),
(333, '2023-05-17 17:28:00', 'Get all users from the database!'),
(334, '2023-05-17 17:28:00', 'Get all users from the database!'),
(335, '2023-05-17 17:28:31', 'Get all users from the database!'),
(336, '2023-05-17 17:28:32', 'Get all users from the database!'),
(337, '2023-05-17 17:28:33', 'Get all users from the database!'),
(338, '2023-05-17 17:28:33', 'Get all users from the database!'),
(339, '2023-05-17 17:28:34', 'Get all users from the database!'),
(340, '2023-05-17 17:28:35', 'Get all users from the database!'),
(341, '2023-05-17 17:29:05', 'Get all users from the database!'),
(342, '2023-05-17 17:29:06', 'Get all users from the database!'),
(343, '2023-05-17 17:29:07', 'Get all users from the database!'),
(344, '2023-05-17 17:29:08', 'Get all users from the database!'),
(345, '2023-05-17 17:29:18', 'Get all users from the database!'),
(346, '2023-05-17 17:29:18', 'Get all users from the database!'),
(347, '2023-05-17 17:29:19', 'Get all users from the database!'),
(348, '2023-05-17 17:29:20', 'Get all users from the database!'),
(349, '2023-05-17 17:29:21', 'Get all users from the database!'),
(350, '2023-05-17 17:29:21', 'Get all users from the database!'),
(351, '2023-05-17 17:29:28', 'Get all users from the database!'),
(352, '2023-05-17 17:29:31', 'Get all users from the database!'),
(353, '2023-05-17 17:29:31', 'Get all users from the database!'),
(354, '2023-05-17 17:29:32', 'Get all users from the database!'),
(355, '2023-05-17 17:29:32', 'Get all users from the database!'),
(356, '2023-05-17 17:29:32', 'Get all users from the database!'),
(357, '2023-05-17 17:33:47', 'Get all users from the database!'),
(358, '2023-05-17 17:34:03', 'Get all users from the database!'),
(359, '2023-05-17 17:34:10', 'Get all users from the database!'),
(360, '2023-05-17 17:34:25', 'Get all users from the database!'),
(361, '2023-05-17 17:34:49', 'Get all users from the database!'),
(362, '2023-05-17 17:34:51', 'Get all users from the database!'),
(363, '2023-05-17 17:34:53', 'Get all users from the database!'),
(364, '2023-05-17 17:34:54', 'Get all users from the database!'),
(365, '2023-05-17 17:35:50', 'Get all users from the database!'),
(366, '2023-05-17 17:35:52', 'Get all users from the database!'),
(367, '2023-05-17 17:36:42', 'Get all users from the database!'),
(368, '2023-05-17 17:36:49', 'Get all users from the database!'),
(369, '2023-05-17 17:36:55', 'Get all users from the database!'),
(370, '2023-05-17 17:37:37', 'Get all users from the database!'),
(371, '2023-05-17 17:37:39', 'Get all users from the database!'),
(372, '2023-05-17 17:37:53', 'Get all users from the database!'),
(373, '2023-05-17 17:37:55', 'Get all users from the database!'),
(374, '2023-05-17 17:38:07', 'Get all users from the database!'),
(375, '2023-05-17 17:38:11', 'Get all users from the database!'),
(376, '2023-05-17 17:38:36', 'Get all users from the database!'),
(377, '2023-05-17 17:38:37', 'Get all users from the database!'),
(378, '2023-05-17 17:38:38', 'Get all users from the database!'),
(379, '2023-05-17 17:39:45', 'Get all users from the database!'),
(380, '2023-05-17 17:39:51', 'Get all users from the database!'),
(381, '2023-05-17 17:39:53', 'Get all users from the database!'),
(382, '2023-05-17 17:39:54', 'Get all users from the database!'),
(383, '2023-05-17 17:39:54', 'Get all users from the database!'),
(384, '2023-05-17 17:40:31', 'Get all users from the database!'),
(385, '2023-05-17 17:40:32', 'Get all users from the database!'),
(386, '2023-05-17 17:40:33', 'Get all users from the database!'),
(387, '2023-05-17 17:40:33', 'Get all users from the database!'),
(388, '2023-05-17 17:41:44', 'Get all users from the database!'),
(389, '2023-05-17 17:41:47', 'Get all users from the database!'),
(390, '2023-05-17 17:42:02', 'Get all users from the database!'),
(391, '2023-05-17 17:42:04', 'Get all users from the database!'),
(392, '2023-05-17 17:42:42', 'Get all users from the database!'),
(393, '2023-05-17 17:42:43', 'Get all users from the database!'),
(394, '2023-05-17 17:42:44', 'Get all users from the database!'),
(395, '2023-05-17 17:42:48', 'Get all users from the database!'),
(396, '2023-05-17 17:43:10', 'Get all users from the database!'),
(397, '2023-05-17 17:43:11', 'Get all users from the database!'),
(398, '2023-05-17 17:43:11', 'Get all users from the database!'),
(399, '2023-05-17 17:44:15', 'Get all users from the database!'),
(400, '2023-05-17 17:44:16', 'Get all users from the database!'),
(401, '2023-05-17 17:44:18', 'Get all users from the database!'),
(402, '2023-05-17 17:44:18', 'Get all users from the database!'),
(403, '2023-05-17 17:45:14', 'Get all users from the database!'),
(404, '2023-05-17 17:45:15', 'Get all users from the database!'),
(405, '2023-05-17 17:45:18', 'Get all users from the database!'),
(406, '2023-05-17 17:45:19', 'Get all users from the database!'),
(407, '2023-05-17 17:45:19', 'Get all users from the database!'),
(408, '2023-05-17 17:45:19', 'Get all users from the database!'),
(409, '2023-05-17 17:45:20', 'Get all users from the database!'),
(410, '2023-05-17 17:45:20', 'Get all users from the database!'),
(411, '2023-05-17 17:45:20', 'Get all users from the database!'),
(412, '2023-05-17 17:45:20', 'Get all users from the database!'),
(413, '2023-05-17 17:45:27', 'Get all users from the database!'),
(414, '2023-05-17 17:45:28', 'Get all users from the database!'),
(415, '2023-05-17 17:45:29', 'Get all users from the database!'),
(416, '2023-05-17 17:45:30', 'Get all users from the database!'),
(417, '2023-05-17 17:45:36', 'Get all users from the database!'),
(418, '2023-05-17 17:45:36', 'Get all users from the database!'),
(419, '2023-05-17 17:45:47', 'Get all users from the database!'),
(420, '2023-05-17 17:45:49', 'Get all users from the database!'),
(421, '2023-05-17 17:45:49', 'Get all users from the database!'),
(422, '2023-05-17 17:45:50', 'Get all users from the database!'),
(423, '2023-05-17 17:48:08', 'The user Test User has successfully logged in with the password!'),
(424, '2023-05-17 17:48:08', 'Generate successfully the JWT token for userid 1!'),
(425, '2023-05-17 17:48:38', 'Get all users from the database!'),
(426, '2023-05-17 17:48:40', 'Get all users from the database!'),
(427, '2023-05-17 17:48:41', 'Get all users from the database!'),
(428, '2023-05-17 17:49:06', 'Get all users from the database!'),
(429, '2023-05-17 17:49:07', 'Get all users from the database!'),
(430, '2023-05-17 17:52:25', 'Get all users from the database!'),
(431, '2023-05-17 17:52:29', 'Get all users from the database!'),
(432, '2023-05-17 17:52:29', 'Get all users from the database!'),
(433, '2023-05-17 17:52:44', 'Get all users from the database!'),
(434, '2023-05-17 17:52:46', 'Get all users from the database!'),
(435, '2023-05-17 17:52:47', 'Get all users from the database!'),
(436, '2023-05-17 17:52:47', 'Get all users from the database!'),
(437, '2023-05-17 17:52:47', 'Get all users from the database!'),
(438, '2023-05-17 17:54:19', 'Get all users from the database!'),
(439, '2023-05-17 17:54:21', 'Get all users from the database!'),
(440, '2023-05-17 17:54:30', 'Get all users from the database!'),
(441, '2023-05-17 17:54:32', 'Get all users from the database!'),
(442, '2023-05-17 17:54:37', 'Get all users from the database!'),
(443, '2023-05-17 17:54:39', 'Get all users from the database!'),
(444, '2023-05-17 17:54:39', 'Get all users from the database!'),
(445, '2023-05-17 17:54:39', 'Get all users from the database!'),
(446, '2023-05-17 17:55:19', 'Get all users from the database!'),
(447, '2023-05-17 17:55:30', 'Get all users from the database!'),
(448, '2023-05-17 17:55:32', 'Get all users from the database!'),
(449, '2023-05-17 17:56:16', 'Get all users from the database!'),
(450, '2023-05-17 17:56:21', 'Get all users from the database!'),
(451, '2023-05-17 17:56:22', 'Get all users from the database!'),
(452, '2023-05-17 17:57:13', 'Get all users from the database!'),
(453, '2023-05-17 17:57:19', 'Get all users from the database!'),
(454, '2023-05-17 17:57:55', 'Get all users from the database!'),
(455, '2023-05-17 17:57:56', 'Get all users from the database!'),
(456, '2023-05-17 17:57:57', 'Get all users from the database!'),
(457, '2023-05-17 17:58:14', 'Get all users from the database!'),
(458, '2023-05-17 17:58:15', 'Get all users from the database!'),
(459, '2023-05-17 17:58:16', 'Get all users from the database!'),
(460, '2023-05-17 18:01:26', 'Get all users from the database!'),
(461, '2023-05-17 18:04:39', 'Get all users from the database!'),
(462, '2023-05-17 18:04:41', 'Get all users from the database!'),
(463, '2023-05-17 18:04:48', 'Get all users from the database!'),
(464, '2023-05-17 18:04:49', 'Get all users from the database!'),
(465, '2023-05-17 18:05:20', 'Get all users from the database!'),
(466, '2023-05-17 18:05:22', 'Get all users from the database!'),
(467, '2023-05-17 18:05:22', 'Get all users from the database!'),
(468, '2023-05-17 18:06:05', 'Get all users from the database!'),
(469, '2023-05-17 18:06:18', 'Get all users from the database!'),
(470, '2023-05-17 18:06:20', 'Get all users from the database!'),
(471, '2023-05-17 18:07:05', 'Get all users from the database!'),
(472, '2023-05-17 18:07:06', 'Get all users from the database!'),
(473, '2023-05-17 18:07:07', 'Get all users from the database!'),
(474, '2023-05-17 18:07:15', 'Get all users from the database!'),
(475, '2023-05-17 18:07:17', 'Get all users from the database!'),
(476, '2023-05-17 18:07:18', 'Get all users from the database!'),
(477, '2023-05-17 18:08:25', 'Get all users from the database!'),
(478, '2023-05-17 18:08:26', 'Get all users from the database!'),
(479, '2023-05-17 18:09:31', 'Get all users from the database!'),
(480, '2023-05-17 18:09:33', 'Get all users from the database!'),
(481, '2023-05-17 18:09:34', 'Get all users from the database!'),
(482, '2023-05-17 18:09:34', 'Get all users from the database!'),
(483, '2023-05-17 18:09:35', 'Get all users from the database!'),
(484, '2023-05-17 18:09:45', 'Get all users from the database!'),
(485, '2023-05-17 18:09:46', 'Get all users from the database!'),
(486, '2023-05-17 18:09:54', 'Get all users from the database!'),
(487, '2023-05-17 18:09:55', 'Get all users from the database!'),
(488, '2023-05-17 18:12:33', 'Get all users from the database!'),
(489, '2023-05-17 18:12:34', 'Get all users from the database!'),
(490, '2023-05-17 18:12:56', 'Get all users from the database!'),
(491, '2023-05-17 18:13:22', 'Get all users from the database!'),
(492, '2023-05-17 18:15:24', 'Get all users from the database!'),
(493, '2023-05-17 19:41:02', 'The user Test User has successfully logged in with the password!'),
(494, '2023-05-17 19:41:02', 'Generate successfully the JWT token for userid 1!'),
(495, '2023-05-17 19:41:05', 'Get all users from the database!'),
(496, '2023-05-17 19:41:06', 'Get all users from the database!'),
(497, '2023-05-17 19:41:09', 'Get all users from the database!'),
(498, '2023-05-17 19:41:10', 'Get all users from the database!'),
(499, '2023-05-17 19:41:11', 'Get all users from the database!'),
(500, '2023-05-17 19:41:17', 'Get all users from the database!'),
(501, '2023-05-17 19:41:19', 'Get all users from the database!'),
(502, '2023-05-17 19:41:20', 'Get all users from the database!'),
(503, '2023-05-17 19:41:22', 'Get all users from the database!'),
(504, '2023-05-17 19:41:32', 'Get all users from the database!'),
(505, '2023-05-17 19:41:34', 'Get all users from the database!'),
(506, '2023-05-17 19:41:34', 'Get all users from the database!'),
(507, '2023-05-17 19:41:40', 'Get all users from the database!'),
(508, '2023-05-17 19:42:04', 'Get all users from the database!'),
(509, '2023-05-17 19:47:23', 'Get all users from the database!'),
(510, '2023-05-17 19:47:43', 'Get all users from the database!'),
(511, '2023-05-17 19:47:54', 'Get all users from the database!'),
(512, '2023-05-17 19:48:08', 'Get all users from the database!'),
(513, '2023-05-17 19:48:17', 'Get all users from the database!'),
(514, '2023-05-17 19:48:23', 'Get all users from the database!'),
(515, '2023-05-17 19:48:36', 'Get all users from the database!'),
(516, '2023-05-17 19:48:40', 'Get all users from the database!'),
(517, '2023-05-17 19:48:45', 'Get all users from the database!'),
(518, '2023-05-17 19:48:54', 'Get all users from the database!'),
(519, '2023-05-17 19:48:56', 'Get all users from the database!'),
(520, '2023-05-17 19:49:23', 'Get all users from the database!'),
(521, '2023-05-17 19:49:24', 'Get all users from the database!'),
(522, '2023-05-17 19:49:38', 'Get all users from the database!'),
(523, '2023-05-17 19:49:40', 'Get all users from the database!'),
(524, '2023-05-17 19:49:52', 'Get all users from the database!'),
(525, '2023-05-17 19:49:55', 'Get all users from the database!'),
(526, '2023-05-17 19:49:57', 'Get all users from the database!'),
(527, '2023-05-17 19:51:14', 'Get all users from the database!'),
(528, '2023-05-17 19:55:52', 'Get all users from the database!'),
(529, '2023-05-17 19:57:23', 'Get all users from the database!'),
(530, '2023-05-17 19:57:58', 'Get all users from the database!'),
(531, '2023-05-17 19:58:27', 'Get all users from the database!'),
(532, '2023-05-17 20:02:16', 'Get all users from the database!'),
(533, '2023-05-17 20:05:33', 'Get all users from the database!'),
(534, '2023-05-17 20:05:41', 'Get all users from the database!'),
(535, '2023-05-17 20:05:42', 'Get all users from the database!'),
(536, '2023-05-17 20:05:49', 'Get all users from the database!'),
(537, '2023-05-17 20:05:50', 'Get all users from the database!'),
(538, '2023-05-17 20:05:51', 'Get all users from the database!'),
(539, '2023-05-17 20:06:23', 'Get all users from the database!'),
(540, '2023-05-17 20:06:26', 'Get all users from the database!'),
(541, '2023-05-17 20:07:44', 'Get all users from the database!'),
(542, '2023-05-17 20:07:47', 'Get all users from the database!'),
(543, '2023-05-17 20:08:05', 'Get all users from the database!'),
(544, '2023-05-17 20:08:25', 'Get all users from the database!'),
(545, '2023-05-17 20:08:27', 'Get all users from the database!'),
(546, '2023-05-17 20:08:32', 'Get all users from the database!'),
(547, '2023-05-17 20:09:04', 'Get all users from the database!'),
(548, '2023-05-17 20:09:09', 'Get all users from the database!'),
(549, '2023-05-17 20:09:16', 'Get all users from the database!'),
(550, '2023-05-17 20:09:32', 'Get all users from the database!'),
(551, '2023-05-17 20:09:34', 'Get all users from the database!'),
(552, '2023-05-17 20:11:00', 'Get all users from the database!'),
(553, '2023-05-17 20:11:14', 'Get all users from the database!'),
(554, '2023-05-17 20:11:28', 'Get all users from the database!'),
(555, '2023-05-17 20:11:30', 'Get all users from the database!'),
(556, '2023-05-17 20:11:36', 'Get all users from the database!'),
(557, '2023-05-17 20:11:41', 'Get all users from the database!'),
(558, '2023-05-17 20:12:14', 'Get all users from the database!'),
(559, '2023-05-17 20:12:17', 'Get all users from the database!'),
(560, '2023-05-17 20:12:25', 'Get all users from the database!'),
(561, '2023-05-17 20:12:31', 'Get all users from the database!'),
(562, '2023-05-17 20:12:36', 'Get all users from the database!'),
(563, '2023-05-17 20:12:46', 'Get all users from the database!'),
(564, '2023-05-17 20:13:12', 'Get all users from the database!'),
(565, '2023-05-17 20:13:17', 'Get all users from the database!'),
(566, '2023-05-17 20:13:42', 'Get all users from the database!'),
(567, '2023-05-17 20:13:44', 'Get all users from the database!'),
(568, '2023-05-17 20:13:48', 'Get all users from the database!'),
(569, '2023-05-17 20:16:07', 'Get all users from the database!'),
(570, '2023-05-17 20:16:13', 'Get all users from the database!'),
(571, '2023-05-17 20:16:15', 'Get all users from the database!'),
(572, '2023-05-17 20:16:19', 'Get all users from the database!'),
(573, '2023-05-17 20:16:24', 'Get all users from the database!'),
(574, '2023-05-17 20:17:03', 'Get all users from the database!'),
(575, '2023-05-17 20:17:08', 'Get all users from the database!'),
(576, '2023-05-17 20:17:13', 'Get all users from the database!'),
(577, '2023-05-17 20:17:44', 'Get all users from the database!'),
(578, '2023-05-17 20:17:46', 'Get all users from the database!'),
(579, '2023-05-17 20:17:53', 'Get all users from the database!'),
(580, '2023-05-17 20:18:13', 'Get all users from the database!'),
(581, '2023-05-17 20:18:18', 'Get all users from the database!'),
(582, '2023-05-17 20:18:19', 'Get all users from the database!'),
(583, '2023-05-17 20:18:58', 'Get all users from the database!'),
(584, '2023-05-17 20:19:00', 'Get all users from the database!'),
(585, '2023-05-17 20:19:08', 'Get all users from the database!'),
(586, '2023-05-17 20:19:09', 'Get all users from the database!'),
(587, '2023-05-17 20:20:14', 'Get all users from the database!'),
(588, '2023-05-17 20:21:07', 'Get all users from the database!'),
(589, '2023-05-17 20:21:08', 'Get all users from the database!'),
(590, '2023-05-17 20:21:21', 'Get all users from the database!'),
(591, '2023-05-17 20:21:47', 'Get all users from the database!'),
(592, '2023-05-17 20:21:48', 'Get all users from the database!'),
(593, '2023-05-17 20:21:59', 'Get all users from the database!'),
(594, '2023-05-17 20:22:01', 'Get all users from the database!'),
(595, '2023-05-17 20:22:05', 'Get all users from the database!'),
(596, '2023-05-17 20:22:18', 'Get all users from the database!'),
(597, '2023-05-17 20:22:20', 'Get all users from the database!'),
(598, '2023-05-17 20:22:39', 'Get all users from the database!'),
(599, '2023-05-17 20:22:52', 'Get all users from the database!'),
(600, '2023-05-17 20:22:53', 'Get all users from the database!'),
(601, '2023-05-17 20:23:58', 'Get all users from the database!'),
(602, '2023-05-17 20:24:00', 'Get all users from the database!'),
(603, '2023-05-17 20:24:01', 'Get all users from the database!'),
(604, '2023-05-17 20:24:06', 'Get all users from the database!'),
(605, '2023-05-17 20:25:10', 'Get all users from the database!'),
(606, '2023-05-17 20:25:11', 'Get all users from the database!'),
(607, '2023-05-17 20:25:20', 'Get all users from the database!'),
(608, '2023-05-17 20:25:26', 'Get all users from the database!'),
(609, '2023-05-17 20:25:32', 'Get all users from the database!'),
(610, '2023-05-17 20:25:40', 'Get all users from the database!'),
(611, '2023-05-17 20:25:41', 'Get all users from the database!'),
(612, '2023-05-17 20:26:41', 'Get all users from the database!'),
(613, '2023-05-17 20:26:46', 'Update user Test User and saves the updated user in the database!'),
(614, '2023-05-17 20:26:46', 'Get all users from the database!'),
(615, '2023-05-17 20:29:16', 'Get all users from the database!'),
(616, '2023-05-17 20:29:20', 'Get all users from the database!'),
(617, '2023-05-17 20:29:48', 'Get all users from the database!'),
(618, '2023-05-17 20:30:03', 'Get all users from the database!'),
(619, '2023-05-17 20:30:04', 'Get all users from the database!'),
(620, '2023-05-17 20:30:18', 'Get all users from the database!'),
(621, '2023-05-17 20:30:19', 'Get all users from the database!'),
(622, '2023-05-17 20:30:29', 'Get all users from the database!'),
(623, '2023-05-17 20:30:35', 'Get all users from the database!'),
(624, '2023-05-17 20:31:55', 'Get all users from the database!'),
(625, '2023-05-17 20:32:07', 'Get all users from the database!'),
(626, '2023-05-17 20:32:11', 'Get all users from the database!'),
(627, '2023-05-17 20:32:22', 'Get all users from the database!'),
(628, '2023-05-17 20:32:32', 'Get all users from the database!'),
(629, '2023-05-18 07:04:15', 'The user Test User has successfully logged in with the password!'),
(630, '2023-05-18 07:04:15', 'The user Test User has successfully logged in with the password!'),
(631, '2023-05-18 07:04:15', 'Generate successfully the JWT token for userid 1!'),
(632, '2023-05-18 07:04:15', 'Generate successfully the JWT token for userid 1!'),
(633, '2023-05-18 07:04:32', 'Get all users from the database!'),
(634, '2023-05-18 07:04:33', 'Get all users from the database!'),
(635, '2023-05-18 07:04:38', 'Get all users from the database!'),
(636, '2023-05-18 07:16:30', 'The user Test User has successfully logged in with the password!'),
(637, '2023-05-18 07:16:30', 'Generate successfully the JWT token for userid 1!'),
(638, '2023-05-18 07:17:45', 'Get all users from the database!'),
(639, '2023-05-18 07:24:15', 'The user Test User has successfully logged in with the password!'),
(640, '2023-05-18 07:24:15', 'Generate successfully the JWT token for userid 1!'),
(641, '2023-05-18 07:24:41', 'The user Test User has successfully logged in with the password!'),
(642, '2023-05-18 07:24:41', 'Generate successfully the JWT token for userid 1!'),
(643, '2023-05-18 07:25:04', 'The user Test User has successfully logged in with the password!'),
(644, '2023-05-18 07:25:04', 'Generate successfully the JWT token for userid 1!'),
(645, '2023-05-18 07:29:49', 'The user Test User has successfully logged in with the password!'),
(646, '2023-05-18 07:29:49', 'Generate successfully the JWT token for userid 1!'),
(647, '2023-05-18 07:29:55', 'Get all users from the database!'),
(648, '2023-05-18 07:29:56', 'Get all users from the database!'),
(649, '2023-05-18 07:30:02', 'Get all users from the database!'),
(650, '2023-05-18 07:30:26', 'Get all users from the database!'),
(651, '2023-05-18 07:31:28', 'Get all users from the database!'),
(652, '2023-05-18 07:31:39', 'Get all users from the database!'),
(653, '2023-05-18 07:31:41', 'Get all users from the database!'),
(654, '2023-05-18 07:31:51', 'The user Test User has successfully logged in with the password!'),
(655, '2023-05-18 07:31:51', 'Generate successfully the JWT token for userid 1!'),
(656, '2023-05-18 07:34:26', 'The user Test User has successfully logged in with the password!'),
(657, '2023-05-18 07:34:26', 'Generate successfully the JWT token for userid 1!'),
(658, '2023-05-18 07:34:40', 'The user Test User has successfully logged in with the password!'),
(659, '2023-05-18 07:34:40', 'Generate successfully the JWT token for userid 1!'),
(660, '2023-05-18 07:35:14', 'The user Test User has successfully logged in with the password!'),
(661, '2023-05-18 07:35:14', 'Generate successfully the JWT token for userid 1!'),
(662, '2023-05-18 07:37:28', 'The user dgfg doesn\'t exists in the database!'),
(663, '2023-05-18 07:37:32', 'The user dgfg doesn\'t exists in the database!'),
(664, '2023-05-18 07:38:11', 'The user dfgfdg doesn\'t exists in the database!'),
(665, '2023-05-18 07:38:23', 'The user Max Mustermann has successfully logged in with the password!'),
(666, '2023-05-18 07:38:23', 'Generate successfully the JWT token for userid 11!'),
(667, '2023-05-18 07:51:21', 'The user Test User has successfully logged in with the password!'),
(668, '2023-05-18 07:51:21', 'Generate successfully the JWT token for userid 1!'),
(669, '2023-05-18 07:51:41', 'Get all users from the database!'),
(670, '2023-05-18 07:51:49', 'Update user Max Mustermanns and saves the updated user in the database!'),
(671, '2023-05-18 07:51:49', 'Get all users from the database!'),
(672, '2023-05-18 07:52:08', 'Update user Max Mustermann and saves the updated user in the database!'),
(673, '2023-05-18 07:52:08', 'Get all users from the database!'),
(674, '2023-05-18 07:55:14', 'Get all users from the database!'),
(675, '2023-05-18 07:55:15', 'Get all users from the database!'),
(676, '2023-05-18 07:55:16', 'Get all users from the database!'),
(677, '2023-05-18 07:55:18', 'Get all users from the database!'),
(678, '2023-05-18 07:55:21', 'Get all users from the database!'),
(679, '2023-05-18 07:55:22', 'Get all users from the database!'),
(680, '2023-05-18 07:55:23', 'Get all users from the database!'),
(681, '2023-05-18 07:55:23', 'Get all users from the database!'),
(682, '2023-05-18 07:55:23', 'Get all users from the database!'),
(683, '2023-05-18 07:55:24', 'Get all users from the database!'),
(684, '2023-05-18 07:55:25', 'Get all users from the database!'),
(685, '2023-05-18 08:01:39', 'Get all users from the database!'),
(686, '2023-05-18 08:02:05', 'The user sfdsdf doesn\'t exists in the database!'),
(687, '2023-05-18 08:02:12', 'The user Test User has successfully logged in with the password!'),
(688, '2023-05-18 08:02:12', 'Generate successfully the JWT token for userid 1!'),
(689, '2023-05-18 08:03:36', 'The user Test User has successfully logged in with the password!'),
(690, '2023-05-18 08:03:36', 'Generate successfully the JWT token for userid 1!'),
(691, '2023-05-18 08:03:38', 'Get all users from the database!'),
(692, '2023-05-18 08:03:40', 'Get all users from the database!'),
(693, '2023-05-18 08:04:45', 'The user Test User has successfully logged in with the password!'),
(694, '2023-05-18 08:04:45', 'Generate successfully the JWT token for userid 1!'),
(695, '2023-05-18 08:05:28', 'The user Test User has successfully logged in with the password um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(696, '2023-05-18 08:05:28', 'Generate successfully the JWT token for userid 1!'),
(697, '2023-05-18 08:06:30', 'The user Test User has successfully logged in with the password test123!'),
(698, '2023-05-18 08:06:30', 'Generate successfully the JWT token for userid 1!'),
(699, '2023-05-18 08:07:49', 'Get all users from the database!'),
(700, '2023-05-18 08:07:53', 'Get all users from the database!'),
(701, '2023-05-18 08:08:07', 'Get all users from the database!'),
(702, '2023-05-18 08:08:09', 'Get all users from the database!'),
(703, '2023-05-18 08:08:12', 'Get all users from the database!'),
(704, '2023-05-18 08:08:53', 'Get all users from the database!'),
(705, '2023-05-18 08:08:55', 'Get all users from the database!'),
(706, '2023-05-18 08:08:57', 'Get all users from the database!'),
(707, '2023-05-18 08:09:13', 'Get all users from the database!'),
(708, '2023-05-18 08:10:07', 'Get all users from the database!'),
(709, '2023-05-18 08:10:17', 'Update user Test User and saves the updated user in the database!'),
(710, '2023-05-18 08:10:17', 'Get all users from the database!'),
(711, '2023-05-18 08:14:43', 'Get all users from the database!'),
(712, '2023-05-18 08:14:47', 'Get all users from the database!'),
(713, '2023-05-18 08:15:01', 'Update user Max Mustermann and saves the updated user in the database!'),
(714, '2023-05-18 08:15:01', 'Get all users from the database!'),
(715, '2023-05-18 08:15:10', 'Update user Max Mustermann and saves the updated user in the database!'),
(716, '2023-05-18 08:15:10', 'Get all users from the database!'),
(717, '2023-05-18 08:15:23', 'Get all users from the database!'),
(718, '2023-05-18 08:15:28', 'Update user Max Mustermann and saves the updated user in the database!'),
(719, '2023-05-18 08:15:28', 'Get all users from the database!'),
(720, '2023-05-18 08:15:32', 'Update user Max Mustermann and saves the updated user in the database!'),
(721, '2023-05-18 08:15:32', 'Get all users from the database!'),
(722, '2023-05-18 08:16:57', 'Get all users from the database!'),
(723, '2023-05-18 08:17:03', 'Update user Max Mustermann and saves the updated user in the database!'),
(724, '2023-05-18 08:17:03', 'Get all users from the database!'),
(725, '2023-05-18 08:17:08', 'Update user Max Mustermann and saves the updated user in the database!'),
(726, '2023-05-18 08:17:08', 'Get all users from the database!'),
(727, '2023-05-18 08:17:32', 'Get all users from the database!'),
(728, '2023-05-18 08:32:36', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!');
INSERT INTO `TBL_Log` (`LogId`, `TimeStamp`, `Message`) VALUES
(729, '2023-05-18 08:32:36', 'Generate successfully the JWT token for userid 1!'),
(730, '2023-05-18 08:35:21', 'Get all users from the database!'),
(731, '2023-05-18 08:40:43', 'Get all users from the database!'),
(732, '2023-05-18 08:41:21', 'Get all users from the database!'),
(733, '2023-05-18 08:41:56', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(734, '2023-05-18 08:41:56', 'Generate successfully the JWT token for userid 2!'),
(735, '2023-05-18 08:42:51', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(736, '2023-05-18 08:42:51', 'Generate successfully the JWT token for userid 2!'),
(737, '2023-05-18 08:43:28', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(738, '2023-05-18 08:43:28', 'Generate successfully the JWT token for userid 2!'),
(739, '2023-05-18 08:44:15', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(740, '2023-05-18 08:44:15', 'Generate successfully the JWT token for userid 2!'),
(741, '2023-05-18 08:44:37', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(742, '2023-05-18 08:44:37', 'Generate successfully the JWT token for userid 1!'),
(743, '2023-05-18 08:46:24', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(744, '2023-05-18 08:46:24', 'Generate successfully the JWT token for userid 2!'),
(745, '2023-05-18 08:48:31', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(746, '2023-05-18 08:48:31', 'Generate successfully the JWT token for userid 2!'),
(747, '2023-05-18 08:49:17', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(748, '2023-05-18 08:49:17', 'Generate successfully the JWT token for userid 2!'),
(749, '2023-05-18 08:51:34', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(750, '2023-05-18 08:51:34', 'Generate successfully the JWT token for userid 2!'),
(751, '2023-05-18 08:52:09', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(752, '2023-05-18 08:52:09', 'Generate successfully the JWT token for userid 2!'),
(753, '2023-05-18 08:56:19', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(754, '2023-05-18 08:56:19', 'Generate successfully the JWT token for userid 2!'),
(755, '2023-05-18 08:57:00', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(756, '2023-05-18 08:57:00', 'Generate successfully the JWT token for userid 2!'),
(757, '2023-05-18 08:58:47', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(758, '2023-05-18 08:58:47', 'Generate successfully the JWT token for userid 2!'),
(759, '2023-05-18 08:59:04', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(760, '2023-05-18 08:59:04', 'Generate successfully the JWT token for userid 2!'),
(761, '2023-05-18 09:00:40', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(762, '2023-05-18 09:00:40', 'Generate successfully the JWT token for userid 2!'),
(763, '2023-05-18 09:01:16', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(764, '2023-05-18 09:01:16', 'Generate successfully the JWT token for userid 2!'),
(765, '2023-05-18 09:01:40', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(766, '2023-05-18 09:01:40', 'Generate successfully the JWT token for userid 2!'),
(767, '2023-05-18 09:05:07', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(768, '2023-05-18 09:05:07', 'Generate successfully the JWT token for userid 1!'),
(769, '2023-05-18 09:06:13', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(770, '2023-05-18 09:06:13', 'Generate successfully the JWT token for userid 2!'),
(771, '2023-05-18 09:07:36', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(772, '2023-05-18 09:07:36', 'Generate successfully the JWT token for userid 2!'),
(773, '2023-05-18 09:10:11', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(774, '2023-05-18 09:10:11', 'Generate successfully the JWT token for userid 2!'),
(775, '2023-05-18 09:11:22', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(776, '2023-05-18 09:11:22', 'Generate successfully the JWT token for userid 1!'),
(777, '2023-05-18 09:12:08', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(778, '2023-05-18 09:12:08', 'Generate successfully the JWT token for userid 2!'),
(779, '2023-05-18 09:14:51', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(780, '2023-05-18 09:14:51', 'Generate successfully the JWT token for userid 2!'),
(781, '2023-05-18 09:16:14', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(782, '2023-05-18 09:16:14', 'Generate successfully the JWT token for userid 2!'),
(783, '2023-05-18 09:18:39', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(784, '2023-05-18 09:18:39', 'Generate successfully the JWT token for userid 2!'),
(785, '2023-05-18 09:20:30', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(786, '2023-05-18 09:20:30', 'Generate successfully the JWT token for userid 2!'),
(787, '2023-05-18 09:22:45', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(788, '2023-05-18 09:22:45', 'Generate successfully the JWT token for userid 2!'),
(789, '2023-05-18 09:23:12', 'The user test doesn\'t exists in the database!'),
(790, '2023-05-18 09:23:15', 'The user test doesn\'t exists in the database!'),
(791, '2023-05-18 09:23:20', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(792, '2023-05-18 09:23:20', 'Generate successfully the JWT token for userid 1!'),
(793, '2023-05-18 09:24:11', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(794, '2023-05-18 09:24:11', 'Generate successfully the JWT token for userid 2!'),
(795, '2023-05-18 09:24:35', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(796, '2023-05-18 09:24:35', 'Generate successfully the JWT token for userid 1!'),
(797, '2023-05-18 09:24:48', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(798, '2023-05-18 09:24:48', 'Generate successfully the JWT token for userid 2!'),
(799, '2023-05-18 09:25:11', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(800, '2023-05-18 09:25:11', 'Generate successfully the JWT token for userid 2!'),
(801, '2023-05-18 09:29:50', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(802, '2023-05-18 09:29:50', 'Generate successfully the JWT token for userid 2!'),
(803, '2023-05-18 09:36:45', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(804, '2023-05-18 09:36:45', 'Generate successfully the JWT token for userid 1!'),
(805, '2023-05-18 09:37:53', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(806, '2023-05-18 09:37:53', 'Generate successfully the JWT token for userid 2!'),
(807, '2023-05-18 09:38:29', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(808, '2023-05-18 09:38:29', 'Generate successfully the JWT token for userid 2!'),
(809, '2023-05-18 09:40:19', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(810, '2023-05-18 09:40:19', 'Generate successfully the JWT token for userid 2!'),
(811, '2023-05-18 09:41:24', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(812, '2023-05-18 09:41:24', 'Generate successfully the JWT token for userid 2!'),
(813, '2023-05-18 09:42:39', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(814, '2023-05-18 09:42:39', 'Generate successfully the JWT token for userid 2!'),
(815, '2023-05-18 09:44:36', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(816, '2023-05-18 09:44:36', 'Generate successfully the JWT token for userid 2!'),
(817, '2023-05-18 09:48:47', 'The user Max Mustermann has successfully logged in with the password hash yHkD66sb+0Oh/V555IM7EGbHk2iZ5OlMvQq3T2D5ZLQ=!'),
(818, '2023-05-18 09:48:47', 'Generate successfully the JWT token for userid 2!'),
(819, '2023-05-18 09:50:18', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(820, '2023-05-18 09:50:18', 'Generate successfully the JWT token for userid 1!'),
(821, '2023-05-18 09:50:33', 'Get all users from the database!'),
(822, '2023-05-18 09:50:38', 'Delete user Max Mustermann from the database!'),
(823, '2023-05-18 09:50:38', 'Get all users from the database!'),
(824, '2023-05-18 09:51:03', 'Create a new user Max Mustermann and saves the user in the database!'),
(825, '2023-05-18 09:51:03', 'Get all users from the database!'),
(826, '2023-05-18 09:51:14', 'Get all users from the database!'),
(827, '2023-05-18 09:51:25', 'The user Max Mustermann has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(828, '2023-05-18 09:51:25', 'Generate successfully the JWT token for userid 12!'),
(829, '2023-05-18 09:52:31', 'The user Max Mustermann has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(830, '2023-05-18 09:52:31', 'Generate successfully the JWT token for userid 12!'),
(831, '2023-05-18 09:54:18', 'The user Max Mustermann has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(832, '2023-05-18 09:54:18', 'Generate successfully the JWT token for userid 12!'),
(833, '2023-05-18 09:54:35', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(834, '2023-05-18 09:54:35', 'Generate successfully the JWT token for userid 1!'),
(835, '2023-05-18 09:55:38', 'The user Max Mustermann has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(836, '2023-05-18 09:55:38', 'Generate successfully the JWT token for userid 12!'),
(837, '2023-05-18 11:06:42', 'The user Max Mustermann has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(838, '2023-05-18 11:06:42', 'Generate successfully the JWT token for userid 12!'),
(839, '2023-05-18 13:30:08', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(840, '2023-05-18 13:30:08', 'Generate successfully the JWT token for userid 1!'),
(841, '2023-05-18 13:44:10', 'Get all users from the database!'),
(842, '2023-05-27 09:51:30', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(843, '2023-05-27 09:51:30', 'Generate successfully the JWT token for userid 1!'),
(844, '2023-05-27 09:51:38', 'Get all users from the database!'),
(845, '2023-05-27 09:51:55', 'Update user The Admin and saves the updated user in the database!'),
(846, '2023-05-27 09:51:55', 'Get all users from the database!'),
(847, '2023-05-27 09:52:17', 'Update user The User and saves the updated user in the database!'),
(848, '2023-05-27 09:52:17', 'Get all users from the database!'),
(849, '2023-05-27 09:52:32', 'The user The Admin has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(850, '2023-05-27 09:52:32', 'Generate successfully the JWT token for userid 1!'),
(851, '2023-05-27 09:52:39', 'The user The User has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(852, '2023-05-27 09:52:39', 'Generate successfully the JWT token for userid 12!'),
(853, '2023-05-27 09:53:24', 'The user The Admin has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(854, '2023-05-27 09:53:24', 'Generate successfully the JWT token for userid 1!'),
(855, '2023-05-27 09:53:27', 'Get all users from the database!'),
(856, '2023-05-27 10:00:25', 'The user The Admin has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(857, '2023-05-27 10:00:25', 'Generate successfully the JWT token for userid 1!'),
(858, '2023-05-27 10:19:18', 'The user The Admin has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(859, '2023-05-27 10:19:18', 'Generate successfully the JWT token for userid 1!'),
(860, '2023-05-27 10:27:18', 'The user The Admin has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(861, '2023-05-27 10:27:18', 'Generate successfully the JWT token for userid 1!'),
(862, '2023-05-27 10:27:44', 'The user The User has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(863, '2023-05-27 10:27:44', 'Generate successfully the JWT token for userid 12!'),
(864, '2023-05-27 10:33:56', 'The user The User has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(865, '2023-05-27 10:33:56', 'Generate successfully the JWT token for userid 12!'),
(866, '2023-05-27 10:37:32', 'The user The User has successfully logged in with the password hash tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=!'),
(867, '2023-05-27 10:37:32', 'Generate successfully the JWT token for userid 12!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_Role`
--

CREATE TABLE `TBL_Role` (
  `RoleId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_Role`
--

INSERT INTO `TBL_Role` (`RoleId`, `Name`) VALUES
(0, 'Admin'),
(1, 'User');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_Sensor`
--

CREATE TABLE `TBL_Sensor` (
  `SensorId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MAC` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_Sensor`
--

INSERT INTO `TBL_Sensor` (`SensorId`, `Name`, `MAC`, `Value`) VALUES
(1, 'Temperature Indoor', 'F4-AB-DF-0A-43-54', 20),
(2, 'Temperature Outdoor', '40-47-8F-2B-F7-79', 15),
(3, 'Humidity Indoor', 'DC-F2-F7-03-E7-12', 19),
(4, 'Humidity Outdoor', 'E7-21-63-9D-63-D9', 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `TBL_User`
--

CREATE TABLE `TBL_User` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` char(255) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `PasswordSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `TBL_User`
--

INSERT INTO `TBL_User` (`UserId`, `FirstName`, `LastName`, `UserName`, `Email`, `Password`, `RoleId`, `PasswordSalt`) VALUES
(1, 'The', 'Admin', 'admin', 'admin@gmx.at', 'um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=', 1, 'uor33sn0GC7c/V1+vbIMSg=='),
(12, 'The', 'User', 'user', 'user@gmx.at', 'tRYe0BC2hkvtG4gyn2OFW3UJu8/SnEfxVC4rMWQ5mH0=', 0, '0dqkE0+eBVr4IVRAYYezXw==');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `TBL_Actor`
--
ALTER TABLE `TBL_Actor`
  ADD PRIMARY KEY (`ActorId`),
  ADD KEY `FK_UserId` (`UserId`);

--
-- Indizes für die Tabelle `TBL_Device`
--
ALTER TABLE `TBL_Device`
  ADD KEY `FK_ActorId` (`DeviceId`);

--
-- Indizes für die Tabelle `TBL_Log`
--
ALTER TABLE `TBL_Log`
  ADD PRIMARY KEY (`LogId`);

--
-- Indizes für die Tabelle `TBL_Role`
--
ALTER TABLE `TBL_Role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indizes für die Tabelle `TBL_Sensor`
--
ALTER TABLE `TBL_Sensor`
  ADD PRIMARY KEY (`SensorId`);

--
-- Indizes für die Tabelle `TBL_User`
--
ALTER TABLE `TBL_User`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `RoleId_FK` (`RoleId`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `TBL_Actor`
--
ALTER TABLE `TBL_Actor`
  MODIFY `ActorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `TBL_Log`
--
ALTER TABLE `TBL_Log`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=868;

--
-- AUTO_INCREMENT für Tabelle `TBL_Role`
--
ALTER TABLE `TBL_Role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `TBL_Sensor`
--
ALTER TABLE `TBL_Sensor`
  MODIFY `SensorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `TBL_User`
--
ALTER TABLE `TBL_User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `TBL_Actor`
--
ALTER TABLE `TBL_Actor`
  ADD CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `TBL_User` (`UserId`);

--
-- Constraints der Tabelle `TBL_Device`
--
ALTER TABLE `TBL_Device`
  ADD CONSTRAINT `FK_ActorId` FOREIGN KEY (`DeviceId`) REFERENCES `TBL_Actor` (`ActorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `TBL_User`
--
ALTER TABLE `TBL_User`
  ADD CONSTRAINT `RoleId_FK` FOREIGN KEY (`RoleId`) REFERENCES `TBL_Role` (`RoleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
