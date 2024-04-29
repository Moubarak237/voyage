-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 18 avr. 2024 à 12:32
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_vol`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE `aeroport` (
  `noma` varchar(50) NOT NULL,
  `nomv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `numeroa` varchar(50) NOT NULL,
  `constructeur` varchar(50) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `nomC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `a_reserve`
--

CREATE TABLE `a_reserve` (
  `date_reservation` date DEFAULT NULL,
  `numerov` varchar(50) NOT NULL,
  `nompa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE `compagnie` (
  `nomC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `passager`
--

CREATE TABLE `passager` (
  `nompa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `nompe` varchar(50) NOT NULL,
  `fonction` varchar(50) NOT NULL,
  `nomC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soccuper_de`
--

CREATE TABLE `soccuper_de` (
  `nompe` varchar(50) NOT NULL,
  `numerov` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `nomv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `numerov` varchar(50) NOT NULL,
  `jour` varchar(10) NOT NULL,
  `heure_depart` varchar(10) NOT NULL,
  `heure_arrivee` varchar(10) NOT NULL,
  `place_libre` int(11) DEFAULT NULL,
  `numeroa` varchar(50) NOT NULL,
  `noma_part_de` varchar(50) NOT NULL,
  `noma_arrive_a` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
  ADD PRIMARY KEY (`noma`),
  ADD KEY `nomv` (`nomv`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`numeroa`),
  ADD KEY `nomc` (`nomC`);

--
-- Index pour la table `a_reserve`
--
ALTER TABLE `a_reserve`
  ADD PRIMARY KEY (`numerov`,`nompa`),
  ADD KEY `nompa` (`nompa`);

--
-- Index pour la table `compagnie`
--
ALTER TABLE `compagnie`
  ADD PRIMARY KEY (`nomC`);

--
-- Index pour la table `passager`
--
ALTER TABLE `passager`
  ADD PRIMARY KEY (`nompa`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`nompe`),
  ADD KEY `nomC` (`nomC`);

--
-- Index pour la table `soccuper_de`
--
ALTER TABLE `soccuper_de`
  ADD PRIMARY KEY (`nompe`,`numerov`),
  ADD KEY `numerov` (`numerov`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`nomv`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`numerov`),
  ADD KEY `numeroa` (`numeroa`),
  ADD KEY `noma_part_de` (`noma_part_de`),
  ADD KEY `noma_arrive_a` (`noma_arrive_a`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aeroport`
--
ALTER TABLE `aeroport`
  ADD CONSTRAINT `aeroport_ibfk_1` FOREIGN KEY (`nomv`) REFERENCES `ville` (`nomv`);

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`nomc`) REFERENCES `compagnie` (`nomC`);

--
-- Contraintes pour la table `a_reserve`
--
ALTER TABLE `a_reserve`
  ADD CONSTRAINT `a_reserve_ibfk_1` FOREIGN KEY (`numerov`) REFERENCES `vol` (`numerov`),
  ADD CONSTRAINT `a_reserve_ibfk_2` FOREIGN KEY (`nompa`) REFERENCES `passager` (`nompa`);

--
-- Contraintes pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`nomC`) REFERENCES `compagnie` (`nomC`);

--
-- Contraintes pour la table `soccuper_de`
--
ALTER TABLE `soccuper_de`
  ADD CONSTRAINT `soccuper_de_ibfk_1` FOREIGN KEY (`nompe`) REFERENCES `personnel` (`nompe`),
  ADD CONSTRAINT `soccuper_de_ibfk_2` FOREIGN KEY (`numerov`) REFERENCES `vol` (`numerov`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`numeroa`) REFERENCES `avion` (`numeroa`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`noma_part_de`) REFERENCES `aeroport` (`noma`),
  ADD CONSTRAINT `vol_ibfk_3` FOREIGN KEY (`noma_arrive_a`) REFERENCES `aeroport` (`noma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
