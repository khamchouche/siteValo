-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql-5.7
-- Généré le : ven. 25 oct. 2024 à 12:56
-- Version du serveur : 5.7.28
-- Version de PHP : 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `khamchouche_bd`
--
CREATE DATABASE IF NOT EXISTS `khamchouche_bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `khamchouche_bd`;

-- --------------------------------------------------------

--
-- Structure de la table `Article`
--

CREATE TABLE `Article` (
  `Reference` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Descriptif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CodeCategorie` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CoutHT` decimal(6,2) NOT NULL DEFAULT '0.00',
  `PrixHT` decimal(7,2) NOT NULL DEFAULT '0.00',
  `QteStock` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Article`
--

INSERT INTO `Article` (`Reference`, `Descriptif`, `CodeCategorie`, `CoutHT`, `PrixHT`, `QteStock`) VALUES
('B12', 'Beurre breton au détail (prix par kg)', 'B', '4.25', '4.75', 11),
('B17', 'Bâtonnets de vanille ( paquet de 3 gousses )', 'G', '2.30', '3.25', 20),
('B22', 'Beurre breton(prix par kg)', 'B', '4.25', '4.85', 11),
('B23', 'Beurre dEspagne(prix par kg)', 'B', '4.25', '4.85', 11),
('C13', 'Café lyophilisé ( pack de 10 sachets )', 'E', '2.74', '3.20', 17),
('C15', 'Café en grain( en paquet 250 g )', 'E', '2.73', '3.45', 31),
('C25', 'Café moulu ( en paquet 250 g )', 'E', '2.46', '3.20', 35),
('F25', 'Farine de froment ( paquet de 1 kg )', 'C', '0.56', '0.65', 40),
('G12', 'Foie gras de canard ( au kilo)', 'V', '29.89', '32.50', 0),
('G13', 'Foie gras d\'oie ( au kilo)', 'V', '22.33', '36.50', 44),
('G21', 'Médaillon de oie gras d\'oie ( au boîte de 200 g )', 'V', '7.12', '11.50', 20),
('H23', 'Huile d\'arachide supérieure ( bouteille 1 litre )', 'E', '2.28', '3.20', 6),
('H25', 'Huile d\'arachide supérieure ( bouteille 25 cl )', 'E', '0.82', '1.20', 2),
('J11', 'Biscottes ( paquet )', 'B', '0.81', '0.95', 0),
('J12', 'Pains au lait ( paquet  de 10 )', 'B', '0.90', '1.03', 25),
('J21', 'Biscuits boudoirs ( paquet  de 36 )', 'B', '1.28', '1.45', 34),
('K12', 'Céréales en pétale ( paquet )', 'C', '1.36', '1.60', 13),
('K16', 'Riz soufflé ( paquet )', 'C', '1.60', '1.82', 47),
('K21', 'Müesli complet ( paquet )', 'C', '2.04', '2.50', 12),
('M11', 'Moutarde à l\'ancienne ( pot de 125 g )', 'E', '1.39', '1.67', 44),
('M12', 'Moutarde à l\'estragon ( pot de 125 g )', 'E', '1.50', '1.87', 30),
('P11', 'Pruneaux séchés d\'Agen au détail ( prix au kg )', 'F', '2.30', '3.42', 34),
('Q22', 'Miel de montagne ( pot de 250 g )', 'S', '3.00', '4.10', 0),
('Q23', 'Miel d\'oranger ( pot de 250 g )', 'S', '3.25', '4.50', 29),
('Q24', 'Miel d\'accacia ( pot de 250 g )', 'S', '3.18', '4.25', 28),
('Q26', 'Miel de cactus ( pot de 250 g )', 'S', '3.95', '5.35', 0),
('Q31', 'Pollen ( pot de 200 g )', 'S', '4.54', '6.30', 6),
('S22', 'Sel fin de cuisine ( 250 g )', 'E', '0.32', '0.38', 0),
('S56', 'Sucre en morceaux ( boîte de 1 kg )', 'S', '0.82', '0.95', 10),
('S68', 'Sucre en poudre ( 500g )', 'S', '0.50', '0.57', 38),
('U12', 'Pommes de rainette ( prix au kg )', 'F', '0.95', '1.15', 7),
('U13', 'Pommes Golden ( prix au kg )', 'F', '0.98', '1.22', 44),
('U25', 'Poires William ( prix au kg )', 'F', '1.08', '1.31', 11),
('U27', 'Poires Pastraca  ( prix au kg )', 'F', '1.18', '1.43', 46),
('V45', 'Vinaigre de vin ( bouteille de 75 cl )', 'E', '1.14', '1.76', 12),
('W21', 'Marrons entiers ( boîte de 500 g )', 'F', '1.73', '2.10', 30),
('W22', 'Haricots verts extra-fins ( boîte de 500 g )', 'L', '1.31', '1.60', 0),
('W23', 'Petits pois à l\'étuvée ( boîte de 500 g )', 'L', '1.21', '1.50', 17),
('W24', 'Petites carottes nouvelles ( boîte de 500 g )', 'L', '1.09', '1.30', 26),
('W25', 'Flageolets à la graisse d\'oie ( boîte de 500 g )', 'L', '1.41', '1.70', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `CodeCategorie` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CodeTVA` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`CodeCategorie`, `Libelle`, `CodeTVA`) VALUES
('B', 'Boulangerie', 'R'),
('C', 'Céréales', 'R'),
('E', 'Epicerie', 'M'),
('F', 'Fruits', 'N'),
('G', 'Corps gras', 'M'),
('L', 'Légumes', 'R'),
('S', 'Sucreries', 'M'),
('V', 'Volailles', 'N');

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `Numero` smallint(5) NOT NULL DEFAULT '0',
  `DateCommande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NomClient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`Numero`, `DateCommande`, `NomClient`) VALUES
