-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 19 nov. 2019 à 08:15
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `qcm_live`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etu` int(11) NOT NULL AUTO_INCREMENT,
  `genre` text COLLATE utf8_bin NOT NULL,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login_etu` text COLLATE utf8_bin NOT NULL,
  `pass_etu` text COLLATE utf8_bin NOT NULL,
  `matricule` text COLLATE utf8_bin NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL,
  `date_etu` date NOT NULL,
  `bConnect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_etu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etu`, `genre`, `nom`, `prenom`, `email`, `login_etu`, `pass_etu`, `matricule`, `num_grpe`, `date_etu`, `bConnect`) VALUES
(1, 'Mme.', 'Tadjer', 'Badr', 'Tadjer.Badr@etu.parisdescartes.fr', 'Badr', '81dc9bdb52d04dc20036dbd8313ed055', '22701001', '201', '2017-09-03', 0),
(2, 'Mme.', 'Pedron', 'Benjamin', 'Pedron.Benjamin@etu.parisdescartes.fr', 'Benjamin', '81dc9bdb52d04dc20036dbd8313ed055', '22701003', '201', '2017-09-03', 0),
(3, 'Mme.', 'Doudaev', 'Adam', 'Doudaev.Adam@etu.parisdescartes.fr', 'Adam', '81dc9bdb52d04dc20036dbd8313ed055', '22701003', '206', '2017-09-02', 0),
(4, 'Mme.', 'Nguyen', 'Vincent', 'Nguyen.Vincent@etu.parisdescartes.fr', 'Vincent', '81dc9bdb52d04dc20036dbd8313ed055', '22701004', '206', '2017-09-02', 0),
(5, 'Mme.', 'Keita', 'Dabi', 'Keita.Dabi@etu.parisdescartes.fr', 'Dabi', '81dc9bdb52d04dc20036dbd8313ed055', '22701005', '203', '2017-09-01', 1),
(6, 'M.', 'Fourrel', 'Oscar', 'Fourrel.Oscar@etu.parisdescartes.fr', 'Oscar', '81dc9bdb52d04dc20036dbd8313ed055', '22701006', '203', '2017-09-01', 0),
(7, 'M.', 'Chatianathan', 'Jeneifan', 'Chatianathan.Jeneifan@etu.parisdescartes.fr', 'Jeneifan', '81dc9bdb52d04dc20036dbd8313ed055', '22701007', '203', '2017-09-01', 0),
(8, 'M.', 'Boirard', 'Cédric', 'Boirard.Cédric@etu.parisdescartes.fr', 'Cédric', '81dc9bdb52d04dc20036dbd8313ed055', '22701008', '207', '2017-10-01', 0),
(9, 'M.', 'BenBilal', 'Bilal', 'BenBilal.Bilal@etu.parisdescartes.fr', 'Bilal', '81dc9bdb52d04dc20036dbd8313ed055', '22701009', '207', '2017-10-01', 0),
(10, 'M.', 'BenHouassini', 'Houassini', 'BenHouassini.Houassini@etu.parisdescartes.fr', 'Houassini', '81dc9bdb52d04dc20036dbd8313ed055', '22701000', '207', '2017-10-01', 0);

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id_grpe` int(11) NOT NULL,
  `num_grpe` int(11) NOT NULL,
  PRIMARY KEY (`id_grpe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_grpe`, `num_grpe`) VALUES
(0, 201),
(1, 203),
(2, 206),
(3, 207);

-- --------------------------------------------------------

--
-- Structure de la table `grpetudiants`
--

DROP TABLE IF EXISTS `grpetudiants`;
CREATE TABLE IF NOT EXISTS `grpetudiants` (
  `id_grpe` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  PRIMARY KEY (`id_grpe`,`id_etu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `grpetudiants`
--

