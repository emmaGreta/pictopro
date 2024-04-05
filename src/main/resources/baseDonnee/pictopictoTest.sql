--
-- supprimer ou création de la base donnée si elle n'exite pas 
--
CREATE DATABASE IF NOT EXISTS pictoproDb ;
USE pictoproDb;

--
-- création d'un utilisateur avec tout les privilèges
--
DROP USER IF EXISTS 'emma'@'%';
CREATE USER 'emma'@'%' IDENTIFIED BY 'poseidon';
GRANT ALL PRIVILEGES ON *.* TO 'emma'@'%';
FLUSH PRIVILEGES;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `therapist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Structure de la table `institution`
--

CREATE TABLE `institution` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `therapist_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `school_grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `pictogram`
--

CREATE TABLE `pictogram` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `update_at` datetime NOT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `subcategory_id_id` int(11) DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `picto_actions`
--

CREATE TABLE `picto_actions` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_actions_sentence`
--

CREATE TABLE `picto_actions_sentence` (
  `picto_actions_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `picto_adjectifs`
--

CREATE TABLE `picto_adjectifs` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Structure de la table `picto_adjectifs_sentence`
--

CREATE TABLE `picto_adjectifs_sentence` (
  `picto_adjectifs_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_aliments`
--

CREATE TABLE `picto_aliments` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_aliments_sentence`
--

CREATE TABLE `picto_aliments_sentence` (
  `picto_aliments_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_animaux`
--

CREATE TABLE `picto_animaux` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_animaux_sentence`
--

CREATE TABLE `picto_animaux_sentence` (
  `picto_animaux_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_autres_mots`
--

CREATE TABLE `picto_autres_mots` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_autres_mots_sentence`
--

CREATE TABLE `picto_autres_mots_sentence` (
  `picto_autres_mots_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_boissons`
--

CREATE TABLE `picto_boissons` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_boissons_sentence`
--

CREATE TABLE `picto_boissons_sentence` (
  `picto_boissons_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `picto_chiffres`
--

CREATE TABLE `picto_chiffres` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_chiffres_sentence`
--

CREATE TABLE `picto_chiffres_sentence` (
  `picto_chiffres_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_comportements`
--

CREATE TABLE `picto_comportements` (
  `id` int(11) NOT NULL,
  `pictograms_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluriel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masculin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_sing` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feminin_plur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_futur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_sing_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prem_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deux_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trois_pers_plur_passe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Structure de la table `picto_comportements_sentence`
--

CREATE TABLE `picto_comportements_sentence` (
  `picto_comportements_id` int(11) NOT NULL,
  `sentence_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
