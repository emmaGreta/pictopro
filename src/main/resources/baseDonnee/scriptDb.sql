--
-- Base de données : `pictopicto`
--
--
-- supprimer ou création de la base donnée si elle n'exite pas 
--
CREATE DATABASE IF NOT EXISTS pictopro ;
USE pictopro;

--
-- création d'un utilisateur avec tout les privilèges
--
DROP USER IF EXISTS 'emma'@'%';
CREATE USER 'emma'@'%' IDENTIFIED BY 'poseidon';
GRANT ALL PRIVILEGES ON *.* TO 'emma'@'%';
FLUSH PRIVILEGES;

-- --------------------------------------------------------