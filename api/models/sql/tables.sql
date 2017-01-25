-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.6.30 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour roadie
CREATE DATABASE IF NOT EXISTS `roadie` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `roadie`;

-- Export de la structure de la table roadie. enregistrement
CREATE TABLE IF NOT EXISTS `enregistrement` (
  `nom` varchar(50) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL COMMENT 'Timestamp du fichier original',
  `taille` int(11) DEFAULT NULL COMMENT 'Taille du fichier original',
  `duree` smallint(5) unsigned DEFAULT NULL,
  `repete` int(10) unsigned NOT NULL,
  `ordre` int(11) DEFAULT NULL COMMENT 'Ordre dans la répète',
  `morceau` int(10) unsigned DEFAULT NULL,
  `googleFileId` varchar(50) DEFAULT NULL COMMENT 'fileId dans Google Drive',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `repeteId_ordre` (`repete`,`ordre`),
  KEY `FK_enregistrement_morceau` (`morceau`),
  CONSTRAINT `FK_enregistrement_morceau` FOREIGN KEY (`morceau`) REFERENCES `morceau` (`id`),
  CONSTRAINT `FK_enregistrement_repete` FOREIGN KEY (`repete`) REFERENCES `repete` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. gadjo
CREATE TABLE IF NOT EXISTS `gadjo` (
  `pseudo` varchar(50) DEFAULT NULL,
  `téléphone` varchar(14) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Personne pouvant être un musicien et pouvant jouer dans un groupe';

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. groupe
CREATE TABLE IF NOT EXISTS `groupe` (
  `nom` varchar(50) DEFAULT NULL,
  `motDePasse` varchar(50) DEFAULT NULL COMMENT 'Mot de passe du groupe pour se connecter à l''appli',
  `dureeRepete` int(10) unsigned DEFAULT '120' COMMENT 'Durée de la répète en générale (minutes)',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. local
CREATE TABLE IF NOT EXISTS `local` (
  `nom` varchar(50) NOT NULL COMMENT 'Exemple : "Au Jardin Morderne" ou "Chez Guéno"',
  `adresse` varchar(255) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT 'Image du local pour faire joli',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. membre
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

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. morceau
CREATE TABLE IF NOT EXISTS `morceau` (
  `nom` varchar(50) DEFAULT NULL,
  `groupe` int(10) unsigned DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_morceau_groupe` (`groupe`),
  CONSTRAINT `FK_morceau_groupe` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table roadie. repete
CREATE TABLE IF NOT EXISTS `repete` (
  `debut` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `groupe` int(10) unsigned NOT NULL,
  `local` int(10) unsigned NOT NULL,
  `notes` tinytext,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `googleId` varchar(50) DEFAULT NULL COMMENT 'Lien vers un dossier Google Drive',
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_repete_local` (`local`),
  KEY `FK_répète_groupe` (`groupe`),
  CONSTRAINT `FK_repete_local` FOREIGN KEY (`local`) REFERENCES `local` (`id`),
  CONSTRAINT `FK_répète_groupe` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Les données exportées n'étaient pas sélectionnées.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
