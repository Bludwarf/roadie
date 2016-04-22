-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.11-log - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour roadie
CREATE DATABASE IF NOT EXISTS `roadie` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `roadie`;


-- Export de la structure de table roadie. enregistrement
CREATE TABLE IF NOT EXISTS `enregistrement` (
  `nom` varchar(50) NOT NULL,
  `fichier` varchar(255) DEFAULT NULL COMMENT 'Lien pour télécharger le mp3',
  `timestamp` timestamp NULL DEFAULT NULL COMMENT 'Timestamp du fichier original',
  `taille` int(11) DEFAULT NULL COMMENT 'Taille du fichier original',
  `audio` varchar(255) DEFAULT NULL COMMENT 'Lien pour écouter directement le mp3',
  `duree` smallint(5) unsigned DEFAULT NULL,
  `repete` int(10) unsigned NOT NULL,
  `ordre` int(11) DEFAULT NULL COMMENT 'Ordre dans la répète',
  `morceau` int(10) unsigned DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repeteId_ordre` (`repete`,`ordre`),
  KEY `FK_enregistrement_morceau` (`morceau`),
  CONSTRAINT `FK_enregistrement_morceau` FOREIGN KEY (`morceau`) REFERENCES `morceau` (`id`),
  CONSTRAINT `FK_enregistrement_repete` FOREIGN KEY (`repete`) REFERENCES `repete` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.enregistrement : ~120 rows (environ)
/*!40000 ALTER TABLE `enregistrement` DISABLE KEYS */;
REPLACE INTO `enregistrement` (`nom`, `fichier`, `timestamp`, `taille`, `audio`, `duree`, `repete`, `ordre`, `morceau`, `id`, `createdAt`, `updatedAt`) VALUES
	('new.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQUJnelJ4S2Q1YTQ', '2011-01-01 01:36:36', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQUJnelJ4S2Q1YTQ', NULL, 1, NULL, NULL, 113, '2016-03-04 18:05:50', '2016-03-04 18:05:50'),
	('hélico (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eOVg2QkdlN0czc28', '2011-01-01 01:17:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eOVg2QkdlN0czc28', NULL, 1, NULL, 5, 114, '2016-03-04 18:05:51', '2016-03-04 18:12:12'),
	('iwantyoursex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eU3ZUUFhVOFBkSU0', '2011-01-01 01:00:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eU3ZUUFhVOFBkSU0', NULL, 1, NULL, NULL, 115, '2016-03-04 18:12:32', '2016-03-04 18:12:32'),
	('hélico (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eclVtZmtYb19BOG8', '2011-01-01 00:29:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eclVtZmtYb19BOG8', NULL, 1, NULL, NULL, 116, '2016-03-04 18:33:37', '2016-03-04 18:33:37'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eakk0emZndnU2TW8', '2011-01-01 00:24:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eakk0emZndnU2TW8', NULL, 4, NULL, 1, 117, '2016-03-15 15:26:14', '2016-03-15 15:26:22'),
	('coeurs bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMlZ6bkctaXhFVVU', '2011-01-01 01:40:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMlZ6bkctaXhFVVU', NULL, 4, NULL, 1, 118, '2016-03-15 15:26:32', '2016-03-15 15:32:32'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWWJDQXdvVWVxckk', '2011-01-01 01:14:24', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWWJDQXdvVWVxckk', NULL, 4, NULL, 2, 119, '2016-03-15 15:26:37', '2016-03-15 15:26:47'),
	('new.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQnpWUXlBeUVYTUU', '2011-01-01 00:15:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQnpWUXlBeUVYTUU', NULL, 4, NULL, 10, 120, '2016-03-15 15:26:39', '2016-04-22 13:39:01'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRHhYQlIyTlhDRlE', '2011-01-01 01:27:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRHhYQlIyTlhDRlE', NULL, 4, NULL, 7, 121, '2016-03-15 15:26:40', '2016-03-15 15:32:29'),
	('lips2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZTRRbHJpWGJONk0', '2011-01-01 01:46:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZTRRbHJpWGJONk0', NULL, 4, NULL, 8, 122, '2016-03-15 15:26:41', '2016-03-15 15:32:36'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eM1V3bWZlMDRNVjA', '2011-01-01 00:33:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eM1V3bWZlMDRNVjA', NULL, 4, NULL, 12, 123, '2016-03-15 15:26:42', '2016-03-15 15:32:09'),
	('lips1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNmJqaHZmOTBpV2c', '2011-01-01 00:29:04', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNmJqaHZmOTBpV2c', NULL, 4, NULL, 8, 124, '2016-03-15 15:26:42', '2016-03-15 15:26:51'),
	('helico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eS1dlRkJBalctU1U', '2011-01-01 00:52:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eS1dlRkJBalctU1U', NULL, 4, NULL, 5, 125, '2016-03-15 15:26:42', '2016-03-15 15:32:17'),
	('sex1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eN3NTT1RLVV8wdGM', '2011-01-01 01:05:18', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eN3NTT1RLVV8wdGM', NULL, 4, NULL, 6, 126, '2016-03-15 15:26:43', '2016-03-15 15:32:19'),
	('sex2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQ3dsX0JhOUZPRlk', '2011-01-01 01:52:04', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQ3dsX0JhOUZPRlk', NULL, 4, NULL, 6, 127, '2016-03-15 15:26:43', '2016-03-15 15:32:39'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eT0dIWi04c2lRdjg', '2011-01-01 00:40:08', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eT0dIWi04c2lRdjg', NULL, 4, NULL, 9, 128, '2016-03-15 15:26:43', '2016-03-15 15:32:12'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUlQtRWFRNTJucTQ', '2011-01-01 00:46:20', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUlQtRWFRNTJucTQ', NULL, 4, NULL, 4, 129, '2016-03-15 15:26:44', '2016-03-15 15:32:14'),
	('devils - push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMzVoZGpOWnpnNUU', '2011-01-01 01:22:20', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMzVoZGpOWnpnNUU', NULL, 4, NULL, 3, 130, '2016-03-15 15:26:44', '2016-03-15 15:32:24'),
	('Downtown.mp3', 'https://docs.google.com/uc?export=download&id=0B2bkDQNfrAz8UEkydDdEY2xUSEk', '2016-03-17 14:46:06', NULL, 'https://drive.google.com/open?id=0B2bkDQNfrAz8UEkydDdEY2xUSEk', NULL, 5, NULL, 13, 131, '2016-03-29 17:43:39', '2016-03-29 17:54:31'),
	('rocky.mp3', 'https://docs.google.com/uc?export=download&id=0B2bkDQNfrAz8RnBzNC15T0RYc3c', '2016-03-17 14:46:09', NULL, 'https://drive.google.com/open?id=0B2bkDQNfrAz8RnBzNC15T0RYc3c', NULL, 5, NULL, NULL, 135, '2016-03-29 17:53:59', '2016-03-29 17:53:59'),
	('you know why.mp3', 'https://docs.google.com/uc?export=download&id=0B2bkDQNfrAz8YUtmZ09RcWxlaFU', '2016-03-17 14:46:21', NULL, 'https://drive.google.com/open?id=0B2bkDQNfrAz8YUtmZ09RcWxlaFU', NULL, 5, NULL, 14, 136, '2016-03-29 17:54:08', '2016-03-29 17:54:55'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeVI1bnRzOTBrNG8', '2011-01-01 01:05:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeVI1bnRzOTBrNG8', NULL, 1, NULL, NULL, 137, '2016-04-21 12:26:39', '2016-04-21 12:26:39'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edXpDZHl4RU5KUGc', '2011-01-01 00:34:08', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edXpDZHl4RU5KUGc', NULL, 1, NULL, NULL, 138, '2016-04-21 12:26:55', '2016-04-21 12:26:55'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUENGZHJ5TEhvY0E', '2011-01-01 00:55:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUENGZHJ5TEhvY0E', NULL, 1, NULL, NULL, 139, '2016-04-21 12:27:07', '2016-04-21 12:27:07'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQWFwUEdyTk93azQ', '2011-01-01 01:31:44', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQWFwUEdyTk93azQ', NULL, 1, NULL, NULL, 140, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('hélico (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eN2I4M1hUZkRzbWM', '2011-01-01 01:12:28', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eN2I4M1hUZkRzbWM', NULL, 1, NULL, NULL, 141, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('yellove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUHdDa1NiNmRWMG8', '2011-01-01 00:23:00', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUHdDa1NiNmRWMG8', NULL, 1, NULL, NULL, 142, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNEQxSm9VMGM4Tzg', '2011-01-01 00:14:26', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNEQxSm9VMGM4Tzg', NULL, 1, NULL, NULL, 143, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('iwantyoursex (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ea2d3SGI3QWZtSkk', '2011-01-01 01:26:38', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ea2d3SGI3QWZtSkk', NULL, 1, NULL, NULL, 144, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNVh1cjJjaTBlUGc', '2011-01-01 00:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNVh1cjJjaTBlUGc', NULL, 1, NULL, NULL, 145, '2016-04-21 12:27:20', '2016-04-21 12:27:20'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMWlEVWV6V2RoTlE', '2011-01-01 00:42:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMWlEVWV6V2RoTlE', NULL, 1, NULL, NULL, 146, '2016-04-21 12:27:25', '2016-04-21 12:27:25'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eam1GVzdCeHBUMDA', '2011-01-01 00:50:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eam1GVzdCeHBUMDA', NULL, 1, NULL, NULL, 147, '2016-04-21 12:27:25', '2016-04-21 12:27:25'),
	('ouhouhou.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVk5MU0NwUTdOeW8', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVk5MU0NwUTdOeW8', NULL, 3, NULL, NULL, 148, '2016-04-21 12:30:49', '2016-04-21 12:30:49'),
	('iwantyoursex voix.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edEhTb1dOM1dIWlU', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edEhTb1dOM1dIWlU', NULL, 3, NULL, NULL, 149, '2016-04-21 12:30:50', '2016-04-21 12:30:50'),
	('lips voix.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZ0I1U2dRT0dBLXM', '2016-03-05 08:30:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZ0I1U2dRT0dBLXM', NULL, 3, NULL, NULL, 150, '2016-04-21 12:30:51', '2016-04-21 12:30:51'),
	('yelove voix 2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eaWtFSnFVZEg4ZnM', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eaWtFSnFVZEg4ZnM', NULL, 3, NULL, NULL, 151, '2016-04-21 12:30:52', '2016-04-21 12:30:52'),
	('yelove voix 3.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUDZVNDYyZDEyQTg', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUDZVNDYyZDEyQTg', NULL, 3, NULL, NULL, 152, '2016-04-21 12:30:53', '2016-04-21 12:30:53'),
	('yelove voix.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUGJlaHE1eWxONTg', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUGJlaHE1eWxONTg', NULL, 3, NULL, NULL, 153, '2016-04-21 12:30:53', '2016-04-21 12:30:53'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRXpjZ2pYa18zSEE', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRXpjZ2pYa18zSEE', NULL, 3, NULL, NULL, 154, '2016-04-21 12:31:01', '2016-04-21 12:31:01'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebWNJaEsxaDhJU0E', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebWNJaEsxaDhJU0E', NULL, 3, NULL, NULL, 155, '2016-04-21 12:31:10', '2016-04-21 12:31:10'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMThheXZ6S2FvYm8', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMThheXZ6S2FvYm8', NULL, 3, NULL, NULL, 156, '2016-04-21 12:31:14', '2016-04-21 12:31:14'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRHdaRDVlTkthVTA', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRHdaRDVlTkthVTA', NULL, 3, NULL, NULL, 157, '2016-04-21 12:31:14', '2016-04-21 12:31:14'),
	('iwantyoursex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eaElsdWVHZktGRTQ', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eaElsdWVHZktGRTQ', NULL, 3, NULL, NULL, 158, '2016-04-21 12:31:31', '2016-04-21 12:31:31'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edmJZVnZNdEVEcGs', '2016-03-05 08:30:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edmJZVnZNdEVEcGs', NULL, 3, NULL, NULL, 159, '2016-04-21 12:31:31', '2016-04-21 12:31:31'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecjhLWE1NRVJ5d1k', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecjhLWE1NRVJ5d1k', NULL, 3, NULL, NULL, 160, '2016-04-21 12:31:35', '2016-04-21 12:31:35'),
	('helico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVERWN29UTlg0RTQ', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVERWN29UTlg0RTQ', NULL, 3, NULL, NULL, 161, '2016-04-21 12:31:35', '2016-04-21 12:31:35'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTjhxUllXc2NxdlE', '2016-03-05 08:30:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTjhxUllXc2NxdlE', NULL, 3, NULL, NULL, 162, '2016-04-21 12:31:35', '2016-04-21 12:31:35'),
	('iwantyoursex 2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eOFN5X1lsSV9ORGc', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eOFN5X1lsSV9ORGc', NULL, 3, NULL, NULL, 163, '2016-04-21 12:31:35', '2016-04-21 12:31:35'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebjI0N01ibW04cUE', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebjI0N01ibW04cUE', NULL, 3, NULL, NULL, 164, '2016-04-21 12:31:35', '2016-04-21 12:31:35'),
	('iwantyoursex2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eanJTMFMwc0JQeW8', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eanJTMFMwc0JQeW8', NULL, 3, NULL, NULL, 165, '2016-04-21 12:31:39', '2016-04-21 12:31:39'),
	('helico 2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eb3lvblI5M3RpZzA', '2016-03-05 08:30:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eb3lvblI5M3RpZzA', NULL, 3, NULL, NULL, 166, '2016-04-21 12:31:39', '2016-04-21 12:31:39'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNGFmY1Yxb0hiSnM', '2016-03-05 08:30:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNGFmY1Yxb0hiSnM', NULL, 3, NULL, NULL, 167, '2016-04-21 12:31:44', '2016-04-21 12:31:44'),
	('new (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVmE2blhlTmNXRlE', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVmE2blhlTmNXRlE', NULL, 7, NULL, NULL, 168, '2016-04-21 12:32:46', '2016-04-21 12:32:46'),
	('duck2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eYkNEZ0pTZ0FodTA', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eYkNEZ0pTZ0FodTA', NULL, 7, NULL, 4, 169, '2016-04-21 12:32:48', '2016-04-21 12:45:26'),
	('new (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebTVHZHhWOEJPY1E', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebTVHZHhWOEJPY1E', NULL, 7, NULL, NULL, 170, '2016-04-21 12:32:49', '2016-04-21 12:32:49'),
	('new (4).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWXFkMEFfZW9FQTQ', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWXFkMEFfZW9FQTQ', NULL, 7, NULL, NULL, 171, '2016-04-21 12:32:50', '2016-04-21 12:32:50'),
	('new (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUTBNRVN6dDNxMlE', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUTBNRVN6dDNxMlE', NULL, 7, NULL, NULL, 172, '2016-04-21 12:32:51', '2016-04-21 12:32:51'),
	('jam.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eOWpLT1loTVBzSTg', '2016-04-02 09:07:12', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eOWpLT1loTVBzSTg', NULL, 7, NULL, NULL, 173, '2016-04-21 12:33:00', '2016-04-21 12:33:00'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZVM1dmU3WGNkYTA', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZVM1dmU3WGNkYTA', NULL, 7, NULL, 2, 174, '2016-04-21 12:33:00', '2016-04-21 12:45:29'),
	('new (5).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRlZxYnFTM3V4ejQ', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRlZxYnFTM3V4ejQ', NULL, 7, NULL, NULL, 175, '2016-04-21 12:33:07', '2016-04-21 12:33:07'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecHBrdHgxZlZmeGM', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecHBrdHgxZlZmeGM', NULL, 7, NULL, 7, 176, '2016-04-21 12:33:23', '2016-04-21 12:45:58'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQWV2QlFld2pIRlk', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQWV2QlFld2pIRlk', NULL, 7, NULL, 8, 177, '2016-04-21 12:33:26', '2016-04-21 12:45:32'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edUVFc19CTG1rNGc', '2016-04-02 09:07:12', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edUVFc19CTG1rNGc', NULL, 7, NULL, 1, 178, '2016-04-21 12:33:26', '2016-04-21 12:45:22'),
	('helico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNWlfLUsySjhNbVE', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNWlfLUsySjhNbVE', NULL, 7, NULL, 5, 179, '2016-04-21 12:33:26', '2016-04-21 12:45:35'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZHlxWGs5bHlNMFE', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZHlxWGs5bHlNMFE', NULL, 7, NULL, 12, 180, '2016-04-21 12:33:39', '2016-04-21 12:45:38'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eemFFX090QjhCRms', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eemFFX090QjhCRms', NULL, 7, NULL, 9, 181, '2016-04-21 12:33:39', '2016-04-21 12:45:42'),
	('sex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZVotWFRfZHRGbkk', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZVotWFRfZHRGbkk', NULL, 7, NULL, 6, 182, '2016-04-21 12:33:39', '2016-04-21 12:45:45'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTkktNDFVUGNSUEk', '2016-04-02 09:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTkktNDFVUGNSUEk', NULL, 7, NULL, 4, 183, '2016-04-21 12:33:41', '2016-04-21 12:45:48'),
	('devils-push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNFowZVhmNEloMUU', '2016-04-02 09:07:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNFowZVhmNEloMUU', NULL, 7, NULL, 3, 184, '2016-04-21 12:33:43', '2016-04-21 12:46:02'),
	('coeurs bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebmlOZ1pvUVFwRDA', '2011-01-01 01:40:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebmlOZ1pvUVFwRDA', NULL, 8, NULL, NULL, 185, '2016-04-21 12:34:40', '2016-04-21 12:34:40'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebGp0ZmlUY1l6M1E', '2011-01-01 01:14:24', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebGp0ZmlUY1l6M1E', NULL, 8, NULL, NULL, 186, '2016-04-21 12:34:52', '2016-04-21 12:34:52'),
	('new.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eM3lDM3JWZlZ6WFk', '2011-01-01 00:15:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eM3lDM3JWZlZ6WFk', NULL, 8, NULL, NULL, 187, '2016-04-21 12:35:02', '2016-04-21 12:35:02'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ea0tfYmVXNURnam8', '2011-01-01 01:27:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ea0tfYmVXNURnam8', NULL, 8, NULL, NULL, 188, '2016-04-21 12:35:16', '2016-04-21 12:35:16'),
	('lips2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeVg2VG00d3NkWjA', '2011-01-01 01:46:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeVg2VG00d3NkWjA', NULL, 8, NULL, NULL, 189, '2016-04-21 12:35:16', '2016-04-21 12:35:16'),
	('lips1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eXy03WEQ0THBaZUU', '2011-01-01 00:29:04', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eXy03WEQ0THBaZUU', NULL, 8, NULL, NULL, 190, '2016-04-21 12:35:16', '2016-04-21 12:35:16'),
	('helico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSlhIckhWVmNpTnM', '2011-01-01 00:52:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSlhIckhWVmNpTnM', NULL, 8, NULL, NULL, 191, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eT1RDSm5IY2NSb00', '2011-01-01 00:24:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eT1RDSm5IY2NSb00', NULL, 8, NULL, NULL, 192, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eS2RiUE1sLUFkem8', '2011-01-01 00:33:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eS2RiUE1sLUFkem8', NULL, 8, NULL, NULL, 193, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('sex1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRDIzTE44bzE3b2s', '2011-01-01 01:05:18', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRDIzTE44bzE3b2s', NULL, 8, NULL, NULL, 194, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('sex2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSENEejZjSlh0QWs', '2011-01-01 01:52:04', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSENEejZjSlh0QWs', NULL, 8, NULL, NULL, 195, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSTh2NFNmTTBFaU0', '2011-01-01 00:40:08', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSTh2NFNmTTBFaU0', NULL, 8, NULL, NULL, 196, '2016-04-21 12:35:24', '2016-04-21 12:35:24'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNTA4VUc0RHZGTms', '2011-01-01 00:46:20', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNTA4VUc0RHZGTms', NULL, 8, NULL, NULL, 197, '2016-04-21 12:35:30', '2016-04-21 12:35:30'),
	('devils - push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNnhlNm9OVWQ1Nk0', '2011-01-01 01:22:20', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNnhlNm9OVWQ1Nk0', NULL, 8, NULL, NULL, 198, '2016-04-21 12:35:36', '2016-04-21 12:35:36'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZE93c3B3OUEwWXc', '2011-01-01 00:23:50', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZE93c3B3OUEwWXc', NULL, 9, NULL, NULL, 199, '2016-04-21 12:43:24', '2016-04-21 12:43:24'),
	('hélico (6).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eY3N6NXhsNHBGSHM', '2011-01-01 01:36:28', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eY3N6NXhsNHBGSHM', NULL, 9, NULL, NULL, 200, '2016-04-21 12:44:14', '2016-04-21 12:44:14'),
	('hélico (4).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eV1JUWUk5QUhGQ0U', '2011-01-01 01:29:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eV1JUWUk5QUhGQ0U', NULL, 9, NULL, NULL, 201, '2016-04-21 12:44:15', '2016-04-21 12:44:15'),
	('hélico (5).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWVhNUHkxVVN0b2s', '2011-01-01 01:35:44', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWVhNUHkxVVN0b2s', NULL, 9, NULL, NULL, 202, '2016-04-21 12:44:15', '2016-04-21 12:44:15'),
	('hélico (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQVRjZmctUHktV2s', '2011-01-01 01:29:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQVRjZmctUHktV2s', NULL, 9, NULL, NULL, 203, '2016-04-21 12:44:15', '2016-04-21 12:44:15'),
	('hélico (7).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQnRqc0Y5eVUwekk', '2011-01-01 01:40:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQnRqc0Y5eVUwekk', NULL, 9, NULL, NULL, 204, '2016-04-21 12:44:20', '2016-04-21 12:44:20'),
	('....MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRFJ6cE5yNnpoZGs', '2011-01-01 00:08:38', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRFJ6cE5yNnpoZGs', NULL, 9, NULL, NULL, 205, '2016-04-21 12:44:20', '2016-04-21 12:44:20'),
	('hélico (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQ0M1QlhRcUxzWm8', '2011-01-01 01:25:10', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQ0M1QlhRcUxzWm8', NULL, 9, NULL, NULL, 206, '2016-04-21 12:44:20', '2016-04-21 12:44:20'),
	('duck2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZFR4UFZzZWg3YjQ', '2011-01-01 01:51:12', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZFR4UFZzZWg3YjQ', NULL, 9, NULL, NULL, 207, '2016-04-21 12:44:26', '2016-04-21 12:44:26'),
	('hélico (8).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMUxPcW0yN0ZpQ1U', '2011-01-01 01:45:42', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMUxPcW0yN0ZpQ1U', NULL, 9, NULL, NULL, 208, '2016-04-21 12:44:40', '2016-04-21 12:44:40'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMXJOLVREeGxNZjg', '2011-01-01 01:01:42', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMXJOLVREeGxNZjg', NULL, 9, NULL, NULL, 209, '2016-04-21 12:44:41', '2016-04-21 12:44:41'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSlp2VFFXTUJ3bGM', '2011-01-01 00:28:18', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSlp2VFFXTUJ3bGM', NULL, 9, NULL, NULL, 210, '2016-04-21 12:44:41', '2016-04-21 12:44:41'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ed0pFNXAzT1k5ZXc', '2011-01-01 00:36:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ed0pFNXAzT1k5ZXc', NULL, 9, NULL, NULL, 211, '2016-04-21 12:44:41', '2016-04-21 12:44:41'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMWlsVjNvODBXSUE', '2011-01-01 00:49:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMWlsVjNvODBXSUE', NULL, 9, NULL, NULL, 212, '2016-04-21 12:44:49', '2016-04-21 12:44:49'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRjVka0szZzE4ODQ', '2011-01-01 01:12:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRjVka0szZzE4ODQ', NULL, 9, NULL, NULL, 213, '2016-04-21 12:44:58', '2016-04-21 12:44:58'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecV9KUkJGYVctbDQ', '2011-01-01 00:19:00', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecV9KUkJGYVctbDQ', NULL, 9, NULL, NULL, 214, '2016-04-21 12:44:58', '2016-04-21 12:44:58'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebWhiYlpsbmdHQVE', '2011-01-01 00:55:40', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebWhiYlpsbmdHQVE', NULL, 9, NULL, NULL, 215, '2016-04-21 12:44:59', '2016-04-21 12:44:59'),
	('hélico (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVk1uZjVzNk13elU', '2011-01-01 01:19:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVk1uZjVzNk13elU', NULL, 9, NULL, NULL, 216, '2016-04-21 12:45:05', '2016-04-21 12:45:05'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeDdnUXNuNzMyZlE', '2011-01-01 00:44:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeDdnUXNuNzMyZlE', NULL, 9, NULL, NULL, 217, '2016-04-21 12:45:05', '2016-04-21 12:45:05'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ea3BNUkE2eHF3LVk', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ea3BNUkE2eHF3LVk', NULL, 10, NULL, 1, 218, '2016-04-21 18:09:13', '2016-04-21 18:09:39'),
	('devilfin.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWDcybXJ0eGdJaTA', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWDcybXJ0eGdJaTA', NULL, 10, NULL, 3, 219, '2016-04-21 18:10:14', '2016-04-21 18:11:28'),
	('soloduck (4).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNndfZEZBQmtiWms', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNndfZEZBQmtiWms', NULL, 10, NULL, 4, 220, '2016-04-21 18:10:14', '2016-04-21 18:11:30'),
	('hélico (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSFBYci1QdlJnbjg', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSFBYci1QdlJnbjg', NULL, 10, NULL, 5, 221, '2016-04-21 18:10:19', '2016-04-21 18:11:33'),
	('hélico (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRFBsY3YxQzdoS1E', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRFBsY3YxQzdoS1E', NULL, 10, NULL, 5, 222, '2016-04-21 18:10:20', '2016-04-21 18:11:35'),
	('hélico (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeTBtazlnSFhFR1E', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeTBtazlnSFhFR1E', NULL, 10, NULL, 5, 223, '2016-04-21 18:10:20', '2016-04-21 18:11:38'),
	('soloduck (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecURWZldKa243YmM', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecURWZldKa243YmM', NULL, 10, NULL, 4, 224, '2016-04-21 18:10:28', '2016-04-21 18:11:41'),
	('soloduck (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVFZraDh1XzlRQms', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVFZraDh1XzlRQms', NULL, 10, NULL, 4, 225, '2016-04-21 18:10:34', '2016-04-21 18:11:07'),
	('soloduck (5).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQXRBaWdNeTF0bXM', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQXRBaWdNeTF0bXM', NULL, 10, NULL, 4, 226, '2016-04-21 18:10:34', '2016-04-21 18:11:43'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRkNaNUF5bTg1a0k', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRkNaNUF5bTg1a0k', NULL, 10, NULL, 3, 227, '2016-04-21 18:10:39', '2016-04-21 18:11:46'),
	('soloduck (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eM1l2NnYyQkpnZDQ', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eM1l2NnYyQkpnZDQ', NULL, 10, NULL, 4, 228, '2016-04-21 18:10:39', '2016-04-21 18:11:10'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUEVNOVNiWnNxbms', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUEVNOVNiWnNxbms', NULL, 10, NULL, 2, 229, '2016-04-21 18:10:43', '2016-04-21 18:11:02'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eamJGZi12SGo3eEE', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eamJGZi12SGo3eEE', NULL, 10, NULL, 11, 230, '2016-04-21 18:10:43', '2016-04-21 18:11:49'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eYWxBZVEwdWthOG8', '2016-01-29 06:18:34', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eYWxBZVEwdWthOG8', NULL, 10, NULL, 7, 231, '2016-04-21 18:10:46', '2016-04-21 18:11:52'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNjRwTUN1TjV6d2s', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNjRwTUN1TjV6d2s', NULL, 10, NULL, 8, 232, '2016-04-21 18:10:50', '2016-04-21 18:11:15'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eb1BsVDFDYTRISjg', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eb1BsVDFDYTRISjg', NULL, 10, NULL, 12, 233, '2016-04-21 18:10:50', '2016-04-21 18:11:18'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSTBHMUgyS1N5aGM', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSTBHMUgyS1N5aGM', NULL, 10, NULL, 9, 234, '2016-04-21 18:10:50', '2016-04-21 18:11:22'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ea1FOOVdyb2VQYjA', '2016-01-29 06:18:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ea1FOOVdyb2VQYjA', NULL, 10, NULL, 4, 235, '2016-04-21 18:10:55', '2016-04-21 18:11:25'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNGVPRnF3VHZDSUE', '2016-01-22 06:33:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNGVPRnF3VHZDSUE', NULL, 11, NULL, NULL, 236, '2016-04-21 18:42:58', '2016-04-21 18:42:58'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeThxclE3ZVJlbVk', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeThxclE3ZVJlbVk', NULL, 11, NULL, NULL, 237, '2016-04-21 18:43:19', '2016-04-21 18:43:19'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQ3E3bnpPbmNZTVE', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQ3E3bnpPbmNZTVE', NULL, 11, NULL, NULL, 238, '2016-04-21 18:45:37', '2016-04-21 18:45:37'),
	('new22.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTjhjV2ZLWXlUUlU', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTjhjV2ZLWXlUUlU', NULL, 11, NULL, NULL, 239, '2016-04-21 18:45:53', '2016-04-21 18:45:53'),
	('new1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eXzRsMnd5UWFGVTg', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eXzRsMnd5UWFGVTg', NULL, 11, NULL, NULL, 240, '2016-04-21 18:45:53', '2016-04-21 18:45:53'),
	('new12.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMUN5QktCZWE0Vmc', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMUN5QktCZWE0Vmc', NULL, 11, NULL, NULL, 241, '2016-04-21 18:45:54', '2016-04-21 18:45:54'),
	('new23.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edDBEaTE1N29nbTg', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edDBEaTE1N29nbTg', NULL, 11, NULL, 5, 242, '2016-04-21 18:45:55', '2016-04-22 13:41:18'),
	('new2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebWZnSFA2azViZ2s', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebWZnSFA2azViZ2s', NULL, 11, NULL, NULL, 243, '2016-04-21 18:45:57', '2016-04-21 18:45:57'),
	('new25.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eY2NFY1c2SEVyaXc', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eY2NFY1c2SEVyaXc', NULL, 11, NULL, NULL, 244, '2016-04-21 18:46:06', '2016-04-21 18:46:06'),
	('new24.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eck5HcXBYMU5veE0', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eck5HcXBYMU5veE0', NULL, 11, NULL, NULL, 245, '2016-04-21 18:46:07', '2016-04-21 18:46:07'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNmxlbWNGSU41bGM', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNmxlbWNGSU41bGM', NULL, 11, NULL, NULL, 246, '2016-04-21 18:46:11', '2016-04-21 18:46:11'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUklVZkxwZUtVbms', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUklVZkxwZUtVbms', NULL, 11, NULL, NULL, 247, '2016-04-21 18:46:12', '2016-04-21 18:46:12'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQmxTR1h0eTdHbUk', '2016-01-22 06:33:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQmxTR1h0eTdHbUk', NULL, 11, NULL, NULL, 248, '2016-04-21 18:46:14', '2016-04-21 18:46:14'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eS3A3aEw2UEh2aVk', '2016-01-22 06:33:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eS3A3aEw2UEh2aVk', NULL, 11, NULL, NULL, 249, '2016-04-21 18:46:15', '2016-04-21 18:46:15'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eb0Q0MmJja1VJOUE', '2016-01-22 06:33:52', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eb0Q0MmJja1VJOUE', NULL, 11, NULL, NULL, 250, '2016-04-21 18:46:15', '2016-04-21 18:46:15'),
	('duck funk.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTWdLZGtWZnFWS0E', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTWdLZGtWZnFWS0E', NULL, 11, NULL, NULL, 251, '2016-04-21 18:46:16', '2016-04-21 18:46:16'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eV0hkcUVyV2QyRDA', '2016-01-22 06:33:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eV0hkcUVyV2QyRDA', NULL, 11, NULL, NULL, 252, '2016-04-21 18:46:17', '2016-04-21 18:46:17'),
	('essai_coeurs_chance4.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQURuREx5WTF6dVE', '2011-01-01 00:07:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQURuREx5WTF6dVE', NULL, 12, NULL, NULL, 253, '2016-04-21 18:53:59', '2016-04-21 18:53:59'),
	('essai_coeurs_chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeTF0c0lVUjNXTjQ', '2010-12-31 23:54:54', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeTF0c0lVUjNXTjQ', NULL, 12, NULL, NULL, 254, '2016-04-21 18:54:01', '2016-04-21 18:54:01'),
	('bee (fin).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQzl3X0hWNWhNR3M', '2010-12-31 23:09:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQzl3X0hWNWhNR3M', NULL, 12, NULL, NULL, 255, '2016-04-21 18:54:01', '2016-04-21 18:54:01'),
	('essai_coeurs_chance3.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTFBCY2JWNDhjdmc', '2011-01-01 00:05:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTFBCY2JWNDhjdmc', NULL, 12, NULL, NULL, 256, '2016-04-21 18:54:01', '2016-04-21 18:54:01'),
	('essai_coeurs_chance2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eN2VIRm55aUFGZTg', '2010-12-31 23:59:08', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eN2VIRm55aUFGZTg', NULL, 12, NULL, NULL, 257, '2016-04-21 18:54:03', '2016-04-21 18:54:03'),
	('new2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebzAybWRBNVB0aUk', '2011-01-01 00:22:38', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebzAybWRBNVB0aUk', NULL, 12, NULL, 10, 258, '2016-04-21 18:54:11', '2016-04-22 13:40:51'),
	('sex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQUNOM1JJX0REVjQ', '2010-12-31 23:49:20', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQUNOM1JJX0REVjQ', NULL, 12, NULL, NULL, 259, '2016-04-21 18:54:22', '2016-04-21 18:54:22'),
	('devil.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebUFtekVpSGQ1WlU', '2010-12-31 23:33:18', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebUFtekVpSGQ1WlU', NULL, 12, NULL, NULL, 260, '2016-04-21 18:54:22', '2016-04-21 18:54:22'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eaXhZUEpvLUhGaXM', '2010-12-31 23:44:26', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eaXhZUEpvLUhGaXM', NULL, 12, NULL, NULL, 261, '2016-04-21 18:54:23', '2016-04-21 18:54:23'),
	('new1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecXpGMTdHLVZNNDQ', '2011-01-01 00:19:56', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecXpGMTdHLVZNNDQ', NULL, 12, NULL, 5, 262, '2016-04-21 18:54:23', '2016-04-22 13:40:45'),
	('yellove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eV2dKNWFvMGw5VFU', '2010-12-31 23:39:44', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eV2dKNWFvMGw5VFU', NULL, 12, NULL, NULL, 263, '2016-04-21 18:54:23', '2016-04-21 18:54:23'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZWxCcnNvcUJXdWc', '2010-12-31 23:28:24', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZWxCcnNvcUJXdWc', NULL, 12, NULL, NULL, 264, '2016-04-21 18:54:32', '2016-04-21 18:54:32'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecVktM3U3Z1hhR0k', '2010-12-31 23:19:40', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecVktM3U3Z1hhR0k', NULL, 12, NULL, NULL, 265, '2016-04-21 18:54:32', '2016-04-21 18:54:32'),
	('new (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eaFBpR3RXRFJzZm8', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eaFBpR3RXRFJzZm8', NULL, 13, NULL, NULL, 266, '2016-04-21 18:56:21', '2016-04-21 18:56:21'),
	('new (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVjlzbm5YYkE5MFE', '2016-03-24 13:31:50', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVjlzbm5YYkE5MFE', NULL, 13, NULL, NULL, 267, '2016-04-21 18:56:23', '2016-04-21 18:56:23'),
	('new (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eaDF4ajZWSDB3cHc', '2016-03-24 13:31:50', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eaDF4ajZWSDB3cHc', NULL, 13, NULL, NULL, 268, '2016-04-21 18:56:24', '2016-04-21 18:56:24'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWjk2Rzc5Q3NoZW8', '2016-03-24 13:31:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWjk2Rzc5Q3NoZW8', NULL, 13, NULL, NULL, 269, '2016-04-21 18:56:33', '2016-04-21 18:56:33'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRXI4dExCenFWT1U', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRXI4dExCenFWT1U', NULL, 13, NULL, NULL, 270, '2016-04-21 18:56:47', '2016-04-21 18:56:47'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSFFsWXJOd1R6Unc', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSFFsWXJOd1R6Unc', NULL, 13, NULL, NULL, 271, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('hélico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZFRPeExGYmk3NlE', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZFRPeExGYmk3NlE', NULL, 13, NULL, NULL, 272, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eRlkwd2IwVzU0Y1E', '2016-03-24 13:31:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eRlkwd2IwVzU0Y1E', NULL, 13, NULL, NULL, 273, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebGxZeWtpSzhfeXM', '2016-03-24 13:31:50', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebGxZeWtpSzhfeXM', NULL, 13, NULL, NULL, 274, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeVFIZWlMZWdTRE0', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeVFIZWlMZWdTRE0', NULL, 13, NULL, NULL, 275, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('sex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUlE1dkU1S0Rtcm8', '2016-03-24 13:31:50', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUlE1dkU1S0Rtcm8', NULL, 13, NULL, NULL, 276, '2016-04-21 18:56:55', '2016-04-21 18:56:55'),
	('helico2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVW5UWXNyYV9jb3c', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVW5UWXNyYV9jb3c', NULL, 13, NULL, NULL, 277, '2016-04-21 18:56:56', '2016-04-21 18:56:56'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebnV1NkphelpOcWs', '2016-03-24 13:31:48', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebnV1NkphelpOcWs', NULL, 13, NULL, NULL, 278, '2016-04-21 18:57:07', '2016-04-21 18:57:07'),
	('devils - push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edi1TbVp6YklWZGs', '2016-03-24 13:31:46', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edi1TbVp6YklWZGs', NULL, 13, NULL, NULL, 279, '2016-04-21 18:57:08', '2016-04-21 18:57:08'),
	('marbles3.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eb2g4a0NUNWRQVW8', '2016-02-17 10:31:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eb2g4a0NUNWRQVW8', NULL, 14, NULL, NULL, 280, '2016-04-21 18:59:02', '2016-04-21 18:59:02'),
	('push2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSS1Gc2FaemNBUkk', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSS1Gc2FaemNBUkk', NULL, 14, NULL, NULL, 281, '2016-04-21 18:59:03', '2016-04-21 18:59:03'),
	('Blouze.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVElNQTlEazlRYkU', '2015-12-05 08:03:12', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVElNQTlEazlRYkU', NULL, 14, NULL, NULL, 282, '2016-04-21 18:59:08', '2016-04-21 18:59:08'),
	('marbles1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eYnFtb1A3MWVKY0k', '2015-12-05 08:03:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eYnFtb1A3MWVKY0k', NULL, 14, NULL, NULL, 283, '2016-04-21 18:59:08', '2016-04-21 18:59:08'),
	('marbles4.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSFNJSjJDQ21oZkE', '2015-12-05 08:03:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSFNJSjJDQ21oZkE', NULL, 14, NULL, NULL, 284, '2016-04-21 18:59:08', '2016-04-21 18:59:08'),
	('marbles2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebzI4NHlRbE1oRk0', '2016-02-17 10:31:32', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebzI4NHlRbE1oRk0', NULL, 14, NULL, NULL, 285, '2016-04-21 18:59:09', '2016-04-21 18:59:09'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eSTVTWWRVVzlGYnc', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eSTVTWWRVVzlGYnc', NULL, 14, NULL, NULL, 286, '2016-04-21 18:59:18', '2016-04-21 18:59:18'),
	('push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eWmJESGhmcHpDZ2c', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eWmJESGhmcHpDZ2c', NULL, 14, NULL, NULL, 287, '2016-04-21 18:59:19', '2016-04-21 18:59:19'),
	('push3.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVDRCOHdsVVNrVms', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVDRCOHdsVVNrVms', NULL, 14, NULL, NULL, 288, '2016-04-21 18:59:22', '2016-04-21 18:59:22'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMFRndjEzbVFiVDg', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMFRndjEzbVFiVDg', NULL, 14, NULL, NULL, 289, '2016-04-21 18:59:37', '2016-04-21 18:59:37'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUTVGMnk0YTljREE', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUTVGMnk0YTljREE', NULL, 14, NULL, NULL, 290, '2016-04-21 18:59:41', '2016-04-21 18:59:41'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eLU05Vm9raG1KSUE', '2015-12-05 08:03:12', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eLU05Vm9raG1KSUE', NULL, 14, NULL, NULL, 291, '2016-04-21 18:59:41', '2016-04-21 18:59:41'),
	('moon1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTHFDbmJrODZuVWc', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTHFDbmJrODZuVWc', NULL, 14, NULL, NULL, 292, '2016-04-21 18:59:41', '2016-04-21 18:59:41'),
	('moon2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eeE1lRkdCVERxLU0', '2015-12-05 08:03:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eeE1lRkdCVERxLU0', NULL, 14, NULL, NULL, 293, '2016-04-21 18:59:50', '2016-04-21 18:59:50'),
	('duck3.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTUdJbXhzdFJMQzQ', '2015-12-05 08:03:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTUdJbXhzdFJMQzQ', NULL, 14, NULL, NULL, 294, '2016-04-21 18:59:50', '2016-04-21 18:59:50'),
	('duck2.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUFo1c2VHMG9NNTA', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUFo1c2VHMG9NNTA', NULL, 14, NULL, NULL, 295, '2016-04-21 18:59:50', '2016-04-21 18:59:50'),
	('duck1.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eenhieG5lVGxhaDg', '2015-12-05 08:03:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eenhieG5lVGxhaDg', NULL, 14, NULL, NULL, 296, '2016-04-21 18:59:51', '2016-04-21 18:59:51'),
	('bee.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTmlKUlJ1RnFiZW8', '2016-04-15 22:34:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTmlKUlJ1RnFiZW8', NULL, 23, NULL, 1, 297, '2016-04-22 13:29:56', '2016-04-22 13:31:22'),
	('new (1).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edW5wd1ZrOXJ2a2c', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edW5wd1ZrOXJ2a2c', NULL, 23, NULL, 10, 298, '2016-04-22 13:30:41', '2016-04-22 13:39:00'),
	('new (3).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eTFlVZENPTzBOY3c', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eTFlVZENPTzBOY3c', NULL, 23, NULL, 10, 299, '2016-04-22 13:30:55', '2016-04-22 13:38:58'),
	('NES.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eblIyeWFWOEx6WHc', '2011-01-01 00:08:38', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eblIyeWFWOEx6WHc', NULL, 23, NULL, 15, 300, '2016-04-22 13:30:58', '2016-04-22 13:38:15'),
	('new (4).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eQjJUdjJidU1tWDg', '2016-04-15 22:34:18', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eQjJUdjJidU1tWDg', NULL, 23, NULL, 10, 301, '2016-04-22 13:31:01', '2016-04-22 13:38:57'),
	('new (2).MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eUXktOXFFZzBNQW8', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eUXktOXFFZzBNQW8', NULL, 23, NULL, 10, 302, '2016-04-22 13:31:06', '2016-04-22 13:38:55'),
	('cosmic.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eZWE3d1FRTk5WaVk', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eZWE3d1FRTk5WaVk', NULL, 23, NULL, 16, 303, '2016-04-22 13:31:07', '2016-04-22 13:32:41'),
	('chance.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ebVdrVUdobGVUS2s', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ebVdrVUdobGVUS2s', NULL, 23, NULL, 2, 304, '2016-04-22 13:31:11', '2016-04-22 13:31:37'),
	('kiss.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eMHRVaGtMTTRuczA', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eMHRVaGtMTTRuczA', NULL, 23, NULL, 7, 305, '2016-04-22 13:31:12', '2016-04-22 13:31:40'),
	('lips.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-edDNYZDNYcHg1dk0', '2016-04-15 22:34:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-edDNYZDNYcHg1dk0', NULL, 23, NULL, 8, 306, '2016-04-22 13:31:14', '2016-04-22 13:31:30'),
	('yelove.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eN2p2NGRHaWViZUE', '2016-04-15 22:34:14', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eN2p2NGRHaWViZUE', NULL, 23, NULL, 12, 307, '2016-04-22 13:31:14', '2016-04-22 13:31:32'),
	('helico.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eVW1aUkE5eEVTYU0', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eVW1aUkE5eEVTYU0', NULL, 23, NULL, 5, 308, '2016-04-22 13:31:15', '2016-04-22 13:31:43'),
	('moon.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-ecWI2N3JuWEtaZFk', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-ecWI2N3JuWEtaZFk', NULL, 23, NULL, 9, 309, '2016-04-22 13:31:15', '2016-04-22 13:31:45'),
	('sex.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eNzl6cjZGTmpodGc', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eNzl6cjZGTmpodGc', NULL, 23, NULL, 6, 310, '2016-04-22 13:31:16', '2016-04-22 13:31:48'),
	('duck.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eS2dHOU4tdEduMGM', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eS2dHOU4tdEduMGM', NULL, 23, NULL, 4, 311, '2016-04-22 13:31:18', '2016-04-22 13:31:50'),
	('devils - push.MP3', 'https://docs.google.com/uc?export=download&id=0B5UYlocMkj-eYWx3ZXZ0cmtDak0', '2016-04-15 22:34:16', NULL, 'https://drive.google.com/open?id=0B5UYlocMkj-eYWx3ZXZ0cmtDak0', NULL, 23, NULL, 3, 312, '2016-04-22 13:31:18', '2016-04-22 13:31:52');
/*!40000 ALTER TABLE `enregistrement` ENABLE KEYS */;


-- Export de la structure de table roadie. gadjo
CREATE TABLE IF NOT EXISTS `gadjo` (
  `pseudo` varchar(50) DEFAULT NULL,
  `téléphone` varchar(14) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Personne pouvant être un musicien et pouvant jouer dans un groupe';

-- Export de données de la table roadie.gadjo : ~5 rows (environ)
/*!40000 ALTER TABLE `gadjo` DISABLE KEYS */;
REPLACE INTO `gadjo` (`pseudo`, `téléphone`, `id`, `createdAt`, `updatedAt`) VALUES
	('Matt DaBass', NULL, 1, '2016-03-01 14:33:07', '2016-03-01 14:33:07'),
	('Pierre K.', NULL, 2, '2016-03-01 14:34:43', '2016-03-01 14:34:43'),
	('Guéno', NULL, 3, '2016-03-01 14:34:48', '2016-03-01 14:34:48'),
	('Colas', NULL, 4, '2016-03-01 14:34:51', '2016-03-01 14:34:51'),
	('Mickaël', NULL, 5, '2016-03-01 14:34:57', '2016-03-01 14:34:57'),
	('JM', NULL, 6, '2016-03-01 14:35:03', '2016-03-01 14:35:03');
/*!40000 ALTER TABLE `gadjo` ENABLE KEYS */;


-- Export de la structure de table roadie. groupe
CREATE TABLE IF NOT EXISTS `groupe` (
  `nom` varchar(50) DEFAULT NULL,
  `motDePasse` varchar(50) DEFAULT NULL COMMENT 'Mot de passe du groupe pour se connecter à l''appli',
  `dureeRepete` int(10) unsigned DEFAULT '120' COMMENT 'Durée de la répète en générale (minutes)',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.groupe : ~2 rows (environ)
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
REPLACE INTO `groupe` (`nom`, `motDePasse`, `dureeRepete`, `id`, `createdAt`, `updatedAt`) VALUES
	('Grand Palace Trio', '*BA382B2B2F8B4CF6B924AAA946584033D6F5A337', 120, 1, '2016-03-01 16:08:29', '2016-03-01 16:08:29'),
	('Caféine', NULL, 120, 2, '2016-03-01 16:08:29', '2016-03-01 16:08:29');
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;


-- Export de la structure de table roadie. local
CREATE TABLE IF NOT EXISTS `local` (
  `nom` varchar(50) NOT NULL COMMENT 'Exemple : "Au Jardin Morderne" ou "Chez Guéno"',
  `adresse` varchar(255) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT 'Image du local pour faire joli',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.local : ~4 rows (environ)
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
REPLACE INTO `local` (`nom`, `adresse`, `id`, `image`, `createdAt`, `updatedAt`) VALUES
	('Au Jardin moderne', NULL, 1, 'http://www.rennesacoupdecoeur.fr/wp-content/uploads/2012/12/jardin-moderne-0411.jpg', '2016-03-01 16:08:37', '2016-03-01 16:56:31'),
	('Chez Guéno', NULL, 2, NULL, '2016-03-01 16:08:37', '2016-03-01 16:56:33'),
	('Chez Pierre', NULL, 3, NULL, '2016-03-01 16:08:37', '2016-03-01 16:08:37'),
	('Au cercle Paul-Bert', NULL, 4, NULL, '2016-03-01 16:08:37', '2016-03-01 16:08:37');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;


-- Export de la structure de table roadie. membre
CREATE TABLE IF NOT EXISTS `membre` (
  `gadjoId` int(10) unsigned NOT NULL,
  `groupeId` int(10) unsigned NOT NULL,
  `instrument` varchar(50) DEFAULT NULL,
  `chanteur` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'bool : chanteur (lead) ?',
  `choriste` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'bool : choriste',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_membre_gadjo` (`gadjoId`),
  KEY `FK_membre_groupe` (`groupeId`),
  CONSTRAINT `FK_membre_gadjo` FOREIGN KEY (`gadjoId`) REFERENCES `gadjo` (`id`),
  CONSTRAINT `FK_membre_groupe` FOREIGN KEY (`groupeId`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.membre : ~7 rows (environ)
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
REPLACE INTO `membre` (`gadjoId`, `groupeId`, `instrument`, `chanteur`, `choriste`, `id`) VALUES
	(1, 2, 'Basse', 0, 1, 1),
	(1, 1, 'Basse', 0, 1, 2),
	(4, 2, 'Guitare', 1, 0, 3),
	(3, 2, 'Batterie', 0, 0, 4),
	(6, 1, 'Batterie', 0, 1, 5),
	(5, 1, 'Guitare', 1, 0, 6),
	(2, 2, 'Guitare', 1, 1, 7);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;


-- Export de la structure de table roadie. morceau
CREATE TABLE IF NOT EXISTS `morceau` (
  `nom` varchar(50) DEFAULT NULL,
  `groupe` int(10) unsigned DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_morceau_groupe` (`groupe`),
  CONSTRAINT `FK_morceau_groupe` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.morceau : ~12 rows (environ)
/*!40000 ALTER TABLE `morceau` DISABLE KEYS */;
REPLACE INTO `morceau` (`nom`, `groupe`, `id`, `createdAt`, `updatedAt`) VALUES
	('Bee', 1, 1, '2016-03-01 12:12:39', '2016-04-22 13:31:22'),
	('Second Chance', 1, 2, '2016-03-01 12:15:18', '2016-04-22 13:31:37'),
	('Devil', 1, 3, '2016-03-01 12:15:25', '2016-04-22 13:31:52'),
	('Duck', 1, 4, '2016-03-01 12:15:31', '2016-04-22 13:31:50'),
	('Hélico', 1, 5, '2016-03-01 12:15:36', '2016-04-22 13:41:18'),
	('I Want Your Sex', 1, 6, '2016-03-01 12:15:42', '2016-04-22 13:31:48'),
	('Kiss', 1, 7, '2016-03-01 12:15:50', '2016-04-22 13:31:40'),
	('Lips', 1, 8, '2016-03-01 12:15:54', '2016-04-22 13:31:30'),
	('Moon', 1, 9, '2016-03-01 12:16:00', '2016-04-22 13:31:45'),
	('(new) not NES', 1, 10, '2016-03-01 12:16:05', '2016-04-22 13:40:51'),
	('Push', 1, 11, '2016-03-01 12:16:17', '2016-04-21 18:11:49'),
	('Yellove', 1, 12, '2016-03-01 12:16:22', '2016-04-22 13:31:32'),
	('Downtown', 2, 13, '2016-03-29 17:54:26', '2016-03-29 17:54:31'),
	('You Know Why', 2, 14, '2016-03-29 17:54:51', '2016-03-29 17:54:55'),
	('NES', 1, 15, '2016-04-22 13:32:17', '2016-04-22 13:37:18'),
	('Cosmic', 1, 16, '2016-04-22 13:32:37', '2016-04-22 13:32:41');
/*!40000 ALTER TABLE `morceau` ENABLE KEYS */;


-- Export de la structure de table roadie. repete
CREATE TABLE IF NOT EXISTS `repete` (
  `debut` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fin` datetime DEFAULT CURRENT_TIMESTAMP,
  `groupe` int(10) unsigned NOT NULL,
  `local` int(10) unsigned NOT NULL,
  `notes` tinytext,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `googleId` varchar(50) DEFAULT NULL COMMENT 'Lien vers un dossier Google Drive',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_repete_local` (`local`),
  KEY `FK_répète_groupe` (`groupe`),
  CONSTRAINT `FK_repete_local` FOREIGN KEY (`local`) REFERENCES `local` (`id`),
  CONSTRAINT `FK_répète_groupe` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Export de données de la table roadie.repete : ~9 rows (environ)
/*!40000 ALTER TABLE `repete` DISABLE KEYS */;
REPLACE INTO `repete` (`debut`, `fin`, `groupe`, `local`, `notes`, `id`, `googleId`, `createdAt`, `updatedAt`) VALUES
	('2016-02-26 20:00:00', '2016-02-26 22:00:00', 1, 1, NULL, 1, NULL, '2016-03-01 16:07:37', '2016-03-01 16:07:37'),
	('2016-02-12 20:00:00', '2016-02-12 22:00:00', 1, 1, NULL, 2, NULL, '2016-03-01 16:07:37', '2016-03-01 16:07:37'),
	('2016-03-04 19:00:00', '2016-03-04 21:00:00', 1, 1, NULL, 3, NULL, '2016-03-01 16:07:37', '2016-03-01 16:07:37'),
	('2016-03-11 19:00:00', '2016-03-11 21:00:00', 1, 1, NULL, 4, NULL, '2016-03-03 16:55:25', '2016-03-03 16:55:26'),
	('2016-03-15 19:00:00', '2016-03-29 21:00:00', 2, 3, NULL, 5, NULL, '2016-03-29 15:23:30', '2016-03-29 15:23:30'),
	('2016-04-01 20:00:00', '2016-04-01 22:00:00', 1, 1, NULL, 7, '0B5UYlocMkj-eR3JJMm5keDR1aFk', '2016-04-21 12:32:23', '2016-04-21 18:24:23'),
	('2016-03-11 20:00:00', '2016-03-11 22:00:00', 1, 1, NULL, 8, NULL, '2016-04-21 12:34:25', '2016-04-21 12:43:04'),
	('2016-02-19 20:00:00', '2016-02-19 22:00:00', 1, 1, NULL, 9, NULL, '2016-04-21 12:42:45', '2016-04-21 12:42:45'),
	('2016-01-28 20:00:00', '2016-01-28 22:00:00', 1, 1, NULL, 10, NULL, '2016-04-21 18:07:00', '2016-04-21 18:07:00'),
	('2016-01-21 20:00:00', '2016-04-21 22:00:00', 1, 1, NULL, 11, '0B5UYlocMkj-eNUl0b1pmcGNZRXc', '2016-04-21 18:41:35', '2016-04-21 18:42:19'),
	('2016-01-08 20:00:00', '2016-01-08 22:00:00', 1, 1, NULL, 12, '0B5UYlocMkj-eT2QwYkI0OUxpOG8', '2016-04-21 18:52:09', '2016-04-21 18:52:25'),
	('2016-03-18 20:00:00', '2016-03-18 22:00:00', 1, 1, NULL, 13, '0B5UYlocMkj-eVEprZmE2WFB4cmc', '2016-04-21 18:55:48', '2016-04-21 18:55:48'),
	('2015-12-04 20:00:00', '2015-12-04 22:00:00', 1, 1, NULL, 14, '0B5UYlocMkj-edjVRWEFrd2djWUU', '2016-04-21 18:58:45', '2016-04-21 18:58:45'),
	('2016-04-15 20:00:00', '2016-04-15 22:00:00', 1, 1, NULL, 23, '0B5UYlocMkj-eXzFxRUZldFdwQ2c', '2016-04-22 13:14:23', '2016-04-22 13:14:23');
/*!40000 ALTER TABLE `repete` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