(1101, '2007-09-13 00:00:00', 'DUPONT'),
(1102, '2007-09-13 00:00:00', 'ETCHENIQUE'),
(1107, '2007-09-13 00:00:00', 'MARTIN'),
(1115, '2007-09-13 00:00:00', 'OYHAMBURU'),
(1116, '2007-09-14 00:00:00', 'MARTIN'),
(1117, '2007-09-14 00:00:00', 'DUPONT'),
(1118, '2007-09-14 00:00:00', 'LATESTE'),
(1120, '2007-09-17 00:00:00', 'MARTIN');

-- --------------------------------------------------------

--
-- Structure de la table `TVA`
--

CREATE TABLE `TVA` (
  `CodeTVA` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LibelleTVA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `TauxTVA` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `TVA`
--

INSERT INTO `TVA` (`CodeTVA`, `LibelleTVA`, `TauxTVA`) VALUES
('E', 'Exonéré', 0),
('M', 'Majoré', 0.075),
('N', 'Normal', 0.055),
('R', 'Réduit', 0.05);

-- --------------------------------------------------------

--
-- Structure de la table `valorant_skin`
--

CREATE TABLE `valorant_skin` (
  `id` int(2) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `type` varchar(20) NOT NULL,
  `rarete` int(1) NOT NULL,
  `prix` int(5) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `valorant_skin`
--

INSERT INTO `valorant_skin` (`id`, `nom`, `type`, `rarete`, `prix`, `image`) VALUES
(1, 'Araxys', 'vendal', 5, 22, 'image/Vandal_araxys_VALORANT.png'),
(2, 'Forsaken Gold', 'vandal', 3, 21, 'image/Vandal_forsaken_gold_VALORANT.png'),
(3, 'Sentinels of Light Pink', 'vandal', 4, 27, 'image/Vandal_sentinels_of_light_pink_VALORANT.png'),
(4, 'Reaver White', 'vandal', 1, 27, 'image/Vandal_reaver_white_VALORANT.png'),
(5, 'Kuronami', 'vandal', 5, 30, 'image/kuronami_white.png'),
(6, 'Gaia', 'vandal', 4, 24, 'image/Vandal_gaia_VALORANT.png');

-- --------------------------------------------------------

--
-- Structure de la table `Ville`
--

CREATE TABLE `Ville` (
  `codepostal` varchar(5) NOT NULL,
  `nomVille` varchar(30) DEFAULT NULL,
  `nbHabitants` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Villes`
--

CREATE TABLE `Villes` (
  `codepostal` varchar(5) NOT NULL,
  `nomVille` varchar(30) DEFAULT NULL,
  `nbHabitants` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `yabontiap_categorie`
--

CREATE TABLE `yabontiap_categorie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `yabontiap_categorie`
--

INSERT INTO `yabontiap_categorie` (`id`, `nom`, `image`) VALUES
(1, 'Entrées', 'entree.jpg'),
(2, 'Plats Principaux', 'plat.jpg'),
(3, 'Desserts', 'dessert.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `yabontiap_ingredient`
--

CREATE TABLE `yabontiap_ingredient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `yabontiap_ingredient`
--

INSERT INTO `yabontiap_ingredient` (`id`, `nom`, `image`) VALUES
(1, 'Laitue', 'laitue.jpg'),
(2, 'Tomate', 'tomate.jpg'),
(3, 'Croûtons', 'croutons.jpg'),
(4, 'Poulet', 'poulet.jpg'),
(5, 'Pâte', 'pate.jpg'),
(6, 'Fromage', 'fromage.jpg'),
(7, 'Pomme', 'pomme.jpg'),
(8, 'Chocolat', 'chocolat.jpg'),
(9, 'Oeuf', 'oeuf.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `yabontiap_recette`
--

CREATE TABLE `yabontiap_recette` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_categorie` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `yabontiap_recette`
--

INSERT INTO `yabontiap_recette` (`id`, `nom`, `description`, `image`, `id_categorie`) VALUES
(1, 'Salade César', 'Mélangez les légumes frais, ajoutez les croûtons et le parmesan. Assaisonnez avec la sauce César.', 'salade_cesar.jpg', 1),
(2, 'Soupe à la tomate', 'Faites cuire les tomates avec des oignons, mixez et ajoutez des épices. Servez chaud.', 'soupe_tomate.jpg', 1),
(3, 'Bruschetta', 'Grillez du pain, frottez avec de l\'ail, ajoutez des tomates, basilic et huile d\'olive.', 'bruschetta.jpg', 1),
(4, 'Poulet rôti', 'Assaisonnez le poulet, enfournez à 200°C pendant 1h30. Servez avec des légumes rôtis.', 'poulet_roti.jpg', 2),
(5, 'Lasagnes', 'Alternez les couches de pâtes, viande et béchamel. Faites cuire 45 minutes à 180°C.', 'lasagnes.jpg', 2),
(6, 'Ratatouille', 'Cuisez les légumes en tranches avec de l\'huile d\'olive et des herbes de Provence.', 'ratatouille.jpg', 2),
(7, 'Tarte aux pommes', 'Disposez les pommes sur la pâte, saupoudrez de sucre et faites cuire 40 minutes à 180°C.', 'tarte_pommes.jpg', 3),
(8, 'Mousse au chocolat', 'Faites fondre le chocolat, ajoutez les œufs battus en neige et réfrigérez.', 'mousse_chocolat.jpg', 3),
(9, 'Crème brûlée', 'Mélangez les jaunes d\'œufs, la crème et le sucre. Faites cuire au bain-marie, caramélisez le dessus.', 'creme_brulee.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `yabontiap_recette_ingredient`
--

CREATE TABLE `yabontiap_recette_ingredient` (
  `id_recette` bigint(20) UNSIGNED NOT NULL,
  `id_ingredient` bigint(20) UNSIGNED NOT NULL,
  `quantite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `yabontiap_recette_ingredient`
--

INSERT INTO `yabontiap_recette_ingredient` (`id_recette`, `id_ingredient`, `quantite`) VALUES
(1, 1, '2 tasses'),
(1, 2, '1 tasse'),
(1, 3, '1/2 tasse'),
(2, 2, '4'),
(2, 6, '1/2 tasse'),
(2, 9, '1'),
(3, 2, '2'),
(3, 6, '1/4 tasse'),
(3, 9, '1'),
(4, 4, '1'),
(4, 5, '2 tasses'),
(4, 6, '1 tasse'),
(5, 4, '500g'),
(5, 5, '300g'),
(5, 6, '2 tasses'),
(6, 2, '3'),
(6, 5, '2 tasses'),
(6, 6, '1 tasse'),
(7, 6, '1/2 tasse'),
(7, 7, '3'),
(7, 9, '2'),
(8, 6, '1/4 tasse'),
(8, 8, '200g'),
(8, 9, '3'),
(9, 6, '1 tasse'),
(9, 8, '1/2 tasse'),
(9, 9, '4');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`Reference`),
  ADD KEY `CodeCategorie` (`CodeCategorie`);

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`CodeCategorie`),
  ADD KEY `CodeTVA` (`CodeTVA`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`Numero`);

--
-- Index pour la table `TVA`
--
ALTER TABLE `TVA`
  ADD PRIMARY KEY (`CodeTVA`);

--
-- Index pour la table `valorant_skin`
--
ALTER TABLE `valorant_skin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD PRIMARY KEY (`codepostal`);

--
-- Index pour la table `Villes`
--
ALTER TABLE `Villes`
  ADD PRIMARY KEY (`codepostal`);

--
-- Index pour la table `yabontiap_categorie`
--
ALTER TABLE `yabontiap_categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `yabontiap_ingredient`
--
ALTER TABLE `yabontiap_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `yabontiap_recette`
--
ALTER TABLE `yabontiap_recette`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `yabontiap_recette_ingredient`
--
ALTER TABLE `yabontiap_recette_ingredient`
  ADD PRIMARY KEY (`id_recette`,`id_ingredient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `yabontiap_categorie`
--
ALTER TABLE `yabontiap_categorie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `yabontiap_ingredient`
--
ALTER TABLE `yabontiap_ingredient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `yabontiap_recette`
--
ALTER TABLE `yabontiap_recette`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Article`
--
ALTER TABLE `Article`
  ADD CONSTRAINT `CT1` FOREIGN KEY (`CodeCategorie`) REFERENCES `Categorie` (`CodeCategorie`);

--
-- Contraintes pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD CONSTRAINT `CT4` FOREIGN KEY (`CodeTVA`) REFERENCES `TVA` (`CodeTVA`);
--
-- Base de données : `nodenot_bd`
--
CREATE DATABASE IF NOT EXISTS `nodenot_bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nodenot_bd`;
--
-- Base de données : `nodenot_bd1`
--
CREATE DATABASE IF NOT EXISTS `nodenot_bd1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nodenot_bd1`;

-- --------------------------------------------------------

--
-- Structure de la table `Article`
--

CREATE TABLE `Article` (
  `Reference` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Descriptif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CodeCategorie` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CoutHT` decimal(6,2) NOT NULL DEFAULT '0.00',
  `PrixHT` decimal(7,2) NOT NULL DEFAULT '0.00',
  `QteStock` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Article`
--

INSERT INTO `Article` (`Reference`, `Descriptif`, `CodeCategorie`, `CoutHT`, `PrixHT`, `QteStock`) VALUES
('B12', 'Beurre breton au détail (prix par kg)', 'B', '4.25', '4.75', 11),
('B17', 'Bâtonnets de vanille ( paquet de 3 gousses )', 'G', '2.30', '3.25', 20),
('C13', 'Café lyophilisé ( pack de 10 sachets )', 'E', '2.74', '3.20', 17),
('C15', 'Café en grain( en paquet 250 g )', 'E', '2.73', '3.45', 31),
('C25', 'Café moulu ( en paquet 250 g )', 'E', '2.46', '3.20', 35),
('F25', 'Farine de froment ( paquet de 1 kg )', 'C', '0.56', '0.65', 40),
('G12', 'Foie gras de canard ( au kilo)', 'V', '29.89', '32.50', 0),
('G13', 'Foie gras d\'oie ( au kilo)', 'V', '22.33', '36.50', 44),
('G21', 'Médaillon de oie gras d\'oie ( au boîte de 200 g )', 'V', '7.12', '11.50', 20),
('H23', 'Huile d\'arachide supérieure ( bouteille 1 litre )', 'E', '2.28', '3.20', 6),
('H25', 'Huile d\'arachide supérieure ( bouteille 25 cl )', 'E', '0.82', '1.20', 2),
('J11', 'Biscottes ( paquet )', 'B', '0.81', '0.95', 0),
('J12', 'Pains au lait ( paquet  de 10 )', 'B', '0.90', '1.03', 25),
('J21', 'Biscuits boudoirs ( paquet  de 36 )', 'B', '1.28', '1.45', 34),
('K12', 'Céréales en pétale ( paquet )', 'C', '1.36', '1.60', 13),
('K16', 'Riz soufflé ( paquet )', 'C', '1.60', '1.82', 47),
('K21', 'Müesli complet ( paquet )', 'C', '2.04', '2.50', 12),
('M11', 'Moutarde à l\'ancienne ( pot de 125 g )', 'E', '1.39', '1.67', 44),
('M12', 'Moutarde à l\'estragon ( pot de 125 g )', 'E', '1.50', '1.87', 30),
('P11', 'Pruneaux séchés d\'Agen au détail ( prix au kg )', 'F', '2.30', '3.42', 34),
('Q22', 'Miel de montagne ( pot de 250 g )', 'S', '3.00', '4.10', 0),
('Q23', 'Miel d\'oranger ( pot de 250 g )', 'S', '3.25', '4.50', 29),
('Q24', 'Miel d\'accacia ( pot de 250 g )', 'S', '3.18', '4.25', 28),
('Q26', 'Miel de cactus ( pot de 250 g )', 'S', '3.95', '5.35', 0),
('Q31', 'Pollen ( pot de 200 g )', 'S', '4.54', '6.30', 6),
('S22', 'Sel fin de cuisine ( 250 g )', 'E', '0.32', '0.38', 0),
('S56', 'Sucre en morceaux ( boîte de 1 kg )', 'S', '0.82', '0.95', 10),
('S68', 'Sucre en poudre ( 500g )', 'S', '0.50', '0.57', 38),
('U12', 'Pommes de rainette ( prix au kg )', 'F', '0.95', '1.15', 7),
('U13', 'Pommes Golden ( prix au kg )', 'F', '0.98', '1.22', 44),
('U25', 'Poires William ( prix au kg )', 'F', '1.08', '1.31', 11),
('U27', 'Poires Pastraca  ( prix au kg )', 'F', '1.18', '1.43', 46),
('V45', 'Vinaigre de vin ( bouteille de 75 cl )', 'E', '1.14', '1.76', 12),
('W21', 'Marrons entiers ( boîte de 500 g )', 'F', '1.73', '2.10', 30),
('W22', 'Haricots verts extra-fins ( boîte de 500 g )', 'L', '1.31', '1.60', 0),
('W23', 'Petits pois à l\'étuvée ( boîte de 500 g )', 'L', '1.21', '1.50', 17),
('W24', 'Petites carottes nouvelles ( boîte de 500 g )', 'L', '1.09', '1.30', 26),
('W25', 'Flageolets à la graisse d\'oie ( boîte de 500 g )', 'L', '1.41', '1.70', 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `Catalogue`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `Catalogue` (
`Reference` varchar(3)
,`Descriptif` varchar(255)
,`Libelle` varchar(255)
,`CodeTVA` varchar(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

CREATE TABLE `Categorie` (
  `CodeCategorie` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `CodeTVA` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`CodeCategorie`, `Libelle`, `CodeTVA`) VALUES
('B', 'Boulangerie', 'R'),
('C', 'Céréales', 'R'),
('E', 'Epicerie', 'M'),
('F', 'Fruits', 'N'),
('G', 'Corps gras', 'M'),
('L', 'Légumes', 'R'),
('S', 'Sucreries', 'M'),
('V', 'Volailles', 'N'),
('X', 'xXXX', 'E');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `CategoriesSansArticles`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `CategoriesSansArticles` (
`Reference` varchar(3)
,`Descriptif` varchar(255)
,`CodeCategorie` varchar(1)
,`CoutHT` decimal(6,2)
,`PrixHT` decimal(7,2)
,`QteStock` int(5)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `CategoriesSansArticles2`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `CategoriesSansArticles2` (
`CodeCategorie` varchar(1)
,`Libelle` varchar(255)
,`CodeTVA` varchar(1)
);

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `Numero` smallint(5) NOT NULL DEFAULT '0',
  `DateCommande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NomClient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`Numero`, `DateCommande`, `NomClient`) VALUES
(1101, '2007-09-13 00:00:00', 'DUPONT'),
(1102, '2007-09-13 00:00:00', 'ETCHENIQUE'),
(1107, '2007-09-13 00:00:00', 'MARTIN'),
(1115, '2007-09-13 00:00:00', 'OYHAMBURU'),
(1116, '2007-09-14 00:00:00', 'MARTIN'),
(1117, '2007-09-14 00:00:00', 'DUPONT'),
(1118, '2007-09-14 00:00:00', 'LATESTE'),
(1120, '2007-09-17 00:00:00', 'MARTIN');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `CommandesSsDate`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `CommandesSsDate` (
`Numero` smallint(5)
,`NomClient` varchar(255)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `LesArticles`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `LesArticles` (
`Reference` varchar(3)
,`Descriptif` varchar(255)
,`CoutHT` decimal(6,2)
,`PrixHT` decimal(7,2)
,`QteStock` int(5)
,`Categorie` varchar(255)
,`LibelleTVA` varchar(255)
,`TauxTVA` float
);

-- --------------------------------------------------------

--
-- Structure de la table `LigneDeCommande`
--

CREATE TABLE `LigneDeCommande` (
  `Numero` smallint(5) NOT NULL DEFAULT '0',
  `Reference` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Quantite` smallint(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `LigneDeCommande`
--

INSERT INTO `LigneDeCommande` (`Numero`, `Reference`, `Quantite`) VALUES
(1101, 'K21', 20),
(1101, 'P11', 16),
(1101, 'Q26', 2),
(1102, 'K16', 15),
(1102, 'K21', 20),
(1102, 'U13', 16),
(1102, 'U27', 15),
(1107, 'J21', 19),
(1107, 'Q31', 11),
(1107, 'W21', 9),
(1107, 'W24', 11),
(1115, 'H25', 4),
(1115, 'K12', 15),
(1115, 'Q31', 8),
(1116, 'G21', 17),
(1116, 'H23', 1),
(1116, 'M12', 4),
(1116, 'Q31', 4),
(1116, 'S56', 2),
(1116, 'U27', 13),
(1116, 'W25', 5),
(1117, 'G21', 18),
(1117, 'H23', 19),
(1117, 'H25', 18),
(1117, 'K12', 13),
(1117, 'K16', 16),
(1117, 'M11', 6),
(1117, 'S56', 8),
(1117, 'S68', 3),
(1117, 'W21', 18),
(1117, 'W22', 17),
(1118, 'W22', 8),
(1120, 'H23', 14),
(1120, 'H25', 17),
(1120, 'J12', 6),
(1120, 'S56', 3);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `MesArticlesPreferes`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `MesArticlesPreferes` (
`Descriptif` varchar(255)
,`CoutHT` decimal(6,2)
);

-- --------------------------------------------------------

--
-- Structure de la table `TVA`
--

CREATE TABLE `TVA` (
  `CodeTVA` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LibelleTVA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `TauxTVA` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `TVA`
--

INSERT INTO `TVA` (`CodeTVA`, `LibelleTVA`, `TauxTVA`) VALUES
('E', 'Exonéré', 0),
('M', 'Majoré', 0.075),
('N', 'Normal', 0.055),
('R', 'Réduit', 0.05);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `UnCatalogue`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `UnCatalogue` (
`Reference` varchar(3)
,`Descriptif` varchar(255)
,`Libelle` varchar(255)
,`CodeTVA` varchar(1)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `UnCatalogueBis`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `UnCatalogueBis` (
`Reference` varchar(3)
,`Descriptif` varchar(255)
,`Libelle` varchar(255)
,`CodeTVA` varchar(1)
);

-- --------------------------------------------------------

--
-- Structure de la vue `Catalogue`
--
DROP TABLE IF EXISTS `Catalogue`;
-- Erreur de lecture de structure pour la table nodenot_bd1.Catalogue : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'Catalogue'

-- --------------------------------------------------------

--
-- Structure de la vue `CategoriesSansArticles`
--
DROP TABLE IF EXISTS `CategoriesSansArticles`;
-- Erreur de lecture de structure pour la table nodenot_bd1.CategoriesSansArticles : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'CategoriesSansArticles'

-- --------------------------------------------------------

--
-- Structure de la vue `CategoriesSansArticles2`
--
DROP TABLE IF EXISTS `CategoriesSansArticles2`;
-- Erreur de lecture de structure pour la table nodenot_bd1.CategoriesSansArticles2 : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'CategoriesSansArticles2'

-- --------------------------------------------------------

--
-- Structure de la vue `CommandesSsDate`
--
DROP TABLE IF EXISTS `CommandesSsDate`;
-- Erreur de lecture de structure pour la table nodenot_bd1.CommandesSsDate : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'CommandesSsDate'

-- --------------------------------------------------------

--
-- Structure de la vue `LesArticles`
--
DROP TABLE IF EXISTS `LesArticles`;
-- Erreur de lecture de structure pour la table nodenot_bd1.LesArticles : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'LesArticles'

-- --------------------------------------------------------

--
-- Structure de la vue `MesArticlesPreferes`
--
DROP TABLE IF EXISTS `MesArticlesPreferes`;
-- Erreur de lecture de structure pour la table nodenot_bd1.MesArticlesPreferes : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'MesArticlesPreferes'

-- --------------------------------------------------------

--
-- Structure de la vue `UnCatalogue`
--
DROP TABLE IF EXISTS `UnCatalogue`;
-- Erreur de lecture de structure pour la table nodenot_bd1.UnCatalogue : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'UnCatalogue'

-- --------------------------------------------------------

--
-- Structure de la vue `UnCatalogueBis`
--
DROP TABLE IF EXISTS `UnCatalogueBis`;
-- Erreur de lecture de structure pour la table nodenot_bd1.UnCatalogueBis : #1142 - La commande 'SHOW VIEW' est interdite à l'utilisateur: 'khamchouche_bd'@'@172.18.0.2' sur la table 'UnCatalogueBis'

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`Reference`),
  ADD KEY `CodeCategorie` (`CodeCategorie`);

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`CodeCategorie`),
  ADD KEY `CodeTVA` (`CodeTVA`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`Numero`);

--
-- Index pour la table `LigneDeCommande`
--
ALTER TABLE `LigneDeCommande`
  ADD PRIMARY KEY (`Numero`,`Reference`),
  ADD KEY `Reference` (`Reference`),
  ADD KEY `Numero` (`Numero`);

--
-- Index pour la table `TVA`
--
ALTER TABLE `TVA`
  ADD PRIMARY KEY (`CodeTVA`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Article`
--
ALTER TABLE `Article`
  ADD CONSTRAINT `CT1` FOREIGN KEY (`CodeCategorie`) REFERENCES `Categorie` (`CodeCategorie`);

--
-- Contraintes pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD CONSTRAINT `CT4` FOREIGN KEY (`CodeTVA`) REFERENCES `TVA` (`CodeTVA`);

--
-- Contraintes pour la table `LigneDeCommande`
--
ALTER TABLE `LigneDeCommande`
  ADD CONSTRAINT `Contrainte1` FOREIGN KEY (`Numero`) REFERENCES `Commande` (`Numero`),
  ADD CONSTRAINT `contrainte2` FOREIGN KEY (`Reference`) REFERENCES `Article` (`Reference`);
--
-- Base de données : `nodenot_bd9`
--
CREATE DATABASE IF NOT EXISTS `nodenot_bd9` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nodenot_bd9`;

-- --------------------------------------------------------

--
-- Structure de la table `Diaporamas`
--

CREATE TABLE `Diaporamas` (
  `idDiaporama` int(11) NOT NULL,
  `titreDiaporama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vitesseDefilement` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Diaporamas`
--

INSERT INTO `Diaporamas` (`idDiaporama`, `titreDiaporama`, `vitesseDefilement`) VALUES
(1, 'diaporama Pantxika', 1),
(2, 'diaporama Thierry', 2),
(3, 'diaporama Yann', 1),
(4, 'diaporam Manu', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Diapos`
--

CREATE TABLE `Diapos` (
  `idphoto` int(10) NOT NULL,
  `titrePhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `idFam` int(10) NOT NULL DEFAULT '0',
  `uriPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Diapos`
--

INSERT INTO `Diapos` (`idphoto`, `titrePhoto`, `idFam`, `uriPhoto`) VALUES
(1, 'Disney_0.gif', 2, '/cartesDisney/Disney_0.gif'),
(2, 'Disney_1.gif', 3, '/cartesDisney/Disney_1.gif'),
(3, 'Disney_2.gif', 1, '/cartesDisney/Disney_2.gif'),
(4, 'Disney_3.gif', 3, '/cartesDisney/Disney_3.gif'),
(5, 'Disney_4.gif', 1, '/cartesDisney/Disney_4.gif'),
(6, 'Disney_5.gif', 3, '/cartesDisney/Disney_5.gif'),
(7, 'Disney_6.gif', 3, '/cartesDisney/Disney_6.gif'),
(8, 'Disney_7.gif', 1, '/cartesDisney/Disney_7.gif'),
(9, 'Disney_8.gif', 3, '/cartesDisney/Disney_8.gif'),
(10, 'Disney_9.gif', 3, '/cartesDisney/Disney_9.gif'),
(11, 'Disney_10.gif', 3, '/cartesDisney/Disney_10.gif'),
(12, 'Disney_11.gif', 3, '/cartesDisney/Disney_11.gif'),
(13, 'Disney_12.gif', 3, '/cartesDisney/Disney_12.gif'),
(14, 'Disney_13.gif', 3, '/cartesDisney/Disney_13.gif'),
(15, 'Disney_14.gif', 3, '/cartesDisney/Disney_14.gif'),
(16, 'Disney_15.gif', 3, '/cartesDisney/Disney_15.gif'),
(17, 'Disney_16.gif', 3, '/cartesDisney/Disney_16.gif'),
(18, 'Disney_17.gif', 3, '/cartesDisney/Disney_17.gif'),
(19, 'Disney_18.gif', 3, '/cartesDisney/Disney_18.gif'),
(20, 'Disney_19.gif', 3, '/cartesDisney/Disney_19.gif'),
(21, 'Disney_20.gif', 3, '/cartesDisney/Disney_20.gif'),
(22, 'Disney_21.gif', 1, '/cartesDisney/Disney_21.gif'),
(23, 'Disney_22.gif', 3, '/cartesDisney/Disney_22.gif'),
(24, 'Disney_23.gif', 3, '/cartesDisney/Disney_23.gif'),
(25, 'Disney_24.gif', 1, '/cartesDisney/Disney_24.gif'),
(26, 'Disney_25.gif', 3, '/cartesDisney/Disney_25.gif'),
(27, 'Disney_26.gif', 3, '/cartesDisney/Disney_26.gif'),
(28, 'Disney_27.gif', 3, '/cartesDisney/Disney_27.gif'),
(29, 'Disney_28.gif', 3, '/cartesDisney/Disney_28.gif'),
(30, 'Disney_29.gif', 1, '/cartesDisney/Disney_29.gif'),
(31, 'Disney_30.gif', 3, '/cartesDisney/Disney_30.gif'),
(32, 'Disney_31.gif', 3, '/cartesDisney/Disney_31.gif'),
(33, 'Disney_32.gif', 3, '/cartesDisney/Disney_32.gif'),
(34, 'Disney_33.gif', 3, '/cartesDisney/Disney_33.gif'),
(35, 'Disney_34.gif', 3, '/cartesDisney/Disney_34.gif'),
(36, 'Disney_35.gif', 3, '/cartesDisney/Disney_35.gif'),
(37, 'Disney_36.gif', 1, '/cartesDisney/Disney_36.gif'),
(38, 'Disney_37.gif', 3, '/cartesDisney/Disney_37.gif'),
(39, 'Disney_38.gif', 1, '/cartesDisney/Disney_38.gif'),
(40, 'Disney_39.gif', 3, '/cartesDisney/Disney_39.gif'),
(41, 'Disney_40.gif', 3, '/cartesDisney/Disney_40.gif'),
(42, 'Disney_41.gif', 1, '/cartesDisney/Disney_41.gif'),
(43, 'Disney_42.gif', 1, '/cartesDisney/Disney_42.gif'),
(44, 'Disney_43.gif', 3, '/cartesDisney/Disney_43.gif'),
(45, 'Disney_44.gif', 1, '/cartesDisney/Disney_44.gif'),
(46, 'Disney_45.gif', 1, '/cartesDisney/Disney_45.gif'),
(47, 'Disney_46.gif', 1, '/cartesDisney/Disney_46.gif'),
(48, 'Disney_47.gif', 1, '/cartesDisney/Disney_47.gif'),
(49, 'Disney_48.gif', 1, '/cartesDisney/Disney_48.gif'),
(50, 'Disney_49.gif', 1, '/cartesDisney/Disney_49.gif'),
(51, 'Disney_50.gif', 1, '/cartesDisney/Disney_50.gif'),
(52, 'Disney_51.gif', 1, '/cartesDisney/Disney_51.gif'),
(53, 'Disney_52.gif', 1, '/cartesDisney/Disney_52.gif'),
(54, 'Disney_53.gif', 1, '/cartesDisney/Disney_53.gif');

-- --------------------------------------------------------

--
-- Structure de la table `DiaposDansDiaporama`
--

CREATE TABLE `DiaposDansDiaporama` (
  `idDiapo` int(10) NOT NULL,
  `idDiaporama` int(10) NOT NULL,
  `rang` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `DiaposDansDiaporama`
--

INSERT INTO `DiaposDansDiaporama` (`idDiapo`, `idDiaporama`, `rang`) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 2, 9),
(4, 2, 8),
(5, 1, 7),
(6, 2, 3),
(7, 1, 6),
(8, 1, 20),
(9, 2, 2),
(10, 4, 1),
(11, 3, 7),
(12, 1, 8),
(12, 2, 19),
(13, 1, 5),
(13, 3, 2),
(14, 1, 19),
(15, 2, 18),
(19, 2, 15),
(20, 1, 4),
(21, 4, 9),
(22, 2, 7),
(23, 1, 13),
(24, 1, 3),
(25, 2, 14),
(25, 4, 8),
(26, 1, 2),
(26, 2, 5),
(27, 2, 13),
(28, 3, 8),
(29, 3, 10),
(30, 4, 10),
(31, 2, 12),
(32, 2, 4),
(33, 3, 9),
(33, 4, 7),
(34, 4, 5),
(35, 1, 11),
(36, 1, 12),
(37, 3, 4),
(38, 2, 6),
(38, 4, 6),
(39, 1, 9),
(40, 1, 16),
(40, 2, 11),
(41, 1, 10),
(41, 2, 10),
(42, 1, 14),
(42, 2, 17),
(43, 1, 18),
(43, 3, 3),
(44, 1, 15),
(45, 1, 17),
(46, 2, 16),
(47, 4, 3),
(50, 3, 6),
(50, 4, 4),
(51, 3, 5),
(52, 4, 2),
(54, 4, 11);

-- --------------------------------------------------------

--
-- Structure de la table `Familles`
--

CREATE TABLE `Familles` (
  `idFamille` int(10) NOT NULL,
  `nomFamille` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Familles`
--

INSERT INTO `Familles` (`idFamille`, `nomFamille`) VALUES
(1, 'Personnage'),
(2, 'Objet'),
(3, 'Animal');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Diaporamas`
--
ALTER TABLE `Diaporamas`
  ADD PRIMARY KEY (`idDiaporama`);

--
-- Index pour la table `Diapos`
--
ALTER TABLE `Diapos`
  ADD PRIMARY KEY (`idphoto`),
  ADD KEY `idFam` (`idFam`);

--
-- Index pour la table `DiaposDansDiaporama`
--
ALTER TABLE `DiaposDansDiaporama`
  ADD PRIMARY KEY (`idDiapo`,`idDiaporama`),
  ADD KEY `idDiaporama` (`idDiaporama`);

--
-- Index pour la table `Familles`
--
ALTER TABLE `Familles`
  ADD PRIMARY KEY (`idFamille`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Diaporamas`
--
ALTER TABLE `Diaporamas`
  MODIFY `idDiaporama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Diapos`
--
ALTER TABLE `Diapos`
  MODIFY `idphoto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `Familles`
--
ALTER TABLE `Familles`
  MODIFY `idFamille` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Diapos`
--
ALTER TABLE `Diapos`
  ADD CONSTRAINT `Diapos_ibfk_1` FOREIGN KEY (`idFam`) REFERENCES `Familles` (`idFamille`);

--
-- Contraintes pour la table `DiaposDansDiaporama`
--
ALTER TABLE `DiaposDansDiaporama`
  ADD CONSTRAINT `DiaposDansDiaporama_ibfk_1` FOREIGN KEY (`idDiaporama`) REFERENCES `Diaporamas` (`idDiaporama`),
  ADD CONSTRAINT `DiaposDansDiaporama_ibfk_2` FOREIGN KEY (`idDiapo`) REFERENCES `Diapos` (`idphoto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
