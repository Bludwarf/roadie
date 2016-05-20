ALTER TABLE `enregistrement`
	ADD COLUMN `googleFileId` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Id du fichier dans Google' AFTER `morceau`;
UPDATE enregistrement SET googleFileId = SUBSTRING_INDEX(fichier,'=',-1);