INSERT INTO `grpetudiants` (`id_grpe`, `id_etu`) VALUES
(0, 1),
(0, 2),
(1, 5),
(1, 6),
(1, 7),
(2, 3),
(2, 4),
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `note2` int(11) NOT NULL,
  PRIMARY KEY (`id_note`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `id_test`, `id_etu`, `note`, `note2`) VALUES
(12, 5, 10, 2, 1),
(11, 5, 9, 4, 2),
(10, 5, 8, 6, 4),
(9, 4, 4, 8, 18),
(8, 4, 3, 6, 15),
(7, 2, 7, 16, 8),
(6, 2, 6, 14, 6),
(5, 2, 5, 13, 5),
(4, 3, 2, 19, 28),
(3, 3, 1, 17, 25),
(2, 1, 2, 18, 36),
(1, 1, 1, 20, 40);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text COLLATE utf8_bin NOT NULL,
  `prenom` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `login_prof` text COLLATE utf8_bin NOT NULL,
  `pass_prof` text COLLATE utf8_bin NOT NULL,
  `date_prof` date NOT NULL,
  `bConnect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `nom`, `prenom`, `email`, `login_prof`, `pass_prof`, `date_prof`, `bConnect`) VALUES
(1, 'Poitrenaud', 'Denis', 'poitrenaud.denis@parisdescartes.fr', 'Denis', '81dc9bdb52d04dc20036dbd8313ed055', '2017-10-01', 0),
(2, 'Ilie', 'Jean-Michel', 'ilie.michel@parisdescartes.fr', 'JeanMichel', '81dc9bdb52d04dc20036dbd8313ed055', '2017-10-01', 1),
(3, 'Frappat', 'Linda', 'frappat.linda@parisdescartes.fr', 'Linda', '81dc9bdb52d04dc20036dbd8313ed055', '2017-10-01', 0),
(4, 'Ouziri', 'Mourad', 'ouziri.mourad@parisdescartes.fr', 'Mourad', '81dc9bdb52d04dc20036dbd8313ed055', '2017-10-01', 0),
(5, 'Moungla', 'Hassine', 'moungla.hassine@parisdescartes.fr', 'Hassine', '81dc9bdb52d04dc20036dbd8313ed055', '2017-10-01', 0);

-- --------------------------------------------------------

--
-- Structure de la table `qcm`
--

DROP TABLE IF EXISTS `qcm`;
CREATE TABLE IF NOT EXISTS `qcm` (
  `id_qcm` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `bAutorise` tinyint(1) NOT NULL,
  `bBloque` tinyint(1) NOT NULL,
  `bAnnule` int(11) NOT NULL,
  PRIMARY KEY (`id_qcm`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `qcm`
--

INSERT INTO `qcm` (`id_qcm`, `id_test`, `id_quest`, `bAutorise`, `bBloque`, `bAnnule`) VALUES
(1, 1, 1, 1, 0, 0),
(2, 1, 2, 1, 0, 0),
(3, 1, 3, 1, 0, 0),
(4, 2, 4, 1, 0, 0),
(5, 2, 5, 1, 0, 0),
(6, 2, 6, 1, 0, 0),
(7, 3, 7, 1, 0, 0),
(8, 3, 8, 1, 0, 0),
(9, 4, 9, 1, 0, 0),
(10, 4, 10, 1, 0, 0),
(11, 4, 11, 1, 0, 0),
(12, 4, 12, 1, 0, 0),
(13, 5, 13, 1, 0, 0),
(14, 5, 14, 1, 0, 0),
(15, 2, 15, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id_quest` int(11) NOT NULL AUTO_INCREMENT,
  `id_theme` int(11) NOT NULL,
  `titre` text COLLATE utf8_bin NOT NULL,
  `texte` text COLLATE utf8_bin NOT NULL,
  `bmultiple` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_quest`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id_quest`, `id_theme`, `titre`, `texte`, `bmultiple`) VALUES
