CREATE USER 'roadie'@'localhost' IDENTIFIED BY 'r04d13';

CREATE DATABASE roadie;

GRANT Alter ON roadie.* TO 'roadie'@'localhost' ;
GRANT Create ON roadie.* TO 'roadie'@'localhost' ;
GRANT Create view ON roadie.* TO 'roadie'@'localhost' ;
GRANT Delete ON roadie.* TO 'roadie'@'localhost' ;
GRANT Drop ON roadie.* TO 'roadie'@'localhost' ;
GRANT Grant option ON roadie.* TO 'roadie'@'localhost' ;
GRANT Index ON roadie.* TO 'roadie'@'localhost' ;
GRANT Insert ON roadie.* TO 'roadie'@'localhost' ;
GRANT References ON roadie.* TO 'roadie'@'localhost' ;
GRANT Select ON roadie.* TO 'roadie'@'localhost' ;
GRANT Show view ON roadie.* TO 'roadie'@'localhost' ;
GRANT Trigger ON roadie.* TO 'roadie'@'localhost' ;
GRANT Update ON roadie.* TO 'roadie'@'localhost' ;
FLUSH PRIVILEGES ;

-- Lancer ensuite api/models/SQL/tables.sql
-- puis api/models/SQL/foreign_keys.SQL (si ça marche !)