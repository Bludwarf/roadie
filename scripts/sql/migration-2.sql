USE `shumis`;

-- Ajout de la colonne googleFileId
ALTER TABLE `enregistrement`
	ADD COLUMN `googleFileId` VARCHAR(50) NULL DEFAULT NULL COMMENT 'fileId dans Google Drive' AFTER `morceau`;

-- Remplissage à partir du lien HREF dans la colonne audio
UPDATE enregistrement
SET googleFileId = SUBSTRING_INDEX(audio,'=',-1);

-- Suppression des colonnes qui peuvent être calculées à partir de googleFileId
ALTER TABLE `enregistrement`
	DROP COLUMN `audio`,
	DROP COLUMN `fichier`;