(1, 1, 'Flotant', 'Quel est le type Flotant ?', 0),
(2, 1, 'Double', 'Quel est le type Double ?', 0),
(3, 1, 'Entier', 'Quel est le type entier ?', 1),
(4, 2, 'PHP', 'Que veut dire PHP ?', 0),
(5, 2, 'PDO', 'Que veut dire PDO ?', 0),
(6, 2, 'MVC', 'Que veut dire MVC ?', 1),
(7, 3, 'Juridiction', 'Quelle est la juriduction saisie pour un Divorce ?', 1),
(8, 3, 'Juridiction', 'Quelle est la juriduction saisie pour un Crime ?', 1),
(9, 4, 'SGBD', 'Que veut dire SGBD ?', 0),
(10, 4, 'Inserer', 'On insert des données avec ?', 0),
(11, 4, 'Recupère', 'On récupère des données avec ?', 0),
(12, 4, 'Moyenne', 'On moyenne des données avec ?', 0),
(13, 5, 'CPT', 'Que veut dire CPT ?', 0),
(14, 5, 'DNS', 'Que veut dire DNS ?', 0),
(15, 2, 'PHP', 'Balise php', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id_rep` int(11) NOT NULL AUTO_INCREMENT,
  `id_quest` int(11) NOT NULL,
  `texte_rep` text COLLATE utf8_bin NOT NULL,
  `bvalide` tinyint(1) NOT NULL,
  `bAutorise` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_rep`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id_rep`, `id_quest`, `texte_rep`, `bvalide`, `bAutorise`) VALUES
(1, 1, 'Integer', 0, 1),
(2, 1, 'float', 1, 1),
(3, 1, 'int', 0, 1),
(4, 1, 'Double', 0, 1),
(5, 2, 'float', 0, 1),
(6, 2, 'int', 0, 1),
(7, 2, 'double', 1, 1),
(8, 3, 'Integer', 1, 1),
(9, 3, 'float', 0, 1),
(10, 3, 'int', 1, 1),
(11, 3, 'double', 0, 1),
(12, 4, 'Program Hypertext Preprocessor', 0, 1),
(13, 4, 'Hypertext Preprocessor', 1, 1),
(14, 4, 'Programme Hyper Précis', 0, 1),
(15, 5, 'PHP Data Object', 1, 1),
(16, 5, 'Programme Data Object', 0, 1),
(17, 5, 'Program Data Object', 0, 1),
(18, 6, 'Modèle Vue Controleur', 1, 1),
(19, 6, 'Modélisation Conception Vue', 0, 1),
(20, 6, 'Model View Controller', 1, 1),
(21, 7, 'Penale', 0, 1),
(22, 7, 'Civil', 1, 1),
(23, 8, 'Administrative', 0, 1),
(24, 8, 'Penale', 1, 1),
(25, 9, 'Système de Gestion de Base de Données', 1, 1),
(26, 9, 'Système de Grande Base de Données', 0, 1),
(27, 9, 'Sens de Gestion de Base de Données', 0, 1),
(28, 10, 'UPDATE', 0, 1),
(29, 10, 'SELECT', 0, 1),
(30, 10, 'DISINCT', 0, 1),
(31, 10, 'INSERT', 1, 1),
(32, 11, 'UPDATE', 0, 1),
(33, 11, 'SELECT', 1, 1),
(34, 11, 'DISINCT', 0, 1),
(35, 11, 'INSERT', 0, 1),
(36, 12, 'UPDATE', 0, 1),
(37, 12, 'SELECT', 0, 1),
(38, 12, 'AVG', 1, 1),
(39, 12, 'INSERT', 0, 1),
(40, 13, 'Cisco Packet Tracer', 1, 1),
(41, 13, 'CIsco Pour Toi', 0, 1),
(42, 13, 'Cisco Pour Tous', 0, 1),
(43, 14, 'Domain Name System', 1, 1),
(44, 14, 'Data Name System', 0, 1),
(45, 14, 'Domain Name Software', 0, 1),
(46, 15, '<?php ?>', 1, 1),
(47, 15, '<php>', 0, 1),
(48, 15, '<? >', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

DROP TABLE IF EXISTS `resultat`;
CREATE TABLE IF NOT EXISTS `resultat` (
  `id_res` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_etu` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `date_res` date DEFAULT NULL,
  `id_rep` int(11) NOT NULL,
  PRIMARY KEY (`id_res`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `resultat`
--

INSERT INTO `resultat` (`id_res`, `id_test`, `id_etu`, `id_quest`, `date_res`, `id_rep`) VALUES
(1, 1, 1, 1, NULL, 2),
(2, 1, 1, 2, NULL, 7),
(3, 1, 1, 3, NULL, 8),
(4, 1, 1, 3, NULL, 10),
(5, 3, 1, 7, NULL, 21),
(6, 3, 1, 8, NULL, 23),
(7, 1, 2, 1, NULL, 2),
(8, 1, 2, 2, NULL, 7),
(9, 1, 2, 3, NULL, 8),
(10, 1, 2, 3, NULL, 11),
(11, 3, 2, 7, NULL, 22),
(12, 3, 2, 8, NULL, 24),
(17, 2, 6, 4, NULL, 12),
(18, 2, 6, 5, NULL, 15),
(19, 2, 6, 6, NULL, 18),
(20, 2, 6, 6, NULL, 20),
(21, 2, 7, 4, NULL, 13),
(22, 2, 7, 5, NULL, 17),
(23, 2, 7, 6, NULL, 18),
(24, 2, 7, 6, NULL, 20),
(25, 4, 3, 9, NULL, 25),
(26, 4, 3, 10, NULL, 28),
(27, 4, 3, 11, NULL, 33),
(28, 4, 3, 12, NULL, 39),
(29, 4, 4, 9, NULL, 27),
(30, 4, 4, 10, NULL, 31),
(31, 4, 4, 11, NULL, 33),
(32, 4, 4, 12, NULL, 38),
(33, 5, 8, 13, NULL, 40),
(34, 5, 8, 14, NULL, 43),
(35, 5, 9, 13, NULL, 33),
(36, 5, 9, 14, NULL, 44),
(37, 5, 10, 13, NULL, 40),
(38, 5, 10, 14, NULL, 45),
(58, 2, 5, 4, NULL, 14),
(59, 2, 5, 4, NULL, 13),
(60, 2, 5, 5, NULL, 15),
(61, 2, 5, 6, NULL, 19),
(62, 2, 5, 6, NULL, 18);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `id_prof` int(11) NOT NULL,
  `num_grpe` text COLLATE utf8_bin NOT NULL,
  `titre_test` text COLLATE utf8_bin NOT NULL,
  `date_test` blob,
  `bActif` tinyint(1) NOT NULL,
  `bTermine` tinyint(4) NOT NULL DEFAULT '0',
  `bOpenCorr` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `test`
--

INSERT INTO `test` (`id_test`, `id_prof`, `num_grpe`, `titre_test`, `date_test`, `bActif`, `bTermine`, `bOpenCorr`) VALUES
(1, 1, '201', 'Test Java', NULL, 0, 0, 0),
(2, 2, '203', 'Test PWEB', NULL, 0, 0, 1),
(3, 3, '201', 'Test Droit', NULL, 0, 0, 0),
(4, 4, '206', 'Test SGBD', NULL, 0, 0, 0),
(5, 5, '207', 'Test Reseau', NULL, 0, 0, 0),
(18, 2, '207', 'Test De Test', 0x323031392d31312d3134, 0, 0, 0),
(19, 2, '203', 'JSP', 0x323031392d31312d3139, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `titre_theme` text COLLATE utf8_bin NOT NULL,
  `desc_theme` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`id_theme`, `titre_theme`, `desc_theme`) VALUES
(1, 'Java', 'Programmation Objet'),
(2, 'PWEB', 'Connaissance PHP'),
(3, 'Droit', 'Droit Penal'),
(4, 'SGBD', 'Les Merises'),
(5, 'Reseau', 'Cisco Packet Tracer');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
