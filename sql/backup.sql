-- --------------------------------------------------------
-- Host:                         34.208.253.55
-- Server version:               10.0.24-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for HackingSim
CREATE DATABASE IF NOT EXISTS `HackingSim` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `HackingSim`;

-- Dumping structure for table HackingSim.Computers
CREATE TABLE IF NOT EXISTS `Computers` (
  `ComputerID` int(11) NOT NULL AUTO_INCREMENT,
  `ComputerHostName` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ComputerDomain` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ComputerIP` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ComputerID`),
  UNIQUE KEY `ComputerIP` (`ComputerIP`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table HackingSim.Computers: ~9 rows (approximately)
DELETE FROM `Computers`;
/*!40000 ALTER TABLE `Computers` DISABLE KEYS */;
INSERT INTO `Computers` (`ComputerID`, `ComputerHostName`, `ComputerDomain`, `ComputerIP`) VALUES
	(1, 'dns1', 'google.com', 134744072),
	(2, 'dns2', 'google.com', 134743044),
	(3, 'slayer1of1', 'player.com', 2133040145),
	(11, 'www', 'nunetnetworks.net', 2622286710),
	(12, 'db1', 'nunetnetworks.net', 2622286712),
	(13, 'db2', 'nunetnetworks.net', 2622286717),
	(14, 'ad1', 'nunetnetworks.net', 2622286593),
	(15, 'ad2', 'nunetnetworks.net', 2622286594),
	(16, 'smtp', 'nunetnetworks.net', 2622286622);
/*!40000 ALTER TABLE `Computers` ENABLE KEYS */;

-- Dumping structure for table HackingSim.FileSystems
CREATE TABLE IF NOT EXISTS `FileSystems` (
  `fsID` int(11) NOT NULL AUTO_INCREMENT,
  `Computer` int(11) NOT NULL DEFAULT '0',
  `fsName` varchar(256) NOT NULL DEFAULT '0',
  `fsType` enum('D','F','L') NOT NULL DEFAULT 'D',
  `fsLft` int(11) NOT NULL DEFAULT '0',
  `fsRgt` int(11) NOT NULL DEFAULT '0',
  `fsParent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsID`),
  KEY `ComputerFS` (`Computer`),
  CONSTRAINT `ComputerFS` FOREIGN KEY (`Computer`) REFERENCES `Computers` (`ComputerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table HackingSim.FileSystems: ~14 rows (approximately)
DELETE FROM `FileSystems`;
/*!40000 ALTER TABLE `FileSystems` DISABLE KEYS */;
INSERT INTO `FileSystems` (`fsID`, `Computer`, `fsName`, `fsType`, `fsLft`, `fsRgt`, `fsParent`) VALUES
	(1, 3, '/', 'D', 1, 12, 0),
	(3, 3, 'home', 'D', 2, 5, 1),
	(4, 3, 'etc', 'D', 6, 7, 1),
	(6, 3, 'www', 'D', 9, 10, 8),
	(7, 3, 'Documents', 'D', 3, 4, 3),
	(8, 3, 'var', 'D', 8, 11, 1),
	(9, 2, '/', 'D', 1, 2, 0),
	(10, 1, '/', 'D', 1, 2, 0),
	(11, 14, '/', 'D', 1, 2, 0),
	(12, 15, '/', 'D', 1, 2, 0),
	(13, 12, '/', 'D', 1, 2, 0),
	(14, 13, '/', 'D', 1, 2, 0),
	(15, 16, '/', 'D', 1, 2, 0),
	(16, 11, '/', 'D', 1, 2, 0);
/*!40000 ALTER TABLE `FileSystems` ENABLE KEYS */;

-- Dumping structure for table HackingSim.Services
CREATE TABLE IF NOT EXISTS `Services` (
  `ServicePort` int(11) NOT NULL,
  `ServiceName` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `ServiceDis` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ServiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table HackingSim.Services: ~4 rows (approximately)
DELETE FROM `Services`;
/*!40000 ALTER TABLE `Services` DISABLE KEYS */;
INSERT INTO `Services` (`ServicePort`, `ServiceName`, `ServiceDis`) VALUES
	(21, 'ftp', ''),
	(80, 'http', ''),
	(0, 'ping', ''),
	(22, 'ssh', '');
/*!40000 ALTER TABLE `Services` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
