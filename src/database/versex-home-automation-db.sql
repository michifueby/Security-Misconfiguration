-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 17. Mai 2023 um 10:21
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
(1, 'Test', 'User', 'user', 'test@gmx.at', 'um3yeqGoD5JcwtdUa9LcHKEO5aXMulRiLHjeQ/5u1fA=', 1, 'uor33sn0GC7c/V1+vbIMSg==');

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
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
