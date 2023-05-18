-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Mai 2023 um 16:37
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

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
-- Tabellenstruktur für Tabelle `tbl_actor`
--

CREATE TABLE `tbl_actor` (
  `ActorId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_actor`
--

INSERT INTO `tbl_actor` (`ActorId`, `UserId`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_device`
--

CREATE TABLE `tbl_device` (
  `DeviceId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MAC` varchar(255) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_device`
--

INSERT INTO `tbl_device` (`DeviceId`, `Name`, `MAC`, `State`, `Value`) VALUES
(1, 'Light Living Room', '', 1, 60),
(2, 'AC', '', 1, 25),
(3, 'Heater', '', 1, 23),
(4, 'Water Heater', '', 0, 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_log`
--

CREATE TABLE `tbl_log` (
  `LogId` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_log`
--

INSERT INTO `tbl_log` (`LogId`, `TimeStamp`, `Message`) VALUES
(1, '2023-05-17 08:33:17', 'The user Test User has successfully logged in with the password!'),
(2, '2023-05-17 08:33:18', 'Generate successfully the JWT token for userid 1!'),
(3, '2023-05-17 12:25:28', 'The user Test User has successfully logged in with the password!'),
(4, '2023-05-17 12:25:28', 'Generate successfully the JWT token for userid 1!'),
(5, '2023-05-17 14:37:28', 'The user Test User has successfully logged in with the password!'),
(6, '2023-05-17 14:37:28', 'Generate successfully the JWT token for userid 1!'),
(7, '2023-05-17 14:37:28', 'The user Test User has successfully logged in with the password!'),
(8, '2023-05-17 14:37:28', 'Generate successfully the JWT token for userid 1!'),
(9, '2023-05-18 07:03:51', 'The user Test User has successfully logged in with the password!'),
(10, '2023-05-18 07:03:51', 'The user Test User has successfully logged in with the password!'),
(11, '2023-05-18 07:03:51', 'Generate successfully the JWT token for userid 1!'),
(12, '2023-05-18 07:03:51', 'Generate successfully the JWT token for userid 1!'),
(13, '2023-05-18 07:03:51', 'The user Test User has successfully logged in with the password!'),
(14, '2023-05-18 07:03:51', 'Generate successfully the JWT token for userid 1!'),
(15, '2023-05-18 10:24:36', 'Get all users from the database!'),
(16, '2023-05-18 10:25:12', 'Get all users from the database!'),
(17, '2023-05-18 12:56:37', 'Get all users from the database!'),
(18, '2023-05-18 13:23:18', 'The user Test User has successfully logged in with the password!'),
(19, '2023-05-18 13:23:18', 'Generate successfully the JWT token for userid 1!'),
(20, '2023-05-18 13:31:09', 'The user Test User has successfully logged in with the password!'),
(21, '2023-05-18 13:31:09', 'Generate successfully the JWT token for userid 1!'),
(22, '2023-05-18 13:35:52', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(23, '2023-05-18 13:35:52', 'Generate successfully the JWT token for userid 1!'),
(24, '2023-05-18 13:35:57', 'Get all users from the database!'),
(25, '2023-05-18 13:43:38', 'Get all users from the database!'),
(26, '2023-05-18 13:45:07', 'Create a new user Test Test and saves the user in the database!'),
(27, '2023-05-18 13:45:07', 'Get all users from the database!'),
(28, '2023-05-18 13:45:25', 'The user Test Test has successfully logged in with the password hash aB7e0ZSRSfN1aOngByxUYvjFn5oEQO6fQ5RuB6heVgo=!'),
(29, '2023-05-18 13:45:25', 'Generate successfully the JWT token for userid 9!'),
(30, '2023-05-18 14:07:13', 'The user Test User has successfully logged in with the password hash um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=!'),
(31, '2023-05-18 14:07:13', 'Generate successfully the JWT token for userid 1!'),
(32, '2023-05-18 14:07:30', 'Get all users from the database!'),
(33, '2023-05-18 14:31:55', 'The user Test Test has successfully logged in with the password hash aB7e0ZSRSfN1aOngByxUYvjFn5oEQO6fQ5RuB6heVgo=!'),
(34, '2023-05-18 14:31:55', 'Generate successfully the JWT token for userid 9!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_role`
--

CREATE TABLE `tbl_role` (
  `RoleId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_role`
--

INSERT INTO `tbl_role` (`RoleId`, `Name`) VALUES
(0, 'User'),
(1, 'Admin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_sensor`
--

CREATE TABLE `tbl_sensor` (
  `SensorId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MAC` varchar(255) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_sensor`
--

INSERT INTO `tbl_sensor` (`SensorId`, `Name`, `MAC`, `Value`) VALUES
(1, 'Temperature Indoor', 'F4-AB-DF-0A-43-54', 20),
(2, 'Temperature Outdoor', '40-47-8F-2B-F7-79', 15),
(3, 'Humidity Indoor', 'DC-F2-F7-03-E7-12', 19),
(4, 'Humidity Outdoor', 'E7-21-63-9D-63-D9', 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` char(255) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `PasswordSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_user`
--

INSERT INTO `tbl_user` (`UserId`, `FirstName`, `LastName`, `UserName`, `Email`, `Password`, `RoleId`, `PasswordSalt`) VALUES
(1, 'Test', 'User', 'admin', 'test@gmx.at', 'um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=', 1, 'uor33sn0GC7c/V1+vbIMSg=='),
(9, 'Test', 'Test', 'user', 'test.test@gmail.com', 'aB7e0ZSRSfN1aOngByxUYvjFn5oEQO6fQ5RuB6heVgo=', 0, 'Z0O1veA0CJ8yLiW7RYL50w==');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_actor`
--
ALTER TABLE `tbl_actor`
  ADD PRIMARY KEY (`ActorId`),
  ADD KEY `FK_UserId` (`UserId`);

--
-- Indizes für die Tabelle `tbl_device`
--
ALTER TABLE `tbl_device`
  ADD KEY `FK_ActorId` (`DeviceId`);

--
-- Indizes für die Tabelle `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`LogId`);

--
-- Indizes für die Tabelle `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indizes für die Tabelle `tbl_sensor`
--
ALTER TABLE `tbl_sensor`
  ADD PRIMARY KEY (`SensorId`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `RoleId_FK` (`RoleId`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_actor`
--
ALTER TABLE `tbl_actor`
  MODIFY `ActorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_sensor`
--
ALTER TABLE `tbl_sensor`
  MODIFY `SensorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_actor`
--
ALTER TABLE `tbl_actor`
  ADD CONSTRAINT `FK_UserId` FOREIGN KEY (`UserId`) REFERENCES `tbl_user` (`UserId`);

--
-- Constraints der Tabelle `tbl_device`
--
ALTER TABLE `tbl_device`
  ADD CONSTRAINT `FK_ActorId` FOREIGN KEY (`DeviceId`) REFERENCES `tbl_actor` (`ActorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `RoleId_FK` FOREIGN KEY (`RoleId`) REFERENCES `tbl_role` (`RoleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
