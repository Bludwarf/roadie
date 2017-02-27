ALTER TABLE `morceau`
	CHANGE COLUMN `groupe` `groupe` INT(11) UNSIGNED NULL DEFAULT NULL AFTER `nom`,
	ADD CONSTRAINT `FK_morceau_groupe` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`);
