-- =====================================================================
--  NOXA BASE — INSTALLATION COMPLÈTE
--  Ouvrez phpMyAdmin, cliquez sur "Importer" depuis la page d'accueil
--  (sans sélectionner de base), choisissez ce fichier et cliquez Exécuter.
--  La base noxa est créée automatiquement.
--  Idempotent : réimportable sans risque (IF NOT EXISTS partout).
--  Compatible MariaDB 10.4+ / MySQL 8+.
-- =====================================================================

CREATE DATABASE IF NOT EXISTS `noxa`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE `noxa`;

-- =====================================================================
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 oct. 2025 à 02:55
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sql`
--

-- --------------------------------------------------------

--
-- Structure de la table `account_info`
--

CREATE TABLE `account_info` (
  `account_id` int(11) NOT NULL,
  `license` varchar(50) NOT NULL,
  `steam` varchar(22) DEFAULT NULL,
  `xbl` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `live` varchar(50) DEFAULT NULL,
  `shopgift` int(11) NOT NULL DEFAULT 0,
  `fivem` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `guid` varchar(20) DEFAULT NULL,
  `first_connection` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `account_info`
--


-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_black_money', 'Argent Sale Propriété', 0),
('property_dirtycash', 'Argent Sale Propriété', 0),
('society_Kays', 'Kays', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bcso', 'B.C.S.O', 0),
('society_boatseller', 'Concessionnaire Beneteau', 1),
('society_boatshop', 'Concessionnaire Bateaux', 1),
('society_brinks', 'Brinks', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_cardealer2', 'ConcessionnaireNord', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_fib', 'FIB', 1),
('society_gouv', 'Gouvernement', 1),
('society_k2r', 'K2R', 1),
('society_kk', 'kk', 1),
('society_mecano', 'Benny\'s', 1),
('society_mecano2', 'Ls Custom', 1),
('society_planeseller', 'Concessionnaire aéronotique', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_rap', 'Studio', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_roxsherif', 'R.S.D', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_test1', 'Teest', 1),
('society_test10', 'tEST&', 1),
('society_testk', 'testk', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1),
('society_vigneron', 'Vigneron', 1),
('trunk_dirtycash', 'Argent Sale Coffre Véhicule', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account_data`
--


-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_15', 'property', 1),
('society_Kays', 'Kays', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bcso', 'B.C.S.O', 1),
('society_boatseller', 'Concesionnaire Beneteau', 1),
('society_boatshop', 'Concessionnaire Bateaux', 1),
('society_brinks', 'Brinks', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_cardealer2', 'ConcesionnaireNord', 1),
('society_fib', 'FIB', 1),
('society_gouv', 'Gouvernement', 1),
('society_k2r', 'K2R', 1),
('society_kk', 'kk', 1),
('society_mecano', 'Benny\'s', 1),
('society_mecano2', 'Ls Custom', 1),
('society_planeseller', 'Concesionnaire aéronotique', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_rap', 'Studio', 1),
('society_roxsherif', 'R.S.D', 1),
('society_studio', 'Studio', 1),
('society_taxi', 'Taxi', 1),
('society_test1', 'Teest', 1),
('society_test10', 'tEST&', 1),
('society_testk', 'testk', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory_items`
--


-- --------------------------------------------------------

--
-- Structure de la table `baninfo`
--

CREATE TABLE `baninfo` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `playername` longtext DEFAULT NULL,
  `Token` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `baninfo`
--


-- --------------------------------------------------------

--
-- Structure de la table `bank_transactions`
--

CREATE TABLE `bank_transactions` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL CHECK (`type` in ('deposit','withdraw','transfer')),
  `amount` int(11) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bank_transactions`
--


-- --------------------------------------------------------

--
-- Structure de la table `banlist`
--

CREATE TABLE `banlist` (
  `license` varchar(50) NOT NULL,
  `ban_id` varchar(255) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` varchar(50) NOT NULL,
  `expiration` varchar(50) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `banlist`
--


-- --------------------------------------------------------

--
-- Structure de la table `banlisthistory`
--

CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL,
  `ban_id` varchar(255) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `banlisthistory`
--


-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `billing`
--


-- --------------------------------------------------------

--
-- Structure de la table `boosterperks`
--

CREATE TABLE `boosterperks` (
  `identifier` varchar(50) DEFAULT '255',
  `time` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

CREATE TABLE `boutique` (
  `id` int(11) NOT NULL,
  `code_boutique` varchar(5) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp_ms` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_admins`
--

CREATE TABLE `boutique_admins` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `added_by` varchar(50) NOT NULL,
  `added_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_history`
--

CREATE TABLE `boutique_history` (
  `id` int(11) NOT NULL,
  `code_boutique` varchar(5) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_label` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `purchase_date` datetime NOT NULL DEFAULT current_timestamp(),
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_images`
--

CREATE TABLE `boutique_images` (
  `code_boutique` varchar(50) NOT NULL,
  `image_url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_purchases`
--

CREATE TABLE `boutique_purchases` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_label` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `boutique_scan`
--

CREATE TABLE `boutique_scan` (
  `id` int(11) NOT NULL,
  `code_boutique` varchar(10) NOT NULL,
  `crate_id` varchar(50) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_type` varchar(20) NOT NULL DEFAULT 'item',
  `rarity` varchar(20) NOT NULL DEFAULT 'common',
  `amount` int(11) NOT NULL DEFAULT 1,
  `purchased` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `timestamp_ms` bigint(20) NOT NULL,
  `expiry` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT '',
  `price` int(11) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'cardealer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `name`, `price`, `society`) VALUES
(8270, 'blista', 'Blista', 15000, 'society_cardealer'),
(8271, 'driftfr36', 'Driftfr36', 40000, 'society_cardealer');

-- --------------------------------------------------------

--
-- Structure de la table `casier`
--

CREATE TABLE `casier` (
  `identifier` varchar(255) DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `casier`
--


-- --------------------------------------------------------

--
-- Structure de la table `casier2`
--

CREATE TABLE `casier2` (
  `identifier` varchar(255) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chestbuilder`
--

CREATE TABLE `chestbuilder` (
  `id` int(11) NOT NULL,
  `pos` longtext DEFAULT NULL,
  `job` varchar(50) NOT NULL DEFAULT '0',
  `items` longtext NOT NULL,
  `maxWeight` int(11) NOT NULL DEFAULT 0,
  `accesbmoney` bit(1) NOT NULL DEFAULT b'0',
  `money` int(11) NOT NULL DEFAULT 0,
  `bmoney` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_data`
--

CREATE TABLE `clothes_data` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `name` longtext NOT NULL DEFAULT '**NIL**',
  `data` longtext DEFAULT NULL,
  `type` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_inventory`
--

CREATE TABLE `clothes_inventory` (
  `UniqueID` int(11) NOT NULL,
  `clothes` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_societies`
--

CREATE TABLE `clothes_societies` (
  `id` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `equip` varchar(50) DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clothes_societies`
--


-- --------------------------------------------------------

--
-- Structure de la table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `darkchat_messages`
--

CREATE TABLE `darkchat_messages` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_15', 'property', 1),
('society_Kays', 'Kays', 1),
('society_ambulance', 'Ambulance', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahmas', 1),
('society_boatshop', 'Concessionnaire Bateaux', 1),
('society_brinks', 'Brinks', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_gouv', 'Gouvernement', 1),
('society_k2r', 'K2R', 1),
('society_kk', 'kk', 1),
('society_mecano', 'Benny\'s', 1),
('society_mecano2', 'Ls Custom', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_roxsherif', 'R.S.D', 1),
('society_taxi', 'Taxi', 1),
('society_test1', 'Teest', 1),
('society_test10', 'tEST&', 1),
('society_testk', 'testk', 1),
('society_unicorn', 'Unicorn', 1),
('society_vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `data` longtext DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore_data`
--


-- --------------------------------------------------------

--
-- Structure de la table `data_inventory`
--

CREATE TABLE `data_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `disabled_weapons`
--

CREATE TABLE `disabled_weapons` (
  `identifier` varchar(50) NOT NULL,
  `weapon` varchar(50) NOT NULL,
  `expire_time` int(11) NOT NULL,
  `disabled_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `createdBy` text NOT NULL,
  `createdAt` text NOT NULL,
  `label` varchar(50) NOT NULL,
  `drugsInfos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `drugs`
--


-- --------------------------------------------------------

--
-- Structure de la table `elevators`
--

CREATE TABLE `elevators` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `elevators`
--

INSERT INTO `elevators` (`id`, `name`) VALUES
(17, 'S.A.M.S');

-- --------------------------------------------------------

--
-- Structure de la table `emotes_binds`
--

CREATE TABLE `emotes_binds` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `binds` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emotes_fav`
--

CREATE TABLE `emotes_fav` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `favoris` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gang`
--

CREATE TABLE `gang` (
  `id` int(11) NOT NULL,
  `infos` longtext DEFAULT NULL,
  `weight` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `limitextra` longtext DEFAULT NULL,
  `poscoffre` longtext DEFAULT NULL,
  `pospatron` longtext DEFAULT NULL,
  `posgarage` longtext DEFAULT NULL,
  `posvestiaire` longtext DEFAULT NULL,
  `posgaragedelete` longtext DEFAULT NULL,
  `blips` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `posgaragespawn` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang`
--

INSERT INTO `gang` (`id`, `infos`, `weight`, `data`, `limitextra`, `poscoffre`, `pospatron`, `posgarage`, `posvestiaire`, `posgaragedelete`, `blips`, `garage`, `posgaragespawn`) VALUES
(68, '{\"label\":\"SOA\",\"name\":\"soa\"}', '{\"weight\":168,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_SNSPISTOL\":{\"count\":2,\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":247},\"WEAPON_PISTOL\":{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":246},\"WEAPON_BAT\":{\"count\":2,\"name\":\"WEAPON_BAT\",\"label\":\"Batte\",\"ammo\":0}},\"items\":{\"ciseaux\":{\"name\":\"ciseaux\",\"label\":\"Ciseaux\",\"count\":11},\"opium\":{\"name\":\"opium\",\"label\":\"Opium\",\"count\":39},\"kitcrochetage\":{\"name\":\"kitcrochetage\",\"label\":\"Kit de crochetage\",\"count\":5},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":19},\"grip\":{\"name\":\"grip\",\"label\":\"Poignée\",\"count\":3},\"jumelles\":{\"name\":\"jumelles\",\"label\":\"Jumelles\",\"count\":18},\"kevlarvip\":{\"name\":\"kevlarvip\",\"label\":\"Kevlar Lourd VIP\",\"count\":40},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":38},\"silencer\":{\"name\":\"silencer\",\"label\":\"Silencieux\",\"count\":2},\"clip\":{\"name\":\"clip\",\"label\":\"Chargeur\",\"count\":97},\"nitrovehicle\":{\"name\":\"nitrovehicle\",\"label\":\"Nitro Voiture\",\"count\":15},\"bmx\":{\"name\":\"bmx\",\"label\":\"Bmx\",\"count\":6},\"staminaboost\":{\"name\":\"staminaboost\",\"label\":\"RedBull\",\"count\":25},\"kevlar\":{\"name\":\"kevlar\",\"label\":\"Kevlar Lourd\",\"count\":7},\"scope\":{\"name\":\"scope\",\"label\":\"Visée de Lunette\",\"count\":6},\"spray_can\":{\"name\":\"spray_can\",\"label\":\"Graffiti\",\"count\":5},\"jerican\":{\"name\":\"jerican\",\"label\":\"Jerrican D\'essence\",\"count\":3}},\"accounts\":{\"dirtycash\":2553405,\"cash\":694500}}', '{\"tenue\":3,\"maxveh\":100,\"veh\":0,\"maxtenue\":50,\"vente\":0}', '{\"x\":160.85275268554688,\"y\":329.024169921875,\"z\":117.3201904296875}', '{\"z\":116.6124267578125,\"x\":139.87252807617188,\"y\":339.96923828125}', '{\"z\":112.13037109375,\"x\":134.63735961914066,\"y\":320.8879089355469}', '{\"z\":116.5955810546875,\"x\":143.98681640625,\"y\":331.5428466796875}', '{\"z\":111.5238037109375,\"x\":147.1780242919922,\"y\":320.4395751953125}', '{\"x\":981.1781005859376,\"y\":-112.44686889648438,\"z\":74.22679901123047}', '{}', '{\"spawn\":{\"z\":111.5238037109375,\"x\":139.25274658203126,\"y\":317.024169921875},\"heading\":110.55118560791016}'),
(107, '{\"label\":\"bloods\",\"name\":\"bloods\"}', '{\"weight\":0,\"maxweight\":1000}', '{\"weapons\":{},\"items\":{},\"accounts\":{\"dirtycash\":100000,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":10,\"veh\":2,\"maxtenue\":5,\"vente\":0}', '{\"x\":-1556.6900634765626,\"z\":48.03369140625,\"y\":-374.8351745605469}', '{\"x\":-1564.826416015625,\"z\":52.21240234375,\"y\":-408.975830078125}', '{\"x\":-1569.81103515625,\"y\":-391.1208801269531,\"z\":41.9677734375}', '{\"x\":-1567.094482421875,\"z\":48.2528076171875,\"y\":-402.1318664550781}', '{\"x\":-1553.063720703125,\"z\":41.9677734375,\"y\":-392.6109924316406}', '{\"x\":-1545.81103515625,\"y\":-400.1406555175781,\"z\":41.984619140625}', '{}', '{\"spawn\":{\"x\":-1561.92529296875,\"z\":41.9677734375,\"y\":-389.4725341796875},\"heading\":221.1023712158203}'),
(133, '{\"label\":\"cayo\",\"name\":\"cayo\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{},\"items\":{\"bitcoin\":{\"name\":\"bitcoin\",\"label\":\"Bitcoin\",\"count\":48},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":1236},\"meth\":{\"name\":\"meth\",\"label\":\"Meth\",\"count\":41}},\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":1,\"maxveh\":100,\"veh\":11,\"maxtenue\":25,\"vente\":0}', '{\"x\":4991.14306640625,\"y\":-5740.52294921875,\"z\":19.877685546875}', '{\"x\":5012.861328125,\"y\":-5756.0703125,\"z\":28.892333984375}', '{\"x\":4974.0263671875,\"y\":-5730.43505859375,\"z\":19.877685546875}', '{\"x\":5005.05517578125,\"y\":-5754.93603515625,\"z\":28.9091796875}', '{\"x\":4976.314453125,\"y\":-5738.0234375,\"z\":19.88018989562988}', '{\"x\":4971.607421875,\"y\":-5782.77587890625,\"z\":20.9084186553955}', '{\"7263BOBA\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":774.2,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"7263BOBA\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-670086588,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":12.3,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":869.2,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":73,\"color1\":64,\"fuelLevel\":47.5,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":915.5,\"wheels\":3,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":true},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":64,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"7263BOBA\"}}', '{\"spawn\":{\"x\":4970.97119140625,\"y\":-5747.6064453125,\"z\":19.88018417358398},\"heading\":240.9710693359375}'),
(134, '{\"name\":\"famillies\",\"label\":\"famillies\"}', '{\"weight\":0,\"maxweight\":1000}', '{\"weapons\":{\"WEAPON_SNSPISTOL\":{\"count\":1,\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":250}},\"items\":{\"burgerclassique\":{\"name\":\"burgerclassique\",\"label\":\"Burger Classique\",\"count\":20},\"coke_pooch\":{\"name\":\"coke_pooch\",\"label\":\"Pochon de coke\",\"count\":75},\"meth\":{\"name\":\"meth\",\"label\":\"Meth\",\"count\":140},\"coca\":{\"name\":\"coca\",\"label\":\"Coca\",\"count\":20},\"bmx\":{\"name\":\"bmx\",\"label\":\"Bmx\",\"count\":3},\"drill\":{\"name\":\"drill\",\"label\":\"Perceuse\",\"count\":5},\"meth_pooch\":{\"name\":\"meth_pooch\",\"label\":\"Pochon de meth\",\"count\":149},\"iak_wheelchair\":{\"name\":\"iak_wheelchair\",\"label\":\"Fauteuil Roulant\",\"count\":8},\"vodka_coca\":{\"name\":\"vodka_coca\",\"label\":\"Vodka Coca\",\"count\":1},\"spray_can\":{\"name\":\"spray_can\",\"label\":\"Graffiti\",\"count\":3}},\"accounts\":{\"dirtycash\":1322509,\"cash\":0}}', '{\"tenue\":2,\"maxveh\":100,\"veh\":19,\"maxtenue\":25,\"vente\":0}', '{\"x\":-162.7252655029297,\"y\":-1635.9033203125,\"z\":37.23291015625}', '{\"x\":-151.10769653320313,\"y\":-1622.16259765625,\"z\":33.6439208984375}', '{\"y\":-1634.796142578125,\"z\":33.56646347045898,\"x\":-202.7292022705078}', '{\"y\":-1622.780517578125,\"z\":33.70540237426758,\"x\":-163.8584442138672}', '{\"y\":-1635.61328125,\"z\":33.3646011352539,\"x\":-192.0630340576172}', '{\"x\":-165.9830780029297,\"y\":-1631.63916015625,\"z\":33.65288543701172}', '{\"42FAX047\":{\"props\":{\"pearlescentColor\":111,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRoof\":-1,\"fuelLevel\":79.1,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"42FAX047\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":2112052861,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":13.3,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tankHealth\":999.6,\"wheels\":0,\"modSmokeEnabled\":false,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":0,\"color1\":9,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":995.7,\"extras\":{\"1\":1,\"2\":false},\"tyreSmokeColor\":[255,255,255]},\"plate\":\"42FAX047\"},\"85SJJ834\":{\"props\":{\"pearlescentColor\":4,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":true,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":58.5,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"85SJJ834\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-913589546,\"modFrontWheels\":0,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":9.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":false,\"7\":false,\"0\":true,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":9,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":900.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":1,\"tankHealth\":984.0,\"wheels\":4,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":53,\"color1\":53,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":834.0,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"85SJJ834\"},\"21EDD943\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"bodyHealth\":983.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"21EDD943\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":7.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":48,\"color1\":48,\"fuelLevel\":65.9,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":994.4,\"wheels\":0,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":58,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"5\":1,\"11\":false,\"1\":1,\"12\":1},\"modBackWheels\":-1},\"plate\":\"21EDD943\"},\"42EHO889\":{\"props\":{\"pearlescentColor\":4,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"fuelLevel\":56.0,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"42EHO889\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-1311154784,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":5.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":988.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tankHealth\":993.8,\"wheels\":0,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":0,\"color1\":1,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":979.5,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"42EHO889\"},\"83LRX592\":{\"props\":{\"pearlescentColor\":0,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"fuelLevel\":62.8,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"83LRX592\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-431692672,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":6.8,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tankHealth\":996.8,\"wheels\":5,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":3,\"color1\":3,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":956.0,\"extras\":{\"3\":1,\"4\":1,\"1\":1,\"2\":1,\"5\":1},\"tyreSmokeColor\":[255,255,255]},\"plate\":\"83LRX592\"},\"43XIK867\":{\"props\":{\"pearlescentColor\":18,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false},\"modRoof\":-1,\"fuelLevel\":49.9,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"43XIK867\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-1405937764,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":10.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":false,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":976.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":112,\"tankHealth\":980.9,\"wheels\":7,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":0,\"color1\":145,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":755.7,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"43XIK867\"},\"01BRY623\":{\"props\":{\"pearlescentColor\":20,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":true,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":53.8,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"01BRY623\",\"modHydrolic\":-1,\"modSideSkirt\":3,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":872704284,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":2,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":8,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":3,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":8,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":793.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":8,\"modFrontBumper\":4,\"modRearBumper\":3,\"neonEnabled\":[false,false,false,false],\"modExhaust\":8,\"modShifterLeavers\":-1,\"modBrakes\":2,\"wheelColor\":156,\"tankHealth\":825.0,\"wheels\":4,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":2,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":2,\"color1\":53,\"modSpoilers\":11,\"modVanityPlate\":-1,\"bodyHealth\":250.0,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"01BRY623\"},\"2112FPUP\":{\"props\":{\"pearlescentColor\":83,\"doorsBroken\":{\"3\":false,\"0\":true,\"1\":true,\"2\":false},\"modRoof\":-1,\"fuelLevel\":17.7,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"2112FPUP\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":389821046,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":9.7,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":false,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":816.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":120,\"tankHealth\":700.0,\"wheels\":7,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":141,\"color1\":141,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":0.0,\"extras\":{\"1\":false,\"2\":false},\"tyreSmokeColor\":[255,255,255]},\"plate\":\"2112FPUP\"},\"87ICS983\":{\"props\":{\"pearlescentColor\":2,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":true,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":94.8,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"87ICS983\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-1349095620,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":true,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":965.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":0,\"tankHealth\":982.0,\"wheels\":3,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":134,\"color1\":105,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":912.0,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"87ICS983\"},\"43ACL069\":{\"props\":{\"pearlescentColor\":55,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":true,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":44.0,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"43ACL069\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":872704284,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":2,\"dirtLevel\":14.3,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":2,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":984.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":9,\"modFrontBumper\":3,\"modRearBumper\":3,\"neonEnabled\":[false,false,false,false],\"modExhaust\":8,\"modShifterLeavers\":-1,\"modBrakes\":2,\"wheelColor\":1,\"tankHealth\":986.5,\"wheels\":4,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":2,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":21,\"color1\":21,\"modSpoilers\":14,\"modVanityPlate\":-1,\"bodyHealth\":808.5,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"43ACL069\"},\"24HER032\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"fuelLevel\":69.7,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"24HER032\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":14.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"color1\":132,\"pearlescentColor\":132,\"neonEnabled\":[false,false,false,false],\"modRearBumper\":-1,\"modShifterLeavers\":-1,\"wheels\":0,\"wheelColor\":156,\"tankHealth\":1000.0,\"modDoorR\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"modRightFender\":-1,\"modArmor\":-1,\"modAerials\":-1,\"modTank\":-1,\"windowTint\":-1,\"modDashboard\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"color2\":58,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"bodyHealth\":1000.0,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modFender\":-1,\"extras\":{\"1\":1,\"11\":1,\"5\":1,\"12\":false},\"modLightbar\":-1},\"plate\":\"24HER032\"},\"05VZH141\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"bodyHealth\":910.1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"05VZH141\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":14.7,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":993.1,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":132,\"color1\":132,\"fuelLevel\":66.3,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":956.1,\"wheels\":0,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":58,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"5\":1,\"11\":false,\"1\":1,\"12\":1},\"modBackWheels\":-1},\"plate\":\"05VZH141\"},\"60FYB883\":{\"props\":{\"pearlescentColor\":132,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"fuelLevel\":65.6,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"60FYB883\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":7.2,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":962.8,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tankHealth\":976.9,\"wheels\":0,\"modSmokeEnabled\":false,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":58,\"color1\":132,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":933.1,\"extras\":{\"1\":1,\"11\":false,\"5\":1,\"12\":1},\"tyreSmokeColor\":[255,255,255]},\"plate\":\"60FYB883\"},\"45COR564\":{\"props\":{\"pearlescentColor\":1,\"doorsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":true,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":37.4,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"45COR564\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":872704284,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":0,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":802.3,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":2,\"wheelColor\":0,\"tankHealth\":822.8,\"wheels\":4,\"modSmokeEnabled\":false,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":2,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":53,\"color1\":53,\"modSpoilers\":0,\"modVanityPlate\":-1,\"bodyHealth\":91.0,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"45COR564\"},\"00AJC237\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":907.1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"00AJC237\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-14495224,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":5.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":false,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":976.2,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":111,\"color1\":5,\"fuelLevel\":64.2,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":998.4,\"wheels\":2,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"3\":false,\"4\":false,\"1\":1,\"2\":false,\"11\":1,\"10\":false,\"12\":false},\"modBackWheels\":-1},\"plate\":\"00AJC237\"},\"02BLT734\":{\"props\":{\"pearlescentColor\":48,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"fuelLevel\":63.3,\"neonColor\":[255,255,255],\"modBackWheels\":-1,\"plate\":\"02BLT734\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":13.8,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":968.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tankHealth\":969.0,\"wheels\":0,\"modSmokeEnabled\":false,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":58,\"color1\":48,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":934.0,\"extras\":{\"1\":1,\"11\":false,\"5\":1,\"12\":false},\"tyreSmokeColor\":[255,255,255]},\"plate\":\"02BLT734\"},\"PNJ6904\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":true},\"modRoof\":-1,\"fuelLevel\":62.6,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"PNJ6904\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":1039032026,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":4.7,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":true,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modDial\":-1,\"engineHealth\":987.8,\"modTrunk\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"color1\":33,\"pearlescentColor\":26,\"neonEnabled\":[false,false,false,false],\"modRearBumper\":-1,\"modShifterLeavers\":-1,\"wheels\":5,\"wheelColor\":106,\"tankHealth\":999.2,\"modDoorR\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"modRightFender\":-1,\"modArmor\":-1,\"modAerials\":-1,\"modTank\":-1,\"windowTint\":-1,\"modDashboard\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"color2\":0,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"bodyHealth\":991.8,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modFender\":-1,\"extras\":{\"2\":false},\"modLightbar\":-1},\"plate\":\"PNJ6904\"}}', '{\"heading\":240.97994995117188,\"spawn\":{\"y\":-1627.0701904296876,\"z\":33.46438217163086,\"x\":-191.66831970214845}}'),
(149, '{\"label\":\"ballas\",\"name\":\"ballas\"}', '{\"weight\":0,\"maxweight\":1000}', '{\"weapons\":{\"WEAPON_COMPACTRIFLE\":{\"count\":1,\"name\":\"WEAPON_COMPACTRIFLE\",\"label\":\"Fusil compact\",\"ammo\":250},\"WEAPON_PISTOL_MK2\":{\"count\":1,\"name\":\"WEAPON_PISTOL_MK2\",\"label\":\"Pistolet Mk II\",\"ammo\":249},\"WEAPON_FLASHLIGHT\":{\"count\":1,\"name\":\"WEAPON_FLASHLIGHT\",\"label\":\"Lampe torche\",\"ammo\":0}},\"items\":{\"grip\":{\"name\":\"grip\",\"label\":\"Poignée\",\"count\":1},\"carokit\":{\"name\":\"carokit\",\"label\":\"Kit carosserie\",\"count\":56},\"cappuccino\":{\"name\":\"cappuccino\",\"label\":\"Cappuccino\",\"count\":2},\"meth\":{\"name\":\"meth\",\"label\":\"Meth\",\"count\":798},\"silencer\":{\"name\":\"silencer\",\"label\":\"Silencieux\",\"count\":1},\"clip\":{\"name\":\"clip\",\"label\":\"Chargeur\",\"count\":19},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":268},\"bitcoin\":{\"name\":\"bitcoin\",\"label\":\"Bitcoin\",\"count\":11},\"scope\":{\"name\":\"scope\",\"label\":\"Visée de Lunette\",\"count\":1},\"cleankit\":{\"name\":\"cleankit\",\"label\":\"Kit Nettoyage Voiture\",\"count\":4},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":11},\"weed\":{\"name\":\"weed\",\"label\":\"Weed\",\"count\":83},\"jewels\":{\"name\":\"jewels\",\"label\":\"Bijoux\",\"count\":31}},\"accounts\":{\"dirtycash\":0,\"cash\":134825}}', '{\"tenue\":0,\"maxveh\":10,\"veh\":1,\"maxtenue\":5,\"vente\":0}', '{\"x\":117.86373901367188,\"y\":-1974.5538330078126,\"z\":21.3099365234375}', '{\"x\":113.45934295654297,\"y\":-1973.98681640625,\"z\":21.3099365234375}', '{\"x\":117.62637329101563,\"y\":-1952.2548828125,\"z\":20.737060546875}', '{\"x\":111.5999984741211,\"y\":-1978.5758056640626,\"z\":20.972900390625}', '{\"x\":115.34505462646485,\"y\":-1948.5230712890626,\"z\":20.6358642578125}', '{\"x\":105.25495147705078,\"y\":-1943.009765625,\"z\":25.4146499633789}', '{\"69VYX930\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":772.3,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"69VYX930\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":872704284,\"modFrontWheels\":4,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":7.7,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":919.5,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":135,\"color1\":145,\"fuelLevel\":37.4,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":148,\"tankHealth\":968.8,\"wheels\":7,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":145,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"69VYX930\"}}', '{\"heading\":48.18897247314453,\"spawn\":{\"x\":107.5780258178711,\"y\":-1942.1142578125,\"z\":20.78759765625}}'),
(174, '{\"name\":\"camorra\",\"label\":\"Camorra\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_SNSPISTOL\":{\"count\":1,\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":250},\"WEAPON_MILITARYRIFLE\":{\"count\":1,\"name\":\"WEAPON_MILITARYRIFLE\",\"label\":\"Fusil militaire\",\"ammo\":79},\"WEAPON_PISTOL50\":{\"count\":4,\"name\":\"WEAPON_PISTOL50\",\"label\":\"Pistolet calibre 50\",\"ammo\":250},\"WEAPON_APPISTOL\":{\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"label\":\"Pistolet automatique\",\"ammo\":250},\"WEAPON_PISTOL\":{\"count\":5,\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":250},\"WEAPON_KNIFE\":{\"count\":2,\"name\":\"WEAPON_KNIFE\",\"label\":\"Couteau\",\"ammo\":0},\"WEAPON_MACHETE\":{\"count\":2,\"name\":\"WEAPON_MACHETE\",\"label\":\"Machette\",\"ammo\":0},\"WEAPON_AK47\":{\"count\":1,\"name\":\"WEAPON_AK47\",\"label\":\"AK47 NON PERM\",\"ammo\":250}},\"items\":{\"kevlar\":{\"name\":\"kevlar\",\"label\":\"Kevlar Lourd\",\"count\":10},\"ciseaux\":{\"name\":\"ciseaux\",\"label\":\"Ciseaux\",\"count\":1},\"whisky\":{\"name\":\"whisky\",\"label\":\"Whisky\",\"count\":1},\"kevlarvip\":{\"name\":\"kevlarvip\",\"label\":\"Kevlar Lourd VIP\",\"count\":595},\"lsd_pooch\":{\"name\":\"lsd_pooch\",\"label\":\"Pochon de LSD\",\"count\":30},\"weed\":{\"name\":\"weed\",\"label\":\"Weed\",\"count\":5},\"kq_outfitbag\":{\"name\":\"kq_outfitbag\",\"label\":\"Outfit bag\",\"count\":1},\"meth\":{\"name\":\"meth\",\"label\":\"Meth\",\"count\":5},\"acier\":{\"name\":\"acier\",\"label\":\"Acier\",\"count\":1},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":5},\"wiskycoca\":{\"name\":\"wiskycoca\",\"label\":\"wiskycoca\",\"count\":5},\"metreshooter\":{\"name\":\"metreshooter\",\"label\":\"Mètre de shooter\",\"count\":1}},\"accounts\":{\"dirtycash\":0,\"cash\":7100000}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":5,\"maxtenue\":25,\"vente\":0}', '{\"x\":-1529.3275146484376,\"y\":1904.6900634765626,\"z\":67.175048828125}', '{\"x\":-1538.2021484375,\"y\":1905.177978515625,\"z\":67.175048828125}', '{\"x\":-1529.3143310546876,\"y\":1919.010986328125,\"z\":61.7325439453125}', '{\"x\":-1511.9736328125,\"y\":1894.7208251953126,\"z\":61.7325439453125}', '{\"x\":-1525.160400390625,\"y\":1920.870361328125,\"z\":61.7325439453125}', '{\"x\":117.42857360839844,\"y\":613.6483764648438,\"z\":209.2021484375}', '{\"7332AYOT\":{\"props\":{\"modExhaust\":0,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":1,\"bodyHealth\":668.6,\"neonColor\":[0,0,0],\"modRearBumper\":1,\"plate\":\"7332AYOT\",\"modHydrolic\":-1,\"modSideSkirt\":3,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-619930876,\"modFrontWheels\":10,\"modArchCover\":-1,\"modSuspension\":1,\"modSeats\":-1,\"modBrakes\":1,\"modTransmission\":1,\"dirtLevel\":8.1,\"modFrame\":0,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":4,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":1,\"modLivery\":-1,\"modOrnaments\":5,\"modDial\":-1,\"engineHealth\":974.2,\"modTrunk\":-1,\"modHorns\":1,\"pearlescentColor\":149,\"color1\":122,\"fuelLevel\":28.3,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":0,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":982.9,\"wheels\":8,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":3,\"modDashboard\":-1,\"modFrontBumper\":3,\"tyreSmokeColor\":[255,255,255],\"color2\":145,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"7332AYOT\"},\"86ETF847\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":0,\"bodyHealth\":1000.0,\"neonColor\":[0,0,0],\"modRearBumper\":-1,\"plate\":\"86ETF847\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":736902334,\"modFrontWheels\":15,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":12.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":2,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":false,\"1\":true,\"2\":false,\"7\":false,\"0\":true,\"5\":false,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":1,\"color1\":67,\"fuelLevel\":80.5,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":0,\"modDoorR\":-1,\"wheelColor\":67,\"tankHealth\":1000.0,\"wheels\":0,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":0,\"modDashboard\":-1,\"modFrontBumper\":0,\"tyreSmokeColor\":[255,255,255],\"color2\":67,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"11\":1,\"12\":false},\"modBackWheels\":-1},\"plate\":\"86ETF847\"},\"61PXN235\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false},\"modRoof\":-1,\"bodyHealth\":881.3,\"neonColor\":[0,0,0],\"modRearBumper\":-1,\"plate\":\"61PXN235\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-122993285,\"modFrontWheels\":16,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":true,\"2\":false,\"7\":false,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":998.9,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":35,\"color1\":43,\"fuelLevel\":51.5,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":993.7,\"wheels\":7,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":43,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"61PXN235\"},\"09SLM746\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"bodyHealth\":4.4,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"09SLM746\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":408825843,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":3.4,\"modFrame\":-1,\"xenonColor\":6,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":1,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":893.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":1,\"color1\":160,\"fuelLevel\":33.0,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":882.7,\"wheels\":4,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":12,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"09SLM746\"},\"44RMT698\":{\"props\":{\"modExhaust\":7,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":0,\"bodyHealth\":554.0,\"neonColor\":[255,0,255],\"modRearBumper\":0,\"plate\":\"44RMT698\",\"modHydrolic\":-1,\"modSideSkirt\":5,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-1244461404,\"modFrontWheels\":9,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":9.0,\"modFrame\":-1,\"xenonColor\":0,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":false,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":1,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":960.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":111,\"color1\":12,\"fuelLevel\":64.8,\"neonEnabled\":[false,false,false,false],\"modFender\":0,\"modSpoilers\":17,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":981.0,\"wheels\":7,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":7,\"modDashboard\":-1,\"modFrontBumper\":4,\"tyreSmokeColor\":[255,255,255],\"color2\":111,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":false,\"2\":false},\"modBackWheels\":-1},\"plate\":\"44RMT698\"}}', '{\"spawn\":{\"x\":-1526.18896484375,\"y\":1917.6263427734376,\"z\":61.7325439453125},\"heading\":198.42520141601563}');
INSERT INTO `gang` (`id`, `infos`, `weight`, `data`, `limitextra`, `poscoffre`, `pospatron`, `posgarage`, `posvestiaire`, `posgaragedelete`, `blips`, `garage`, `posgaragespawn`) VALUES
(181, '{\"name\":\"NarcosNeras\",\"label\":\"NarcosNeras\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_KNIFE\":{\"count\":1,\"name\":\"WEAPON_KNIFE\",\"label\":\"Couteau\",\"ammo\":0},\"GADGET_PARACHUTE\":{\"count\":1,\"name\":\"GADGET_PARACHUTE\",\"label\":\"Parachute\",\"ammo\":0},\"WEAPON_FLASHLIGHT\":{\"count\":1,\"name\":\"WEAPON_FLASHLIGHT\",\"label\":\"Lampe torche\",\"ammo\":0}},\"items\":{\"kevlar\":{\"name\":\"kevlar\",\"label\":\"Kevlar Lourd\",\"count\":2},\"carokit\":{\"name\":\"carokit\",\"label\":\"Kit carosserie\",\"count\":3},\"jumelles\":{\"name\":\"jumelles\",\"label\":\"Jumelles\",\"count\":1},\"jerican\":{\"name\":\"jerican\",\"label\":\"Jerrican D\'essence\",\"count\":1},\"kevlarvip\":{\"name\":\"kevlarvip\",\"label\":\"Kevlar Lourd VIP\",\"count\":9},\"weed\":{\"name\":\"weed\",\"label\":\"Weed\",\"count\":11},\"clip\":{\"name\":\"clip\",\"label\":\"Chargeur\",\"count\":38},\"water\":{\"name\":\"water\",\"label\":\"Bouteille d\'eau\",\"count\":36},\"bmx\":{\"name\":\"bmx\",\"label\":\"Bmx\",\"count\":4},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":4},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":282},\"scope\":{\"name\":\"scope\",\"label\":\"Visée de Lunette\",\"count\":1},\"phone\":{\"name\":\"phone\",\"label\":\"Téléphone\",\"count\":1},\"bread\":{\"name\":\"bread\",\"label\":\"Pain\",\"count\":7}},\"accounts\":{\"dirtycash\":2221152,\"cash\":0}}', '{\"tenue\":1,\"maxveh\":100,\"veh\":2,\"maxtenue\":25,\"vente\":0}', '{\"x\":-940.0841064453125,\"y\":202.3144073486328,\"z\":67.85977935791016}', '{\"x\":-941.564453125,\"y\":199.84967041015626,\"z\":67.86485290527344}', '{\"x\":-930.4239501953125,\"y\":214.78736877441407,\"z\":67.46452331542969}', '{\"x\":-938.7363891601563,\"y\":206.0638427734375,\"z\":67.46491241455078}', '{\"x\":-929.00244140625,\"y\":212.31849670410157,\"z\":67.46460723876953}', '{\"x\":-939.1836547851564,\"y\":204.1239013671875,\"z\":67.85972595214844}', '{\"62TMT610\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":784.3,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"62TMT610\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2107990196,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":2,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":945.4,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":13,\"color1\":12,\"fuelLevel\":73.0,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":970.0,\"wheels\":0,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":12,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"62TMT610\"},\"42VEI126\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":840.3,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"42VEI126\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2107990196,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":4.3,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":2,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":13,\"color1\":12,\"fuelLevel\":79.4,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":997.6,\"wheels\":0,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":12,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"42VEI126\"}}', '{\"heading\":149.15106201171876,\"spawn\":{\"x\":-929.4963989257813,\"y\":210.69451904296876,\"z\":67.46468353271485}}'),
(186, '{\"label\":\"Gitan\",\"name\":\"Gitan\"}', '{\"weight\":0,\"maxweight\":1000}', '{\"weapons\":{},\"items\":{\"cleankit\":{\"name\":\"cleankit\",\"label\":\"Kit Nettoyage Voiture\",\"count\":8},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":121},\"coke_pooch\":{\"name\":\"coke_pooch\",\"label\":\"Pochon de coke\",\"count\":1},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":2}},\"accounts\":{\"dirtycash\":1839805,\"cash\":1315043}}', '{\"tenue\":2,\"maxveh\":100,\"veh\":3,\"maxtenue\":25,\"vente\":0}', '{\"x\":-2032.7076416015626,\"y\":-451.6878967285156,\"z\":11.7392578125}', '{\"x\":-1993.89892578125,\"y\":-488.71649169921877,\"z\":12.093017578125}', '{\"x\":-2030.5845947265626,\"y\":-465.30987548828127,\"z\":11.5875244140625}', '{\"x\":-2020.4835205078126,\"y\":-471.21759033203127,\"z\":11.4527587890625}', '{\"x\":-2034.6988525390626,\"y\":-462.1450500488281,\"z\":11.4022216796875}', '{\"x\":-1518.6988525390626,\"y\":-886.7472534179688,\"z\":10.12158203125}', '{\"05PUT035\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":973.8,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"05PUT035\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2107990196,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":9.3,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":998.8,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":2,\"color1\":105,\"fuelLevel\":85.3,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":990.2,\"wheels\":0,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":12,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"05PUT035\"},\"08CXC775\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":795.5,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"08CXC775\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2107990196,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":14.2,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":false,\"7\":false,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":929.6,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":2,\"color1\":105,\"fuelLevel\":31.7,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":0,\"tankHealth\":964.3,\"wheels\":0,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":105,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"08CXC775\"},\"44EVE433\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"0\":false,\"1\":false,\"2\":false},\"modRoof\":-1,\"bodyHealth\":975.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"44EVE433\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":850991848,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":0.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":48,\"color1\":48,\"fuelLevel\":66.3,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":991.6,\"wheels\":0,\"tyreBurst\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":58,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"5\":1,\"11\":false,\"1\":1,\"12\":1},\"modBackWheels\":-1},\"plate\":\"44EVE433\"}}', '{\"heading\":328.81890869140627,\"spawn\":{\"x\":-2029.3978271484376,\"y\":-459.3758239746094,\"z\":11.5032958984375}}'),
(191, '{\"label\":\"CBZ\",\"name\":\"Canadian Boy\'Z\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":0,\"maxtenue\":25,\"vente\":0}', '{\"x\":742.1052856445313,\"y\":1284.2197265625,\"z\":360.4949645996094}', '{\"x\":743.2909545898438,\"y\":1279.7442626953126,\"z\":360.4950866699219}', '{\"x\":763.0382080078125,\"y\":1281.6695556640626,\"z\":360.494384765625}', '{\"x\":765.859619140625,\"y\":1287.4691162109376,\"z\":360.4942626953125}', '{\"x\":776.7179565429688,\"y\":1277.2413330078126,\"z\":360.4945068359375}', '{\"x\":766.7091674804688,\"y\":1287.804931640625,\"z\":360.4942626953125}', '[]', '{\"spawn\":{\"x\":789.7465209960938,\"y\":1275.8760986328126,\"z\":360.4960021972656},\"heading\":263.7498474121094}'),
(193, '{\"label\":\"Crips\",\"name\":\"crips\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":1,\"maxveh\":100,\"veh\":2,\"maxtenue\":25,\"vente\":0}', '{\"x\":-345.5297546386719,\"y\":35.13405227661133,\"z\":47.85894775390625}', '{\"x\":-358.2311096191406,\"y\":17.17365264892578,\"z\":47.85474395751953}', '{\"x\":-365.69744873046877,\"y\":43.454345703125,\"z\":50.93448638916015}', '{\"x\":-366.69342041015627,\"y\":48.72430801391601,\"z\":54.42980194091797}', '{\"x\":-369.1427001953125,\"y\":40.78859329223633,\"z\":51.05913162231445}', '{\"x\":-361.95513916015627,\"y\":32.24496459960937,\"z\":47.87616348266601}', '{\"89HFJ286\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":1000.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"89HFJ286\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-310465116,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":9.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":4,\"color1\":3,\"fuelLevel\":63.4,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"wheels\":0,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":3,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":false,\"2\":1},\"modBackWheels\":-1},\"plate\":\"89HFJ286\"},\"81TOU423\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRoof\":-1,\"bodyHealth\":0.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"81TOU423\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-810318068,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":581.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":5,\"color1\":7,\"fuelLevel\":64.9,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":861.8,\"wheels\":1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"81TOU423\"}}', '{\"heading\":82.37907409667969,\"spawn\":{\"x\":-379.367919921875,\"y\":39.91628646850586,\"z\":50.10677719116211}}'),
(194, '{\"label\":\"White\",\"name\":\"white\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_PISTOL\":{\"count\":6,\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":226}},\"items\":{\"kevlar\":{\"name\":\"kevlar\",\"label\":\"Kevlar Lourd\",\"count\":2},\"lsd\":{\"name\":\"lsd\",\"label\":\"LSD\",\"count\":251},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":48},\"drill\":{\"name\":\"drill\",\"label\":\"Perceuse\",\"count\":1}},\"accounts\":{\"dirtycash\":1558447,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":8,\"maxtenue\":25,\"vente\":0}', '{\"x\":-658.1212158203125,\"y\":886.2695922851563,\"z\":229.30447387695313}', '{\"x\":-653.7758178710938,\"y\":889.3846435546875,\"z\":229.236572265625}', '{\"x\":-673.9448852539063,\"y\":898.7948608398438,\"z\":229.4535369873047}', '{\"x\":-643.1095581054688,\"y\":874.0364379882813,\"z\":224.5931396484375}', '{\"x\":-676.4693603515625,\"y\":903.6446533203124,\"z\":230.5802459716797}', '{\"x\":-642.7693481445313,\"y\":874.6222534179688,\"z\":224.4877471923828}', '{\"87GEW162\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"1\":false,\"0\":false},\"modRoof\":-1,\"bodyHealth\":828.2,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"87GEW162\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":390201602,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":10.4,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":879.9,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":5,\"color1\":132,\"fuelLevel\":43.2,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":112,\"tankHealth\":896.2,\"wheels\":6,\"tyreBurst\":{\"0\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":12,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"87GEW162\"},\"42LPP448\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":930.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"42LPP448\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-208911803,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":1.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":true,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":943.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":1,\"color1\":111,\"fuelLevel\":92.7,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":111,\"tankHealth\":991.0,\"wheels\":4,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":111,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":1},\"modBackWheels\":-1},\"plate\":\"42LPP448\"},\"87RCH181\":{\"props\":{\"pearlescentColor\":1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":83.7,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"87RCH181\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-410205223,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":958.0,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":132,\"tankHealth\":958.0,\"wheels\":4,\"modSmokeEnabled\":false,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":111,\"color1\":111,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":565.0,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"87RCH181\"},\"87RMC457\":{\"props\":{\"pearlescentColor\":13,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"fuelLevel\":65.2,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"87RMC457\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2107990196,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":691.7,\"modTrunk\":-1,\"modHorns\":-1,\"modHood\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"wheelColor\":0,\"tankHealth\":865.4,\"wheels\":0,\"modSmokeEnabled\":false,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modRightFender\":-1,\"modEngine\":-1,\"modArmor\":-1,\"modTank\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modDoorR\":-1,\"modDashboard\":-1,\"modLightbar\":-1,\"modFender\":-1,\"color2\":12,\"color1\":12,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"bodyHealth\":359.5,\"extras\":[],\"tyreSmokeColor\":[255,255,255]},\"plate\":\"87RMC457\"},\"21IJH882\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false},\"modRoof\":-1,\"bodyHealth\":479.0,\"neonColor\":[255,255,255],\"modRearBumper\":-1,\"plate\":\"21IJH882\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":1854776567,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true,\"5\":true,\"6\":true},\"modXenon\":1,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":833.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":18,\"color1\":111,\"fuelLevel\":54.5,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":111,\"tankHealth\":828.0,\"wheels\":4,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":111,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":1},\"modBackWheels\":-1},\"plate\":\"21IJH882\"},\"28FIQ327\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false},\"modRoof\":-1,\"bodyHealth\":966.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"28FIQ327\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":1854776567,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":3.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":false,\"2\":true,\"7\":true,\"0\":false,\"5\":false,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":978.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":1,\"color1\":111,\"fuelLevel\":53.5,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":0,\"modDoorR\":-1,\"wheelColor\":111,\"tankHealth\":987.0,\"wheels\":4,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":111,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":false},\"modBackWheels\":-1},\"plate\":\"28FIQ327\"},\"87DYN257\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":989.9,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"87DYN257\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-410205223,\"modFrontWheels\":1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":12.1,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":1,\"color1\":111,\"fuelLevel\":94.6,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":134,\"tankHealth\":999.0,\"wheels\":4,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":111,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"87DYN257\"},\"28GVW583\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":-1,\"bodyHealth\":1000.0,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"28GVW583\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-808831384,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":8.8,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":false,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":4,\"color1\":1,\"fuelLevel\":78.3,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"wheels\":3,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"11\":1,\"10\":false,\"12\":false},\"modBackWheels\":-1},\"plate\":\"28GVW583\"}}', '{\"spawn\":{\"x\":-670.5704345703125,\"y\":912.466796875,\"z\":230.34165954589845},\"heading\":326.46234130859377}'),
(195, '{\"label\":\"BMF\",\"name\":\"bmf\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_PISTOL\":{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":250},\"WEAPON_MINISMG\":{\"count\":1,\"name\":\"WEAPON_MINISMG\",\"label\":\"Mini smg\",\"ammo\":250},\"WEAPON_MACHINEPISTOL\":{\"count\":2,\"name\":\"WEAPON_MACHINEPISTOL\",\"label\":\"Pistolet mitrailleur\",\"ammo\":234}},\"items\":{\"weed\":{\"name\":\"weed\",\"label\":\"Weed\",\"count\":38},\"coke\":{\"name\":\"coke\",\"label\":\"Coke\",\"count\":29},\"meth_pooch\":{\"name\":\"meth_pooch\",\"label\":\"Pochon de meth\",\"count\":1},\"kevlarvip\":{\"name\":\"kevlarvip\",\"label\":\"Kevlar Lourd VIP\",\"count\":16},\"meth\":{\"name\":\"meth\",\"label\":\"Meth\",\"count\":18},\"scope\":{\"name\":\"scope\",\"label\":\"Visée de Lunette\",\"count\":1}},\"accounts\":{\"dirtycash\":766245,\"cash\":0}}', '{\"tenue\":3,\"maxveh\":100,\"veh\":3,\"maxtenue\":25,\"vente\":0}', '{\"x\":-1812.9285888671876,\"y\":430.8351135253906,\"z\":128.5076904296875}', '{\"x\":-1793.797607421875,\"y\":451.0001220703125,\"z\":128.5076904296875}', '{\"x\":-1787.285400390625,\"y\":459.5948486328125,\"z\":128.30859375}', '{\"x\":-1797.453369140625,\"y\":426.05938720703127,\"z\":128.5076141357422}', '{\"x\":-1792.9246826171876,\"y\":458.62335205078127,\"z\":128.30859375}', '{\"x\":-1797.439208984375,\"y\":433.2779235839844,\"z\":128.5076141357422}', '{\"EAJU9337\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":false,\"0\":false,\"5\":false},\"modRoof\":-1,\"bodyHealth\":541.6,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"plate\":\"EAJU9337\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-2128279531,\"modFrontWheels\":9,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":3,\"windowsBroken\":{\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":false,\"5\":true,\"6\":true},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":733.8,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":148,\"color1\":136,\"fuelLevel\":56.6,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":12,\"tankHealth\":909.1,\"wheels\":0,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":2,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":132,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":{\"1\":false,\"2\":false},\"modBackWheels\":-1},\"plate\":\"EAJU9337\"},\"82IFN893\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false},\"modRoof\":-1,\"bodyHealth\":928.5,\"neonColor\":[255,255,255],\"modRearBumper\":-1,\"plate\":\"82IFN893\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":-1995326987,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":15.0,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":0,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":false,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":938.3,\"modTrunk\":-1,\"modHorns\":-1,\"pearlescentColor\":0,\"color1\":0,\"fuelLevel\":57.4,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modSpoilers\":-1,\"modDoorR\":-1,\"wheelColor\":156,\"tankHealth\":937.8,\"wheels\":0,\"tyreBurst\":{\"5\":false,\"4\":true,\"1\":false,\"0\":true},\"modAerials\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modTrimA\":-1,\"modTank\":-1,\"windowTint\":-1,\"modLightbar\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"extras\":[],\"modBackWheels\":-1},\"plate\":\"82IFN893\"},\"66AHD209\":{\"props\":{\"modExhaust\":5,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false,\"6\":false},\"modRoof\":4,\"fuelLevel\":89.6,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"plate\":\"66AHD209\",\"modHydrolic\":-1,\"modSideSkirt\":6,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":1532171089,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"modBrakes\":2,\"modTransmission\":2,\"dirtLevel\":15.0,\"modFrame\":0,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":1,\"modAPlate\":-1,\"modGrille\":0,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modXenon\":1,\"modLivery\":-1,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modDial\":-1,\"engineHealth\":976.0,\"modTrunk\":-1,\"modHorns\":-1,\"modOrnaments\":-1,\"color1\":12,\"pearlescentColor\":1,\"neonEnabled\":[false,false,false,false],\"modRearBumper\":3,\"modShifterLeavers\":-1,\"wheels\":7,\"wheelColor\":0,\"tankHealth\":997.0,\"modDoorR\":-1,\"modTrimA\":-1,\"modEngine\":2,\"modRightFender\":0,\"modArmor\":-1,\"modAerials\":-1,\"modTank\":-1,\"windowTint\":1,\"modDashboard\":-1,\"modHood\":5,\"modFrontBumper\":2,\"color2\":12,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"bodyHealth\":975.5,\"modSpoilers\":15,\"modVanityPlate\":-1,\"modFender\":0,\"extras\":[],\"modLightbar\":-1},\"plate\":\"66AHD209\"}}', '{\"heading\":97.14743041992188,\"spawn\":{\"x\":-1792.9246826171876,\"y\":458.62335205078127,\"z\":128.30859375}}'),
(197, '{\"name\":\"marabunta\",\"label\":\"Marabunta\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":0,\"maxtenue\":25,\"vente\":0}', '{\"x\":1437.396484375,\"y\":-1492.322998046875,\"z\":63.62445068359375}', '{\"x\":1438.7176513671876,\"y\":-1495.5224609375,\"z\":63.22447967529297}', '{\"x\":1424.844970703125,\"y\":-1503.4317626953126,\"z\":61.13833236694336}', '{\"x\":1432.8935546875,\"y\":-1490.8707275390626,\"z\":63.22448348999023}', '{\"x\":1418.41552734375,\"y\":-1509.1021728515626,\"z\":60.31241226196289}', '{\"x\":1432.892333984375,\"y\":-1490.8724365234376,\"z\":63.22448348999023}', '[]', '{\"spawn\":{\"x\":1418.41552734375,\"y\":-1509.1021728515626,\"z\":60.31241226196289},\"heading\":135.81887817382813}'),
(198, '{\"name\":\"fonoti\",\"label\":\"Fonoti\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":1,\"maxtenue\":25,\"vente\":0}', '{\"x\":-111.0752944946289,\"y\":999.65380859375,\"z\":235.75672912597657}', '{\"x\":-113.0058822631836,\"y\":985.9231567382813,\"z\":235.75416564941407}', '{\"x\":-128.28819274902345,\"y\":1009.0462036132813,\"z\":235.7321319580078}', '{\"x\":-111.51769256591797,\"y\":982.1080322265625,\"z\":235.7568817138672}', '{\"x\":-129.18101501464845,\"y\":1001.6288452148438,\"z\":235.7321319580078}', '{\"x\":-129.1862335205078,\"y\":1001.6261596679688,\"z\":235.7321319580078}', '{\"48KAD911\":{\"props\":{\"modExhaust\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"1\":false,\"2\":false,\"0\":false,\"5\":false},\"modRoof\":-1,\"customSecondaryColor\":[0,0,0],\"fuelLevel\":37.2,\"neonColor\":[255,255,255],\"modRearBumper\":-1,\"plate\":\"48KAD911\",\"modHydrolic\":-1,\"modSideSkirt\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"model\":117401876,\"modFrontWheels\":-1,\"modArchCover\":-1,\"modSuspension\":-1,\"modSeats\":-1,\"customPrimaryColor\":[0,0,0],\"modBrakes\":-1,\"modTransmission\":-1,\"dirtLevel\":11.5,\"modFrame\":-1,\"xenonColor\":255,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modAPlate\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"plateIndex\":1,\"windowsBroken\":{\"3\":false,\"4\":true,\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false},\"modLightbar\":-1,\"modLivery\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHorns\":-1,\"bodyHealth\":1000.0,\"modFrontBumper\":-1,\"modSpoilers\":-1,\"neonEnabled\":[false,false,false,false],\"modXenon\":false,\"pearlescentColor\":0,\"modShifterLeavers\":-1,\"wheelColor\":156,\"tankHealth\":1000.0,\"color1\":58,\"wheels\":2,\"modDoorR\":-1,\"modRightFender\":-1,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modTank\":-1,\"modEngine\":-1,\"windowTint\":-1,\"modAerials\":-1,\"modHood\":-1,\"modDashboard\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modTrimA\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modVanityPlate\":-1,\"color2\":0,\"extras\":{\"3\":1,\"1\":1,\"2\":1},\"modArmor\":-1},\"plate\":\"48KAD911\"}}', '{\"spawn\":{\"x\":-129.18087768554688,\"y\":1001.6258544921875,\"z\":235.7321319580078},\"heading\":183.07345581054688}'),
(200, '{\"label\":\"O\'Black\",\"name\":\"oblack\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":{\"WEAPON_SNSPISTOL\":{\"count\":1,\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":250}},\"items\":{\"drill\":{\"name\":\"drill\",\"label\":\"Perceuse\",\"count\":4}},\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":0,\"maxtenue\":25,\"vente\":0}', '{\"x\":956.1132202148438,\"y\":-675.0004272460938,\"z\":58.45943832397461}', '{\"x\":957.66015625,\"y\":-668.319091796875,\"z\":58.46177673339844}', '{\"x\":957.399658203125,\"y\":-664.7510375976563,\"z\":58.01100921630859}', '{\"x\":952.7160034179688,\"y\":-670.5239868164063,\"z\":58.45940780639648}', '{\"x\":961.21728515625,\"y\":-660.9960327148438,\"z\":57.76913833618164}', '{\"x\":953.9202880859376,\"y\":-669.8980712890625,\"z\":58.45940780639648}', '[]', '{\"spawn\":{\"x\":961.21728515625,\"y\":-660.9960327148438,\"z\":57.76913833618164},\"heading\":302.56591796875}'),
(201, '{\"label\":\"shadow\",\"name\":\"shadow\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":0,\"maxtenue\":25,\"vente\":0}', '{\"x\":1392.5994873046876,\"y\":1129.2410888671876,\"z\":109.74578857421875}', '{\"x\":1395.5850830078126,\"y\":1159.5101318359376,\"z\":114.33355712890625}', '{\"x\":1407.373291015625,\"y\":1115.038818359375,\"z\":114.83756256103516}', '{\"x\":1405.1766357421876,\"y\":1137.816162109375,\"z\":109.7457504272461}', '{\"x\":1412.45166015625,\"y\":1118.87890625,\"z\":114.8379135131836}', '{\"x\":1387.7144775390626,\"y\":1147.8773193359376,\"z\":114.33403778076172}', '[]', '{\"spawn\":{\"x\":1404.097900390625,\"y\":1118.10205078125,\"z\":114.83757019042969},\"heading\":92.48445129394531}'),
(202, '{\"label\":\"Canadian Boy\'z\",\"name\":\"Canadian Boy\'z\"}', '{\"weight\":0,\"maxweight\":50000}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"dirtycash\":0,\"cash\":0}}', '{\"tenue\":0,\"maxveh\":100,\"veh\":0,\"maxtenue\":25,\"vente\":0}', '{\"x\":731.2952880859375,\"y\":1275.1370849609376,\"z\":368.3685302734375}', '{\"x\":732.1561279296875,\"y\":1277.69970703125,\"z\":368.3685607910156}', '{\"x\":773.0000610351563,\"y\":1290.5726318359376,\"z\":360.49383544921877}', '{\"x\":714.4666137695313,\"y\":1279.5660400390626,\"z\":360.4944763183594}', '{\"x\":768.604248046875,\"y\":1287.2818603515626,\"z\":360.49420166015627}', '{\"x\":735.5859375,\"y\":1283.128173828125,\"z\":360.4944763183594}', '[]', '{\"spawn\":{\"x\":767.2438354492188,\"y\":1278.5533447265626,\"z\":360.49444580078127},\"heading\":266.66229248046877}');

-- --------------------------------------------------------

--
-- Structure de la table `gang2_car`
--

CREATE TABLE `gang2_car` (
  `gang_name` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `properties` longtext DEFAULT NULL,
  `stored` tinyint(4) DEFAULT 1,
  `time_out` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang2_car`
--


-- --------------------------------------------------------

--
-- Structure de la table `gang2_chest`
--

CREATE TABLE `gang2_chest` (
  `gang_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang2_chest`
--


-- --------------------------------------------------------

--
-- Structure de la table `gang2_clothes`
--

CREATE TABLE `gang2_clothes` (
  `gang` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  `creator` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang2_clothes`
--


-- --------------------------------------------------------

--
-- Structure de la table `gang2_grade_permissions`
--

CREATE TABLE `gang2_grade_permissions` (
  `job_name` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL,
  `coffre_access` tinyint(4) DEFAULT 1,
  `coffre_deposit` tinyint(4) DEFAULT 1,
  `coffre_take` tinyint(4) DEFAULT 1,
  `coffre_weapons` tinyint(4) DEFAULT 1,
  `coffre_items` tinyint(4) DEFAULT 1,
  `coffre_money` tinyint(4) DEFAULT 1,
  `garage_access` tinyint(4) DEFAULT 1,
  `vehicles` longtext DEFAULT '[]',
  `vestiaire_access` tinyint(4) DEFAULT 1,
  `vestiaire_create` tinyint(4) DEFAULT 0,
  `clothes` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang2_grade_permissions`
--

INSERT INTO `gang2_grade_permissions` (`job_name`, `grade`, `coffre_access`, `coffre_deposit`, `coffre_take`, `coffre_weapons`, `coffre_items`, `coffre_money`, `garage_access`, `vehicles`, `vestiaire_access`, `vestiaire_create`, `clothes`) VALUES
('k2r', 0, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('Kays', 1, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 1, '[]'),
('Kays', 2, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('kk', 1, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('kk', 2, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('test1', 2, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('test10', 3, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]'),
('testk', 0, 1, 1, 1, 1, 1, 1, 1, '[]', 1, 0, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `gangs2`
--

CREATE TABLE `gangs2` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `positions` longtext NOT NULL,
  `max_tenues` int(11) NOT NULL DEFAULT 10,
  `garage_size` int(11) NOT NULL DEFAULT 10,
  `coffre_weight` int(11) NOT NULL DEFAULT 100,
  `can_sell_weapons` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `gangs2`
--

INSERT INTO `gangs2` (`id`, `name`, `label`, `positions`, `max_tenues`, `garage_size`, `coffre_weight`, `can_sell_weapons`) VALUES
(7, 'test1', 'Teest', '{\"Vestiaire\":{\"z\":29.30811500549316,\"y\":-869.2147827148438,\"x\":-158.95852661132813},\"SuppressionVehicule\":{\"x\":-153.77244567871095,\"y\":-862.1961669921875,\"z\":29.71451187133789},\"Spawn Vehicule\":{\"z\":29.45192146301269,\"y\":-865.604248046875,\"x\":-158.96038818359376},\"Patron\":{\"z\":30.20409965515136,\"y\":-850.9747314453125,\"x\":-154.20858764648438},\"Blip\":{\"z\":0.0,\"y\":0.0,\"x\":0.0},\"Garage\":{\"z\":29.92189598083496,\"y\":-856.129638671875,\"x\":-156.18276977539066},\"Suppression Vehicule\":{\"z\":29.59615135192871,\"y\":-862.4932250976563,\"x\":-158.193359375},\"SpawnVehicule\":{\"z\":0.0,\"y\":0.0,\"x\":0.0},\"Coffre\":{\"z\":30.4449348449707,\"y\":-846.4862670898438,\"x\":-151.954345703125}}', 10, 10, 100, 0),
(8, 'testk', 'testk', '{\"Suppression Vehicule\":{\"x\":-1419.2696533203126,\"y\":-575.4375,\"z\":30.55857849121093},\"Patron\":{\"x\":-1425.0623779296876,\"y\":-578.578857421875,\"z\":30.52043342590332},\"SuppressionVehicule\":{\"x\":-1415.693115234375,\"y\":-575.91455078125,\"z\":29.85770416259765},\"Blip\":{\"x\":0.0,\"y\":0.0,\"z\":0.0},\"Vestiaire\":{\"x\":-1413.1258544921876,\"y\":-573.089599609375,\"z\":30.39787483215332},\"Coffre\":{\"x\":-1427.2841796875,\"y\":-583.5653686523438,\"z\":30.64866638183593},\"Garage\":{\"x\":-1422.0911865234376,\"y\":-575.8012084960938,\"z\":30.40797805786132},\"Spawn Vehicule\":{\"x\":-1414.0640869140626,\"y\":-573.50244140625,\"z\":30.40888786315918},\"SpawnVehicule\":{\"x\":0.0,\"y\":0.0,\"z\":0.0}}', 10, 10, 100, 0),
(9, 'test10', 'tEST&', '{\"Suppression Vehicule\":{\"z\":31.6398868560791,\"y\":-867.5840454101563,\"x\":-330.3328857421875},\"Patron\":{\"z\":70.9929428100586,\"y\":10.14973831176757,\"x\":-5.02830934524536},\"SuppressionVehicule\":{\"z\":70.8906021118164,\"y\":7.07227277755737,\"x\":-0.86468929052352},\"SpawnVehicule\":{\"z\":70.85057830810547,\"y\":5.8661298751831,\"x\":4.27583074569702},\"Blip\":{\"z\":0.0,\"y\":0.0,\"x\":0.0},\"Vestiaire\":{\"x\":7.63327074050903,\"y\":6.43462991714477,\"z\":70.72871398925781},\"Coffre\":{\"z\":70.93921661376953,\"y\":12.20055103302002,\"x\":-5.43816566467285},\"Garage\":{\"z\":71.08077239990235,\"y\":8.39793014526367,\"x\":-3.22628903388977},\"Spawn Vehicule\":{\"z\":31.62478637695312,\"y\":-866.7916870117188,\"x\":-334.6476745605469}}', 10, 10, 100, 0);

-- --------------------------------------------------------

--
-- Structure de la table `gang_skin`
--

CREATE TABLE `gang_skin` (
  `id` int(11) NOT NULL,
  `skin` longtext NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `gang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gang_skin`
--

INSERT INTO `gang_skin` (`id`, `skin`, `name`, `type`, `gang`) VALUES
(27, '{\"hair_color_1\":1,\"mask_2\":0,\"hair_2\":0,\"bodyb_2\":0,\"torso_1\":157,\"makeup_2\":0,\"shoes_1\":24,\"ears_1\":-1,\"chest_1\":0,\"watches_2\":0,\"lipstick_2\":0,\"nose_6\":0,\"ears_2\":0,\"bproof_2\":0,\"nose_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"skin_md_weight\":50,\"torso_2\":0,\"blemishes_2\":0,\"bodyb_4\":0,\"bodyb_3\":-1,\"dad\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"neck_thickness\":0,\"complexion_1\":0,\"nose_5\":0,\"tshirt_1\":138,\"helmet_1\":-1,\"eye_color\":0,\"beard_1\":16,\"helmet_2\":0,\"makeup_1\":0,\"jaw_1\":0,\"decals_2\":0,\"eyebrows_6\":0,\"eyebrows_4\":0,\"glasses_2\":6,\"shoes_2\":0,\"chest_2\":0,\"arms\":30,\"chin_4\":0,\"makeup_3\":0,\"sun_2\":0,\"bproof_1\":0,\"blush_1\":0,\"face_md_weight\":50,\"hair_color_2\":0,\"blush_3\":0,\"eyebrows_3\":0,\"moles_1\":0,\"glasses_1\":5,\"bodyb_1\":-1,\"jaw_2\":0,\"blush_2\":0,\"decals_1\":0,\"pants_2\":2,\"watches_1\":-1,\"lipstick_1\":0,\"tshirt_2\":0,\"eyebrows_2\":0,\"nose_1\":0,\"age_1\":0,\"arms_2\":0,\"mask_1\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"sun_1\":0,\"mom\":21,\"lipstick_4\":0,\"chin_3\":0,\"eye_squint\":0,\"age_2\":0,\"hair_1\":15,\"bracelets_1\":-1,\"moles_2\":0,\"sex\":0,\"blemishes_1\":0,\"chest_3\":0,\"eyebrows_5\":0,\"chin_2\":0,\"bags_1\":0,\"beard_2\":10.0,\"makeup_4\":0,\"chin_1\":0,\"beard_3\":0,\"pants_1\":4,\"complexion_2\":0,\"beard_4\":0,\"nose_3\":0,\"bags_2\":0,\"cheeks_1\":0,\"chain_1\":0,\"cheeks_3\":0,\"nose_4\":0}', 'SOA', 'mp_m_freemode_01', 'soa'),
(31, '{\"mask_2\":13,\"jaw_2\":0,\"beard_2\":10.0,\"cheeks_3\":0,\"cheeks_2\":0,\"age_1\":0,\"cheeks_1\":0,\"pants_1\":24,\"chain_1\":208,\"makeup_3\":0,\"shoes_1\":10,\"chest_3\":0,\"lipstick_2\":0,\"chin_4\":0,\"nose_1\":0,\"chin_1\":0,\"makeup_2\":0,\"moles_1\":0,\"lipstick_1\":0,\"decals_2\":0,\"bags_1\":81,\"lip_thickness\":0,\"eyebrows_3\":0,\"neck_thickness\":0,\"eye_squint\":0,\"makeup_1\":0,\"blush_2\":0,\"nose_6\":0,\"beard_3\":0,\"decals_1\":0,\"tshirt_2\":0,\"lipstick_4\":0,\"bproof_1\":0,\"bodyb_4\":0,\"complexion_1\":0,\"arms\":26,\"eyebrows_5\":0,\"dad\":0,\"blush_1\":0,\"pants_2\":0,\"sun_2\":0,\"bracelets_1\":-1,\"mask_1\":169,\"jaw_1\":0,\"face_md_weight\":50,\"ears_1\":-1,\"nose_2\":0,\"blemishes_2\":0,\"hair_1\":15,\"tshirt_1\":207,\"torso_2\":0,\"beard_4\":0,\"bproof_2\":0,\"glasses_2\":2,\"torso_1\":234,\"mom\":21,\"lipstick_3\":0,\"blemishes_1\":0,\"nose_3\":0,\"ears_2\":0,\"blush_3\":0,\"nose_4\":0,\"eyebrows_2\":0,\"hair_color_2\":0,\"moles_2\":0,\"skin_md_weight\":50,\"bodyb_1\":-1,\"bodyb_2\":0,\"helmet_2\":20,\"glasses_1\":72,\"age_2\":0,\"chain_2\":0,\"eyebrows_6\":0,\"complexion_2\":0,\"eye_color\":0,\"shoes_2\":0,\"chest_2\":0,\"beard_1\":16,\"hair_2\":0,\"chin_3\":0,\"arms_2\":0,\"nose_5\":0,\"eyebrows_1\":0,\"helmet_1\":105,\"eyebrows_4\":0,\"hair_color_1\":1,\"watches_2\":0,\"watches_1\":-1,\"chest_1\":0,\"sun_1\":0,\"bodyb_3\":-1,\"bracelets_2\":0,\"sex\":0,\"bags_2\":0,\"chin_2\":0,\"makeup_4\":0}', 'tkt gh', 'mp_m_freemode_01', 'soa'),
(32, '{\"bracelets_1\":-1,\"hair_color_2\":0,\"beard_2\":10.0,\"cheeks_3\":0,\"cheeks_2\":0,\"makeup_4\":0,\"skin_md_weight\":50,\"pants_1\":4,\"chain_1\":0,\"makeup_3\":0,\"shoes_1\":24,\"chest_3\":0,\"lipstick_2\":0,\"chin_4\":0,\"nose_1\":0,\"complexion_2\":0,\"makeup_2\":0,\"moles_1\":0,\"lipstick_1\":0,\"decals_2\":0,\"sun_2\":0,\"lip_thickness\":0,\"eyebrows_3\":0,\"neck_thickness\":0,\"eye_squint\":0,\"blemishes_1\":0,\"arms_2\":0,\"nose_6\":0,\"beard_3\":0,\"decals_1\":0,\"makeup_1\":0,\"lipstick_4\":0,\"chin_1\":0,\"bodyb_4\":0,\"nose_2\":0,\"jaw_2\":0,\"hair_1\":15,\"dad\":0,\"blush_1\":0,\"pants_2\":2,\"bodyb_1\":-1,\"age_1\":0,\"mask_1\":0,\"jaw_1\":0,\"face_md_weight\":50,\"ears_2\":0,\"moles_2\":0,\"blush_2\":0,\"beard_4\":0,\"tshirt_1\":0,\"hair_color_1\":1,\"bags_1\":59,\"bproof_2\":0,\"glasses_2\":6,\"torso_1\":0,\"nose_3\":0,\"lipstick_3\":0,\"eyebrows_4\":0,\"mom\":21,\"sex\":0,\"blush_3\":0,\"nose_4\":0,\"eyebrows_2\":0,\"tshirt_2\":0,\"nose_5\":0,\"bproof_1\":0,\"helmet_2\":0,\"bodyb_2\":0,\"mask_2\":0,\"glasses_1\":5,\"age_2\":0,\"chain_2\":0,\"eyebrows_6\":0,\"torso_2\":0,\"eye_color\":0,\"shoes_2\":0,\"chest_2\":0,\"beard_1\":16,\"hair_2\":0,\"chin_3\":0,\"ears_1\":-1,\"blemishes_2\":0,\"eyebrows_1\":0,\"helmet_1\":-1,\"complexion_1\":0,\"eyebrows_5\":0,\"watches_2\":0,\"watches_1\":-1,\"chest_1\":0,\"sun_1\":0,\"bodyb_3\":-1,\"bracelets_2\":0,\"arms\":30,\"bags_2\":6,\"chin_2\":0,\"cheeks_1\":0}', 'soaaaaaaaa', 'mp_m_freemode_01', 'soa'),
(69, '{\"blemishes_2\":0,\"arms_2\":0,\"lipstick_3\":0,\"mask_1\":0,\"lipstick_2\":0,\"sun_1\":0,\"bodyb_2\":0,\"jaw_2\":0,\"ears_1\":-1,\"chin_2\":0,\"bodyb_4\":0,\"jaw_1\":0,\"bodyb_1\":-1,\"bags_1\":0,\"makeup_4\":0,\"blemishes_1\":0,\"neck_thickness\":0,\"bracelets_2\":0,\"decals_2\":0,\"hair_color_1\":0,\"shoes_1\":173,\"bproof_2\":0,\"pants_1\":375,\"nose_2\":0,\"eyebrows_3\":0,\"nose_5\":0,\"dad\":26,\"torso_2\":0,\"arms\":4,\"eye_color\":6,\"decals_1\":0,\"age_1\":0,\"lipstick_1\":0,\"beard_1\":2,\"nose_6\":0,\"cheeks_1\":0,\"glasses_1\":73,\"cheeks_3\":0,\"hair_1\":137,\"lip_thickness\":0,\"tshirt_1\":302,\"eyebrows_5\":0,\"shoes_2\":2,\"age_2\":0,\"chest_2\":0,\"cheeks_2\":0,\"sex\":0,\"beard_2\":10,\"bags_2\":0,\"chain_1\":1,\"skin_md_weight\":38,\"blush_2\":0,\"watches_2\":0,\"eye_squint\":0,\"moles_2\":0,\"mask_2\":0,\"nose_1\":0,\"complexion_1\":0,\"chest_1\":0,\"hair_color_2\":0,\"face_md_weight\":0,\"makeup_1\":0,\"torso_1\":647,\"lipstick_4\":0,\"complexion_2\":0,\"bracelets_1\":-1,\"blush_3\":0,\"watches_1\":-1,\"hair_2\":0,\"chest_3\":0,\"eyebrows_6\":0,\"nose_3\":0,\"sun_2\":0,\"eyebrows_4\":0,\"tshirt_2\":1,\"beard_4\":0,\"pants_2\":0,\"moles_1\":0,\"glasses_2\":5,\"helmet_1\":-1,\"beard_3\":0,\"chain_2\":0,\"mom\":2,\"bproof_1\":116,\"chin_1\":0,\"nose_4\":0,\"eyebrows_2\":9.9,\"chin_3\":0,\"makeup_2\":0,\"eyebrows_1\":7,\"ears_2\":0,\"blush_1\":0,\"helmet_2\":0,\"chin_4\":0,\"bodyb_3\":-1,\"makeup_3\":0}', 'op v1', 'mp_m_freemode_01', 'famillies'),
(77, '{\"dad\":26,\"tshirt_1\":176,\"beard_4\":0,\"hair_2\":0,\"lip_thickness\":0,\"shoes_2\":2,\"nose_1\":0,\"chin_2\":0,\"watches_2\":0,\"bags_2\":0,\"complexion_1\":0,\"eyebrows_6\":0,\"nose_2\":0,\"lipstick_3\":0,\"blemishes_2\":0,\"torso_1\":740,\"chest_2\":0,\"beard_1\":2,\"sun_1\":0,\"eyebrows_3\":0,\"lipstick_2\":0,\"age_2\":0,\"lipstick_4\":0,\"bproof_2\":0,\"beard_3\":0,\"makeup_2\":0,\"chin_1\":0,\"shoes_1\":210,\"chin_4\":0,\"eye_squint\":0,\"jaw_2\":0,\"chest_1\":0,\"bodyb_1\":-1,\"makeup_3\":0,\"bodyb_2\":0,\"eyebrows_1\":7,\"eyebrows_4\":0,\"bracelets_2\":0,\"moles_1\":0,\"nose_5\":0,\"watches_1\":-1,\"jaw_1\":0,\"hair_color_2\":0,\"bodyb_3\":-1,\"blush_1\":0,\"bags_1\":45,\"chain_1\":296,\"hair_color_1\":0,\"chin_3\":0,\"skin_md_weight\":38,\"tshirt_2\":0,\"eyebrows_2\":9.9,\"chain_2\":0,\"ears_1\":-1,\"makeup_1\":0,\"sun_2\":0,\"lipstick_1\":0,\"decals_2\":0,\"pants_1\":401,\"ears_2\":0,\"cheeks_3\":0,\"helmet_1\":-1,\"bracelets_1\":-1,\"eyebrows_5\":0,\"complexion_2\":0,\"nose_6\":0,\"mask_2\":0,\"hair_1\":189,\"blemishes_1\":0,\"chest_3\":0,\"helmet_2\":0,\"blush_2\":0,\"beard_2\":10,\"bodyb_4\":0,\"arms\":4,\"nose_4\":0,\"moles_2\":0,\"makeup_4\":0,\"cheeks_1\":0,\"torso_2\":5,\"pants_2\":1,\"eye_color\":6,\"neck_thickness\":0,\"bproof_1\":116,\"decals_1\":0,\"sex\":0,\"mom\":2,\"age_1\":0,\"glasses_1\":73,\"glasses_2\":5,\"arms_2\":0,\"blush_3\":0,\"cheeks_2\":0,\"nose_3\":0,\"mask_1\":0,\"face_md_weight\":0}', 'op shott', 'mp_m_freemode_01', 'famillies'),
(79, '{\"decals_1\":0,\"age_1\":0,\"sun_2\":0,\"ears_1\":-1,\"bags_1\":45,\"eyebrows_4\":0,\"eyebrows_5\":0,\"complexion_1\":0,\"moles_2\":0,\"nose_1\":0,\"mom\":2,\"bracelets_2\":0,\"blush_1\":0,\"dad\":43,\"chain_1\":1,\"eye_squint\":0,\"lipstick_3\":0,\"watches_2\":0,\"nose_2\":0,\"helmet_1\":145,\"cheeks_1\":0,\"bracelets_1\":-1,\"bodyb_4\":0,\"chest_1\":0,\"lipstick_4\":0,\"hair_1\":135,\"bags_2\":0,\"chin_2\":0,\"neck_thickness\":0,\"bproof_2\":0,\"hair_color_1\":0,\"skin_md_weight\":0,\"makeup_3\":0,\"eye_color\":1,\"lip_thickness\":0,\"arms\":1,\"hair_color_2\":0,\"eyebrows_2\":8.9,\"torso_2\":1,\"blemishes_2\":0,\"bodyb_3\":-1,\"chin_1\":0,\"beard_1\":3,\"glasses_2\":5,\"sun_1\":0,\"complexion_2\":0,\"moles_1\":0,\"lipstick_1\":0,\"makeup_4\":0,\"tshirt_2\":1,\"chain_2\":0,\"beard_4\":0,\"makeup_2\":0,\"blush_3\":0,\"makeup_1\":0,\"cheeks_2\":0,\"torso_1\":519,\"eyebrows_6\":0,\"nose_4\":0,\"chest_3\":0,\"jaw_1\":0,\"shoes_2\":0,\"shoes_1\":27,\"ears_2\":0,\"bproof_1\":0,\"mask_1\":0,\"mask_2\":0,\"cheeks_3\":0,\"chest_2\":0,\"blush_2\":0,\"blemishes_1\":0,\"jaw_2\":0,\"watches_1\":-1,\"pants_2\":0,\"tshirt_1\":320,\"nose_6\":0,\"nose_3\":0,\"arms_2\":0,\"decals_2\":0,\"nose_5\":0,\"bodyb_1\":-1,\"lipstick_2\":0,\"bodyb_2\":0,\"pants_1\":36,\"eyebrows_1\":0,\"chin_3\":0,\"beard_2\":10,\"chin_4\":0,\"glasses_1\":73,\"age_2\":0,\"beard_3\":0,\"sex\":0,\"helmet_2\":0,\"eyebrows_3\":0,\"hair_2\":0,\"face_md_weight\":0}', 'op convoie', 'mp_m_freemode_01', 'famillies'),
(125, '{\"lipstick_3\":0,\"helmet_1\":8,\"moles_1\":0,\"sun_2\":0,\"helmet_2\":0,\"chin_4\":0,\"beard_2\":10,\"jaw_2\":0,\"chest_3\":0,\"ears_2\":0,\"torso_2\":1,\"pants_1\":377,\"beard_3\":0,\"bracelets_1\":-1,\"eye_squint\":0,\"chain_1\":0,\"bodyb_2\":0,\"jaw_1\":0,\"lipstick_4\":0,\"blush_1\":0,\"beard_4\":0,\"shoes_1\":24,\"nose_5\":0,\"cheeks_3\":0,\"bracelets_2\":0,\"cheeks_1\":0,\"skin_md_weight\":50,\"chest_2\":0,\"lipstick_2\":0,\"eyebrows_3\":0,\"bodyb_4\":0,\"makeup_1\":0,\"eyebrows_6\":0,\"blush_3\":0,\"nose_4\":0,\"watches_2\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"decals_2\":0,\"hair_color_1\":55,\"makeup_2\":0,\"lipstick_1\":0,\"pants_\":126,\"blemishes_2\":0,\"chin_3\":0,\"sun_1\":0,\"nose_6\":0,\"bproof_1\":0,\"makeup_3\":0,\"age_1\":0,\"mask_2\":0,\"bproof_2\":0,\"eyebrows_2\":0,\"shoes_2\":0,\"bodyb_1\":-1,\"tshirt_1\":15,\"complexion_2\":0,\"mom\":21,\"lip_thickness\":0,\"chest_1\":0,\"face_md_weight\":50,\"decals_1\":0,\"beard_1\":2,\"bags_2\":6,\"torso_1\":22,\"eyebrows_4\":0,\"hair_1\":79,\"eyebrows_5\":0,\"cheeks_2\":0,\"hair_2\":0,\"neck_thickness\":0,\"nose_3\":0,\"pants_2\":0,\"blemishes_1\":0,\"ears_1\":-1,\"bags_1\":59,\"complexion_1\":0,\"blush_2\":0,\"arms_2\":0,\"mask_1\":312,\"chin_2\":0,\"sex\":0,\"bodyb_3\":-1,\"chin_1\":0,\"dad\":0,\"age_2\":0,\"makeup_4\":0,\"eyebrows_1\":0,\"moles_2\":0,\"arms\":214,\"eye_color\":0,\"glasses_2\":7,\"nose_1\":0,\"nose_2\":0,\"glasses_1\":17,\"watches_1\":-1,\"chain_2\":0}', 'SOA', 'mp_m_freemode_01', 'soa'),
(129, '{\"glasses_1\":0,\"eyebrows_3\":0,\"helmet_2\":0,\"lipstick_3\":0,\"bodyb_1\":-1,\"complexion_2\":0,\"bodyb_2\":0,\"nose_5\":0,\"lipstick_4\":0,\"glasses_2\":0,\"beard_3\":0,\"hair_1\":12,\"helmet_1\":0,\"chest_1\":0,\"eyebrows_5\":0,\"jaw_2\":0,\"lipstick_2\":0,\"age_2\":0,\"moles_2\":0,\"makeup_3\":0,\"bracelets_2\":0,\"sun_2\":0,\"cheeks_1\":0,\"bodyb_3\":-1,\"sun_1\":0,\"hair_color_2\":0,\"tshirt_1\":33,\"lip_thickness\":0,\"moles_1\":0,\"eye_squint\":0,\"blemishes_1\":0,\"nose_1\":0,\"complexion_1\":0,\"dad\":0,\"nose_2\":0,\"nose_3\":0,\"chain_2\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"beard_4\":0,\"chin_4\":0,\"nose_4\":0,\"arms\":0,\"chin_2\":0,\"blush_2\":0,\"blush_1\":0,\"nose_6\":0,\"shoes_2\":2,\"eyebrows_2\":0,\"bproof_1\":0,\"makeup_1\":0,\"chin_3\":0,\"eye_color\":0,\"bracelets_1\":-1,\"chest_3\":0,\"bodyb_4\":0,\"watches_2\":0,\"shoes_1\":66,\"chain_1\":1,\"lipstick_1\":0,\"makeup_2\":0,\"hair_2\":0,\"eyebrows_6\":0,\"blush_3\":0,\"blemishes_2\":0,\"beard_2\":0,\"neck_thickness\":0,\"decals_1\":0,\"ears_1\":-1,\"sex\":0,\"chin_1\":0,\"bags_2\":0,\"pants_2\":0,\"hair_color_1\":0,\"cheeks_2\":0,\"age_1\":0,\"arms_2\":0,\"jaw_1\":0,\"tshirt_2\":0,\"ears_2\":0,\"pants_1\":10,\"bproof_2\":0,\"skin_md_weight\":50,\"bags_1\":0,\"mask_1\":0,\"decals_2\":0,\"torso_1\":716,\"chest_2\":0,\"eyebrows_4\":0,\"mask_2\":0,\"beard_1\":0,\"mom\":21,\"face_md_weight\":50,\"makeup_4\":0,\"cheeks_3\":0,\"torso_2\":0}', 'Tenue sooldat s', 'mp_m_freemode_01', 'NarcosNeras'),
(130, '{\"decals_1\":0,\"cheeks_3\":10,\"face_md_weight\":52,\"nose_3\":0,\"bproof_1\":114,\"chest_3\":0,\"beard_4\":0,\"blush_2\":0,\"chest_2\":0,\"dad\":0,\"moles_2\":0,\"ears_1\":-1,\"jaw_2\":10,\"beard_3\":0,\"blush_1\":0,\"bracelets_1\":-1,\"lip_thickness\":0,\"watches_1\":-1,\"bracelets_2\":0,\"hair_1\":5,\"makeup_2\":0,\"chin_1\":10,\"hair_2\":0,\"makeup_4\":0,\"blush_3\":0,\"eyebrows_2\":9,\"arms\":17,\"pants_1\":97,\"chin_2\":10,\"bodyb_1\":-1,\"sex\":0,\"eye_squint\":0,\"complexion_1\":0,\"eyebrows_1\":7,\"bags_2\":0,\"makeup_3\":0,\"decals_2\":0,\"pants_2\":0,\"chest_1\":0,\"bodyb_3\":-1,\"nose_6\":0,\"age_2\":0,\"beard_2\":10,\"neck_thickness\":10,\"arms_2\":0,\"hair_color_2\":0,\"tshirt_1\":1,\"eyebrows_4\":0,\"chain_1\":1,\"complexion_2\":0,\"chin_4\":10,\"sun_1\":0,\"tshirt_2\":1,\"nose_1\":0,\"bproof_2\":4,\"age_1\":0,\"blemishes_1\":0,\"helmet_1\":138,\"sun_2\":0,\"lipstick_1\":0,\"moles_1\":0,\"ears_2\":0,\"chin_3\":10,\"mask_2\":0,\"makeup_1\":0,\"eyebrows_3\":0,\"shoes_2\":0,\"mom\":29,\"mask_1\":0,\"lipstick_4\":0,\"watches_2\":0,\"glasses_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"blemishes_2\":0,\"bodyb_4\":0,\"glasses_1\":12,\"torso_2\":1,\"jaw_1\":10,\"eyebrows_5\":0,\"nose_5\":0,\"helmet_2\":0,\"skin_md_weight\":26,\"eyebrows_6\":0,\"lipstick_3\":0,\"nose_2\":0,\"chain_2\":0,\"eye_color\":0,\"bodyb_2\":0,\"beard_1\":28,\"cheeks_1\":10,\"hair_color_1\":0,\"torso_1\":315,\"shoes_1\":25,\"nose_4\":0,\"cheeks_2\":10}', 'Tenue plan Pompier', 'mp_m_freemode_01', 'Gitan'),
(131, '{\"decals_1\":0,\"cheeks_3\":10,\"face_md_weight\":52,\"nose_3\":0,\"bproof_1\":114,\"chest_3\":0,\"beard_4\":0,\"blush_2\":0,\"chest_2\":0,\"dad\":0,\"moles_2\":0,\"ears_1\":-1,\"jaw_2\":10,\"beard_3\":0,\"blush_1\":0,\"bracelets_1\":-1,\"lip_thickness\":0,\"watches_1\":-1,\"bracelets_2\":0,\"hair_1\":5,\"makeup_2\":0,\"chin_1\":10,\"hair_2\":0,\"makeup_4\":0,\"blush_3\":0,\"eyebrows_2\":9,\"arms\":62,\"pants_1\":12,\"chin_2\":10,\"bodyb_1\":-1,\"sex\":0,\"eye_squint\":0,\"complexion_1\":0,\"eyebrows_1\":7,\"bags_2\":0,\"makeup_3\":0,\"decals_2\":0,\"pants_2\":0,\"chest_1\":0,\"bodyb_3\":-1,\"nose_6\":0,\"age_2\":0,\"beard_2\":10,\"neck_thickness\":10,\"arms_2\":0,\"hair_color_2\":0,\"tshirt_1\":15,\"eyebrows_4\":0,\"chain_1\":111,\"complexion_2\":0,\"chin_4\":10,\"sun_1\":0,\"tshirt_2\":1,\"nose_1\":0,\"bproof_2\":4,\"age_1\":0,\"blemishes_1\":0,\"helmet_1\":0,\"sun_2\":0,\"lipstick_1\":0,\"moles_1\":0,\"ears_2\":0,\"chin_3\":10,\"mask_2\":0,\"makeup_1\":0,\"eyebrows_3\":0,\"shoes_2\":0,\"mom\":29,\"mask_1\":0,\"lipstick_4\":0,\"watches_2\":0,\"glasses_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"blemishes_2\":0,\"bodyb_4\":0,\"glasses_1\":12,\"torso_2\":9,\"jaw_1\":10,\"eyebrows_5\":0,\"nose_5\":0,\"helmet_2\":0,\"skin_md_weight\":26,\"eyebrows_6\":0,\"lipstick_3\":0,\"nose_2\":0,\"chain_2\":0,\"eye_color\":0,\"bodyb_2\":0,\"beard_1\":28,\"cheeks_1\":10,\"hair_color_1\":0,\"torso_1\":674,\"shoes_1\":108,\"nose_4\":0,\"cheeks_2\":10}', 'Tenue classique ', 'mp_m_freemode_01', 'Gitan'),
(133, '{\"nose_1\":0,\"bodyb_2\":0,\"eyebrows_1\":0,\"sun_2\":0,\"chain_2\":0,\"mask_2\":25,\"lipstick_3\":0,\"makeup_3\":0,\"eyebrows_2\":0,\"bproof_1\":0,\"chin_3\":0,\"arms_2\":0,\"moles_2\":0,\"makeup_2\":0,\"eyebrows_5\":0,\"bags_2\":0,\"arms\":4,\"beard_2\":0,\"helmet_2\":0,\"sun_1\":0,\"moles_1\":0,\"skin_md_weight\":50,\"chin_2\":0,\"bodyb_3\":-1,\"nose_6\":0,\"hair_color_2\":0,\"pants_2\":0,\"chest_1\":0,\"nose_5\":0,\"eyebrows_3\":0,\"tshirt_1\":314,\"hair_1\":12,\"nose_3\":0,\"mom\":21,\"hair_2\":0,\"dad\":0,\"nose_2\":0,\"age_2\":0,\"blemishes_1\":0,\"chin_1\":0,\"cheeks_1\":0,\"shoes_1\":1,\"mask_1\":104,\"nose_4\":0,\"beard_3\":0,\"blush_3\":0,\"lip_thickness\":0,\"jaw_2\":0,\"bodyb_4\":0,\"ears_2\":0,\"bracelets_2\":0,\"pants_1\":362,\"glasses_1\":0,\"helmet_1\":12,\"complexion_2\":0,\"eye_squint\":0,\"ears_1\":-1,\"blush_1\":0,\"blemishes_2\":0,\"eyebrows_4\":0,\"decals_2\":0,\"lipstick_1\":0,\"makeup_1\":0,\"watches_1\":6,\"chest_2\":0,\"cheeks_2\":0,\"blush_2\":0,\"shoes_2\":0,\"chain_1\":0,\"decals_1\":0,\"jaw_1\":0,\"beard_1\":0,\"face_md_weight\":50,\"bproof_2\":0,\"eyebrows_6\":0,\"chest_3\":0,\"bracelets_1\":-1,\"chin_4\":0,\"neck_thickness\":0,\"eye_color\":0,\"glasses_2\":0,\"lipstick_2\":0,\"bodyb_1\":-1,\"sex\":0,\"torso_2\":3,\"torso_1\":111,\"bags_1\":82,\"lipstick_4\":0,\"makeup_4\":0,\"beard_4\":0,\"cheeks_3\":0,\"hair_color_1\":0,\"complexion_1\":0,\"tshirt_2\":0,\"age_1\":0,\"watches_2\":2}', 'Tenue soldat ', 'mp_m_freemode_01', 'NarcosNeras'),
(135, '{\"bodyb_1\":-1,\"age_2\":0,\"eyebrows_4\":0,\"moles_2\":0,\"makeup_3\":0,\"jaw_2\":0,\"age_1\":0,\"chest_2\":0,\"beard_2\":0,\"eyebrows_6\":0,\"nose_4\":0,\"glasses_1\":42,\"chin_1\":0,\"blush_2\":0,\"eyebrows_2\":0,\"shoes_2\":0,\"hair_1\":85,\"complexion_1\":0,\"chain_1\":1,\"decals_2\":0,\"chest_3\":0,\"glasses_2\":0,\"nose_1\":0,\"face_md_weight\":0,\"complexion_2\":0,\"cheeks_3\":0,\"decals_1\":0,\"ears_2\":0,\"nose_2\":0,\"lipstick_3\":0,\"bracelets_2\":0,\"hair_color_1\":0,\"moles_1\":0,\"lipstick_2\":0,\"chain_2\":1,\"shoes_1\":99,\"bodyb_4\":0,\"beard_4\":0,\"tshirt_1\":16,\"sex\":1,\"bags_1\":0,\"sun_1\":0,\"pants_1\":172,\"makeup_2\":0,\"makeup_1\":0,\"chin_2\":0,\"neck_thickness\":0,\"dad\":44,\"bproof_2\":0,\"nose_5\":0,\"bags_2\":0,\"bodyb_2\":0,\"nose_3\":0,\"cheeks_2\":0,\"mask_1\":0,\"hair_color_2\":0,\"makeup_4\":0,\"sun_2\":0,\"mom\":45,\"lip_thickness\":0,\"eye_squint\":0,\"chin_4\":0,\"beard_1\":0,\"helmet_1\":0,\"blemishes_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"beard_3\":0,\"torso_1\":463,\"nose_6\":0,\"bodyb_3\":-1,\"lipstick_1\":0,\"ears_1\":-1,\"torso_2\":1,\"bproof_1\":0,\"chin_3\":0,\"bracelets_1\":16,\"lipstick_4\":0,\"jaw_1\":0,\"blemishes_1\":0,\"cheeks_1\":0,\"blush_1\":0,\"chest_1\":0,\"eye_color\":9,\"eyebrows_3\":0,\"arms_2\":0,\"watches_1\":23,\"blush_3\":0,\"arms\":93,\"eyebrows_1\":0,\"helmet_2\":0,\"pants_2\":20,\"watches_2\":0,\"eyebrows_5\":0,\"mask_2\":0,\"skin_md_weight\":56}', 'femme', 'mp_f_freemode_01', 'cayo'),
(141, '{\"moles_1\":0,\"age_2\":0,\"jaw_1\":-10,\"chin_1\":0,\"eyebrows_5\":-9,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"skin_md_weight\":50,\"nose_5\":0,\"beard_1\":0,\"blemishes_1\":0,\"dad\":4,\"eyebrows_4\":0,\"sun_1\":0,\"chain_2\":0,\"eyebrows_1\":0,\"eye_color\":5,\"bodyb_2\":0,\"blush_3\":0,\"cheeks_1\":10,\"chest_2\":0,\"hair_2\":0,\"nose_6\":-8,\"torso_2\":0,\"cheeks_3\":10,\"nose_2\":3,\"pants_2\":0,\"makeup_2\":0,\"eyebrows_3\":34,\"shoes_1\":220,\"bodyb_4\":0,\"sun_2\":0,\"chest_3\":0,\"mom\":24,\"decals_1\":0,\"sex\":0,\"age_1\":0,\"bracelets_2\":0,\"ears_1\":26,\"lipstick_3\":0,\"complexion_2\":0,\"ears_2\":0,\"mask_2\":0,\"lip_thickness\":0,\"hair_color_1\":0,\"bracelets_1\":-1,\"torso_1\":766,\"moles_2\":0,\"chin_2\":-6,\"mask_1\":0,\"blemishes_2\":0,\"neck_thickness\":0,\"nose_3\":0,\"bags_1\":81,\"tshirt_2\":0,\"watches_1\":-1,\"blush_1\":0,\"chin_3\":-4,\"nose_4\":0,\"chin_4\":-2,\"complexion_1\":0,\"decals_2\":0,\"lipstick_2\":0,\"nose_1\":-6,\"makeup_4\":0,\"face_md_weight\":50,\"eye_squint\":0,\"blush_2\":0,\"bodyb_3\":-1,\"makeup_3\":0,\"bproof_2\":0,\"jaw_2\":4,\"hair_color_2\":0,\"bodyb_1\":-1,\"eyebrows_2\":3,\"beard_2\":0,\"tshirt_1\":15,\"cheeks_2\":-10,\"arms_2\":0,\"chest_1\":0,\"lipstick_1\":0,\"makeup_1\":0,\"arms\":0,\"watches_2\":0,\"bags_2\":0,\"glasses_2\":4,\"hair_1\":197,\"bproof_1\":117,\"beard_4\":0,\"eyebrows_6\":2,\"helmet_2\":0,\"pants_1\":256,\"chain_1\":251,\"glasses_1\":77,\"shoes_2\":0}', 'Tenue 1', 'mp_m_freemode_01', 'bmf'),
(142, '{\"moles_1\":0,\"hair_color_2\":0,\"jaw_1\":-10,\"chin_1\":0,\"eyebrows_5\":-9,\"helmet_1\":-1,\"lipstick_4\":0,\"beard_3\":0,\"skin_md_weight\":50,\"nose_5\":0,\"beard_1\":0,\"blemishes_1\":0,\"dad\":4,\"eyebrows_4\":0,\"sun_1\":0,\"chain_2\":0,\"eyebrows_1\":0,\"eye_color\":5,\"bodyb_2\":0,\"chin_4\":-2,\"cheeks_1\":10,\"makeup_4\":0,\"hair_2\":0,\"nose_6\":-8,\"torso_2\":0,\"cheeks_3\":10,\"mom\":24,\"lipstick_3\":0,\"makeup_2\":0,\"chin_3\":-4,\"pants_1\":264,\"watches_1\":-1,\"sun_2\":0,\"eyebrows_3\":34,\"bracelets_2\":0,\"chain_1\":251,\"nose_2\":3,\"age_1\":0,\"chest_1\":0,\"ears_1\":26,\"bproof_2\":0,\"complexion_2\":0,\"chest_2\":0,\"mask_2\":13,\"decals_1\":0,\"blush_1\":0,\"bracelets_1\":-1,\"torso_1\":647,\"bags_2\":0,\"sex\":0,\"bodyb_4\":0,\"blemishes_2\":0,\"blush_2\":0,\"nose_3\":0,\"bags_1\":81,\"tshirt_2\":0,\"makeup_1\":0,\"moles_2\":0,\"helmet_2\":0,\"nose_4\":0,\"watches_2\":0,\"complexion_1\":0,\"nose_1\":-6,\"lipstick_2\":0,\"bproof_1\":0,\"chest_3\":0,\"face_md_weight\":50,\"eye_squint\":0,\"neck_thickness\":0,\"bodyb_3\":-1,\"makeup_3\":0,\"age_2\":0,\"jaw_2\":4,\"glasses_2\":4,\"bodyb_1\":-1,\"hair_color_1\":0,\"beard_2\":0,\"tshirt_1\":15,\"blush_3\":0,\"arms_2\":0,\"eyebrows_2\":3,\"lipstick_1\":0,\"pants_2\":0,\"arms\":205,\"mask_1\":169,\"ears_2\":0,\"chin_2\":-6,\"hair_1\":197,\"lip_thickness\":0,\"beard_4\":0,\"eyebrows_6\":2,\"shoes_1\":160,\"cheeks_2\":-10,\"decals_2\":0,\"glasses_1\":77,\"shoes_2\":3}', 'MAFIA 2', 'mp_m_freemode_01', 'bmf'),
(143, '{\"moles_1\":0,\"age_2\":0,\"bproof_2\":0,\"chin_1\":0,\"eyebrows_5\":0,\"helmet_1\":8,\"lipstick_4\":0,\"beard_3\":0,\"skin_md_weight\":50,\"nose_5\":0,\"beard_1\":0,\"blemishes_1\":0,\"dad\":0,\"eyebrows_4\":0,\"sun_1\":0,\"chain_2\":0,\"eyebrows_1\":15,\"eye_color\":0,\"bodyb_2\":0,\"blush_3\":0,\"cheeks_1\":0,\"chest_2\":0,\"hair_2\":0,\"nose_6\":0,\"torso_2\":1,\"cheeks_3\":0,\"chin_3\":0,\"watches_1\":58,\"makeup_2\":0,\"moles_2\":0,\"makeup_4\":0,\"bodyb_4\":0,\"sun_2\":0,\"chin_4\":0,\"watches_2\":2,\"decals_1\":0,\"nose_2\":0,\"age_1\":0,\"pants_2\":2,\"ears_1\":-1,\"cheeks_2\":0,\"complexion_2\":0,\"sex\":0,\"mask_2\":0,\"blemishes_2\":0,\"hair_color_1\":5,\"bracelets_1\":-1,\"torso_1\":720,\"hair_color_2\":37,\"eyebrows_6\":0,\"beard_4\":0,\"shoes_1\":224,\"face_md_weight\":61,\"bracelets_2\":0,\"blush_2\":0,\"tshirt_2\":0,\"nose_1\":0,\"nose_3\":0,\"helmet_2\":0,\"nose_4\":0,\"bags_2\":0,\"complexion_1\":0,\"eyebrows_2\":10,\"lipstick_2\":0,\"glasses_2\":0,\"chin_2\":0,\"eyebrows_3\":0,\"eye_squint\":0,\"blush_1\":0,\"bodyb_3\":-1,\"makeup_3\":0,\"neck_thickness\":0,\"jaw_2\":0,\"decals_2\":0,\"bodyb_1\":-1,\"bags_1\":0,\"beard_2\":0,\"tshirt_1\":15,\"bproof_1\":114,\"arms_2\":0,\"chest_3\":0,\"lipstick_1\":0,\"makeup_1\":0,\"arms\":0,\"mom\":25,\"ears_2\":0,\"chain_1\":234,\"hair_1\":208,\"lip_thickness\":0,\"mask_1\":265,\"lipstick_3\":0,\"chest_1\":0,\"pants_1\":253,\"jaw_1\":0,\"glasses_1\":77,\"shoes_2\":1}', 'CRIPS', 'mp_m_freemode_01', 'crips'),
(144, '{\"chest_1\":0,\"lipstick_1\":0,\"chin_1\":0,\"lipstick_3\":0,\"blush_1\":0,\"chin_2\":0,\"lipstick_2\":0,\"chain_2\":4,\"chest_2\":0,\"pants_1\":87,\"makeup_4\":0,\"chin_3\":0,\"neck_thickness\":0,\"hair_color_1\":3,\"eye_squint\":0,\"sex\":0,\"dad\":0,\"helmet_2\":0,\"hair_1\":0,\"blemishes_2\":0,\"makeup_2\":0,\"beard_3\":61,\"moles_2\":0,\"hair_color_2\":3,\"nose_3\":0,\"face_md_weight\":50,\"arms_2\":0,\"chest_3\":0,\"eyebrows_5\":4,\"eyebrows_1\":26,\"helmet_1\":106,\"mask_1\":269,\"eyebrows_2\":10,\"shoes_2\":0,\"bproof_2\":0,\"sun_2\":0,\"lipstick_4\":0,\"nose_4\":0,\"decals_1\":0,\"makeup_1\":0,\"bproof_1\":20,\"beard_4\":0,\"chin_4\":0,\"arms\":30,\"cheeks_3\":0,\"cheeks_2\":0,\"torso_2\":0,\"shoes_1\":59,\"age_1\":0,\"bags_1\":219,\"ears_1\":41,\"mom\":21,\"beard_1\":10,\"complexion_1\":0,\"beard_2\":10,\"pants_2\":0,\"blush_2\":0,\"nose_6\":0,\"watches_1\":-1,\"eyebrows_3\":61,\"tshirt_2\":4,\"hair_2\":0,\"bracelets_1\":-1,\"nose_5\":0,\"blemishes_1\":0,\"sun_1\":0,\"lip_thickness\":0,\"chain_1\":178,\"mask_2\":0,\"decals_2\":0,\"blush_3\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"eye_color\":13,\"watches_2\":0,\"nose_1\":0,\"tshirt_1\":209,\"bodyb_3\":-1,\"bracelets_2\":0,\"glasses_2\":0,\"ears_2\":0,\"skin_md_weight\":50,\"cheeks_1\":0,\"jaw_1\":0,\"torso_1\":219,\"age_2\":0,\"makeup_3\":0,\"nose_2\":0,\"eyebrows_4\":0,\"complexion_2\":0,\"jaw_2\":0,\"bodyb_4\":0,\"bags_2\":0,\"eyebrows_6\":0,\"glasses_1\":0,\"moles_1\":0}', 'Cayo recrue', 'mp_m_freemode_01', 'cayo'),
(146, '{\"lipstick_4\":0,\"chin_4\":-2,\"chin_1\":0,\"lipstick_3\":0,\"blush_1\":0,\"chin_2\":-6,\"lipstick_2\":0,\"chain_2\":0,\"chest_2\":0,\"chain_1\":-1,\"makeup_4\":0,\"chin_3\":-4,\"neck_thickness\":0,\"hair_color_1\":0,\"eye_squint\":0,\"sex\":0,\"dad\":4,\"helmet_2\":0,\"hair_1\":197,\"blemishes_2\":0,\"mask_2\":0,\"beard_3\":0,\"moles_2\":0,\"hair_color_2\":0,\"nose_3\":0,\"face_md_weight\":50,\"arms_2\":0,\"chest_3\":0,\"bodyb_3\":-1,\"nose_5\":0,\"tshirt_1\":308,\"mask_1\":169,\"eyebrows_2\":3,\"hair_2\":0,\"bproof_2\":9,\"sun_2\":0,\"age_1\":0,\"nose_4\":0,\"decals_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"beard_4\":0,\"eyebrows_1\":0,\"arms\":38,\"bproof_1\":20,\"moles_1\":0,\"bags_2\":0,\"shoes_1\":188,\"helmet_1\":-1,\"eyebrows_6\":2,\"ears_1\":26,\"mom\":24,\"beard_1\":0,\"complexion_1\":0,\"makeup_2\":0,\"pants_2\":0,\"sun_1\":0,\"glasses_1\":77,\"watches_1\":-1,\"cheeks_3\":10,\"tshirt_2\":0,\"bags_1\":81,\"bracelets_1\":-1,\"blemishes_1\":0,\"nose_2\":3,\"pants_1\":256,\"lip_thickness\":0,\"watches_2\":0,\"eye_color\":5,\"torso_2\":2,\"blush_3\":0,\"bodyb_1\":-1,\"bodyb_2\":0,\"eyebrows_3\":34,\"glasses_2\":4,\"chest_1\":0,\"shoes_2\":0,\"eyebrows_5\":-9,\"bracelets_2\":0,\"decals_2\":0,\"ears_2\":0,\"skin_md_weight\":50,\"cheeks_1\":10,\"jaw_1\":-10,\"nose_6\":-8,\"age_2\":0,\"makeup_3\":0,\"torso_1\":726,\"blush_2\":0,\"complexion_2\":0,\"nose_1\":-6,\"bodyb_4\":0,\"beard_2\":0,\"cheeks_2\":-10,\"jaw_2\":4,\"eyebrows_4\":0}', 'MAFIA 3', 'mp_m_freemode_01', 'bmf');

-- --------------------------------------------------------

--
-- Structure de la table `gofast_cooldown`
--

CREATE TABLE `gofast_cooldown` (
  `identifier` varchar(50) NOT NULL,
  `cooldown` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gofast_cooldown`
--


-- --------------------------------------------------------

--
-- Structure de la table `id_unique`
--

CREATE TABLE `id_unique` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `uid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_account`
--

CREATE TABLE `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_followers`
--

CREATE TABLE `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_posts`
--

CREATE TABLE `instagram_posts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instagram_stories`
--

CREATE TABLE `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `insta_stories`
--

CREATE TABLE `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventory_4_items`
--

CREATE TABLE `inventory_4_items` (
  `uniqueID` varchar(512) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `items` longtext NOT NULL,
  `originX` float DEFAULT NULL,
  `originY` float DEFAULT NULL,
  `originZ` float DEFAULT NULL,
  `expires` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inventory_4_items`
--


-- --------------------------------------------------------

--
-- Structure de la table `inventory_clothes`
--

CREATE TABLE `inventory_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inventory_trunk`
--

CREATE TABLE `inventory_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) DEFAULT NULL,
  `unique` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `can_remove`, `type`, `unique`) VALUES
('Faux papiers', 'faux_papiers', 0.1, 1, 'item', 0),
('bandage', 'Bandage', 0.5, 1, 'item', 0),
('basic_cuff', 'Menottes Basique', 0.5, 1, 'item', 0),
('basic_key', 'Clefs de Menottes Basique', 0.5, 1, 'item', 0),
('beer', 'Bière', 0.5, 1, 'item', 0),
('bitcoin', 'Bitcoin', 1.5, 1, 'item', 0),
('black_phone', 'Black Phone', 10, 1, 'item', 0),
('blowpipe', 'Chalumeaux', 1.5, 1, 'item', 0),
('blue_phone', 'Blue Phone', 10, 1, 'item', 0),
('bread', 'Pain', 0.4, 1, 'item', 0),
('brochet', 'Brochet', 0.4, 1, 'item', 0),
('burger', 'Burger', 0.5, 1, 'item', 0),
('burgerclassique', 'Burger Classique', 0.5, 1, 'item', 0),
('cabillaud', 'Cabillaud', 0.6, 1, 'item', 0),
('cacahuete', 'cacahuète', 0.5, 1, 'item', 0),
('cagoule', 'Cagoule', 0.5, 1, 'item', 0),
('capote', 'Capote', 0.5, 1, 'item', 0),
('carotool', 'Outils carosserie', 4, 1, 'item', 0),
('carton__ingredient_burgershot', 'Carton de ingrédient BurgerShot', 1, 1, 'item', 0),
('carton_aliment_burgershot', 'Carton alimentaire BurgerShot', 1, 1, 'item', 0),
('cash', 'Argent', 0, 1, 'accounts', 0),
('casino_beer', 'Casino Beer', 0, 1, 'item', 0),
('casino_burger', 'Burger', 0, 1, 'item', 0),
('casino_chips', 'Casino Chips', 0, 1, 'item', 0),
('casino_coffee', 'Casino Coffee', 0, 1, 'item', 0),
('casino_coke', 'Casino Kofola', 0, 1, 'item', 0),
('casino_donut', 'Donut', 0, 1, 'item', 0),
('casino_ego_chaser', 'Casino Ego Chaser', 0, 1, 'item', 0),
('casino_luckypotion', 'Casino Lucky Potion', 0, 1, 'item', 0),
('casino_psqs', 'Casino Ps & Qs', 0, 1, 'item', 0),
('casino_sandwitch', 'Sandwitch', 0.5, 1, 'item', 0),
('casino_sprite', 'Casino Sprite', 0, 1, 'item', 0),
('cb', 'Carte Bancaire', 1, 1, 'item', 0),
('cbd', 'CBD', 1, 1, 'item', 0),
('cbd_pooch', 'Pochon de CBD', 0.3, 1, 'item', 0),
('chiffon_clean', 'Chiffon Microfibre', 2, 1, 'item', 0),
('chip', 'Jeton', 0, 1, 'item', 0),
('chips', 'chips', 0.5, 1, 'item', 0),
('cigarette', 'Cigarette', 0.5, 1, 'item', 0),
('classic_phone', 'Classic Phone', 2, 1, 'item', 0),
('clip', 'Boite de munitions', 0.5, 1, 'item', 0),
('coca', 'Coca', 0.5, 1, 'item', 0),
('cofee', 'Café', 1, 1, 'item', 0),
('coke', 'Coke', 1, 1, 'item', 0),
('coke_pooch', 'Pochon de coke', 0.3, 1, 'item', 0),
('cola', 'Cola', 0.5, 1, 'item', 0),
('commandetacos', 'Commande Tacos', 1, 1, 'item', 0),
('composant', 'Composant', 1, 1, 'item', 0),
('composant_rtx', 'Composant RTX', 1, 1, 'item', 0),
('cornichons', 'Cornichons', 0.5, 1, 'item', 0),
('defibrillateur', 'Défibrillateur', 2, 1, 'item', 0),
('dirtycash', 'Argent sale', 0, 1, 'accounts', 0),
('donuts', 'Donuts', 1, 1, 'item', 0),
('drive', 'Permis de conduire', 0, 1, 'item', 1),
('drop_flareV2', 'Flare', 1, 1, 'item', 0),
('fanta', 'fanta', 0.5, 1, 'item', 0),
('feuille_coca', 'Feuille de coca', 1, 1, 'item', 0),
('firstaidkit', 'Trousse premier secours', 1, 1, 'item', 0),
('fish', 'Poisson', 0.5, 1, 'item', 0),
('fishingrod', 'Canne à pêche', 0.5, 1, 'item', 0),
('fixkit', 'Kit réparation', 1.5, 1, 'item', 0),
('fixtool', 'Outils réparation', 2, 1, 'item', 0),
('frites', 'Frites', 0.5, 1, 'item', 0),
('gadget_parachute', 'Parachute', 1, 1, 'weapons', 1),
('garnitures', 'Garnitures', 0.5, 1, 'item', 0),
('gazbottle', 'Bouteille de gaz', 2, 1, 'item', 0),
('gitanes', 'Gitanes', 0.5, 1, 'item', 0),
('gold_phone', 'Gold Phone', 2, 1, 'item', 0),
('gphone', 'gPhone', 1, 1, 'item', 0),
('grand_cru', 'Grand cru', 0.5, 1, 'item', 0),
('grapperaisin', 'Grappe de raisin', 0.5, 1, 'item', 0),
('green_phone', 'Green Phone', 10, 1, 'item', 0),
('greenlight_phone', 'Green Light Phone', 10, 1, 'item', 0),
('handcuff', 'Serre câble ', 0.5, 1, 'item', 0),
('hottub1', 'Hottub 1', 1, 1, 'item', 0),
('hottub1stairs', 'Hottub 1 Stairs', 1, 1, 'item', 0),
('hottub2', 'Hottub 2', 1, 1, 'item', 0),
('hottub2stairs', 'Hottub 2 Stairs', 1, 1, 'item', 0),
('hottub3', 'Hottub 3', 1, 1, 'item', 0),
('hottub3stairs', 'Hottub 3 Stairs', 1, 1, 'item', 0),
('ice', 'Glaçon', 0.5, 1, 'item', 0),
('icetea', 'icetea', 0.5, 1, 'item', 0),
('id_card_f', 'Carte de sécurité', 0.5, 1, 'item', 0),
('idcard', 'Carte Identité', 0, 1, 'item', 1),
('jager', 'Jägermeister', 0.5, 1, 'item', 0),
('jagerbomb', 'Jägermeister', 0.5, 1, 'item', 0),
('jagercerbere', 'Jäger Cerbère', 0.5, 1, 'item', 0),
('jerican', 'Jerican', 4, 1, 'item', 0),
('jewels', 'Bijoux', 1, 1, 'item', 0),
('job_barilpetrole', 'Baril de petrole', 1, 1, 'item', 0),
('job_cartemere', 'Carte mere', 0.5, 1, 'item', 0),
('job_pc', 'pc', 1, 1, 'item', 0),
('job_polypropylene', 'Polypropylene', 0.5, 1, 'item', 0),
('job_tomate', 'Tomate Fraiche', 0.5, 1, 'item', 0),
('job_ttomate', 'Tomate Traiter', 1, 1, 'item', 0),
('jumelles', 'Jumelles', 0.5, 1, 'item', 0),
('jus_coca', 'Jus de coca', 0.5, 1, 'item', 0),
('jus_de_pomme', 'Jus de Pomme', 0.5, 1, 'item', 0),
('jus_raisin', 'Jus de raisin', 0.5, 1, 'item', 0),
('jusfruit', 'Jus de fruits', 0.5, 1, 'item', 0),
('ketamine', 'Ketamine', 1, 1, 'item', 0),
('kevlar', 'Kevlar Lourd', 2.5, 1, 'item', 0),
('kevlarlow', 'Kevlar Léger', 0.5, 1, 'item', 0),
('kevlarmid', 'Kevlar Medium', 1.5, 1, 'item', 0),
('kitcrochetage', 'Kit de crochetage', 1, 1, 'item', 0),
('kq_outfitbag', 'Outfit bag', 4, 1, 'item', 0),
('lamp', 'Lampe pour Weed', 0.3, 1, 'item', 0),
('latex', 'Latex', 1.5, 1, 'item', 0),
('limonade', 'Limonade', 0.5, 1, 'item', 0),
('lingotor', 'Lingot d\'or', 1, 1, 'item', 0),
('lockpick', 'Pied de Biche', 1, 1, 'item', 0),
('malbora', 'Malboro', 0.5, 1, 'item', 0),
('martini', 'Martini blanc', 1, 1, 'item', 0),
('meat', 'Viande', 0.5, 1, 'item', 0),
('medikit', 'Medikit', 0.5, 1, 'item', 0),
('menthe', 'Feuille de menthe', 1, 1, 'item', 0),
('meth', 'Meth', 1, 1, 'item', 0),
('meth_pooch', 'Pochon de meth', 0.3, 1, 'item', 0),
('metreshooter', 'Mètre de shooter', 0.5, 1, 'item', 0),
('mixapero', 'Mix Apéritif', 0.5, 1, 'item', 0),
('mojito', 'Mojito', 0.5, 1, 'item', 0),
('munitions', 'Munitions de pistolet', 0.5, 1, 'item', 0),
('olive', 'Olive', 0.5, 1, 'item', 0),
('opium', 'Opium', 1, 1, 'item', 0),
('opium_pooch', 'Pochon d\'Opium', 0.3, 1, 'item', 0),
('orange', 'Orange', 0.5, 1, 'item', 0),
('orange_juice', 'Jus d\'orange', 0.5, 1, 'item', 0),
('orangina', 'Orangina', 0.5, 1, 'item', 0),
('oxygen_mask', 'Masque à Oxygène', 0.6, 1, 'item', 0),
('painburger', 'Pain Burger', 1, 1, 'item', 0),
('paper', 'Papier', 0.5, 1, 'item', 0),
('pepitor', 'Pépite d\'or', 1, 1, 'item', 0),
('pepperspray', 'Gazeuse', 1, -1, 'item', 0),
('phone', 'Téléphone', 0.5, 1, 'item', 0),
('phone_hack', 'Phone Hack', 10, 1, 'item', 0),
('phone_module', 'Phone Module', 10, 1, 'item', 0),
('piluleoubli', 'GHB', 1, 1, 'item', 0),
('pink_phone', 'Pink Phone', 10, 1, 'item', 0),
('pizza', 'Pizza', 1, 1, 'item', 0),
('plante', 'Plante du Jardinier', 2, 1, 'item', 0),
('police_cuff', 'Menottes LSPD', 0.5, 1, 'item', 0),
('police_key', 'Clefs de Menottes LSPD', 0.5, 1, 'item', 0),
('pomme', 'Pomme', 1, 1, 'item', 0),
('pooch_ketamine', 'Pochon de ketamine', 0.3, 1, 'item', 0),
('pot', 'Pot', 0.5, 1, 'item', 0),
('poulet', 'Poulet', 0.5, 1, 'item', 0),
('powerbank', 'Power Bank', 10, 1, 'item', 0),
('pâte a pizza', 'Pate à pizza', 1, 1, 'item', 0),
('radio', 'Radio', 0.5, 1, 'item', 0),
('raisin', 'Raisin', 0.5, 1, 'item', 0),
('red_phone', 'Red Phone', 10, 1, 'item', 0),
('redbull', 'Redbull', 0.5, 1, 'item', 0),
('redmonney', 'Faux Billet', 0.5, 1, 'item', 0),
('repairkit', 'Kit de réparation', 2, 1, 'item', 0),
('reparkit', 'Kit de réparation', 5, 1, 'item', 0),
('rhum', 'Rhum', 0.5, 1, 'item', 0),
('rhumcoca', 'Rhum-Coca', 0.5, 1, 'item', 0),
('rhumfruit', 'Rhum-Jus de fruits', 0.5, 1, 'item', 0),
('rorge', 'orge', 1, 1, 'item', 0),
('rtissu', 'Tissu', 1, 1, 'item', 0),
('rtx_4090', 'RTX 4090', 1, 1, 'item', 0),
('salade', 'Salade', 0.5, 1, 'item', 0),
('sardine', 'Sardine', 1, 1, 'item', 0),
('saumon', 'Saumon', 1, 1, 'item', 0),
('scrap', 'Pieces Détachés', 1, 1, 'item', 0),
('scratch_ticket', 'Ticket a gratter', 2, 1, 'item', 0),
('steak', 'Steak Haché', 1, 1, 'item', 0),
('tabac', 'Tabac', 1.5, 1, 'item', 0),
('tabacblond', 'Tabac Blond', 0.5, 1, 'item', 0),
('tabacblondsec', 'Tabac Blond Séché', 0.5, 1, 'item', 0),
('tabacbrun', 'Tabac Brun', 0.5, 1, 'item', 0),
('tabacbrunsec', 'Tabac Brun Séché', 0.5, 1, 'item', 0),
('tarte_pomme', 'Tarte aux Pommes', 0.5, 1, 'item', 0),
('teqpaf', 'Teq\'paf', 0.5, 1, 'item', 0),
('tequila', 'Tequila', 0.5, 1, 'item', 0),
('thon', 'Thon', 1, 1, 'item', 0),
('tomates', 'Tomates', 0.5, 1, 'item', 0),
('tpoulet', 'Wings', 0.5, 1, 'item', 0),
('truite', 'Truite', 1, 1, 'item', 0),
('ttissu', 'Vetement Nike', 1, 1, 'item', 0),
('twisky', 'wisky', 1, 1, 'item', 0),
('viande_1', 'Viande Blanche', 1.5, 1, 'item', 0),
('viande_2', 'Viande Rouge', 2.5, 1, 'item', 0),
('vine', 'Bouteille de Vin', 0.5, 1, 'item', 0),
('vittvin', 'Vin Blanc', 0.5, 1, 'item', 0),
('vodka', 'Vodka', 0.5, 1, 'item', 0),
('vodkaenergy', 'Vodka-Energy', 0.5, 1, 'item', 0),
('vodkafruit', 'Vodka-Jus de fruits', 0.5, 1, 'item', 0),
('vodkaredbull', 'Vodka-Redbull', 0.5, 1, 'item', 0),
('water', 'Bouteille d\'eau', 0.5, 1, 'item', 0),
('waterpass', 'Water Pass', 0.5, 1, 'item', 0),
('waterpassunlimited', 'Water Pass Unlimited', 0.5, 1, 'item', 0),
('weapon', 'Permis port d\'armes', 0, 1, 'item', 1),
('weapon_advancedrifle', 'Fusil Avancé', 1, 1, 'weapons', 1),
('weapon_appistol', 'Pistolet Perforant', 1, 1, 'weapons', 1),
('weapon_assaultrifle', 'AK-47', 1, 1, 'weapons', 1),
('weapon_assaultrifle_mk2', 'AK-47 MK2', 1, 1, 'weapons', 1),
('weapon_assaultshotgun', 'Fusil à Pompe D\'assaut', 1, 1, 'weapons', 1),
('weapon_assaultsmg', 'Mitraillette D\'assaut', 1, 1, 'weapons', 1),
('weapon_autoshotgun', 'Fusil à Pompe Auto', 1, 1, 'weapons', 1),
('weapon_ball', 'Balle', 1, 1, 'weapons', 1),
('weapon_bat', 'Batte De Baseball', 1, 1, 'weapons', 1),
('weapon_battleaxe', 'Hache', 1, 1, 'weapons', 1),
('weapon_bayonet', 'Bayonet', 1, 1, 'weapons', 1),
('weapon_beanbag', 'Pompe Bean-Bag', 1, 1, 'weapons', 1),
('weapon_bottle', 'Bouteille Cassé', 1, 1, 'weapons', 1),
('weapon_bullpuprifle', 'Fusil Bullpup', 1, 1, 'weapons', 1),
('weapon_bullpuprifle_mk2', 'Fusil Bullpup MK2', 1, 1, 'weapons', 1),
('weapon_bullpupshotgun', 'Fusil à Pompe Bullpup', 1, 1, 'weapons', 1),
('weapon_bzgas', 'Gaz Lacrymogène', 1, 1, 'weapons', 1),
('weapon_carbinerifle', 'M4A1', 1, 1, 'weapons', 1),
('weapon_carbinerifle_mk2', 'M4A1 MK2', 1, 1, 'weapons', 1),
('weapon_ceramicpistol', 'Pistolet En Céramique', 1, 1, 'weapons', 1),
('weapon_combatmg', 'M60', 1, 1, 'weapons', 1),
('weapon_combatmg_mk2', 'M60 MK2', 1, 1, 'weapons', 1),
('weapon_combatpdw', 'Arme De Défense Personnelle', 1, 1, 'weapons', 1),
('weapon_combatpistol', 'Pistolet De Combat', 1, 1, 'weapons', 1),
('weapon_combatshotgun', 'Fusil à Pompe De Combat', 1, 1, 'weapons', 1),
('weapon_compactlauncher', 'Lance Grenades Compact', 1, 1, 'weapons', 1),
('weapon_compactrifle', 'AK Compact', 1, 1, 'weapons', 1),
('weapon_crowbar', 'Pied De Biche', 1, 1, 'weapons', 1),
('weapon_dagger', 'Poignard', 1, 1, 'weapons', 1),
('weapon_dbshotgun', 'Fusil à Double Canon', 1, 1, 'weapons', 1),
('weapon_doubleaction', 'Revolver Double Action', 1, 1, 'weapons', 1),
('weapon_emplauncher', 'Lanceur EMP Compact', 1, 1, 'weapons', 1),
('weapon_fertilizercan', 'Bidon D\'engrais', 1, 1, 'weapons', 1),
('weapon_fireextinguisher', 'Extincteur', 1, 1, 'weapons', 1),
('weapon_firework', 'Lanceur De Feu D\'artifice', 1, 1, 'weapons', 1),
('weapon_flare', 'Fumée De Détresse', 1, 1, 'weapons', 1),
('weapon_flaregun', 'Pistolet De Détresse', 1, 1, 'weapons', 1),
('weapon_flashlight', 'Lampe Torche', 1, 1, 'weapons', 1),
('weapon_gadgetpistol', 'Pistolet Cayo Périco', 1, 1, 'weapons', 1),
('weapon_golfclub', 'Club De Golf', 1, 1, 'weapons', 1),
('weapon_grenade', 'Grenade', 1, 1, 'weapons', 1),
('weapon_grenadelauncher', 'Lance Grenades', 1, 1, 'weapons', 1),
('weapon_gusenberg', 'Gusenberg', 1, 1, 'weapons', 1),
('weapon_hammer', 'Marteau', 1, 1, 'weapons', 1),
('weapon_hatchet', 'Hachette', 1, 1, 'weapons', 1),
('weapon_hazardcan', 'Jerrycan Dangereux', 1, 1, 'weapons', 1),
('weapon_heavypistol', 'Pistolet Lourd', 1, 1, 'weapons', 1),
('weapon_heavyrifle', 'Fusil Lourd', 1, 1, 'weapons', 1),
('weapon_heavyshotgun', 'Fusil à Pompe Lourd', 1, 1, 'weapons', 1),
('weapon_heavysniper', 'Sniper Lourd', 1, 1, 'weapons', 1),
('weapon_heavysniper_mk2', 'Sniper Lourd MK2', 1, 1, 'weapons', 1),
('weapon_hominglauncher', 'Homing', 1, 1, 'weapons', 1),
('weapon_karambit', 'Karambit', 1, 1, 'weapons', 1),
('weapon_katana', 'Katana', 1, 1, 'weapons', 1),
('weapon_knife', 'Couteau', 1, 1, 'weapons', 1),
('weapon_knuckle', 'Poing Américain', 1, 1, 'weapons', 1),
('weapon_lucile', 'Lucile', 1, 1, 'weapons', 1),
('weapon_machete', 'Machette', 1, 1, 'weapons', 1),
('weapon_machinepistol', 'Tec-9', 1, 1, 'weapons', 1),
('weapon_marksmanpistol', 'Pistolet De Tireur D\'élite', 1, 1, 'weapons', 1),
('weapon_marksmanrifle', 'Sniper Tireur D\'élite', 1, 1, 'weapons', 1),
('weapon_marksmanrifle_mk2', 'Sniper Tireur D\'élite MK2', 1, 1, 'weapons', 1),
('weapon_mg', 'Mitrailleuse Légère', 1, 1, 'weapons', 1),
('weapon_microsmg', 'Micro Uzi', 1, 1, 'weapons', 1),
('weapon_militaryrifle', 'Fusil Militaire', 1, 1, 'weapons', 1),
('weapon_minigun', 'Minigun', 1, 1, 'weapons', 1),
('weapon_minismg', 'Scorpion', 1, 1, 'weapons', 1),
('weapon_molotov', 'Cocktails Molotov', 1, 1, 'weapons', 1),
('weapon_musket', 'Mousquet', 1, 1, 'weapons', 1),
('weapon_navyrevolver', 'Navy Revolver', 1, 1, 'weapons', 1),
('weapon_nightstick', 'Matraque', 1, 1, 'weapons', 1),
('weapon_pan', 'Poele', 1, 1, 'weapons', 1),
('weapon_petrolcan', 'Jerrican D\'essence', 1, 1, 'weapons', 1),
('weapon_pipebomb', 'Bombe Artisanale', 1, 1, 'weapons', 1),
('weapon_pistol', 'Beretta', 1, 1, 'weapons', 1),
('weapon_pistol50', 'Calibre 50', 1, 1, 'weapons', 1),
('weapon_pistol_mk2', 'Beretta MK2', 1, 1, 'weapons', 1),
('weapon_poolcue', 'Queue De Billard', 1, 1, 'weapons', 1),
('weapon_precisionrifle', 'Sniper De Précision', 1, 1, 'weapons', 1),
('weapon_proxmine', 'Mine De Proximité', 1, 1, 'weapons', 1),
('weapon_pumpshotgun', 'Fusil à Pompe', 1, 1, 'weapons', 1),
('weapon_pumpshotgun_mk2', 'Fusil à Pompe MK2', 1, 1, 'weapons', 1),
('weapon_railgun', 'Fusil à Rail', 1, 1, 'weapons', 1),
('weapon_raycarbine', 'Carabine Laser', 1, 1, 'weapons', 1),
('weapon_rayminigun', 'Minigun Laser', 1, 1, 'weapons', 1),
('weapon_raypistol', 'Pistolet Rayon', 1, 1, 'weapons', 1),
('weapon_revolver', 'Revolver', 1, 1, 'weapons', 1),
('weapon_revolver_mk2', 'Revolver MK2', 1, 1, 'weapons', 1),
('weapon_rpg', 'RPG', 1, 1, 'weapons', 1),
('weapon_sawnoffshotgun', 'Canon Scié', 1, 1, 'weapons', 1),
('weapon_smg', 'MP5', 1, 1, 'weapons', 1),
('weapon_smg_mk2', 'MP5 MK2', 1, 1, 'weapons', 1),
('weapon_smokegrenade', 'Fumigène', 1, 1, 'weapons', 1),
('weapon_sniperrifle', 'Sniper', 1, 1, 'weapons', 1),
('weapon_snowball', 'Brique', 1, 1, 'weapons', 1),
('weapon_snspistol', 'Pétoire', 1, 1, 'weapons', 1),
('weapon_snspistol_mk2', 'Pétoire MK2', 1, 1, 'weapons', 1),
('weapon_specialcarbine', 'G36', 1, 1, 'weapons', 1),
('weapon_specialcarbine_mk2', 'G36 MK2', 1, 1, 'weapons', 1),
('weapon_stickybomb', 'Bombes Collantes', 1, 1, 'weapons', 1),
('weapon_stone_hatchet', 'Hachette En Pierre', 1, 1, 'weapons', 1),
('weapon_stungun', 'Taser', 1, 1, 'weapons', 1),
('weapon_switchblade', 'Couteau Papillon', 1, 1, 'weapons', 1),
('weapon_tacticalrifle', 'Fusil Tactique', 1, 1, 'weapons', 1),
('weapon_tridagger', 'Dagger', 1, 1, 'weapons', 1),
('weapon_vintagepistol', 'Pistolet Vintage', 1, 1, 'weapons', 1),
('weapon_wrench', 'Clé à Molette', 1, 1, 'weapons', 1),
('weed_candy_leaf', 'Graine Candy', 0.5, 1, 'item', 0),
('weed_head_candy', 'Tete de Candy', 1, 1, 'item', 0),
('weed_head_mac10', 'Tete de Mac 10', 1, 1, 'item', 0),
('weed_head_og', 'Tete de OG W', 1, 1, 'item', 0),
('weed_head_rain', 'Tete de Rainbow', 1, 1, 'item', 0),
('weed_head_tropical', 'Tete de Tropical', 1, 1, 'item', 0),
('weed_mac10_leaf', 'Graine Mac10', 0.5, 1, 'item', 0),
('weed_og_leaf', 'Graine OG W', 0.5, 1, 'item', 0),
('weed_rainbow_leaf', 'Graine Rainbow', 0.5, 1, 'item', 0),
('weed_tropical_leaf', 'Graine Tropical', 0.5, 1, 'item', 0),
('wet_black_phone', 'Wet Black Phone', 10, 1, 'item', 0),
('wet_blue_phone', 'Wet Blue Phone', 10, 1, 'item', 0),
('wet_classic_phone', 'Wet Classic Phone', 10, 1, 'item', 0),
('wet_gold_phone', 'Wet Gold Phone', 10, 1, 'item', 0),
('wet_green_phone', 'Wet Green Phone', 10, 1, 'item', 0),
('wet_greenlight_phone', 'Wet Green Light Phone', 10, 1, 'item', 0),
('wet_pink_phone', 'Wet Pink Phone', 10, 1, 'item', 0),
('wet_red_phone', 'Wet Red Phone', 10, 1, 'item', 0),
('wet_white_phone', 'Wet White Phone', 10, 1, 'item', 0),
('whisky', 'Whisky', 0.5, 1, 'item', 0),
('whiskycoca', 'Whisky-coca', 0.5, 1, 'item', 0),
('white_phone', 'White Phone', 10, 1, 'item', 0),
('wiskycoca', 'wiskycoca', 0.5, 1, 'item', 0),
('xylazine', 'xylazine', 0.5, 1, 'item', 0),
('xylazine_pooch', 'Pochon de xylazine', 0.3, 1, 'item', 0),
('zetony', 'Jetons', 0.5, 1, 'item', 0);

-- --------------------------------------------------------

--
-- Structure de la table `izey_clothes`
--

CREATE TABLE `izey_clothes` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(60) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `trunk` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `izey_clothes`
--


-- --------------------------------------------------------

--
-- Structure de la table `izey_trunk`
--

CREATE TABLE `izey_trunk` (
  `info` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `izey_trunk`
--


-- --------------------------------------------------------

--
-- Structure de la table `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `remainingTasks` int(100) NOT NULL,
  `motif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `societyType` int(11) NOT NULL DEFAULT 1,
  `canWashMoney` tinyint(1) NOT NULL DEFAULT 0,
  `canUseOffshore` tinyint(1) NOT NULL DEFAULT 0,
  `handyservice` varchar(2) NOT NULL DEFAULT '0',
  `hasapp` int(2) NOT NULL DEFAULT 0,
  `onlyboss` int(2) NOT NULL DEFAULT 0,
  `number` varchar(10) NOT NULL DEFAULT '1',
  `motdchange` varchar(155) DEFAULT '',
  `motd` varchar(155) DEFAULT '',
  `member` varchar(11) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `societyType`, `canWashMoney`, `canUseOffshore`, `handyservice`, `hasapp`, `onlyboss`, `number`, `motdchange`, `motd`, `member`) VALUES
('Gitan', 'Gitan', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('NarcosNeras', 'NarcosNeras', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('ambulance', 'Ambulance', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('autoexotic', 'Auto Exotic', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('avocat', 'Avocat', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('bahamas', 'Bahamas', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('ballas', 'ballas', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('bcso', 'B.C.S.O', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('beanmachine', 'Bean-Machine', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('black_disciples', 'Black disciples', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('blackhands', 'blackhands', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('bloods', 'bloods', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('bmf', 'BMF', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('boatseller', 'Concessionnaire Bénéteau', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('boxe', 'Boxe', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('brinks', 'Brinks', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('burgershot', 'BurgerShot', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('camorra', 'camorra', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('cardealer', 'Concessionnaire', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('cardealer2', 'ConcesionnaireNord', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('cartelarmeniens', 'cartelarmeniens', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('cartelcamaro', 'cartelcamaro', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('cayo', 'cayo', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('cayo_perico', 'Cayo perico', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('chantier', 'Chantier', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('club77', 'Club 77', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('crips', 'Crips', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('famillies', 'famillies', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('fib', 'FIB', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('fonoti', 'Fonoti', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('gouv', 'Gouvernement', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('jardinier', 'Jardinier', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('journalist', 'Journaliste', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('larrys', 'Larrys', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('lsco', 'L.S.C.O', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('mafia_americaine', 'mafia_americaine', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('mafia_américaine', 'Mafia américaine', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('mafiacornbread', 'mafiacornbread', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('mafiarusse', 'mafiarusse', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('marabunta', 'Marabunta', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('mecano', 'Benny\'s', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('mecano2', 'Ls Custom', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('northhood', 'northhood', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('oblack', 'O\'Black', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('oragricole', 'Or Agricole', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('planeseller', 'Concessionnaire aéronotique', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('portuguesa', 'Portuguesa', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('realestateagent', 'Agent immobilier', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('roxsherif', 'R.S.D', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('sahp', 'S.A.H.P', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('santa_blanca', 'Santa Blanca', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('santa_blanca_(sb)', 'Santa Blanca (SB)', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('santablanca', 'santablanca', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('sasp', 'San Andreas State Police', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('shadow', 'shadow', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('soa', 'soa', 2, 0, 1, '0', 0, 0, '1', '', '', ''),
('studio', 'Studio', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('tacos', 'Tacos', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('taxi', 'Taxi', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('test1', 'Teest', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('test10', 'tEST&', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('testk', 'testk', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('unemployed', 'Citoyen', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('unemployed2', 'Aucune', 2, 0, 0, '0', 0, 0, '1', '', '', ''),
('unicorn', 'Unicorn', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('usms', 'U.S Marshal', 1, 0, 0, '0', 0, 0, '1', '', '', ''),
('vigneron', 'Vigneron', 1, 1, 0, '0', 0, 0, '1', '', '', ''),
('white', 'White', 2, 0, 0, '0', 0, 0, '1', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `jobs_farm`
--

CREATE TABLE `jobs_farm` (
  `id` int(11) NOT NULL,
  `infos` longtext DEFAULT NULL,
  `weight` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `limitextra` longtext DEFAULT NULL,
  `posrecolte` longtext DEFAULT NULL,
  `postraitement` longtext DEFAULT NULL,
  `posvente` longtext DEFAULT NULL,
  `poscoffre` longtext DEFAULT NULL,
  `pospatron` longtext DEFAULT NULL,
  `posgarage` longtext DEFAULT NULL,
  `posvestiaire` longtext DEFAULT NULL,
  `posgaragedelete` longtext DEFAULT NULL,
  `blips` longtext DEFAULT NULL,
  `posgaragespawn` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs_farm`
--

INSERT INTO `jobs_farm` (`id`, `infos`, `weight`, `data`, `limitextra`, `posrecolte`, `postraitement`, `posvente`, `poscoffre`, `pospatron`, `posgarage`, `posvestiaire`, `posgaragedelete`, `blips`, `posgaragespawn`) VALUES
(1, '{\"name\":\"vigneron\",\"label\":\"Vigneron\"}', '{\"circuit\":{\"item_recoltename\":\"raisin\",\"item_recoltelabel\":\"Raisin\",\"item_traitementname\":\"jusderaisin\",\"item_traitementlabel\":\"Jus de Raisin\"},\"vehicle\":[\"bison3\"]}', '{\"weapons\":[],\"items\":{\"jusderaisin\":{\"weight\":28.6,\"name\":\"jusderaisin\",\"count\":276,\"label\":\"Jus de raisin\"},\"raisin\":{\"weight\":1,\"name\":\"raisin\",\"count\":1,\"label\":\"Raisin\"}},\"accounts\":{\"cash\":0,\"dirtycash\":0}}', '{\"maxweight\":1000,\"maxtenue\":5,\"weight\":56.20000000000001,\"tenue\":0}', '{\"x\":-1832.6351318359376,\"y\":2133.276123046875,\"z\":124.20476531982422}', '{\"x\":-42.0966796875,\"y\":1884.1219482421876,\"z\":195.52601623535157}', '{\"x\":82.13575744628906,\"y\":81.44163513183594,\"z\":78.61700439453125}', '{\"x\":-1877.2901611328126,\"y\":2063.056396484375,\"z\":145.57371520996095}', '{\"x\":-1876.21337890625,\"y\":2060.803466796875,\"z\":145.57371520996095}', '{\"x\":-1923.013427734375,\"y\":2059.604248046875,\"z\":140.8320770263672}', '{\"x\":-1928.6536865234376,\"y\":2059.564208984375,\"z\":140.83624267578126}', '{\"x\":-1918.4593505859376,\"y\":2056.44775390625,\"z\":140.735107421875}', '{\"y\":2050.44677734375,\"z\":142.74154663085938,\"x\":-1890.700439453125}', '{\"spawn\":{\"x\":-1918.1766357421876,\"y\":2056.3427734375,\"z\":140.73507690429688},\"heading\":249.58714294433595}'),
(4, '{\"name\":\"oragricole\",\"label\":\"OrAgricole\"}', '{\"circuit\":{\"item_recoltename\":\"ble\",\"item_recoltelabel\":\"Ble\",\"item_traitementname\":\"farine\",\"item_traitementlabel\":\"Farine\"},\"vehicle\":[\"bison3\"]}', '{\"weapons\":[],\"items\":[],\"accounts\":{\"cash\":60,\"dirtycash\":0}}', '{\"maxweight\":5000,\"maxtenue\":10,\"weight\":0,\"tenue\":0}', '{\"x\":482.4395751953125,\"y\":6490.62841796875,\"z\":30.088623046875}', '{\"y\":4636.0302734375,\"x\":1930.2081298828128,\"z\":40.45171737670898}', '{\"y\":1230.34814453125,\"x\":-3193.80908203125,\"z\":10.0483283996582}', '{\"x\":413.010986328125,\"y\":6539.314453125,\"z\":27.7296142578125}', '{\"x\":416.26812744140627,\"y\":6520.62841796875,\"z\":27.7127685546875}', '{\"x\":420.67254638671877,\"y\":6529.2529296875,\"z\":27.6790771484375}', '{\"x\":405.6527404785156,\"y\":6526.33837890625,\"z\":27.6959228515625}', '{\"x\":424.4307861328125,\"y\":6539.9208984375,\"z\":27.6622314453125}', '{\"y\":6539.35400390625,\"z\":27.7296142578125,\"x\":413.2879028320313}', '{\"heading\":0.0,\"spawn\":{\"x\":424.4307861328125,\"y\":6539.8681640625,\"z\":27.6622314453125}}');

-- --------------------------------------------------------

--
-- Structure de la table `jobs_skin`
--

CREATE TABLE `jobs_skin` (
  `id` int(11) NOT NULL,
  `skin` longtext NOT NULL,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `jobs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs_skin`
--

INSERT INTO `jobs_skin` (`id`, `skin`, `name`, `type`, `jobs`) VALUES
(8, '{\"moles_2\":0,\"eye_squint\":0,\"hair_2\":0,\"lip_thickness\":0,\"helmet_2\":0,\"helmet_1\":-1,\"blush_1\":0,\"nose_5\":0,\"jaw_2\":0,\"eyebrows_6\":0,\"bracelets_1\":-1,\"cheeks_2\":0,\"tshirt_2\":1,\"neck_thickness\":0,\"mom\":0,\"decals_1\":0,\"chest_2\":0,\"makeup_2\":0,\"age_1\":0,\"beard_1\":3,\"eye_color\":0,\"watches_2\":0,\"hair_color_2\":0,\"torso_1\":13,\"nose_6\":0,\"tshirt_1\":15,\"mask_2\":0,\"jaw_1\":0,\"makeup_4\":0,\"mask_1\":0,\"beard_4\":17,\"shoes_2\":0,\"nose_2\":0,\"blush_2\":0,\"chain_2\":0,\"blemishes_1\":0,\"eyebrows_1\":0,\"face_md_weight\":17,\"dad\":2,\"chest_3\":0,\"watches_1\":-1,\"glasses_2\":0,\"moles_1\":0,\"sun_1\":0,\"lipstick_1\":0,\"bodyb_3\":-1,\"ears_1\":-1,\"glasses_1\":3,\"lipstick_4\":0,\"blush_3\":0,\"pants_2\":1,\"ears_2\":0,\"nose_4\":0,\"chest_1\":0,\"pants_1\":90,\"cheeks_1\":0,\"eyebrows_2\":10.0,\"sun_2\":0,\"lipstick_2\":0,\"beard_2\":10,\"makeup_1\":0,\"decals_2\":0,\"chin_3\":0,\"arms_2\":0,\"eyebrows_4\":0,\"beard_3\":0,\"blemishes_2\":0,\"bracelets_2\":0,\"bodyb_2\":0,\"bags_2\":0,\"chin_2\":0,\"chin_4\":0,\"bodyb_1\":-1,\"lipstick_3\":0,\"skin_md_weight\":70,\"torso_2\":2,\"eyebrows_5\":0,\"nose_1\":0,\"sex\":0,\"eyebrows_3\":0,\"chain_1\":1,\"bags_1\":0,\"cheeks_3\":0,\"nose_3\":0,\"complexion_2\":0,\"age_2\":0,\"bodyb_4\":0,\"makeup_3\":0,\"hair_color_1\":0,\"arms\":37,\"chin_1\":0,\"complexion_1\":0,\"bproof_2\":0,\"hair_1\":43,\"shoes_1\":27,\"bproof_1\":0}', 'Tenue employés Vigneron.', 'mp_m_freemode_01', 'vigneron'),
(10, '{\"tshirt_1\":15,\"glasses_2\":0,\"nose_1\":0,\"eye_squint\":0,\"jaw_2\":0,\"pants_2\":0,\"blush_2\":0,\"bags_1\":0,\"hair_color_1\":0,\"chest_1\":0,\"helmet_1\":-1,\"hair_2\":0,\"blemishes_2\":0,\"eyebrows_5\":0,\"chain_2\":0,\"bproof_1\":0,\"hair_1\":1,\"makeup_3\":41,\"bracelets_2\":0,\"nose_5\":0,\"pants_1\":4,\"age_1\":0,\"eyebrows_4\":0,\"mask_1\":0,\"beard_2\":10,\"chin_3\":0,\"shoes_1\":25,\"bodyb_3\":-1,\"torso_2\":0,\"beard_1\":3,\"makeup_2\":0,\"makeup_1\":0,\"blemishes_1\":0,\"arms_2\":0,\"lip_thickness\":0,\"torso_1\":237,\"chin_4\":0,\"hair_color_2\":0,\"ears_2\":0,\"eyebrows_2\":0,\"bodyb_1\":-1,\"shoes_2\":0,\"nose_2\":0,\"eye_color\":21,\"age_2\":0,\"chin_2\":0,\"nose_4\":0,\"dad\":7,\"helmet_2\":0,\"bracelets_1\":-1,\"nose_3\":0,\"moles_2\":0,\"complexion_1\":1,\"cheeks_3\":0,\"mask_2\":0,\"lipstick_4\":0,\"chin_1\":0,\"eyebrows_6\":0,\"ears_1\":46,\"bproof_2\":0,\"tshirt_2\":0,\"moles_1\":0,\"sun_1\":0,\"eyebrows_3\":42,\"chest_2\":0,\"watches_2\":0,\"sun_2\":0,\"watches_1\":-1,\"bodyb_2\":0,\"blush_1\":0,\"lipstick_3\":0,\"bags_2\":0,\"nose_6\":0,\"bodyb_4\":0,\"neck_thickness\":0,\"sex\":0,\"jaw_1\":0,\"lipstick_2\":0,\"chain_1\":-1,\"cheeks_2\":0,\"skin_md_weight\":10,\"face_md_weight\":3,\"cheeks_1\":0,\"arms\":23,\"lipstick_1\":0,\"decals_2\":0,\"beard_4\":0,\"eyebrows_1\":0,\"glasses_1\":0,\"makeup_4\":54,\"decals_1\":0,\"complexion_2\":0,\"blush_3\":0,\"chest_3\":0,\"mom\":29,\"beard_3\":0}', 'Tenue de service', 'mp_m_freemode_01', 'oragricole');

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'ambulance', 0, 'ambulance', 'Ambulancier', 5000, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":0,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":33,\"pants_1\":19,\"blush_3\":0,\"torso_2\":1,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":21,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":11,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":57,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":91,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":23,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":1,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":65,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":105,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":257,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(2, 'ambulance', 1, 'doctor', 'Medecin', 7000, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":0,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":33,\"pants_1\":19,\"blush_3\":0,\"torso_2\":1,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":21,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":11,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":57,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":91,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":7,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":1,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":106,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":9,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(3, 'ambulance', 2, 'chief_doctor', 'Médecin-Chef', 9000, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":0,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":33,\"pants_1\":19,\"blush_3\":0,\"torso_2\":1,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":21,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":11,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":57,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":91,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":50,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":258,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(4, 'ambulance', 3, 'boss', 'Directeur', 1, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":0,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":33,\"pants_1\":19,\"blush_3\":0,\"torso_2\":1,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":21,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":11,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":57,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":91,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":81,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":14,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(7, 'avocat', 0, 'recruit', 'Recrue', 1, '{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}', '{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
(8, 'avocat', 1, 'boss', 'Patron', 1, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(30, 'avocat', 0, 'recruit', 'Recrue', 1, '', ''),
(31, 'avocat', 1, 'experimente', 'Experimenté', 1, '', ''),
(32, 'avocat', 2, 'boss', 'Patron', 5, '', ''),
(43, 'mecano', 0, 'recruit', 'Recrue', 400, '{}', '{}'),
(44, 'mecano', 1, 'novice', 'Novice', 450, '{}', '{}'),
(45, 'mecano', 2, 'experimente', 'Experimente', 475, '{}', '{}'),
(46, 'mecano', 3, 'chief', 'Chef d\'equipe', 600, '{}', '{}'),
(47, 'mecano', 4, 'boss', 'Patron', 5000, '{}', '{}'),
(66, 'taxi', 0, 'recrue', 'Recrue', 1, '{}', '{}'),
(67, 'taxi', 1, 'novice', 'Novice', 1, '{}', '{}'),
(68, 'taxi', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
(69, 'taxi', 3, 'uber', 'Uber', 1, '{}', '{}'),
(70, 'taxi', 4, 'boss', 'Patron', 1, '{}', '{}'),
(74, 'unemployed', 0, 'unemployed', 'RSA', 100, '{}', '{}'),
(75, 'unicorn', 0, 'barman', 'Barman', 1, '{}', '{}'),
(76, 'unicorn', 1, 'dancer', 'Videur', 1, '{}', '{}'),
(77, 'unicorn', 2, 'viceboss', 'Co-gérant', 1, '{}', '{}'),
(78, 'unicorn', 3, 'boss', 'Gérant', 1, '{}', '{}'),
(90, 'burgershot', 0, 'recrue', 'Recrue', 1, '{}', '{}'),
(91, 'burgershot', 1, 'novice', 'Novice', 1, '{}', '{}'),
(92, 'burgershot', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
(93, 'burgershot', 3, 'chief', 'Chef d\'équipe', 1, '{}', '{}'),
(94, 'burgershot', 4, 'boss', 'Patron', 1, '{}', '{}'),
(157, 'unemployed2', 0, 'unemployed2', 'Citoyen', 0, '{}', '{}'),
(551, 'cardealer', 0, 'recruit', 'Recrue', 1, '{}', '{}'),
(552, 'cardealer', 1, 'novice', 'Novice', 1, '{}', '{}'),
(553, 'cardealer', 2, 'experienced', 'Experimente', 1, '{}', '{}'),
(554, 'cardealer', 3, 'boss', 'Co-Patron', 1, '{}', '{}'),
(617, 'boatseller', 0, 'recruit', 'Recrue', 100, '{}', '{}'),
(618, 'boatseller', 1, 'novice', 'Novice', 100, '{}', '{}'),
(619, 'boatseller', 2, 'experienced', 'Experimente', 100, '{}', '{}'),
(620, 'boatseller', 3, 'boss', 'Patron', 100, '{}', '{}'),
(621, 'planeseller', 0, 'recruit', 'Recrue', 1, '{}', '{}'),
(622, 'planeseller', 1, 'novice', 'Novice', 1, '{}', '{}'),
(623, 'planeseller', 2, 'experienced', 'Experimente', 1, '{}', '{}'),
(624, 'planeseller', 3, 'boss', 'Patron', 2500, '{}', '{}'),
(759, 'journalist', 0, 'stagiaire', 'Stagiaire', 1, '{}', '{}'),
(768, 'journalist', 1, 'reporter', 'Reporter', 1, '{}', '{}'),
(777, 'journalist', 2, 'investigator', 'Investigateur', 1, '{}', '{}'),
(786, 'journalist', 3, 'boss', 'Directeur', 1, '{}', '{}'),
(801, 'tacos', 0, 'recruit', 'Recrue', 12, '{}', '{}'),
(802, 'jardinier', 0, 'recruit', 'Recrue', 12, '{}', '{}'),
(873, 'gouv', 0, 'secrétaire', 'Secrétaire', 5000, '{}', '{}'),
(874, 'gouv', 1, 'garde_du_corps', 'Service secret', 9000, '{}', '{}'),
(875, 'gouv', 2, 'garde_corps_rap', 'Chef Service secret', 9000, '{}', '{}'),
(876, 'gouv', 3, 'chef_section', 'Directeur Service secret', 9000, '{}', '{}'),
(877, 'gouv', 4, 'procureur', 'Procureur', 6000, '{}', '{}'),
(878, 'gouv', 5, 'juge', 'Juge', 7500, '{}', '{}'),
(879, 'gouv', 6, 'procureur_general', 'Procureur Général', 8000, '{}', '{}'),
(880, 'gouv', 7, 'vice_gouverneur', 'Lieutenant Gouverneur', 9500, '{}', '{}'),
(881, 'gouv', 8, 'boss', 'Gouverneur', 1, '{}', '{}'),
(900, 'mecano2', 0, 'recruit', 'Recrue', 1000, '{}', '{}'),
(901, 'mecano2', 1, 'novice', 'Novice', 1500, '{}', '{}'),
(902, 'mecano2', 2, 'experimente', 'Experimente', 2000, '{}', '{}'),
(903, 'mecano2', 3, 'chief', 'Chef d\'equipe', 2500, '{}', '{}'),
(904, 'mecano2', 4, 'boss', 'Patron', 3000, '{}', '{}'),
(924, 'bcso', 0, 'recruit', 'Cadet', 1, '{}', '{}'),
(925, 'bcso', 1, 'deputytwo', 'Deputy 2', 1, '{}', '{}'),
(926, 'bcso', 2, 'deputyone', 'Deputy 1', 1, '{}', '{}'),
(927, 'bcso', 3, 'senior', 'Senior Deputy', 1, '{}', '{}'),
(928, 'bcso', 4, 'sergent', 'Sergent', 1, '{}', '{}'),
(929, 'bcso', 5, 'lieutenant', 'Lieutenant', 1, '{}', '{}'),
(930, 'bcso', 6, 'major', 'Major', 1, '{}', '{}'),
(931, 'bcso', 7, 'adjoint', 'Sheriff Adjoint', 1, '{}', '{}'),
(932, 'bcso', 8, 'boss', 'Sheriff', 1, '{}', '{}'),
(1151, 'fib', 0, 'recruit', 'Consultant Fédéral', 1, '{}', '{}'),
(1152, 'fib', 1, 'officer', 'Agent Aspirant', 1, '{}', '{}'),
(1153, 'fib', 2, 'sergeant', 'Agent Fédéral', 1, '{}', '{}'),
(1154, 'fib', 3, 'sergeant_chief', 'Agent Spécial', 1, '{}', '{}'),
(1155, 'fib', 4, 'intendent', 'Agent Spécial Superviseur', 1, '{}', '{}'),
(1156, 'fib', 5, 'lieutenant', 'Agent Spécial en Charge', 1, '{}', '{}'),
(1157, 'fib', 6, 'chef', 'Agent Spécial de Coordination', 1, '{}', '{}'),
(1158, 'fib', 7, 'boss', 'Directeur d\'Agence', 1, '{}', '{}'),
(1534, 'boxe', 0, 'organisateur_combat', 'Organisateur Combat', 1, '[]', '[]'),
(1541, 'chantier', 0, 'recruit', 'Ouvrier', 12, '{}', '{}'),
(1542, 'roxsherif', 0, 'recruit', 'Cadet', 800, '{}', '{}'),
(1543, 'roxsherif', 1, 'deputytwo', 'Deputy 2', 1150, '{}', '{}'),
(1544, 'roxsherif', 2, 'deputyone', 'Deputy 1', 1000, '{}', '{}'),
(1545, 'roxsherif', 3, 'senior', 'Senior Deputy', 1300, '{}', '{}'),
(1546, 'roxsherif', 4, 'sergent', 'Sergent', 1500, '{}', '{}'),
(1547, 'roxsherif', 5, 'lieutenant', 'Lieutenant', 1700, '{}', '{}'),
(1548, 'roxsherif', 6, 'major', 'Major', 2000, '{}', '{}'),
(1549, 'roxsherif', 7, 'adjoint', 'Sheriff Adjoint', 2400, '{}', '{}'),
(1550, 'roxsherif', 8, 'boss', 'Sheriff', 3500, '{}', '{}'),
(1551, 'bahamas', 0, 'barman', 'Barman', 2500, '{}', '{}'),
(1552, 'bahamas', 1, 'videur', 'Videur', 1500, '{}', '{}'),
(1553, 'bahamas', 2, 'dj', 'DJ', 5000, '{}', '{}'),
(1554, 'bahamas', 3, 'boss', 'Gérant', 8000, '{}', '{}'),
(1642, 'cardealer', 4, 'boss', 'Patron', 9999, '{}', '{}'),
(1655, 'cardealer2', 0, 'recruit', 'Recrue', 400, '{}', '{}'),
(1656, 'cardealer2', 1, 'novice', 'Novice', 500, '{}', '{}'),
(1657, 'cardealer2', 2, 'experienced', 'Experimente', 800, '{}', '{}'),
(1658, 'cardealer2', 3, 'boss', 'Co-Patron', 1000, '{}', '{}'),
(1659, 'cardealer2', 4, 'boss', 'Patron', 1000, '{}', '{}'),
(1660, 'brinks', 0, 'novice', 'Convoyeur Brink’s', 100, '{}', '{}'),
(1661, 'brinks', 1, 'experimente', 'Chef de mouvement Brink’s', 100, '{}', '{}'),
(1662, 'brinks', 2, 'ce', 'Chef d’agence Brink’s', 100, '{}', '{}'),
(1663, 'brinks', 3, 'cpdg', 'CO-PDG', 100, '{}', '{}'),
(1664, 'brinks', 4, 'boss', 'Patron', 100, '{}', '{}'),
(1689, 'realestateagent', 0, 'location', 'Location', 900, '{}', '{}'),
(1690, 'realestateagent', 1, 'vendeur', 'Vendeur', 1200, '{}', '{}'),
(1691, 'realestateagent', 2, 'gestion', 'Gestion', 2000, '{}', '{}'),
(1692, 'realestateagent', 3, 'boss', 'Patron', 5000, '{}', '{}'),
(1715, 'vigneron', 5, 'boss', 'Patron', 200, '{}', '{}'),
(1716, 'vigneron', 4, 'responsable', 'Co-Patron', 1, '{}', '{}'),
(1717, 'vigneron', 3, 'chefequipe', 'Chef-d\'equipe', 250, '{}', '{}'),
(1718, 'vigneron', 2, 'experimente', 'Experimente', 100, '{}', '{}'),
(1719, 'vigneron', 1, 'novice', 'Novice', 50, '{}', '{}'),
(1720, 'vigneron', 0, 'employer', 'Stagiaire', 5, '{}', '{}'),
(1737, 'vigneron', 5, 'boss', 'Patron', 200, '{}', '{}'),
(1738, 'vigneron', 4, 'responsable', 'Co-Patron', 1, '{}', '{}'),
(1739, 'vigneron', 3, 'chefequipe', 'Chef-d\'equipe', 250, '{}', '{}'),
(1740, 'vigneron', 1, 'novice', 'Novice', 50, '{}', '{}'),
(1741, 'vigneron', 2, 'experimente', 'Experimente', 100, '{}', '{}'),
(1742, 'vigneron', 0, 'employer', 'Stagiaire', 5, '{}', '{}'),
(1759, 'mafiacornbread', 1, 'soldado', 'soldado', 0, '[]', '[]'),
(1760, 'mafiacornbread', 2, 'combatiente', 'combatiente', 0, '[]', '[]'),
(1761, 'mafiacornbread', 3, 'lideres', 'Lideres', 0, '[]', '[]'),
(1762, 'mafiacornbread', 4, 'diputado', 'Diputado', 0, '[]', '[]'),
(1763, 'mafiacornbread', 5, 'jefe', 'Jefe', 1000, '[]', '[]'),
(1764, 'mafiacornbread', 6, 'boss', 'Patron', 0, '[]', '[]'),
(1784, 'portuguesa', 2, 'principe', 'Principe', 0, '[]', '[]'),
(1785, 'portuguesa', 3, 'lider', 'Lider', 0, '[]', '[]'),
(1786, 'portuguesa', 4, 'boss', 'Patron', 0, '[]', '[]'),
(1787, 'portuguesa', 1, 'legionario', 'legionario', 0, '[]', '[]'),
(1788, 'cartelarmeniens', 2, 'grand', 'grand', 50, '[]', '[]'),
(1789, 'cartelarmeniens', 3, 'brasdroit', 'brasdroit', 200, '[]', '[]'),
(1790, 'cartelarmeniens', 4, 'boss', 'boss', 500, '[]', '[]'),
(1791, 'cartelarmeniens', 1, 'petit', 'petit', 10, '[]', '[]'),
(1792, 'cartelcamaro', 2, 'grand', 'grand', 6000, '[]', '[]'),
(1793, 'cartelcamaro', 3, 'brasdroit', 'brasdroit', 8000, '[]', '[]'),
(1794, 'cartelcamaro', 4, 'boss', 'boss', 9999, '[]', '[]'),
(1795, 'cartelcamaro', 1, 'petit', 'petit', 5000, '[]', '[]'),
(1822, 'santablanca', 2, 'segundo', 'segundo', 0, '[]', '[]'),
(1823, 'santablanca', 3, 'jefe', 'jefe', 0, '[]', '[]'),
(1824, 'santablanca', 4, 'boss', 'Patron', 0, '[]', '[]'),
(1825, 'santablanca', 1, 'soldado', 'soldado', 0, '[]', '[]'),
(1826, 'mafia_américaine', 5, 'recruit', 'Recrue', 1, '[]', '[]'),
(1827, 'mafia_américaine', 6, 'boss', 'Patron', 0, '[]', '[]'),
(1828, 'mafia_américaine', 3, 'trésorié', 'Trésorié', 1, '[]', '[]'),
(1829, 'mafia_américaine', 4, 'soldat', 'Soldat', 1, '[]', '[]'),
(1830, 'mafia_américaine', 1, 'parrain', 'Parrain', 1, '[]', '[]'),
(1831, 'mafia_américaine', 2, 'bras_droit', 'Bras droit', 1, '[]', '[]'),
(1838, 'blackhands', 5, 'boss', 'Patron', 1, '[]', '[]'),
(1839, 'blackhands', 3, 'bras_droit', 'Bras droit', 0, '[]', '[]'),
(1840, 'blackhands', 4, 'lead', 'Lead', 0, '[]', '[]'),
(1841, 'blackhands', 1, 'soldat', 'Soldat', 0, '[]', '[]'),
(1842, 'blackhands', 2, 'lieutenant', 'Lieutenant', 0, '[]', '[]'),
(1850, 'soa', 4, 'boss', 'boss', 1, '[]', '[]'),
(1851, 'soa', 1, 'recruit', 'recrue', 0, '[]', '[]'),
(1852, 'soa', 2, 'biker', 'biker', 1, '[]', '[]'),
(1853, 'soa', 3, 'vice-president', 'vice-president', 1, '[]', '[]'),
(1860, 'mafia_americaine', 1, 'recruit', 'recrue', 0, '[]', '[]'),
(1861, 'mafia_americaine', 3, 'capitain', 'capitain', 0, '[]', '[]'),
(1862, 'mafia_americaine', 2, 'soldat', 'soldat', 0, '[]', '[]'),
(1863, 'mafia_americaine', 5, 'parrain', 'parrain', 0, '[]', '[]'),
(1864, 'mafia_americaine', 4, 'lieutenant', 'lieutenant', 0, '[]', '[]'),
(1865, 'mafia_americaine', 6, 'boss', 'Patron', 0, '[]', '[]'),
(1877, 'autoexotic', 0, 'recruit', 'Recrue', 1, '{}', '{}'),
(1878, 'autoexotic', 1, 'novice', 'Novice', 1, '{}', '{}'),
(1879, 'autoexotic', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
(1880, 'autoexotic', 3, 'chief', 'Chef d\'equipe', 1, '{}', '{}'),
(1881, 'autoexotic', 4, 'boss', 'Patron', 1, '{}', '{}'),
(1888, 'mafiarusse', 4, 'bras_droit', 'bras droit', 0, '[]', '[]'),
(1889, 'mafiarusse', 3, 'elite', 'elite', 0, '[]', '[]'),
(1890, 'mafiarusse', 6, 'boss', 'Patron', 0, '[]', '[]'),
(1891, 'mafiarusse', 5, 'bras_gauche', 'bras gauche', 0, '[]', '[]'),
(1892, 'mafiarusse', 2, 'soldat', 'soldat', 4500, '[]', '[]'),
(1893, 'mafiarusse', 1, 'recruit', 'recrue', 2500, '[]', '[]'),
(1894, 'santa_blanca_(sb)', 3, 'capitans', 'Capitans', 1, '[]', '[]'),
(1895, 'santa_blanca_(sb)', 4, 'guerreros', 'Guerreros', 1, '[]', '[]'),
(1896, 'santa_blanca_(sb)', 5, 'boss', 'Patron', 0, '[]', '[]'),
(1897, 'santa_blanca_(sb)', 2, 'co-lead', 'Co-lead', 1, '[]', '[]'),
(1898, 'northhood', 3, 'brasgauche', 'brasgauche', 0, '[]', '[]'),
(1899, 'northhood', 4, 'boss', 'Patron', 0, '[]', '[]'),
(1900, 'northhood', 1, 'littlegangsta', 'littlegangsta', 0, '[]', '[]'),
(1901, 'northhood', 2, 'homies', 'homies', 0, '[]', '[]'),
(1908, 'santa_blanca', 1, 'nuevo', 'Nuevo', 1, '[]', '[]'),
(1909, 'santa_blanca', 2, 'soldato', 'Soldato', 1, '[]', '[]'),
(1910, 'santa_blanca', 3, 'caporal', 'Caporal', 1, '[]', '[]'),
(1911, 'santa_blanca', 4, 'segundo', 'Segundo', 4, '[]', '[]'),
(1912, 'santa_blanca', 5, 'boss', 'Patron', 0, '[]', '[]'),
(1913, 'sasp', 0, 'recruit', 'Rookie', 1500, '{}', '{}'),
(1914, 'sasp', 1, 'officer', 'Officier', 2000, '{}', '{}'),
(1915, 'sasp', 2, 'sergeant', 'Sergent', 3000, '{}', '{}'),
(1916, 'sasp', 3, 'lieutenant', 'Lieutenant', 4000, '{}', '{}'),
(1917, 'sasp', 4, 'capitaine', 'Capitaine', 5000, '{}', '{}'),
(1918, 'sasp', 5, 'commander', 'Commander', 6000, '{}', '{}'),
(1919, 'sasp', 6, 'deputy', 'Deputy Chief', 7000, '{}', '{}'),
(1921, 'sasp', 7, 'boss', 'Chief of SASP', 8000, '{}', '{}'),
(1933, 'studio', 0, 'recruit', 'Jeune Rappeur', 850, '{}', '{}'),
(1934, 'studio', 1, 'novice', 'Artiste', 1000, '{}', '{}'),
(1935, 'studio', 2, 'experienced', 'Manager', 1500, '{}', '{}'),
(1936, 'studio', 3, 'boss', 'Patron', 2500, '{}', '{}'),
(1937, 'camorra', 3, 'sottocapo', 'Sottocapo', 0, '[]', '[]'),
(1938, 'camorra', 2, 'soldato', 'soldato', 0, '[]', '[]'),
(1939, 'camorra', 1, 'associati', 'Associati', 0, '[]', '[]'),
(1940, 'camorra', 4, 'boss', 'Patron', 0, '[]', '[]'),
(1945, 'black_disciples', 1, 'petit', 'Petit', 1, '[]', '[]'),
(1946, 'black_disciples', 4, 'boss', 'Patron', 0, '[]', '[]'),
(1947, 'black_disciples', 3, 'gérant', 'Gérant', 1, '[]', '[]'),
(1966, 'cayo_perico', 1, 'recruit', 'Recrue', 1, '[]', '[]'),
(1967, 'cayo_perico', 2, 'soldat', 'Soldat', 2, '[]', '[]'),
(1968, 'cayo_perico', 3, 'lieutenant_', 'Lieutenant ', 3, '[]', '[]'),
(1969, 'cayo_perico', 4, 'chef_d\'equipe', 'Chef d\'equipe', 4, '[]', '[]'),
(1970, 'cayo_perico', 5, 'bras_droit_', 'Bras droit ', 5, '[]', '[]'),
(1971, 'cayo_perico', 6, 'jefe_', 'Jefe ', 6, '[]', '[]'),
(1972, 'cayo_perico', 7, 'boss', 'Patron', 0, '[]', '[]'),
(1982, 'club77', 0, 'barman', 'Barman', 750, '{}', '{}'),
(1983, 'club77', 1, 'dancer', 'Videur', 850, '{}', '{}'),
(1984, 'club77', 2, 'viceboss', 'Co-gérant', 1000, '{}', '{}'),
(1985, 'club77', 3, 'boss', 'Gérant', 2500, '{}', '{}'),
(2057, 'mafiacornbread', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2058, 'mafiacornbread', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2059, 'mafiacornbread', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2060, 'mafiacornbread', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2061, 'mafiacornbread', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2062, 'mafiacornbread', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2063, 'mafiacornbread', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2260, 'soa', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2261, 'soa', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2262, 'soa', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2263, 'soa', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2264, 'soa', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2265, 'soa', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2266, 'soa', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2435, 'larrys', 0, 'recruit', 'Recrue', 1, '{}', '{}'),
(2436, 'larrys', 1, 'novice', 'Novice', 1, '{}', '{}'),
(2437, 'larrys', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
(2438, 'larrys', 3, 'chief', 'Chef d\'equipe', 1, '{}', '{}'),
(2439, 'larrys', 4, 'boss', 'Patron', 1, '{}', '{}'),
(2440, 'beanmachine', 0, 'recrue', 'Recrue', 200, '{}', '{}'),
(2441, 'beanmachine', 1, 'novice', 'Novice', 500, '{}', '{}'),
(2442, 'beanmachine', 2, 'experimente', 'Experimente', 350, '{}', '{}'),
(2443, 'beanmachine', 3, 'chief', 'Chef d\'équipe', 750, '{}', '{}'),
(2444, 'beanmachine', 4, 'boss', 'Patron', 1500, '{}', '{}'),
(2543, 'bloods', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2544, 'bloods', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2545, 'bloods', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2546, 'bloods', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2547, 'bloods', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2548, 'bloods', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2549, 'bloods', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2731, 'cayo', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2732, 'cayo', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2733, 'cayo', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2734, 'cayo', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2735, 'cayo', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2736, 'cayo', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2737, 'cayo', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2738, 'famillies', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2739, 'famillies', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2740, 'famillies', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2741, 'famillies', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2742, 'famillies', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2743, 'famillies', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2744, 'famillies', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2843, 'ballas', 6, 'boss', 'Patron', 0, '{}', '{}'),
(2844, 'ballas', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(2845, 'ballas', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(2846, 'ballas', 3, 'elite', 'Elite', 0, '{}', '{}'),
(2847, 'ballas', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(2848, 'ballas', 1, 'membre', 'Membre', 0, '{}', '{}'),
(2849, 'ballas', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(2927, 'oragricole', 5, 'boss', 'Patron', 0, '{}', '{}'),
(2928, 'oragricole', 3, 'chefequipe', 'Chef-d\'equipe', 0, '{}', '{}'),
(2929, 'oragricole', 4, 'responsable', 'Co-Patron', 0, '{}', '{}'),
(2930, 'oragricole', 1, 'novice', 'Novice', 0, '{}', '{}'),
(2931, 'oragricole', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
(2932, 'oragricole', 0, 'employer', 'Stagiaire', 0, '{}', '{}'),
(2972, 'usms', 0, 'recruit', 'Rookie', 2500, '{}', '{}'),
(2973, 'usms', 1, 'officer', 'Officier', 3000, '{}', '{}'),
(2974, 'usms', 2, 'sergeant', 'Sergent', 5000, '{}', '{}'),
(2975, 'usms', 3, 'lieutenant', 'Lieutenant', 7500, '{}', '{}'),
(2976, 'usms', 4, 'capitaine', 'Capitaine', 7000, '{}', '{}'),
(2977, 'usms', 5, 'commander', 'Commander', 7500, '{}', '{}'),
(2978, 'usms', 6, 'deputy', 'Deputy Chief', 8000, '{}', '{}'),
(2979, 'usms', 7, 'assistantboss', 'Assistant Chief', 9000, '{}', '{}'),
(2980, 'usms', 8, 'boss', 'Chief of U.S Marshal', 9999, '{}', '{}'),
(3051, 'camorra', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3052, 'camorra', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3053, 'camorra', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3054, 'camorra', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3055, 'camorra', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3056, 'camorra', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3057, 'camorra', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3098, 'sahp', 0, 'recruit', 'Rookie', 1500, '{}', '{}'),
(3099, 'sahp', 1, 'officer', 'Officier', 2000, '{}', '{}'),
(3100, 'sahp', 2, 'sergeant', 'Sergent', 3000, '{}', '{}'),
(3101, 'sahp', 3, 'lieutenant', 'Lieutenant', 4000, '{}', '{}'),
(3102, 'sahp', 4, 'capitaine', 'Capitaine', 5000, '{}', '{}'),
(3103, 'sahp', 5, 'commander', 'Commander', 6000, '{}', '{}'),
(3104, 'sahp', 6, 'deputy', 'Deputy Chief', 7000, '{}', '{}'),
(3105, 'sahp', 7, 'boss', 'Chief of SAHP', 8000, '{}', '{}'),
(3106, 'lsco', 0, 'recruit', 'Rookie', 1, '{}', '{}'),
(3107, 'lsco', 1, 'officer', 'Officier', 1, '{}', '{}'),
(3108, 'lsco', 2, 'sergeant', 'Sergent', 1, '{}', '{}'),
(3109, 'lsco', 3, 'lieutenant', 'Lieutenant', 1, '{}', '{}'),
(3110, 'lsco', 4, 'capitaine', 'Capitaine', 1, '{}', '{}'),
(3111, 'lsco', 5, 'commander', 'Commander', 1, '{}', '{}'),
(3112, 'lsco', 6, 'deputy', 'Deputy Chief', 1, '{}', '{}'),
(3113, 'lsco', 7, 'boss', 'Chief of LSCO', 2000, '{}', '{}'),
(3121, 'NarcosNeras', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3122, 'NarcosNeras', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3123, 'NarcosNeras', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3124, 'NarcosNeras', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3125, 'NarcosNeras', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3126, 'NarcosNeras', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3127, 'NarcosNeras', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3156, 'Gitan', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3157, 'Gitan', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3158, 'Gitan', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3159, 'Gitan', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3160, 'Gitan', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3161, 'Gitan', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3162, 'Gitan', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3205, 'crips', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3206, 'crips', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3207, 'crips', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3208, 'crips', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3209, 'crips', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3210, 'crips', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3211, 'crips', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3212, 'white', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3213, 'white', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3214, 'white', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3215, 'white', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3216, 'white', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3217, 'white', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3218, 'white', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3219, 'bmf', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3220, 'bmf', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3221, 'bmf', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3222, 'bmf', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3223, 'bmf', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3224, 'bmf', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3225, 'bmf', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3239, 'test1', 0, 'recrue', 'Recrue', 0, '[]', '[]'),
(3240, 'test1', 1, 'petit', 'Petit', 0, '[]', '[]'),
(3241, 'test1', 2, 'boss', 'Boss', 0, '[]', '[]'),
(3242, 'testk', 0, 'boss', 'boss', 0, '[]', '[]'),
(3250, 'marabunta', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3251, 'marabunta', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3252, 'marabunta', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3253, 'marabunta', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3254, 'marabunta', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3255, 'marabunta', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3256, 'marabunta', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3257, 'fonoti', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3258, 'fonoti', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3259, 'fonoti', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3260, 'fonoti', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3261, 'fonoti', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3262, 'fonoti', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3263, 'fonoti', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3271, 'oblack', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3272, 'oblack', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3273, 'oblack', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3274, 'oblack', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3275, 'oblack', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3276, 'oblack', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3277, 'oblack', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3278, 'shadow', 6, 'boss', 'Patron', 0, '{}', '{}'),
(3279, 'shadow', 4, 'lieutenant', 'lieutenant', 0, '{}', '{}'),
(3280, 'shadow', 5, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(3281, 'shadow', 0, 'recruit', 'Associé', 0, '{}', '{}'),
(3282, 'shadow', 1, 'membre', 'Membre', 0, '{}', '{}'),
(3283, 'shadow', 2, 'soldat', 'Soldat', 0, '{}', '{}'),
(3284, 'shadow', 3, 'elite', 'Elite', 0, '{}', '{}'),
(3292, 'test10', 0, 'recrue', 'Recrue', 0, '[]', '[]'),
(3293, 'test10', 3, 'boss', 'Boss', 0, '[]', '[]'),
(3294, 'test10', 1, 'Sbire Droit', 'Soldat', 0, '[]', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `koy_afk_players`
--

CREATE TABLE `koy_afk_players` (
  `UniqueID` varchar(155) NOT NULL,
  `points` longtext DEFAULT '0',
  `time` longtext DEFAULT '0',
  `inZone` tinyint(1) DEFAULT 0,
  `skin` longtext DEFAULT 'none',
  `playerName` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `koy_afk_players`
--


-- --------------------------------------------------------

--
-- Structure de la table `kq_extra`
--

CREATE TABLE `kq_extra` (
  `id` int(11) NOT NULL,
  `player` varchar(256) DEFAULT '0',
  `tag` varchar(50) DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_accounts`
--

CREATE TABLE `lbtablet_ambulance_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_bulletin`
--

CREATE TABLE `lbtablet_ambulance_bulletin` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_conditions`
--

CREATE TABLE `lbtablet_ambulance_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `severity` varchar(25) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_ambulance_conditions`
--

INSERT INTO `lbtablet_ambulance_conditions` (`id`, `severity`, `category_id`, `title`) VALUES
(98, 'critical', 24, 'Aortic Aneurysm'),
(91, 'critical', 24, 'Heart Attack'),
(92, 'critical', 24, 'Heart Failure'),
(94, 'critical', 24, 'Stroke'),
(103, 'critical', 25, 'Fractured Hip'),
(108, 'critical', 25, 'Pelvic Fracture'),
(126, 'critical', 27, 'Ebola Virus Disease'),
(123, 'critical', 27, 'Meningitis'),
(145, 'critical', 29, 'Brain Cancer'),
(138, 'critical', 29, 'Breast Cancer'),
(142, 'critical', 29, 'Colon Cancer'),
(141, 'critical', 29, 'Leukemia'),
(143, 'critical', 29, 'Lymphoma'),
(144, 'critical', 29, 'Pancreatic Cancer'),
(139, 'critical', 29, 'Prostate Cancer'),
(149, 'critical', 30, 'Lung Cancer'),
(153, 'critical', 30, 'Pulmonary Embolism'),
(170, 'critical', 32, 'Spinal Cord Injury'),
(163, 'critical', 32, 'Traumatic Brain Injury'),
(97, 'minor', 24, 'Angina'),
(95, 'minor', 24, 'Arrhythmia'),
(96, 'minor', 24, 'High Blood Pressure'),
(100, 'minor', 24, 'Peripheral Artery Disease'),
(101, 'minor', 25, 'Broken Arm'),
(109, 'minor', 25, 'Rotator Cuff Tear'),
(106, 'minor', 25, 'Sprained Ankle'),
(110, 'minor', 25, 'Tennis Elbow'),
(104, 'minor', 25, 'Torn ACL'),
(114, 'minor', 26, 'Gastroesophageal Reflux Disease (GERD)'),
(118, 'minor', 26, 'Peptic Ulcer'),
(124, 'minor', 27, 'Influenza (Flu)'),
(127, 'minor', 27, 'Zika Virus'),
(131, 'minor', 28, 'Anxiety Disorder'),
(133, 'minor', 28, 'Obsessive-Compulsive Disorder (OCD)'),
(135, 'minor', 28, 'Phobias'),
(147, 'minor', 30, 'Asthma'),
(152, 'minor', 30, 'Bronchitis'),
(151, 'minor', 30, 'Sleep Apnea'),
(160, 'minor', 31, 'Hyperthyroidism'),
(157, 'minor', 31, 'Thyroid Disorders'),
(169, 'minor', 32, 'Bell’s Palsy'),
(171, 'minor', 32, 'Cluster Headaches'),
(162, 'minor', 32, 'Concussion'),
(168, 'minor', 32, 'Migraine'),
(93, 'moderate', 24, 'Coronary Artery Disease'),
(99, 'moderate', 24, 'Deep Vein Thrombosis (DVT)'),
(102, 'moderate', 25, 'Broken Leg'),
(105, 'moderate', 25, 'Dislocated Shoulder'),
(107, 'moderate', 25, 'Herniated Disc'),
(111, 'moderate', 26, 'Appendicitis'),
(116, 'moderate', 26, 'Gallstones'),
(117, 'moderate', 26, 'Pancreatitis'),
(120, 'moderate', 27, 'COVID-19'),
(125, 'moderate', 27, 'Malaria'),
(137, 'moderate', 28, 'Dementia'),
(129, 'moderate', 28, 'Depression'),
(132, 'moderate', 28, 'Post-Traumatic Stress Disorder (PTSD)'),
(146, 'moderate', 30, 'Pneumonia'),
(159, 'moderate', 31, 'Adrenal Insufficiency (Addison’s Disease)'),
(158, 'moderate', 31, 'Cushing’s Syndrome'),
(164, 'moderate', 32, 'Epilepsy'),
(112, 'severe', 26, 'Crohn\'s Disease'),
(119, 'severe', 26, 'Hepatitis C'),
(115, 'severe', 26, 'Irritable Bowel Syndrome (IBS)'),
(113, 'severe', 26, 'Ulcerative Colitis'),
(121, 'severe', 27, 'Hepatitis'),
(122, 'severe', 27, 'HIV/AIDS'),
(128, 'severe', 27, 'Lyme Disease'),
(130, 'severe', 28, 'Bipolar Disorder'),
(136, 'severe', 28, 'Eating Disorders'),
(134, 'severe', 28, 'Schizophrenia'),
(140, 'severe', 29, 'Skin Cancer'),
(148, 'severe', 30, 'Chronic Obstructive Pulmonary Disease (COPD)'),
(154, 'severe', 30, 'Cystic Fibrosis'),
(150, 'severe', 30, 'Tuberculosis (TB)'),
(161, 'severe', 31, 'Polycystic Ovary Syndrome (PCOS)'),
(155, 'severe', 31, 'Type 1 Diabetes'),
(156, 'severe', 31, 'Type 2 Diabetes'),
(167, 'severe', 32, 'Alzheimer’s Disease'),
(165, 'severe', 32, 'Multiple Sclerosis'),
(166, 'severe', 32, 'Parkinson\'s Disease');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_conditions_categories`
--

CREATE TABLE `lbtablet_ambulance_conditions_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_ambulance_conditions_categories`
--

INSERT INTO `lbtablet_ambulance_conditions_categories` (`id`, `title`) VALUES
(29, 'Cancer Types'),
(24, 'Cardiovascular Conditions'),
(31, 'Endocrine Disorders'),
(26, 'Gastrointestinal Conditions'),
(27, 'Infectious Diseases'),
(28, 'Mental Health Conditions'),
(32, 'Neurological Conditions'),
(25, 'Orthopedic Injuries'),
(30, 'Respiratory Conditions');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_logs`
--

CREATE TABLE `lbtablet_ambulance_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(25) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profiles`
--

CREATE TABLE `lbtablet_ambulance_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profile_conditions`
--

CREATE TABLE `lbtablet_ambulance_profile_conditions` (
  `profile_id` varchar(100) NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_profile_tags`
--

CREATE TABLE `lbtablet_ambulance_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports`
--

CREATE TABLE `lbtablet_ambulance_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `patient` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_attachments`
--

CREATE TABLE `lbtablet_ambulance_reports_attachments` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_conditions`
--

CREATE TABLE `lbtablet_ambulance_reports_conditions` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `condition_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_doctors`
--

CREATE TABLE `lbtablet_ambulance_reports_doctors` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `doctor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_reports_tags`
--

CREATE TABLE `lbtablet_ambulance_reports_tags` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_ambulance_tags`
--

CREATE TABLE `lbtablet_ambulance_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `tag_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_apps_loggedin`
--

CREATE TABLE `lbtablet_apps_loggedin` (
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(25) NOT NULL,
  `account` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms`
--

CREATE TABLE `lbtablet_chat_rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `terminal_type` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `creator` varchar(100) NOT NULL,
  `last_message` text DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms_members`
--

CREATE TABLE `lbtablet_chat_rooms_members` (
  `room_id` int(10) UNSIGNED NOT NULL,
  `account` varchar(100) NOT NULL,
  `notifications` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_chat_rooms_messages`
--

CREATE TABLE `lbtablet_chat_rooms_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `author` varchar(100) NOT NULL,
  `message` text DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_clock_alarms`
--

CREATE TABLE `lbtablet_clock_alarms` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `hours` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `minutes` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_notes`
--

CREATE TABLE `lbtablet_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` mediumtext NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_notifications`
--

CREATE TABLE `lbtablet_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) NOT NULL DEFAULT 0,
  `custom_data` text DEFAULT NULL,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photos`
--

CREATE TABLE `lbtablet_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photo_albums`
--

CREATE TABLE `lbtablet_photo_albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_photo_album_photos`
--

CREATE TABLE `lbtablet_photo_album_photos` (
  `album_id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_accounts`
--

CREATE TABLE `lbtablet_police_accounts` (
  `id` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `callsign` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_police_accounts`
--


-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_bulletin`
--

CREATE TABLE `lbtablet_police_bulletin` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases`
--

CREATE TABLE `lbtablet_police_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_charges`
--

CREATE TABLE `lbtablet_police_cases_charges` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `criminal` varchar(100) NOT NULL,
  `offence_id` int(10) UNSIGNED NOT NULL,
  `charges` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_criminals`
--

CREATE TABLE `lbtablet_police_cases_criminals` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `id` varchar(100) NOT NULL,
  `fine` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fined` tinyint(1) NOT NULL DEFAULT 0,
  `jailed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_evidence`
--

CREATE TABLE `lbtablet_police_cases_evidence` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_involved`
--

CREATE TABLE `lbtablet_police_cases_involved` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_linked_reports`
--

CREATE TABLE `lbtablet_police_cases_linked_reports` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_cases_tags`
--

CREATE TABLE `lbtablet_police_cases_tags` (
  `case_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_jail`
--

CREATE TABLE `lbtablet_police_jail` (
  `id` int(10) UNSIGNED NOT NULL,
  `prisoner` varchar(100) NOT NULL,
  `jailed_by` varchar(100) DEFAULT NULL,
  `reason` varchar(100) NOT NULL,
  `original_time` int(10) UNSIGNED NOT NULL,
  `jail_time` int(10) UNSIGNED NOT NULL,
  `jailed_at` datetime NOT NULL DEFAULT current_timestamp(),
  `related_case` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_logs`
--

CREATE TABLE `lbtablet_police_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `related_id` varchar(500) DEFAULT NULL,
  `log_action` varchar(50) NOT NULL,
  `log_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_offences`
--

CREATE TABLE `lbtablet_police_offences` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `fine` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_police_offences`
--

INSERT INTO `lbtablet_police_offences` (`id`, `category_id`, `class`, `title`, `description`, `fine`, `jail_time`) VALUES
(1, 1, 'misdemeanor', 'Possession of Controlled Substances', 'Having illegal drugs for personal use.', 500, 0),
(2, 1, 'infraction', 'Possession of Drug Paraphernalia', 'Having items associated with drug use or preparation.', 200, 0),
(3, 1, 'felony', 'Drug Trafficking', 'The distribution or sale of illegal drugs.', 0, 60),
(4, 1, 'felony', 'Driving Under Drug Influence', 'Operating a vehicle while under the influence of drugs.', 1000, 12),
(5, 1, 'felony', 'Cultivation of Illegal Drugs', 'Growing plants used to produce controlled substances.', 0, 48),
(6, 1, 'misdemeanor', 'Public Drug Use', 'Consuming illegal drugs in public spaces.', 300, 0),
(7, 1, 'felony', 'Drug Manufacturing', 'Producing illegal drugs for sale or distribution.', 0, 72),
(8, 1, 'felony', 'Prescription Fraud', 'Falsifying prescriptions to obtain controlled substances.', 1000, 24),
(9, 1, 'felony', 'Possession with Intent to Distribute', 'Possessing drugs in quantities that suggest intent to sell.', 0, 48),
(10, 1, 'felony', 'Operating a Drug House', 'Maintaining a property for drug manufacturing or distribution.', 0, 72),
(11, 1, 'felony', 'Public Sale of Drugs', 'Selling illegal drugs in a public area.', 2000, 36),
(12, 2, 'felony', 'Carrying a Concealed Weapon Without Permit', 'Possessing a hidden weapon without the required authorization.', 0, 36),
(13, 2, 'felony', 'Illegal Sale of Firearms', 'Selling guns without the necessary licenses or background checks.', 5000, 60),
(14, 2, 'felony', 'Unlawful Discharge of a Firearm', 'Firing a weapon in prohibited areas or in a manner that endangers others.', 4000, 36),
(15, 2, 'felony', 'Possession of a Prohibited Weapon', 'Owning or carrying weapons banned by law, such as sawed-off shotguns or explosives.', 5000, 48),
(16, 2, 'misdemeanor', 'Brandishing a Weapon', 'Displaying a weapon in a threatening manner without just cause.', 750, 12),
(17, 2, 'misdemeanor', 'Using a Weapon While Intoxicated', 'Operating or handling a weapon while under the influence of drugs or alcohol.', 1000, 12),
(18, 2, 'felony', 'Possession of a Weapon in a Restricted Area', 'Bringing firearms or other weapons into places where they are strictly prohibited, such as airports or schools.', 3000, 24),
(19, 2, 'felony', 'Trafficking Illegal Firearms', 'Transporting or selling firearms unlawfully across jurisdictions.', 7000, 72),
(20, 2, 'misdemeanor', 'Failure to Secure a Firearm', 'Neglecting to safely store a firearm, leading to potential unauthorized access.', 500, 0),
(21, 2, 'felony', 'Modifying a Firearm Illegally', 'Altering a weapon to make it more lethal, such as converting it to fully automatic.', 6000, 48),
(22, 2, 'felony', 'Possession of a Firearm Without a Serial Number', 'Owning or using a weapon with the serial number removed or obscured.', 4000, 36),
(23, 2, 'misdemeanor', 'Carrying a Loaded Firearm in Public', 'Possessing a firearm with live ammunition in a public space without legal authorization.', 2000, 24),
(24, 2, 'misdemeanor', 'Negligent Use of a Weapon', 'Handling or operating a firearm carelessly, causing risk to others.', 1500, 12),
(25, 2, 'felony', 'Possession of a Stolen Firearm', 'Being in possession of a weapon known to be stolen.', 5000, 36),
(26, 3, 'misdemeanor', 'Vandalism', 'Deliberate destruction or defacement of property.', 1000, 0),
(27, 3, 'felony', 'Burglary', 'Unlawful entry into a building with the intent to commit a crime.', 0, 24),
(28, 3, 'felony', 'Arson', 'The willful and malicious burning of property.', 2000, 48),
(29, 3, 'misdemeanor', 'Shoplifting', 'Stealing merchandise from a retail establishment.', 300, 0),
(30, 3, 'infraction', 'Trespassing', 'Entering or remaining on someone else\'s property without permission.', 200, 0),
(31, 3, 'felony', 'Grand Theft', 'Stealing property of significant value.', 0, 36),
(32, 3, 'misdemeanor', 'Petty Theft', 'Stealing property of low value.', 500, 0),
(33, 3, 'misdemeanor', 'Possession of Stolen Property', 'Having goods that were unlawfully taken from someone else.', 700, 0),
(34, 3, 'misdemeanor', 'Graffiti', 'Illegally painting or defacing public or private property.', 500, 0),
(35, 3, 'felony', 'Credit Card Fraud', 'Using stolen or fake credit card information to make purchases.', 2000, 24),
(36, 3, 'felony', 'Breaking and Entering', 'Forcing entry into a property without permission.', 0, 36),
(37, 3, 'misdemeanor', 'Piracy', 'Illegally copying or distributing copyrighted material.', 1000, 0),
(38, 3, 'felony', 'Identity Theft', 'Using someone else\'s personal information for fraudulent purposes.', 2000, 48),
(39, 3, 'misdemeanor', 'Trespassing', 'Entering or remaining on property without permission.', 250, 0),
(40, 3, 'felony', 'Theft of Public Property', 'Stealing items belonging to the government or public institutions.', 0, 36),
(41, 3, 'misdemeanor', 'Unauthorized Use of a Vehicle', 'Using a vehicle without the owner’s permission but not intending to steal it.', 500, 0),
(42, 3, 'misdemeanor', 'Illegal Squatting', 'Occupying an abandoned or unoccupied property without permission.', 300, 0),
(43, 4, 'infraction', 'Speeding', 'Exceeding the posted speed limit.', 100, 0),
(44, 4, 'infraction', 'Running a Red Light', 'Failing to stop at a red traffic light.', 200, 0),
(45, 4, 'felony', 'Driving Under the Influence (DUI)', 'Operating a vehicle while under the influence of alcohol or drugs.', 1000, 12),
(46, 4, 'misdemeanor', 'Reckless Driving', 'Operating a vehicle with willful or wanton disregard for safety.', 500, 6),
(47, 4, 'misdemeanor', 'Driving Without a License', 'Operating a vehicle without a valid driver\'s license.', 250, 0),
(48, 4, 'felony', 'Hit and Run', 'Leaving the scene of an accident without providing information or assistance.', 0, 24),
(49, 4, 'infraction', 'Driving Without Insurance', 'Operating a vehicle without valid insurance coverage.', 500, 0),
(50, 4, 'infraction', 'Failure to Yield', 'Not giving the right of way when required by traffic laws.', 150, 0),
(51, 4, 'infraction', 'Illegal U-Turn', 'Making a U-turn where prohibited by traffic signs or laws.', 100, 0),
(52, 4, 'infraction', 'Driving Without Headlights', 'Operating a vehicle at night or in poor visibility without lights on.', 50, 0),
(53, 4, 'felony', 'Street Racing', 'Engaging in illegal speed contests on public roads.', 1500, 24),
(54, 4, 'infraction', 'Driving in the Wrong Direction', 'Operating a vehicle against the flow of traffic.', 200, 0),
(55, 4, 'infraction', 'Illegal Parking in Handicap Zones', 'Parking in a space designated for disabled individuals without proper permits.', 200, 0),
(56, 4, 'misdemeanor', 'Road Rage Incident', 'Driving aggressively and endangering others during a dispute.', 750, 6),
(57, 4, 'infraction', 'Unregistered Vehicle', 'Driving a vehicle without proper registration.', 150, 0),
(58, 4, 'infraction', 'Excessive Window Tinting', 'Having window tint darker than allowed by law.', 100, 0),
(59, 5, 'felony', 'Embezzlement', 'Fraudulently taking money or property from an employer.', 0, 36),
(60, 5, 'felony', 'Fraud', 'Intentionally deceiving others for financial gain.', 0, 48),
(61, 5, 'felony', 'Identity Theft', 'Using someone else\'s personal information for fraudulent purposes.', 1000, 36),
(62, 5, 'felony', 'Tax Evasion', 'Deliberately avoiding paying required taxes.', 5000, 60),
(63, 5, 'felony', 'Money Laundering', 'Processing illegal funds to make them appear legitimate.', 0, 48),
(64, 5, 'felony', 'Insider Trading', 'Using non-public information to trade stocks for financial advantage.', 0, 36),
(65, 5, 'felony', 'Forgery', 'Creating or altering documents with intent to defraud.', 0, 24),
(66, 5, 'felony', 'Cybercrime', 'Using computers to commit fraud, identity theft, or unauthorized access.', 0, 60),
(67, 5, 'felony', 'Healthcare Fraud', 'Filing false claims or manipulating healthcare billing for profit.', 0, 48),
(68, 5, 'felony', 'Ponzi Scheme', 'Fraudulent investment scam promising high returns with minimal risk.', 0, 120),
(69, 5, 'felony', 'Counterfeiting', 'Producing fake currency or documents.', 2000, 48),
(70, 5, 'felony', 'Corporate Espionage', 'Stealing trade secrets or confidential business information.', 0, 72),
(71, 6, 'felony', 'Bigamy', 'Entering into a marriage while already married to another person.', 0, 12),
(72, 6, 'felony', 'Perjury', 'Lying under oath in a legal proceeding.', 0, 24),
(73, 6, 'misdemeanor', 'Filing a False Police Report', 'Intentionally providing false information to law enforcement.', 500, 0),
(74, 6, 'misdemeanor', 'Resisting Arrest', 'Physically or verbally opposing law enforcement during an arrest.', 0, 6),
(75, 6, 'misdemeanor', 'Failure to Appear in Court', 'Not showing up for a scheduled court date without valid reason.', 500, 0),
(76, 6, 'infraction', 'Unlawful Assembly', 'Gathering in a manner that poses a threat to public safety or order.', 200, 0),
(77, 6, 'misdemeanor', 'Failure to Report a Crime', 'Not notifying authorities about a witnessed crime.', 250, 0),
(78, 6, 'misdemeanor', 'Providing False Identification', 'Presenting fake or misleading identification to authorities.', 300, 12),
(79, 7, 'misdemeanor', 'Assault', 'Intentionally causing physical harm to another person.', 0, 12),
(80, 7, 'felony', 'Robbery', 'Taking property from a person through force or intimidation.', 0, 36),
(81, 7, 'felony', 'Homicide', 'The unlawful killing of another person.', 0, 120),
(82, 7, 'felony', 'Domestic Violence', 'Physical or emotional abuse within a household or intimate relationship.', 0, 36),
(83, 7, 'felony', 'Kidnapping', 'Unlawfully seizing and detaining a person against their will.', 0, 120),
(84, 7, 'felony', 'Aggravated Assault', 'An attack causing serious bodily harm or involving a weapon.', 0, 60),
(85, 7, 'misdemeanor', 'Battery', 'Intentional physical contact or harm to another person without consent.', 0, 12),
(86, 7, 'felony', 'Terroristic Threats', 'Threatening violence to cause fear or disruption.', 0, 48),
(87, 7, 'felony', 'Vehicular Manslaughter', 'Causing a death through negligent or reckless driving.', 0, 60),
(88, 7, 'felony', 'Hate Crime', 'A crime motivated by prejudice against a person’s race, religion, or other characteristics.', 0, 48),
(89, 7, 'felony', 'Child Abuse', 'Physical, emotional, or sexual abuse of a minor.', 0, 72),
(90, 7, 'misdemeanor', 'Reckless Endangerment', 'Engaging in actions that could cause serious harm to others.', 0, 12),
(93, 7, 'misdemeanor', 'Stalking', 'Repeatedly following or harassing someone, causing fear.', 0, 12),
(94, 8, 'felony', 'Hacking', 'Gaining unauthorized access to computer systems.', 0, 36),
(95, 8, 'felony', 'Phishing', 'Using fake communication to obtain sensitive information.', 1500, 24),
(96, 8, 'misdemeanor', 'Online Harassment', 'Bullying or threatening someone via the internet.', 500, 0),
(97, 8, 'felony', 'Unauthorized Access to Computer Systems', 'Hacking into computer systems without permission.', 3000, 48),
(98, 9, 'infraction', 'Overfishing', 'Exceeding legal limits on fish catches.', 500, 0),
(99, 9, 'felony', 'Illegal Logging', 'Harvesting timber without permits.', 3000, 36),
(100, 9, 'felony', 'Endangered Species Trafficking', 'Trading animals or plants protected by conservation laws.', 0, 48),
(101, 9, 'felony', 'Illegal Mining', 'Extracting minerals or resources without proper permits.', 4000, 60),
(102, 9, 'misdemeanor', 'Illegal Dumping', 'Disposing of waste in unauthorized areas.', 750, 0),
(103, 9, 'felony', 'Poaching', 'Illegally hunting or capturing wildlife.', 4000, 36),
(104, 10, 'misdemeanor', 'Disorderly Conduct', 'Behaving in a disruptive or unruly manner in public.', 300, 0),
(105, 10, 'infraction', 'Public Intoxication', 'Being visibly drunk or impaired in public.', 150, 0),
(106, 10, 'infraction', 'Loitering', 'Remaining in an area without a legitimate purpose.', 50, 0),
(107, 10, 'infraction', 'Disturbing the Peace', 'Engaging in loud or disruptive behavior in public.', 100, 0),
(108, 10, 'felony', 'Rioting', 'Participating in a violent public disturbance.', 0, 36),
(109, 10, 'misdemeanor', 'Prostitution', 'Engaging in or soliciting sexual services for money.', 500, 0),
(110, 10, 'misdemeanor', 'Hate Speech', 'Making statements intended to incite violence or hatred against a group.', 1000, 0),
(111, 10, 'infraction', 'Unlawful Assembly', 'Gathering with others in a way that disturbs public peace.', 100, 0),
(112, 10, 'infraction', 'Illegal Protests', 'Organizing or participating in a protest without proper permits.', 100, 0),
(113, 10, 'misdemeanor', 'Indecent Exposure', 'Deliberately exposing private parts in public.', 500, 0),
(114, 10, 'felony', 'Obstructing Justice', 'Interfering with law enforcement or court proceedings.', 0, 24),
(115, 10, 'felony', 'Bribery', 'Offering or accepting something of value to influence decisions.', 5000, 36),
(117, 10, 'felony', 'Inciting a Riot', 'Encouraging or instigating a group to engage in violent behavior.', 0, 48);

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_offences_categories`
--

CREATE TABLE `lbtablet_police_offences_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_police_offences_categories`
--

INSERT INTO `lbtablet_police_offences_categories` (`id`, `title`) VALUES
(8, 'Cybercrimes'),
(1, 'Drug-Related Offences'),
(9, 'Environmental Offences'),
(6, 'Miscellaneous Crimes'),
(3, 'Property Crimes'),
(10, 'Public Order Offences'),
(4, 'Traffic Violations'),
(7, 'Violent Crimes'),
(2, 'Weapon-Related Offences'),
(5, 'White-Collar Crimes');

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_phone_unlocks`
--

CREATE TABLE `lbtablet_police_phone_unlocks` (
  `phone_number` varchar(15) NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `finished_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_profiles`
--

CREATE TABLE `lbtablet_police_profiles` (
  `id` varchar(100) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `notes` text NOT NULL DEFAULT '',
  `profile_type` varchar(50) NOT NULL DEFAULT 'player'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_profile_tags`
--

CREATE TABLE `lbtablet_police_profile_tags` (
  `id` varchar(100) NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports`
--

CREATE TABLE `lbtablet_police_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_attachments`
--

CREATE TABLE `lbtablet_police_reports_attachments` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_involved`
--

CREATE TABLE `lbtablet_police_reports_involved` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `involved` varchar(100) NOT NULL,
  `involvement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_reports_tags`
--

CREATE TABLE `lbtablet_police_reports_tags` (
  `report_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_tags`
--

CREATE TABLE `lbtablet_police_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants`
--

CREATE TABLE `lbtablet_police_warrants` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `warrant_type` varchar(100) NOT NULL,
  `warrant_status` varchar(50) NOT NULL DEFAULT 'active',
  `priority` varchar(50) NOT NULL DEFAULT 'low',
  `title` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `linked_profile_id` varchar(100) DEFAULT NULL,
  `linked_profile_type` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_attachments`
--

CREATE TABLE `lbtablet_police_warrants_attachments` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_linked_reports`
--

CREATE TABLE `lbtablet_police_warrants_linked_reports` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_warrants_tags`
--

CREATE TABLE `lbtablet_police_warrants_tags` (
  `warrant_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_weapons`
--

CREATE TABLE `lbtablet_police_weapons` (
  `serial_number` varchar(100) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `weapon_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_wiretaps`
--

CREATE TABLE `lbtablet_police_wiretaps` (
  `phone_number` varchar(15) NOT NULL,
  `creator_tablet_id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_police_wiretaps_subscribers`
--

CREATE TABLE `lbtablet_police_wiretaps_subscribers` (
  `tablet_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_characters`
--

CREATE TABLE `lbtablet_registration_characters` (
  `identifier` varchar(100) NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dateofbirth` varchar(20) NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `job` varchar(100) NOT NULL DEFAULT 'unemployed',
  `height` smallint(5) UNSIGNED NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `description` text NOT NULL DEFAULT '',
  `phone_number` varchar(20) NOT NULL DEFAULT '',
  `jail` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_licenses`
--

CREATE TABLE `lbtablet_registration_licenses` (
  `character_id` varchar(100) NOT NULL,
  `license` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_properties`
--

CREATE TABLE `lbtablet_registration_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_registration_vehicles`
--

CREATE TABLE `lbtablet_registration_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `character_id` varchar(100) NOT NULL,
  `plate` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `picture` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_tablets`
--

CREATE TABLE `lbtablet_tablets` (
  `id` varchar(100) NOT NULL,
  `tablet_name` varchar(50) NOT NULL,
  `settings` longtext DEFAULT NULL,
  `battery` tinyint(3) UNSIGNED NOT NULL DEFAULT 100,
  `is_setup` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lbtablet_tablets`
--


-- --------------------------------------------------------

--
-- Structure de la table `lbtablet_voice_memo_recordings`
--

CREATE TABLE `lbtablet_voice_memo_recordings` (
  `id` int(10) UNSIGNED NOT NULL,
  `tablet_id` varchar(100) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `leboncoin`
--

CREATE TABLE `leboncoin` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `plate` varchar(12) DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `price` longtext DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL,
  `buyed` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `leboncoin`
--


-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('avion', 'Avion License'),
('boat', 'Boat License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis Camion'),
('helico', 'Helicoptere License'),
('police', 'Badge LSPD'),
('weapon', 'Permis port d\'armes');

-- --------------------------------------------------------

--
-- Structure de la table `ls_core`
--

CREATE TABLE `ls_core` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nv_banking_data`
--

CREATE TABLE `nv_banking_data` (
  `uuid` varchar(255) NOT NULL,
  `credit_score` int(11) DEFAULT 0,
  `savings_balance` int(100) DEFAULT 0,
  `transactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`transactions`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `plate` varchar(11) DEFAULT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `open_car`
--


-- --------------------------------------------------------

--
-- Structure de la table `owned_themepark`
--

CREATE TABLE `owned_themepark` (
  `id` int(11) NOT NULL,
  `identifier` varchar(500) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(50) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `boutique` tinyint(1) DEFAULT 0,
  `selling` tinyint(1) DEFAULT 0,
  `carseller` int(11) DEFAULT 0,
  `stored` tinyint(4) NOT NULL DEFAULT 1,
  `propertyID` int(11) NOT NULL DEFAULT 0,
  `vehicletv` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `owned_vehicles`
--


-- --------------------------------------------------------

--
-- Structure de la table `pending_items`
--

CREATE TABLE `pending_items` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_label` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_backups`
--

CREATE TABLE `phone_backups` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_backups`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_clock_alarms`
--

CREATE TABLE `phone_clock_alarms` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_crypto`
--

CREATE TABLE `phone_crypto` (
  `id` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_accounts`
--

CREATE TABLE `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_channels`
--

CREATE TABLE `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_members`
--

CREATE TABLE `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_darkchat_messages`
--

CREATE TABLE `phone_darkchat_messages` (
  `id` int(11) NOT NULL,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_accounts`
--

CREATE TABLE `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  `private` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_instagram_accounts`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_comments`
--

CREATE TABLE `phone_instagram_comments` (
  `id` varchar(10) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_follows`
--

CREATE TABLE `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_follow_requests`
--

CREATE TABLE `phone_instagram_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_likes`
--

CREATE TABLE `phone_instagram_likes` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_messages`
--

CREATE TABLE `phone_instagram_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_notifications`
--

CREATE TABLE `phone_instagram_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_posts`
--

CREATE TABLE `phone_instagram_posts` (
  `id` varchar(10) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `location` varchar(50) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_stories`
--

CREATE TABLE `phone_instagram_stories` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_instagram_stories_views`
--

CREATE TABLE `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_last_phone`
--

CREATE TABLE `phone_last_phone` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_logged_in_accounts`
--

CREATE TABLE `phone_logged_in_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_logged_in_accounts`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_accounts`
--

CREATE TABLE `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_deleted`
--

CREATE TABLE `phone_mail_deleted` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_mail_messages`
--

CREATE TABLE `phone_mail_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_maps_locations`
--

CREATE TABLE `phone_maps_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_marketplace_posts`
--

CREATE TABLE `phone_marketplace_posts` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_message_channels`
--

CREATE TABLE `phone_message_channels` (
  `id` int(11) NOT NULL,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_message_members`
--

CREATE TABLE `phone_message_members` (
  `channel_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_message_messages`
--

CREATE TABLE `phone_message_messages` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_music_playlists`
--

CREATE TABLE `phone_music_playlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_music_saved_playlists`
--

CREATE TABLE `phone_music_saved_playlists` (
  `playlist_id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_music_songs`
--

CREATE TABLE `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_notes`
--

CREATE TABLE `phone_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_notifications`
--

CREATE TABLE `phone_notifications` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `custom_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phones`
--

CREATE TABLE `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT NULL,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_phones`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_blocked_numbers`
--

CREATE TABLE `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_calls`
--

CREATE TABLE `phone_phone_calls` (
  `id` int(10) UNSIGNED NOT NULL,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_contacts`
--

CREATE TABLE `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_phone_voicemail`
--

CREATE TABLE `phone_phone_voicemail` (
  `id` int(10) UNSIGNED NOT NULL,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `url` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_photos`
--

CREATE TABLE `phone_photos` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(500) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_photos`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_photo_albums`
--

CREATE TABLE `phone_photo_albums` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_photo_album_members`
--

CREATE TABLE `phone_photo_album_members` (
  `album_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_photo_album_photos`
--

CREATE TABLE `phone_photo_album_photos` (
  `album_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_services_channels`
--

CREATE TABLE `phone_services_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_services_channels`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_services_messages`
--

CREATE TABLE `phone_services_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_services_messages`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_accounts`
--

CREATE TABLE `phone_tiktok_accounts` (
  `name` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `video_count` int(11) NOT NULL DEFAULT 0,
  `twitter` varchar(20) DEFAULT NULL,
  `instagram` varchar(20) DEFAULT NULL,
  `show_likes` tinyint(1) DEFAULT 1,
  `phone_number` varchar(15) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_channels`
--

CREATE TABLE `phone_tiktok_channels` (
  `id` varchar(10) NOT NULL,
  `last_message` varchar(50) NOT NULL,
  `member_1` varchar(20) NOT NULL,
  `member_2` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_comments`
--

CREATE TABLE `phone_tiktok_comments` (
  `id` varchar(10) NOT NULL,
  `reply_to` varchar(10) DEFAULT NULL,
  `video_id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(550) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_comments_likes`
--

CREATE TABLE `phone_tiktok_comments_likes` (
  `username` varchar(20) NOT NULL,
  `comment_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_follows`
--

CREATE TABLE `phone_tiktok_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_likes`
--

CREATE TABLE `phone_tiktok_likes` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_messages`
--

CREATE TABLE `phone_tiktok_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_notifications`
--

CREATE TABLE `phone_tiktok_notifications` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  `comment_id` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_pinned_videos`
--

CREATE TABLE `phone_tiktok_pinned_videos` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_saves`
--

CREATE TABLE `phone_tiktok_saves` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_unread_messages`
--

CREATE TABLE `phone_tiktok_unread_messages` (
  `username` varchar(20) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_videos`
--

CREATE TABLE `phone_tiktok_videos` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `src` varchar(500) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `music` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `saves` int(11) NOT NULL DEFAULT 0,
  `pinned_comment` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tiktok_views`
--

CREATE TABLE `phone_tiktok_views` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_accounts`
--

CREATE TABLE `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `last_seen` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_matches`
--

CREATE TABLE `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_messages`
--

CREATE TABLE `phone_tinder_messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_tinder_swipes`
--

CREATE TABLE `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_accounts`
--

CREATE TABLE `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `profile_header` varchar(500) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `phone_twitter_accounts`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_follows`
--

CREATE TABLE `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_follow_requests`
--

CREATE TABLE `phone_twitter_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_hashtags`
--

CREATE TABLE `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_likes`
--

CREATE TABLE `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_messages`
--

CREATE TABLE `phone_twitter_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_notifications`
--

CREATE TABLE `phone_twitter_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_promoted`
--

CREATE TABLE `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_retweets`
--

CREATE TABLE `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_twitter_tweets`
--

CREATE TABLE `phone_twitter_tweets` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_voice_memos_recordings`
--

CREATE TABLE `phone_voice_memos_recordings` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_wallet_transactions`
--

CREATE TABLE `phone_wallet_transactions` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `phone_yellow_pages_posts`
--

CREATE TABLE `phone_yellow_pages_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `piwel_territoires`
--

CREATE TABLE `piwel_territoires` (
  `zone` varchar(50) NOT NULL,
  `id_crew_owner` varchar(50) DEFAULT NULL,
  `crews_points` longtext NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `piwel_territoires`
--


-- --------------------------------------------------------

--
-- Structure de la table `plaintes`
--

CREATE TABLE `plaintes` (
  `identifier` varchar(50) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Num` varchar(50) DEFAULT '',
  `Prenom1` varchar(50) DEFAULT '',
  `Nom1` varchar(50) DEFAULT '',
  `Num1` varchar(50) DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `plaintes`
--


-- --------------------------------------------------------

--
-- Structure de la table `plaintes2`
--

CREATE TABLE `plaintes2` (
  `identifier` varchar(50) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Num` varchar(50) DEFAULT '',
  `Prenom1` varchar(50) DEFAULT '',
  `Nom1` varchar(50) DEFAULT '',
  `Num1` varchar(50) DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `identifier` varchar(50) NOT NULL,
  `tattoos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `playerstattoos`
--


-- --------------------------------------------------------

--
-- Structure de la table `players_buildings`
--

CREATE TABLE `players_buildings` (
  `id` int(255) DEFAULT 0,
  `label` varchar(255) DEFAULT 'Inconnu',
  `data` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `players_warn`
--

CREATE TABLE `players_warn` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_boutique`
--

CREATE TABLE `player_boutique` (
  `identifier` varchar(50) NOT NULL,
  `credits` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_gallery`
--

CREATE TABLE `player_gallery` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_notes`
--

CREATE TABLE `player_notes` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(50) NOT NULL,
  `outfit` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `player_outfits`
--


-- --------------------------------------------------------

--
-- Structure de la table `player_uids`
--

CREATE TABLE `player_uids` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player_uids`
--


-- --------------------------------------------------------

--
-- Structure de la table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `label` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `playlists`
--

INSERT INTO `playlists` (`id`, `label`) VALUES
(90, 'rap'),
(102, '1'),
(104, 'GIMS'),
(105, 'Jul'),
(106, 'mayloo'),
(107, 'Neko'),
(108, 'Italie'),
(109, 'boite');

-- --------------------------------------------------------

--
-- Structure de la table `playlist_songs`
--

CREATE TABLE `playlist_songs` (
  `id` int(11) NOT NULL,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playtime`
--

CREATE TABLE `playtime` (
  `identifier` varchar(50) NOT NULL DEFAULT 'nil',
  `timeplayed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `playtime`
--


-- --------------------------------------------------------

--
-- Structure de la table `private_garage`
--

CREATE TABLE `private_garage` (
  `id` int(11) NOT NULL,
  `owner` longtext DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` longtext DEFAULT NULL,
  `typegarage` varchar(10) DEFAULT NULL,
  `listvehicle` longtext DEFAULT '{}',
  `typeachat` varchar(20) DEFAULT NULL,
  `achatprix` int(12) DEFAULT 1,
  `locationprix` int(12) DEFAULT 1,
  `achatchoisi` varchar(20) DEFAULT NULL,
  `raidpolice` varchar(20) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_build`
--

CREATE TABLE `properties_build` (
  `propertyID` int(11) NOT NULL,
  `propertyOwner` varchar(100) DEFAULT '-',
  `ownerName` varchar(100) DEFAULT '-',
  `propertyLabel` varchar(100) DEFAULT NULL,
  `propertyInteriors` int(11) DEFAULT NULL,
  `propertyEntering` varchar(255) DEFAULT NULL,
  `propertyGarage` varchar(255) DEFAULT NULL,
  `propertyRented` varchar(255) DEFAULT NULL,
  `garageInteriors` int(11) DEFAULT NULL,
  `data` longtext DEFAULT '{}',
  `dataMoney` longtext DEFAULT '{"cash":{"count":0},"dirtycash":{"count":0}}',
  `maxStorage` int(11) DEFAULT NULL,
  `ownerList` longtext DEFAULT '{}',
  `accessList` longtext DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `properties_vehicles`
--

CREATE TABLE `properties_vehicles` (
  `propertyID` int(11) DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `data_vehicle` longtext NOT NULL,
  `stored` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchase_history`
--

CREATE TABLE `purchase_history` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_label` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pvp_leaderboard`
--

CREATE TABLE `pvp_leaderboard` (
  `identifier` varchar(255) NOT NULL DEFAULT 'NO IDENTIFIER',
  `kills` int(11) NOT NULL DEFAULT 0,
  `death` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `race_tracks`
--

CREATE TABLE `race_tracks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapports`
--

CREATE TABLE `rapports` (
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `Montant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rapports`
--


-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `shops`
--

CREATE TABLE `shops` (
  `item` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `shops`
--

INSERT INTO `shops` (`item`, `price`) VALUES
('bread', 4),
('phone', 250),
('water', 4);

-- --------------------------------------------------------

--
-- Structure de la table `slife_gf_zones`
--

CREATE TABLE `slife_gf_zones` (
  `idtemp` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `infos` longtext DEFAULT NULL,
  `players` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `slife_gf_zones`
--


-- --------------------------------------------------------

--
-- Structure de la table `slots_inventory`
--

CREATE TABLE `slots_inventory` (
  `UniqueID` int(11) NOT NULL,
  `slots` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `societies_storage`
--

CREATE TABLE `societies_storage` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  `weapons` longtext DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  `dirty_money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `societies_storage`
--

INSERT INTO `societies_storage` (`id`, `name`, `label`, `vehicles`, `items`, `weapons`, `money`, `dirty_money`) VALUES
(1, 'black_disciples', 'Black disciples', NULL, NULL, NULL, 0, 0),
(2, 'shadow', 'shadow', NULL, NULL, NULL, 0, 0),
(3, 'mafiacornbread', 'mafiacornbread', NULL, NULL, NULL, 0, 0),
(4, 'taxi', 'Taxi', NULL, NULL, NULL, 0, 0),
(5, 'cartelarmeniens', 'cartelarmeniens', NULL, NULL, NULL, 0, 0),
(6, 'unicorn', 'Unicorn', NULL, NULL, NULL, 19999, 0),
(7, 'sasp', 'San Andreas State Police', NULL, NULL, NULL, 0, 0),
(8, 'autoexotic', 'Auto Exotic', NULL, NULL, NULL, 0, 0),
(9, 'test1', 'Teest', NULL, NULL, NULL, 0, 0),
(10, 'bahamas', 'Bahamas', NULL, NULL, NULL, 0, 0),
(11, 'lsco', 'L.S.C.O', NULL, NULL, NULL, 0, 0),
(12, 'cayo_perico', 'Cayo perico', NULL, NULL, NULL, 0, 0),
(13, 'soa', 'soa', NULL, NULL, NULL, 0, 0),
(14, 'test10', 'tEST&', NULL, NULL, NULL, 0, 0),
(15, 'santablanca', 'santablanca', NULL, NULL, NULL, 0, 0),
(16, 'Gitan', 'Gitan', NULL, NULL, NULL, 0, 0),
(17, 'testk', 'testk', NULL, NULL, NULL, 0, 0),
(18, 'boxe', 'Boxe', NULL, NULL, NULL, 0, 0),
(19, 'cartelcamaro', 'cartelcamaro', NULL, NULL, NULL, 0, 0),
(20, 'unemployed', 'Citoyen', NULL, NULL, NULL, 0, 0),
(21, 'jardinier', 'Jardinier', NULL, NULL, NULL, 0, 0),
(22, 'sahp', 'S.A.H.P', NULL, NULL, NULL, 0, 0),
(23, 'planeseller', 'Concessionnaire aéronotique', NULL, NULL, NULL, 0, 0),
(24, 'vigneron', 'Vigneron', NULL, NULL, NULL, 0, 0),
(25, 'usms', 'U.S Marshal', NULL, NULL, NULL, 0, 0),
(26, 'mafiarusse', 'mafiarusse', NULL, NULL, NULL, 0, 0),
(27, 'mafia_américaine', 'Mafia américaine', NULL, NULL, NULL, 0, 0),
(28, 'mafia_americaine', 'mafia_americaine', NULL, NULL, NULL, 0, 0),
(29, 'unemployed2', 'Aucune', NULL, NULL, NULL, 0, 0),
(30, 'cayo', 'cayo', NULL, NULL, NULL, 0, 0),
(31, 'oblack', 'O\'Black', NULL, NULL, NULL, 0, 0),
(32, 'oragricole', 'Or Agricole', NULL, NULL, NULL, 0, 0),
(33, 'fonoti', 'Fonoti', NULL, NULL, NULL, 0, 0),
(34, 'portuguesa', 'Portuguesa', NULL, NULL, NULL, 0, 0),
(35, 'mecano', 'Benny\'s', NULL, NULL, NULL, 0, 0),
(36, 'mecano2', 'Ls Custom', NULL, NULL, NULL, 0, 0),
(37, 'ballas', 'ballas', NULL, NULL, NULL, 0, 0),
(38, 'cardealer2', 'ConcesionnaireNord', NULL, NULL, NULL, 0, 0),
(39, 'brinks', 'Brinks', NULL, NULL, NULL, 0, 0),
(40, 'ambulance', 'Ambulance', NULL, NULL, NULL, 40993, 0),
(41, 'blackhands', 'blackhands', NULL, NULL, NULL, 0, 0),
(42, 'camorra', 'camorra', NULL, NULL, NULL, 0, 0),
(43, 'bloods', 'bloods', NULL, NULL, NULL, 0, 0),
(44, 'santa_blanca_(sb)', 'Santa Blanca (SB)', NULL, NULL, NULL, 0, 0),
(45, 'club77', 'Club 77', NULL, NULL, NULL, 0, 0),
(46, 'journalist', 'Journaliste', NULL, NULL, NULL, 0, 0),
(47, 'bmf', 'BMF', NULL, NULL, NULL, 0, 0),
(48, 'roxsherif', 'R.S.D', NULL, NULL, NULL, 0, 0),
(49, 'fib', 'FIB', NULL, NULL, NULL, 0, 0),
(50, 'northhood', 'northhood', NULL, NULL, NULL, 0, 0),
(51, 'famillies', 'famillies', NULL, NULL, NULL, 0, 0),
(52, 'tacos', 'Tacos', NULL, NULL, NULL, 0, 0),
(53, 'burgershot', 'BurgerShot', NULL, NULL, NULL, 49981, 0),
(54, 'studio', 'Studio', NULL, NULL, NULL, 0, 0),
(55, 'bcso', 'B.C.S.O', NULL, NULL, NULL, 0, 0),
(56, 'beanmachine', 'Bean-Machine', NULL, NULL, NULL, 0, 0),
(57, 'realestateagent', 'Agent immobilier', NULL, NULL, NULL, 0, 0),
(58, 'santa_blanca', 'Santa Blanca', NULL, NULL, NULL, 0, 0),
(59, 'white', 'White', NULL, NULL, NULL, 0, 0),
(60, 'boatseller', 'Concessionnaire Bénéteau', NULL, NULL, NULL, 0, 0),
(61, 'avocat', 'Avocat', NULL, NULL, NULL, 0, 0),
(62, 'cardealer', 'Concessionnaire', NULL, NULL, NULL, 0, 0),
(63, 'chantier', 'Chantier', NULL, NULL, NULL, 0, 0),
(64, 'gouv', 'Gouvernement', NULL, NULL, NULL, 0, 0),
(65, 'larrys', 'Larrys', NULL, NULL, NULL, 0, 0),
(66, 'marabunta', 'Marabunta', NULL, NULL, NULL, 0, 0),
(67, 'NarcosNeras', 'NarcosNeras', NULL, NULL, NULL, 0, 0),
(68, 'crips', 'Crips', NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `society_billing`
--

CREATE TABLE `society_billing` (
  `id` int(11) NOT NULL,
  `owner_identifier` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `sender_identifier` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `send_date` longtext DEFAULT NULL,
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT 0,
  `payed` tinyint(2) DEFAULT 0,
  `payed_date` longtext DEFAULT NULL,
  `refund` tinyint(2) DEFAULT 0,
  `refund_date` longtext DEFAULT NULL,
  `refund_by_identifier` varchar(255) DEFAULT NULL,
  `refund_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `storypass`
--

CREATE TABLE `storypass` (
  `identifier` varchar(100) NOT NULL,
  `palier` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tebex_accounts`
--

CREATE TABLE `tebex_accounts` (
  `steam` varchar(50) NOT NULL DEFAULT '0',
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `expiration` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tebex_accounts`
--


-- --------------------------------------------------------

--
-- Structure de la table `tebex_commands`
--

CREATE TABLE `tebex_commands` (
  `id` int(25) NOT NULL,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tebex_fidelite`
--

CREATE TABLE `tebex_fidelite` (
  `id` int(25) NOT NULL,
  `license` varchar(255) NOT NULL DEFAULT '0',
  `havebuy` int(11) NOT NULL DEFAULT 0,
  `totalbuy` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tebex_fidelite`
--


-- --------------------------------------------------------

--
-- Structure de la table `tebex_logs_commands`
--

CREATE TABLE `tebex_logs_commands` (
  `id` int(25) NOT NULL,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tebex_logs_commands`
--


-- --------------------------------------------------------

--
-- Structure de la table `tebex_players_wallet`
--

CREATE TABLE `tebex_players_wallet` (
  `identifiers` text NOT NULL,
  `transaction` text DEFAULT NULL,
  `price` text NOT NULL,
  `currency` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tebex_players_wallet`
--


-- --------------------------------------------------------

--
-- Structure de la table `tinder_accounts`
--

CREATE TABLE `tinder_accounts` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tinder_likes`
--

CREATE TABLE `tinder_likes` (
  `id` int(11) NOT NULL,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tinder_messages`
--

CREATE TABLE `tinder_messages` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `vehicleModel` int(11) NOT NULL DEFAULT 0,
  `vehiclePlate` varchar(50) NOT NULL,
  `items` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_account`
--

CREATE TABLE `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_hashtags`
--

CREATE TABLE `twitter_hashtags` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_mentions`
--

CREATE TABLE `twitter_mentions` (
  `id` int(11) NOT NULL,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(5) NOT NULL,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `character_id` int(11) NOT NULL,
  `identifier` varchar(155) NOT NULL,
  `permission_group` varchar(50) DEFAULT 'user',
  `permission_level` int(11) DEFAULT 0,
  `position` longtext DEFAULT '{"x":-774.95, "y":318.24, "z":195.86}',
  `skin` longtext DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `loadout` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `isDead` int(11) DEFAULT 0,
  `status` longtext DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dateofbirth` varchar(25) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `animations` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `coins` int(11) DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 1,
  `statuscompte` tinyint(1) DEFAULT 0,
  `viplevel` int(1) NOT NULL DEFAULT 0,
  `kills` varchar(255) DEFAULT '0',
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `adventcalendar` longtext DEFAULT '[]',
  `ammo` longtext NOT NULL DEFAULT '[]',
  `IsHurt` int(11) DEFAULT NULL,
  `idhouse` varchar(11) DEFAULT '-1',
  `idgarage` varchar(11) DEFAULT '-1',
  `wheel` datetime DEFAULT NULL,
  `in_property` tinyint(1) DEFAULT 0,
  `property_id` int(11) DEFAULT NULL,
  `in_garage` tinyint(1) DEFAULT 0,
  `uid` int(11) DEFAULT NULL,
  `account_number` varchar(10) DEFAULT NULL,
  `bank` int(11) DEFAULT 0,
  `image_url` text DEFAULT NULL,
  `code_boutique` varchar(5) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `user_licenses`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_outfits`
--

CREATE TABLE `user_outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `outfit_data` longtext NOT NULL,
  `slot` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vbank`
--

CREATE TABLE `vbank` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL DEFAULT '0',
  `history` longtext NOT NULL,
  `bankid` longtext NOT NULL,
  `Virement` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`model`, `name`, `price`, `category`) VALUES
('Dinghy', 'dinghy4', 3000000, 'boat'),
('Dynasty', 'Dynasty', 120000, 'sportsclassics'),
('Frogger', 'frogger', 13000000, 'avions'),
('Lurcher', 'Lurcher', 60000, 'muscle'),
('Novak', 'Novak', 120000, 'suvs'),
('Stryder', 'Stryder', 85000, 'motorcycles'),
('Sugoi', 'Sugoi', 1250000, 'sports'),
('Suntrap', 'suntrap', 1500000, 'boat'),
('Vigero3', 'Vigero3', 95000, 'muscle'),
('adder', 'Adder', 1400000, 'super'),
('akuma', 'Akuma', 25000, 'motorcycles'),
('aleutian', 'Aleutian', 120000, 'suvs'),
('alpha', 'Alpha', 250000, 'sports'),
('asbo', 'Asbo', 25000, 'compacts'),
('asea', 'Asea', 18000, 'sedans'),
('asea2', 'Asea2', 20000, 'sedans'),
('asterope', 'Asterope', 17000, 'sedans'),
('asterope2', 'Asterope2', 20000, 'sedans'),
('astron', 'Astron', 95000, 'suvs'),
('autarch', 'Autarch', 1950000, 'super'),
('avarus', 'Avarus', 25000, 'motorcycles'),
('bagger', 'Bagger', 15000, 'motorcycles'),
('baller', 'Baller', 85000, 'suvs'),
('baller2', 'Baller', 450000, 'suvs'),
('baller3', 'Baller Sport', 125000, 'suvs'),
('baller4', 'Baller4', 170000, 'suvs'),
('baller7', 'Baller7', 250000, 'suvs'),
('baller8', 'Baller8', 300000, 'suvs'),
('banshee', 'Banshee', 120000, 'sports'),
('banshee2', 'Banshee 900R', 255000, 'super'),
('bati', 'Bati 801', 24000, 'motorcycles'),
('bati2', 'Bati 801RR', 30000, 'motorcycles'),
('bestiagts', 'Bestia GTS', 500000, 'sports'),
('bf400', 'BF400', 50000, 'motorcycles'),
('bfinjection', 'Bf Injection', 35000, 'offroad'),
('bifta', 'Bifta', 40000, 'offroad'),
('bison', 'Bison', 85000, 'vans'),
('bison2', 'Bison2', 85000, 'vans'),
('bison3', 'Bison3', 60000, 'vans'),
('bjxl', 'Bjxl', 100000, 'suvs'),
('blade', 'Blade', 30000, 'muscle'),
('blazer', 'Blazer', 30000, 'offroad'),
('blazer2', 'Blazer2', 49000, 'offroad'),
('blazer3', 'Blazer3', 30000, 'offroad'),
('blazer4', 'Blazer Sport', 45000, 'offroad'),
('blista', 'Blista', 15000, 'compacts'),
('blista2', 'Blista2', 17000, 'sports'),
('blista3', 'Blista3', 25000, 'sports'),
('bobcatxl', 'Bobcat XL', 42000, 'vans'),
('bodhi2', 'Bodhi2', 40000, 'offroad'),
('boor', 'Boor', 25000, 'offroad'),
('boxville', 'Boxville', 45000, 'vans'),
('boxville2', 'Boxville2', 50000, 'vans'),
('boxville3', 'Boxville3', 60000, 'vans'),
('boxville4', 'Boxville4', 70000, 'vans'),
('boxville6', 'Boxville6', 80000, 'vans'),
('brawler', 'Brawler', 55000, 'offroad'),
('brigham', 'Brigham', 45000, 'muscle'),
('brioso', 'Brioso R/A', 25000, 'compacts'),
('brioso2', 'Brioso2', 17000, 'compacts'),
('brioso3', 'Brioso3', 25000, 'compacts'),
('broadway', 'Broadway', 45000, 'muscle'),
('btype', 'Btype', 75000, 'sportsclassics'),
('btype2', 'Btype Hotroad', 250000, 'sportsclassics'),
('btype3', 'Btype Luxe', 300000, 'sportsclassics'),
('buccaneer', 'Buccaneer', 60000, 'muscle'),
('buccaneer2', 'Buccaneer Rider', 40000, 'muscle'),
('buffalo', 'Buffalo', 55000, 'sports'),
('buffalo2', 'Buffalo S', 200000, 'sports'),
('buffalo3', 'Buffalo3', 175000, 'sports'),
('buffalo5', 'Buffalo5', 145000, 'muscle'),
('bullet', 'Bullet', 150000, 'super'),
('burrito', 'Burrito', 75000, 'vans'),
('burrito2', 'Burrito2', 95000, 'vans'),
('burrito3', 'Burrito3', 115000, 'vans'),
('burrito4', 'Burrito4', 130000, 'vans'),
('burrito5', 'Burrito5', 160000, 'vans'),
('calico', 'Calico', 75000, 'sports'),
('camper', 'Camper', 46000, 'vans'),
('caracara2', 'Caracara2', 500000, 'offroad'),
('carbonizzare', 'Carbonizzare', 650000, 'sports'),
('carbonrs', 'Carbon RS', 7000, 'motorcycles'),
('casco', 'Casco', 75000, 'sportsclassics'),
('cavalcade', 'Cavalcade', 25000, 'suvs'),
('cavalcade2', 'Cavalcade', 75100, 'suvs'),
('cavalcade3', 'Cavalcade3', 150000, 'suvs'),
('champion', 'Champion', 212000, 'super'),
('cheburek', 'Cheburek', 60000, 'sportsclassics'),
('cheetah', 'Cheetah', 675000, 'super'),
('cheetah2', 'Cheetah2', 1500000, 'sportsclassics'),
('chimera', 'Chimera', 25000, 'motorcycles'),
('chino', 'Chino', 25000, 'muscle'),
('chino2', 'Chino Luxe', 30000, 'muscle'),
('cinquemila', 'Cinquemila', 75000, 'sedans'),
('cliffhanger', 'Cliffhanger', 50000, 'motorcycles'),
('clique', 'Clique', 45000, 'muscle'),
('clique2', 'Clique2', 47000, 'muscle'),
('club', 'Club', 12000, 'compacts'),
('cog55', 'Cog55', 170000, 'sedans'),
('cog552', 'Cog552', 170000, 'sedans'),
('cogcabrio', 'Cognoscenti Cabrio', 165000, 'coupes'),
('cognoscenti', 'Cognoscenti', 315000, 'sedans'),
('cognoscenti2', 'Cognoscenti2', 315000, 'sedans'),
('comet2', 'Comet', 120000, 'sports'),
('comet3', 'Comet3', 95000, 'sports'),
('comet4', 'Comet4', 275000, 'sports'),
('comet5', 'Comet 5', 285000, 'sports'),
('comet6', 'Comet6', 300000, 'sports'),
('comet7', 'Comet7', 350000, 'sports'),
('contender', 'Contender', 95000, 'suvs'),
('coquette', 'Coquette', 95000, 'sports'),
('coquette2', 'Coquette Classic', 50000, 'sportsclassics'),
('coquette3', 'Coquette BlackFin', 55000, 'muscle'),
('coquette4', 'Coquette4', 60000, 'sports'),
('corsita', 'Corsita', 50000, 'sports'),
('coureur', 'Coureur', 75000, 'sports'),
('cruiser', 'Cruiser (velo)', 100, 'motorcycles'),
('cyclone', 'Cyclone', 1890000, 'super'),
('cypher', 'Cypher', 62500, 'sports'),
('daemon', 'Daemon', 11500, 'motorcycles'),
('daemon2', 'Daemon High', 13500, 'motorcycles'),
('defiler', 'Defiler', 9800, 'motorcycles'),
('deity', 'Deity', 250000, 'sedans'),
('deveste', 'Deveste', 700000, 'super'),
('deviant', 'Deviant', 700000, 'muscle'),
('diablous', 'Diablous', 15000, 'motorcycles'),
('diablous2', 'Diablous2', 30000, 'motorcycles'),
('dilettante', 'Dilettante', 25000, 'compacts'),
('dilettante2', 'Dilettante2', 30000, 'compacts'),
('dloader', 'Dloader', 200000, 'offroad'),
('dominator', 'Dominator', 50000, 'muscle'),
('dominator2', 'Dominator2', 15000, 'muscle'),
('dominator3', 'Dominator3', 30000, 'muscle'),
('dominator7', 'Dominator7', 75000, 'muscle'),
('dominator8', 'Dominator8', 45000, 'muscle'),
('dominator9', 'Dominator9', 45000, 'muscle'),
('dorado', 'Dorado', 65000, 'suvs'),
('double', 'Double T', 30000, 'motorcycles'),
('drafter', 'Drafter', 100000, 'sports'),
('draugur', 'Draugur', 150000, 'offroad'),
('drifteuros', 'Drifteuros', 25000, 'sports'),
('driftfr36', 'Driftfr36', 40000, 'coupes'),
('driftfuto', 'Driftfuto', 25000, 'sports'),
('driftjester', 'Driftjester', 100000, 'sports'),
('driftremus', 'Driftremus', 24500, 'sports'),
('drifttampa', 'Drifttampa', 475000, 'sports'),
('driftyosemite', 'Driftyosemite', 133000, 'muscle'),
('dubsta', 'Dubsta', 90000, 'suvs'),
('dubsta2', 'Dubsta Luxuary', 150000, 'suvs'),
('dubsta3', 'Bubsta 6x6', 400000, 'offroad'),
('dukes', 'Dukes', 35000, 'muscle'),
('dukes2', 'Dukes2', 45000, 'muscle'),
('dukes3', 'Dukes3', 65000, 'muscle'),
('elegy', 'Elegy', 450000, 'sports'),
('elegy2', 'Elegy', 150000, 'sports'),
('ellie', 'Ellie', 111700, 'muscle'),
('emerus', 'Emerus', 700000, 'super'),
('emperor', 'Emperor', 30000, 'sedans'),
('emperor2', 'Emperor2', 27000, 'sedans'),
('emperor3', 'Emperor3', 28000, 'sedans'),
('enduro', 'Enduro', 10000, 'motorcycles'),
('entity2', 'Entity2', 525000, 'super'),
('entity3', 'Entity3', 625000, 'super'),
('entityxf', 'Entity XF', 725000, 'super'),
('esskey', 'Esskey', 25000, 'motorcycles'),
('eudora', 'Eudora', 57600, 'muscle'),
('euros', 'Euros', 50000, 'sports'),
('everon', 'Everon', 200000, 'offroad'),
('everon2', 'Everon2', 68500, 'sports'),
('exemplar', 'Exemplar', 100000, 'coupes'),
('f620', 'F620', 87700, 'coupes'),
('faction', 'Faction', 30000, 'muscle'),
('faction2', 'Faction Rider', 40000, 'muscle'),
('faction3', 'Faction XL', 50000, 'muscle'),
('fagaloa', 'Fagaloa', 25000, 'sportsclassics'),
('faggio', 'Faggio', 1900, 'motorcycles'),
('faggio2', 'Vespa', 2700, 'motorcycles'),
('faggio3', 'Faggio3', 900, 'motorcycles'),
('fcr', 'Fcr', 4450, 'motorcycles'),
('fcr2', 'Fcr2', 12000, 'motorcycles'),
('felon', 'Felon', 75000, 'coupes'),
('felon2', 'Felon GT', 150000, 'coupes'),
('feltzer2', 'Feltzer', 150000, 'sports'),
('feltzer3', 'Stirling GT', 3650000, 'sportsclassics'),
('fixter', 'Fixter (velo)', 225, 'motorcycles'),
('flashgt', 'Flashgt', 300000, 'sports'),
('fmj', 'FMJ', 185000, 'super'),
('fq2', 'Fhantom', 17000, 'suvs'),
('fr36', 'Fr36', 34000, 'coupes'),
('freecrawler', 'Freecrawler', 240000, 'offroad'),
('fugitive', 'Fugitive', 12000, 'sedans'),
('furia', 'Furia', 450000, 'super'),
('furoregt', 'Furore GT', 200000, 'sports'),
('fusilade', 'Fusilade', 40000, 'sports'),
('futo', 'Futo', 15000, 'sports'),
('futo2', 'Futo2', 20000, 'sports'),
('gargoyle', 'Gargoyle', 16500, 'motorcycles'),
('gauntlet', 'Gauntlet', 35000, 'muscle'),
('gauntlet2', 'Gauntlet2', 50000, 'muscle'),
('gauntlet3', 'Gauntlet3', 75000, 'muscle'),
('gauntlet4', 'Gauntlet4', 85000, 'muscle'),
('gauntlet5', 'Gauntlet5', 900000, 'muscle'),
('gauntlet6', 'Gauntlet6', 327350, 'sports'),
('gb200', 'Gb200', 480000, 'sports'),
('gburrito', 'Gang Burrito', 55000, 'vans'),
('gburrito2', 'Burrito', 69000, 'vans'),
('glendale', 'Glendale', 47000, 'sedans'),
('glendale2', 'Glendale2', 10000, 'sedans'),
('gp1', 'Gp1', 350000, 'super'),
('granger', 'Grabger', 48000, 'suvs'),
('greenwood', 'Greenwood', 34500, 'muscle'),
('gresley', 'Gresley', 47500, 'suvs'),
('growler', 'Growler', 150000, 'sports'),
('gt500', 'GT 500', 985000, 'sportsclassics'),
('guardian', 'Guardian', 95000, 'offroad'),
('habanero', 'Habanero', 8500, 'suvs'),
('hakuchou', 'Hakuchou', 20310, 'motorcycles'),
('hakuchou2', 'Hakuchou Sport', 75000, 'motorcycles'),
('hellion', 'Hellion', 150000, 'offroad'),
('hermes', 'Hermes', 535000, 'muscle'),
('hexer', 'Hexer', 12000, 'motorcycles'),
('hotknife', 'Hotknife', 125000, 'muscle'),
('hotring', 'Hotring', 45000, 'sports'),
('huntley', 'Huntley S', 40000, 'suvs'),
('hustler', 'Hustler', 625000, 'muscle'),
('ignus', 'Ignus', 600000, 'super'),
('imorgon', 'Imorgon', 720000, 'sports'),
('impaler', 'Impaler', 59500, 'muscle'),
('impaler2', 'Impaler2', 69500, 'muscle'),
('impaler3', 'Impaler3', 79500, 'muscle'),
('impaler5', 'Impaler5', 99500, 'sedans'),
('impaler6', 'Impaler6', 109500, 'muscle'),
('infernus', 'Infernus', 180000, 'super'),
('infernus2', 'Infernus2', 133600, 'sportsclassics'),
('ingot', 'Ingot', 2123, 'sedans'),
('innovation', 'Innovation', 25000, 'motorcycles'),
('intruder', 'Intruder', 12000, 'sedans'),
('issi2', 'Issi', 25000, 'compacts'),
('issi3', 'Issi 3 ', 50000, 'sportsclassics'),
('issi7', 'Issi7', 95000, 'sports'),
('issi8', 'Issi8', 75000, 'suvs'),
('italigtb', 'Italigtb', 500000, 'super'),
('italigtb2', 'Italigtb2', 700000, 'super'),
('italigto', 'Italigto', 600000, 'sports'),
('italirsx', 'Italirsx', 900000, 'sports'),
('iwagen', 'Iwagen', 125000, 'suvs'),
('jackal', 'Jackal', 45000, 'coupes'),
('jb700', 'Jb700', 6500000, 'sportsclassics'),
('jb7002', 'Jb7002', 7500000, 'sportsclassics'),
('jester', 'Jester', 85000, 'sports'),
('jester2', 'Jester(Racecar)', 155000, 'sports'),
('jester3', 'Jester3', 95000, 'sports'),
('jester4', 'Jester4', 75000, 'sports'),
('journey', 'Journey', 12000, 'vans'),
('journey2', 'Journey2', 13000, 'vans'),
('jubilee', 'Jubilee', 335000, 'suvs'),
('jugular', 'Jugular', 350000, 'sports'),
('kalahari', 'Kalahari', 75000, 'offroad'),
('kamacho', 'Kamacho', 350000, 'offroad'),
('kanjo', 'Kanjo', 15000, 'compacts'),
('kanjosj', 'Kanjosj', 16000, 'coupes'),
('khamelion', 'Khamelion', 38000, 'sports'),
('komoda', 'Komoda', 400000, 'sports'),
('krieger', 'Krieger', 1000000, 'super'),
('kuruma', 'Kuruma', 350000, 'sports'),
('l35', 'L35', 30000, 'offroad'),
('landstalker', 'Landstalker', 60000, 'suvs'),
('landstalker2', 'Landstalker2', 84400, 'suvs'),
('le7b', 'RE-7B', 325000, 'super'),
('lectro', 'Lectro', 31550, 'motorcycles'),
('lm87', 'Lm87', 500000, 'super'),
('locust', 'Locust', 210000, 'sports'),
('lynx', 'Lynx', 40000, 'sports'),
('mamba', 'Mamba', 90000, 'sports'),
('manana', 'Manana', 25000, 'sportsclassics'),
('manana2', 'Manana2', 35000, 'muscle'),
('manchez', 'Manchez', 7000, 'motorcycles'),
('manchez2', 'Manchez2', 11000, 'motorcycles'),
('manchez3', 'Manchez3', 13000, 'motorcycles'),
('massacro', 'Massacro', 50000, 'sports'),
('massacro2', 'Massacro(Racecar)', 150000, 'sports'),
('mesa', 'Mesa', 40000, 'suvs'),
('mesa2', 'Mesa2', 60000, 'suvs'),
('mesa3', 'Mesa Trail', 100000, 'suvs'),
('michelli', 'Michelli', 35400, 'sportsclassics'),
('minivan', 'Minivan', 15000, 'vans'),
('minivan2', 'Minivan2', 30000, 'vans'),
('monroe', 'Monroe', 75000, 'sportsclassics'),
('monstrociti', 'Monstrociti', 40000, 'offroad'),
('moonbeam', 'Moonbeam', 18000, 'vans'),
('moonbeam2', 'Moonbeam Rider', 35000, 'vans'),
('mule', 'Mule', 500000, 'vans'),
('nebula', 'Nebula', 60000, 'sportsclassics'),
('nemesis', 'Nemesis', 10000, 'motorcycles'),
('neo', 'Neo', 955000, 'sports'),
('neon', 'Neon', 1500000, 'sports'),
('nero', 'Nero', 1500000, 'super'),
('nero2', 'Nero2', 3000000, 'super'),
('nightblade', 'Nightblade', 85000, 'motorcycles'),
('nightshade', 'Nightshade', 95000, 'muscle'),
('ninef', '9F', 250000, 'sports'),
('ninef2', '9F Cabrio', 300000, 'sports'),
('omnis', 'Omnis', 65000, 'sports'),
('omnisegt', 'Omnisegt', 50000, 'sports'),
('oracle', 'Oracle', 35000, 'coupes'),
('oracle2', 'Oracle XS', 45000, 'coupes'),
('osiris', 'Osiris', 360000, 'super'),
('outlaw', 'Outlaw', 40000, 'offroad'),
('panthere', 'Panthere', 100000, 'sports'),
('panto', 'Panto', 45000, 'compacts'),
('paradise', 'Paradise', 19000, 'vans'),
('paragon', 'Paragon', 415000, 'sports'),
('pariah', 'Pariah', 2420000, 'sports'),
('patriot', 'Patriot', 50000, 'suvs'),
('patriot2', 'Patriot2', 90000, 'suvs'),
('pcj', 'PCJ-600', 12000, 'motorcycles'),
('penetrator', 'Penetrator', 800000, 'super'),
('penumbra', 'Penumbra', 75000, 'sports'),
('penumbra2', 'Penumbra2', 45000, 'sports'),
('peyote', 'Peyote', 30000, 'sportsclassics'),
('peyote2', 'Peyote2', 45000, 'muscle'),
('peyote3', 'Peyote3', 60000, 'sportsclassics'),
('pfister811', 'Pfister', 400000, 'super'),
('phoenix', 'Phoenix', 25000, 'muscle'),
('picador', 'Picador', 30000, 'muscle'),
('pigalle', 'Pigalle', 25000, 'sportsclassics'),
('pony', 'Pony', 25000, 'vans'),
('pony2', 'Pony2', 40000, 'vans'),
('postlude', 'Postlude', 45000, 'coupes'),
('powersurge', 'Powersurge', 20000, 'motorcycles'),
('prairie', 'Prairie', 24000, 'compacts'),
('premier', 'Premier', 16000, 'sedans'),
('previon', 'Previon', 8000, 'coupes'),
('primo', 'Primo', 45000, 'sedans'),
('primo2', 'Primo Custom', 50000, 'sedans'),
('prototipo', 'X80 Proto', 3500000, 'super'),
('r300', 'R300', 50000, 'sports'),
('radi', 'Radius', 60000, 'suvs'),
('raiden', 'raiden', 2375000, 'sports'),
('rancherxl', 'Rancherxl', 40000, 'offroad'),
('rancherxl2', 'Rancherxl2', 25000, 'offroad'),
('rapidgt', 'Rapid GT', 50000, 'sports'),
('rapidgt2', 'Rapid GT Convertible', 150000, 'sports'),
('rapidgt3', 'Rapid GT3', 1285000, 'sportsclassics'),
('raptor', 'Raptor', 150000, 'sports'),
('ratel', 'Ratel', 45000, 'offroad'),
('ratloader', 'Ratloader', 25000, 'muscle'),
('ratloader2', 'Ratloader2', 40000, 'muscle'),
('reaper', 'Reaper', 350000, 'super'),
('rebel', 'Rebel', 50000, 'offroad'),
('rebel2', 'Rebel', 50000, 'offroad'),
('rebla', 'Rebla', 400000, 'suvs'),
('reever', 'Reever', 85000, 'motorcycles'),
('regina', 'Regina', 25000, 'sedans'),
('remus', 'Remus', 60000, 'sports'),
('retinue', 'Retinue', 815000, 'sportsclassics'),
('retinue2', 'Retinue2', 450000, 'sportsclassics'),
('revolter', 'Revolter', 700000, 'sports'),
('rhapsody', 'Rhapsody', 60000, 'compacts'),
('rhinehart', 'Rhinehart', 25000, 'sedans'),
('riata', 'riata', 480000, 'offroad'),
('rocoto', 'Rocoto', 50000, 'suvs'),
('romero', 'Romero', 25000, 'sedans'),
('rt3000', 'Rt3000', 80000, 'sports'),
('ruffian', 'Ruffian', 6800, 'motorcycles'),
('ruiner4', 'Ruiner4', 24000, 'muscle'),
('rumpo', 'Rumpo', 15000, 'vans'),
('rumpo2', 'Rumpo2', 45000, 'vans'),
('rumpo3', 'Rumpo Trail', 30000, 'vans'),
('ruston', 'Ruston', 80000, 'sports'),
('s80', 'S80', 650000, 'super'),
('sabregt', 'Sabre Turbo', 30000, 'muscle'),
('sabregt2', 'Sabre GT', 25000, 'muscle'),
('sanchez', 'Sanchez', 15000, 'motorcycles'),
('sanchez2', 'Sanchez Sport', 25000, 'motorcycles'),
('sanctus', 'Sanctus', 30000, 'motorcycles'),
('sandking', 'Sandking', 85000, 'offroad'),
('sandking2', 'Sandking2', 150000, 'offroad'),
('savestra', 'Savestra', 120000, 'sportsclassics'),
('sc1', 'SC 1', 2603000, 'super'),
('schafter2', 'Schafter', 200000, 'sedans'),
('schafter3', 'Schafter V12', 450000, 'sports'),
('schafter4', 'Schafter4', 250000, 'sports'),
('schlagen', 'Schlagen', 312000, 'sports'),
('schwarzer', 'Schwarzer', 76450, 'sports'),
('scorcher', 'Scorcher (velo)', 280, 'motorcycles'),
('seminole', 'Seminole', 25000, 'suvs'),
('seminole2', 'Seminole2', 84400, 'suvs'),
('sentinel', 'Sentinel', 40000, 'coupes'),
('sentinel2', 'Sentinel XS', 65000, 'coupes'),
('sentinel3', 'Sentinel3', 120000, 'sports'),
('sentinel4', 'Sentinel4', 75000, 'sports'),
('serrano', 'Serrano', 12000, 'suvs'),
('seven70', 'Seven 70', 45000, 'sports'),
('sheava', 'ETR1', 420000, 'super'),
('shinobi', 'Shinobi', 12000, 'motorcycles'),
('slamvan', 'Slamvan', 42000, 'muscle'),
('slamvan2', 'Slamvan2', 52000, 'muscle'),
('slamvan3', 'Slam Van', 25000, 'muscle'),
('sm722', 'Sm722', 75000, 'sports'),
('sovereign', 'Sovereign', 25000, 'motorcycles'),
('specter', 'Specter', 5000000, 'sports'),
('specter2', 'Specter2', 6002000, 'sports'),
('speedo', 'Speedo', 25000, 'vans'),
('speedo2', 'Speedo2', 26000, 'vans'),
('speedo5', 'Speedo5', 30000, 'vans'),
('stafford', 'Stafford', 30000, 'sedans'),
('stalion', 'Stalion', 30000, 'muscle'),
('stalion2', 'Stalion2', 27000, 'muscle'),
('stanier', 'Stanier', 12000, 'sedans'),
('stinger', 'Stinger', 150000, 'sportsclassics'),
('stingergt', 'Stinger GT', 125000, 'sportsclassics'),
('stingertt', 'Stingertt', 125000, 'sports'),
('stratum', 'Stratum', 12000, 'sedans'),
('streiter', 'Streiter', 400000, 'sports'),
('stretch', 'Stretch', 120000, 'sedans'),
('sultan', 'Sultan', 45000, 'sports'),
('sultan2', 'Sultan2', 45000, 'sports'),
('sultan3', 'Sultan3', 50000, 'sports'),
('sultanrs', 'Sultan RS', 500000, 'super'),
('superd', 'Super Diamond', 150000, 'sedans'),
('surano', 'Surano', 75000, 'sports'),
('surfer', 'Surfer', 25000, 'vans'),
('surfer2', 'Surfer2', 26000, 'vans'),
('surfer3', 'Surfer3', 27000, 'vans'),
('surge', 'Surge', 35000, 'sedans'),
('swinger', 'Swinger', 45000, 'sportsclassics'),
('t20', 'T20', 900000, 'super'),
('taco', 'Taco', 30000, 'vans'),
('tahoma', 'Tahoma', 25000, 'muscle'),
('tailgater', 'Tailgater', 35000, 'sedans'),
('tailgater2', 'Tailgater2', 35000, 'sedans'),
('taipan', 'Taipan', 2345000, 'super'),
('tampa2', 'Drift Tampa', 775000, 'sports'),
('tenf', 'Tenf', 150000, 'sports'),
('tenf2', 'Tenf2', 150000, 'sports'),
('terminus', 'Terminus', 125000, 'offroad'),
('tezeract', 'Tezeract', 500000, 'super'),
('thrax', 'Thrax', 300000, 'super'),
('thrust', 'Thrust', 26000, 'motorcycles'),
('tigon', 'Tigon', 3500000, 'super'),
('torero', 'Torero', 150000, 'sportsclassics'),
('torero2', 'Torero2', 250000, 'super'),
('tornado', 'Tornado', 5000, 'sportsclassics'),
('tornado2', 'Tornado2', 5000, 'sportsclassics'),
('tornado3', 'Tornado3', 5000, 'sportsclassics'),
('tornado4', 'Tornado4', 5000, 'sportsclassics'),
('tornado5', 'Tornado5', 5000, 'sportsclassics'),
('tornado6', 'Tornado6', 5000, 'sportsclassics'),
('toros', 'Toros', 175000, 'suvs'),
('trophytruck', 'Trophy Truck', 150000, 'offroad'),
('trophytruck2', 'Trophy Truck Limited', 300000, 'offroad'),
('tropos', 'Tropos', 40000, 'sports'),
('tulip', 'Tulip', 35000, 'muscle'),
('tulip2', 'Tulip2', 35000, 'muscle'),
('turismo2', 'Turismo2', 350000, 'sportsclassics'),
('turismo3', 'Turismo3', 350000, 'super'),
('turismor', 'Turismo R', 500000, 'super'),
('tyrant', 'Tyrant', 600000, 'super'),
('tyrus', 'Tyrus', 600000, 'super'),
('vacca', 'Vacca', 120000, 'super'),
('vader', 'Vader', 7200, 'motorcycles'),
('vagner', 'Vagner', 800000, 'super'),
('vagrant', 'Vagrant', 450000, 'offroad'),
('vamos', 'Vamos', 34500, 'muscle'),
('vectre', 'Vectre', 150000, 'sports'),
('verlierer2', 'Verlierer', 70000, 'sports'),
('verus', 'Verus', 45000, 'offroad'),
('vigero', 'Vigero', 12500, 'muscle'),
('vigero2', 'Vigero2', 12500, 'muscle'),
('vindicator', 'Vindicator', 11300, 'motorcycles'),
('virgo', 'Virgo', 14000, 'muscle'),
('virgo2', 'Virgo2', 6300, 'muscle'),
('virgo3', 'Virgo3', 6300, 'muscle'),
('virtue', 'Virtue', 85000, 'super'),
('viseris', 'Viseris', 875000, 'sportsclassics'),
('visione', 'Visione', 2250000, 'super'),
('vivanite', 'Vivanite', 121600, 'suvs'),
('voodoo', 'Voodoo', 7200, 'muscle'),
('voodoo2', 'Voodoo2', 8000, 'muscle'),
('vortex', 'Vortex', 9800, 'motorcycles'),
('vstr', 'Vstr', 110000, 'sports'),
('warrener', 'Warrener', 4000, 'sedans'),
('warrener2', 'Warrener2', 11000, 'sedans'),
('washington', 'Washington', 9000, 'sedans'),
('weevil', 'Weevil', 5000, 'compacts'),
('weevil2', 'Weevil2', 2500, 'muscle'),
('windsor', 'Windsor', 150000, 'coupes'),
('windsor2', 'Windsor Drop', 250000, 'coupes'),
('winky', 'Winky', 30000, 'offroad'),
('wolfsbane', 'Woflsbane', 9000, 'motorcycles'),
('xa21', 'Xa21', 800000, 'super'),
('xls', 'XLS', 32000, 'suvs'),
('yosemite', 'Yosemite', 485000, 'muscle'),
('yosemite2', 'Yosemite2', 133000, 'muscle'),
('yosemite3', 'Yosemite3', 200000, 'offroad'),
('youga', 'Youga', 10800, 'vans'),
('youga2', 'Youga Luxuary', 14500, 'vans'),
('youga3', 'Youga3', 14500, 'vans'),
('youga4', 'Youga4', 14500, 'vans'),
('z190', 'Z190', 900000, 'sportsclassics'),
('zeno', 'Zeno', 2250000, 'super'),
('zentorno', 'Zentorno', 1500000, 'super'),
('zion', 'Zion', 36000, 'coupes'),
('zion2', 'Zion Cabrio', 45000, 'coupes'),
('zion3', 'Zion3', 133600, 'sportsclassics'),
('zorrusso', 'Zorrusso', 200000, 'super'),
('ztype', 'Z-Type', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`, `society`) VALUES
('avions', 'Avions/Hélico', 'planeseller'),
('boat', 'Bateaux', 'boatseller'),
('compacts', 'Compacts', 'carshop'),
('coupes', 'Coupes', 'carshop'),
('motorcycles', 'Motos', 'carshop'),
('muscle', 'Muscle', 'carshop'),
('offroad', 'Off Road', 'carshop'),
('sedans', 'Sedans', 'carshop'),
('sports', 'Sports', 'carshop'),
('sportsclassics', 'Sports Classics', 'carshop'),
('super', 'Super', 'carshop'),
('suvs', 'SUVs', 'carshop'),
('vans', 'Vans', 'carshop');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vip`
--

CREATE TABLE `vip` (
  `id` int(11) NOT NULL,
  `code_boutique` varchar(10) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_accounts`
--

CREATE TABLE `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_chats`
--

CREATE TABLE `whatsapp_chats` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups`
--

CREATE TABLE `whatsapp_groups` (
  `id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups_messages`
--

CREATE TABLE `whatsapp_groups_messages` (
  `id` int(11) NOT NULL,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_groups_users`
--

CREATE TABLE `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `whatsapp_stories`
--

CREATE TABLE `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `license` (`license`);

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_account_data_account_name` (`account_name`(191)) USING BTREE,
  ADD KEY `index_addon_account_data_account_name_owner` (`account_name`(191),`owner`) USING BTREE;

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE;

--
-- Index pour la table `baninfo`
--
ALTER TABLE `baninfo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_identifier` (`identifier`),
  ADD KEY `idx_date` (`date`);

--
-- Index pour la table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`license`) USING BTREE;

--
-- Index pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_billing_identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `boutique`
--
ALTER TABLE `boutique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_boutique_type` (`code_boutique`,`type`);

--
-- Index pour la table `boutique_admins`
--
ALTER TABLE `boutique_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `boutique_history`
--
ALTER TABLE `boutique_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_boutique` (`code_boutique`);

--
-- Index pour la table `boutique_images`
--
ALTER TABLE `boutique_images`
  ADD PRIMARY KEY (`code_boutique`);

--
-- Index pour la table `boutique_purchases`
--
ALTER TABLE `boutique_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Index pour la table `boutique_scan`
--
ALTER TABLE `boutique_scan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_boutique` (`code_boutique`),
  ADD KEY `purchased` (`purchased`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `chestbuilder`
--
ALTER TABLE `chestbuilder`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `clothes_data`
--
ALTER TABLE `clothes_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clothes_inventory`
--
ALTER TABLE `clothes_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `clothes_societies`
--
ALTER TABLE `clothes_societies`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Index pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_datastore_data_name` (`name`) USING BTREE,
  ADD KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE;

--
-- Index pour la table `data_inventory`
--
ALTER TABLE `data_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- Index pour la table `disabled_weapons`
--
ALTER TABLE `disabled_weapons`
  ADD PRIMARY KEY (`identifier`,`weapon`);

--
-- Index pour la table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `elevators`
--
ALTER TABLE `elevators`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emotes_binds`
--
ALTER TABLE `emotes_binds`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emotes_fav`
--
ALTER TABLE `emotes_fav`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_identifier` (`identifier`);

--
-- Index pour la table `gang`
--
ALTER TABLE `gang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `gang2_car`
--
ALTER TABLE `gang2_car`
  ADD PRIMARY KEY (`gang_name`,`plate`);

--
-- Index pour la table `gang2_chest`
--
ALTER TABLE `gang2_chest`
  ADD PRIMARY KEY (`gang_name`,`type`,`item`);

--
-- Index pour la table `gang2_grade_permissions`
--
ALTER TABLE `gang2_grade_permissions`
  ADD PRIMARY KEY (`job_name`,`grade`);

--
-- Index pour la table `gangs2`
--
ALTER TABLE `gangs2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `gang_skin`
--
ALTER TABLE `gang_skin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gofast_cooldown`
--
ALTER TABLE `gofast_cooldown`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `id_unique`
--
ALTER TABLE `id_unique`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Index pour la table `instagram_posts`
--
ALTER TABLE `instagram_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `instagram_stories`
--
ALTER TABLE `instagram_stories`
  ADD PRIMARY KEY (`owner`) USING BTREE;

--
-- Index pour la table `inventory_4_items`
--
ALTER TABLE `inventory_4_items`
  ADD PRIMARY KEY (`uniqueID`),
  ADD KEY `type` (`type`);

--
-- Index pour la table `inventory_clothes`
--
ALTER TABLE `inventory_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `inventory_trunk`
--
ALTER TABLE `inventory_trunk`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `izey_clothes`
--
ALTER TABLE `izey_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `izey_trunk`
--
ALTER TABLE `izey_trunk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `jobs_farm`
--
ALTER TABLE `jobs_farm`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `jobs_skin`
--
ALTER TABLE `jobs_skin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `koy_afk_players`
--
ALTER TABLE `koy_afk_players`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `kq_extra`
--
ALTER TABLE `kq_extra`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_accounts`
--
ALTER TABLE `lbtablet_ambulance_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `severity` (`severity`,`category_id`,`title`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `lbtablet_ambulance_conditions_categories`
--
ALTER TABLE `lbtablet_ambulance_conditions_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Index pour la table `lbtablet_ambulance_logs`
--
ALTER TABLE `lbtablet_ambulance_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `lbtablet_ambulance_profiles`
--
ALTER TABLE `lbtablet_ambulance_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_ambulance_profile_conditions`
--
ALTER TABLE `lbtablet_ambulance_profile_conditions`
  ADD PRIMARY KEY (`profile_id`,`condition_id`),
  ADD KEY `condition_id` (`condition_id`);

--
-- Index pour la table `lbtablet_ambulance_profile_tags`
--
ALTER TABLE `lbtablet_ambulance_profile_tags`
  ADD PRIMARY KEY (`id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_ambulance_reports_attachments`
--
ALTER TABLE `lbtablet_ambulance_reports_attachments`
  ADD PRIMARY KEY (`report_id`,`attachment`);

--
-- Index pour la table `lbtablet_ambulance_reports_conditions`
--
ALTER TABLE `lbtablet_ambulance_reports_conditions`
  ADD PRIMARY KEY (`report_id`,`condition_id`),
  ADD KEY `condition_id` (`condition_id`);

--
-- Index pour la table `lbtablet_ambulance_reports_doctors`
--
ALTER TABLE `lbtablet_ambulance_reports_doctors`
  ADD PRIMARY KEY (`report_id`,`doctor`),
  ADD KEY `doctor` (`doctor`);

--
-- Index pour la table `lbtablet_ambulance_reports_tags`
--
ALTER TABLE `lbtablet_ambulance_reports_tags`
  ADD PRIMARY KEY (`report_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_ambulance_tags`
--
ALTER TABLE `lbtablet_ambulance_tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_apps_loggedin`
--
ALTER TABLE `lbtablet_apps_loggedin`
  ADD PRIMARY KEY (`tablet_id`,`app`,`account`);

--
-- Index pour la table `lbtablet_chat_rooms`
--
ALTER TABLE `lbtablet_chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_chat_rooms_members`
--
ALTER TABLE `lbtablet_chat_rooms_members`
  ADD PRIMARY KEY (`room_id`,`account`);

--
-- Index pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Index pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `lbtablet_photo_album_photos`
--
ALTER TABLE `lbtablet_photo_album_photos`
  ADD PRIMARY KEY (`album_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Index pour la table `lbtablet_police_accounts`
--
ALTER TABLE `lbtablet_police_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_cases_charges`
--
ALTER TABLE `lbtablet_police_cases_charges`
  ADD PRIMARY KEY (`case_id`,`criminal`,`offence_id`),
  ADD KEY `offence_id` (`offence_id`);

--
-- Index pour la table `lbtablet_police_cases_criminals`
--
ALTER TABLE `lbtablet_police_cases_criminals`
  ADD PRIMARY KEY (`case_id`,`id`);

--
-- Index pour la table `lbtablet_police_cases_evidence`
--
ALTER TABLE `lbtablet_police_cases_evidence`
  ADD PRIMARY KEY (`case_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_cases_involved`
--
ALTER TABLE `lbtablet_police_cases_involved`
  ADD PRIMARY KEY (`case_id`,`involved`);

--
-- Index pour la table `lbtablet_police_cases_linked_reports`
--
ALTER TABLE `lbtablet_police_cases_linked_reports`
  ADD PRIMARY KEY (`case_id`,`report_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Index pour la table `lbtablet_police_cases_tags`
--
ALTER TABLE `lbtablet_police_cases_tags`
  ADD PRIMARY KEY (`case_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `related_case` (`related_case`);

--
-- Index pour la table `lbtablet_police_logs`
--
ALTER TABLE `lbtablet_police_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`,`class`,`title`);

--
-- Index pour la table `lbtablet_police_offences_categories`
--
ALTER TABLE `lbtablet_police_offences_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Index pour la table `lbtablet_police_phone_unlocks`
--
ALTER TABLE `lbtablet_police_phone_unlocks`
  ADD PRIMARY KEY (`phone_number`);

--
-- Index pour la table `lbtablet_police_profiles`
--
ALTER TABLE `lbtablet_police_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_profile_tags`
--
ALTER TABLE `lbtablet_police_profile_tags`
  ADD PRIMARY KEY (`id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_reports_attachments`
--
ALTER TABLE `lbtablet_police_reports_attachments`
  ADD PRIMARY KEY (`report_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_reports_involved`
--
ALTER TABLE `lbtablet_police_reports_involved`
  ADD PRIMARY KEY (`report_id`,`involved`);

--
-- Index pour la table `lbtablet_police_reports_tags`
--
ALTER TABLE `lbtablet_police_reports_tags`
  ADD PRIMARY KEY (`report_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_tags`
--
ALTER TABLE `lbtablet_police_tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Index pour la table `lbtablet_police_warrants_attachments`
--
ALTER TABLE `lbtablet_police_warrants_attachments`
  ADD PRIMARY KEY (`warrant_id`,`attachment`);

--
-- Index pour la table `lbtablet_police_warrants_linked_reports`
--
ALTER TABLE `lbtablet_police_warrants_linked_reports`
  ADD PRIMARY KEY (`warrant_id`,`report_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Index pour la table `lbtablet_police_warrants_tags`
--
ALTER TABLE `lbtablet_police_warrants_tags`
  ADD PRIMARY KEY (`warrant_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Index pour la table `lbtablet_police_weapons`
--
ALTER TABLE `lbtablet_police_weapons`
  ADD PRIMARY KEY (`serial_number`);

--
-- Index pour la table `lbtablet_police_wiretaps`
--
ALTER TABLE `lbtablet_police_wiretaps`
  ADD PRIMARY KEY (`phone_number`),
  ADD KEY `creator_tablet_id` (`creator_tablet_id`);

--
-- Index pour la table `lbtablet_police_wiretaps_subscribers`
--
ALTER TABLE `lbtablet_police_wiretaps_subscribers`
  ADD PRIMARY KEY (`tablet_id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `lbtablet_registration_characters`
--
ALTER TABLE `lbtablet_registration_characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Index pour la table `lbtablet_registration_licenses`
--
ALTER TABLE `lbtablet_registration_licenses`
  ADD PRIMARY KEY (`character_id`,`license`);

--
-- Index pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `character_id` (`character_id`);

--
-- Index pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`),
  ADD KEY `character_id` (`character_id`);

--
-- Index pour la table `lbtablet_tablets`
--
ALTER TABLE `lbtablet_tablets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tablet_id` (`tablet_id`);

--
-- Index pour la table `leboncoin`
--
ALTER TABLE `leboncoin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`) USING BTREE;

--
-- Index pour la table `nv_banking_data`
--
ALTER TABLE `nv_banking_data`
  ADD PRIMARY KEY (`uuid`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_open_car_owner` (`owner`) USING BTREE,
  ADD KEY `index_open_car_owner_plate` (`owner`,`plate`) USING BTREE;

--
-- Index pour la table `owned_themepark`
--
ALTER TABLE `owned_themepark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(191));

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `pending_items`
--
ALTER TABLE `pending_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_backups`
--
ALTER TABLE `phone_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_clock_alarms`
--
ALTER TABLE `phone_clock_alarms`
  ADD PRIMARY KEY (`id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_crypto`
--
ALTER TABLE `phone_crypto`
  ADD PRIMARY KEY (`id`,`coin`);

--
-- Index pour la table `phone_darkchat_accounts`
--
ALTER TABLE `phone_darkchat_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_darkchat_channels`
--
ALTER TABLE `phone_darkchat_channels`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `phone_darkchat_members`
--
ALTER TABLE `phone_darkchat_members`
  ADD PRIMARY KEY (`channel_name`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `sender` (`sender`);

--
-- Index pour la table `phone_instagram_accounts`
--
ALTER TABLE `phone_instagram_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_instagram_comments`
--
ALTER TABLE `phone_instagram_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_follows`
--
ALTER TABLE `phone_instagram_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_instagram_follow_requests`
--
ALTER TABLE `phone_instagram_follow_requests`
  ADD PRIMARY KEY (`requester`,`requestee`),
  ADD KEY `requestee` (`requestee`);

--
-- Index pour la table `phone_instagram_likes`
--
ALTER TABLE `phone_instagram_likes`
  ADD PRIMARY KEY (`id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_messages`
--
ALTER TABLE `phone_instagram_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_instagram_notifications`
--
ALTER TABLE `phone_instagram_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`);

--
-- Index pour la table `phone_instagram_posts`
--
ALTER TABLE `phone_instagram_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_stories`
--
ALTER TABLE `phone_instagram_stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_instagram_stories_views`
--
ALTER TABLE `phone_instagram_stories_views`
  ADD PRIMARY KEY (`story_id`,`viewer`),
  ADD KEY `viewer` (`viewer`);

--
-- Index pour la table `phone_last_phone`
--
ALTER TABLE `phone_last_phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_logged_in_accounts`
--
ALTER TABLE `phone_logged_in_accounts`
  ADD PRIMARY KEY (`phone_number`,`app`,`username`);

--
-- Index pour la table `phone_mail_accounts`
--
ALTER TABLE `phone_mail_accounts`
  ADD PRIMARY KEY (`address`);

--
-- Index pour la table `phone_mail_deleted`
--
ALTER TABLE `phone_mail_deleted`
  ADD PRIMARY KEY (`message_id`,`address`),
  ADD KEY `address` (`address`);

--
-- Index pour la table `phone_mail_messages`
--
ALTER TABLE `phone_mail_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recipient` (`recipient`),
  ADD KEY `idx_sender` (`sender`);

--
-- Index pour la table `phone_maps_locations`
--
ALTER TABLE `phone_maps_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_message_channels`
--
ALTER TABLE `phone_message_channels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_message_members`
--
ALTER TABLE `phone_message_members`
  ADD PRIMARY KEY (`channel_id`,`phone_number`),
  ADD KEY `idx_members_phone_number` (`phone_number`);

--
-- Index pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_music_playlists`
--
ALTER TABLE `phone_music_playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_music_saved_playlists`
--
ALTER TABLE `phone_music_saved_playlists`
  ADD PRIMARY KEY (`playlist_id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_music_songs`
--
ALTER TABLE `phone_music_songs`
  ADD PRIMARY KEY (`song_id`,`playlist_id`),
  ADD KEY `playlist_id` (`playlist_id`);

--
-- Index pour la table `phone_notes`
--
ALTER TABLE `phone_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_phones`
--
ALTER TABLE `phone_phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `is_setup` (`is_setup`);

--
-- Index pour la table `phone_phone_blocked_numbers`
--
ALTER TABLE `phone_phone_blocked_numbers`
  ADD PRIMARY KEY (`phone_number`,`blocked_number`);

--
-- Index pour la table `phone_phone_calls`
--
ALTER TABLE `phone_phone_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_calls_missed` (`callee`,`answered`),
  ADD KEY `idx_calls_callee_id` (`callee`),
  ADD KEY `idx_calls_caller_id` (`caller`);

--
-- Index pour la table `phone_phone_contacts`
--
ALTER TABLE `phone_phone_contacts`
  ADD PRIMARY KEY (`contact_phone_number`,`phone_number`);

--
-- Index pour la table `phone_phone_voicemail`
--
ALTER TABLE `phone_phone_voicemail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_photo_album_members`
--
ALTER TABLE `phone_photo_album_members`
  ADD PRIMARY KEY (`album_id`,`phone_number`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_photo_album_photos`
--
ALTER TABLE `phone_photo_album_photos`
  ADD PRIMARY KEY (`album_id`,`photo_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Index pour la table `phone_services_channels`
--
ALTER TABLE `phone_services_channels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_services_messages`
--
ALTER TABLE `phone_services_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_tiktok_accounts`
--
ALTER TABLE `phone_tiktok_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_tiktok_channels`
--
ALTER TABLE `phone_tiktok_channels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_1` (`member_1`,`member_2`),
  ADD KEY `member_2` (`member_2`);

--
-- Index pour la table `phone_tiktok_comments`
--
ALTER TABLE `phone_tiktok_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `username` (`username`),
  ADD KEY `reply_to` (`reply_to`);

--
-- Index pour la table `phone_tiktok_comments_likes`
--
ALTER TABLE `phone_tiktok_comments_likes`
  ADD PRIMARY KEY (`username`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Index pour la table `phone_tiktok_follows`
--
ALTER TABLE `phone_tiktok_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_tiktok_likes`
--
ALTER TABLE `phone_tiktok_likes`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_messages`
--
ALTER TABLE `phone_tiktok_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `sender` (`sender`);

--
-- Index pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Index pour la table `phone_tiktok_pinned_videos`
--
ALTER TABLE `phone_tiktok_pinned_videos`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_saves`
--
ALTER TABLE `phone_tiktok_saves`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tiktok_unread_messages`
--
ALTER TABLE `phone_tiktok_unread_messages`
  ADD PRIMARY KEY (`username`,`channel_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Index pour la table `phone_tiktok_videos`
--
ALTER TABLE `phone_tiktok_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_tiktok_views`
--
ALTER TABLE `phone_tiktok_views`
  ADD PRIMARY KEY (`username`,`video_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Index pour la table `phone_tinder_accounts`
--
ALTER TABLE `phone_tinder_accounts`
  ADD PRIMARY KEY (`phone_number`);

--
-- Index pour la table `phone_tinder_matches`
--
ALTER TABLE `phone_tinder_matches`
  ADD PRIMARY KEY (`phone_number_1`,`phone_number_2`),
  ADD KEY `phone_number_2` (`phone_number_2`);

--
-- Index pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_tinder_swipes`
--
ALTER TABLE `phone_tinder_swipes`
  ADD PRIMARY KEY (`swiper`,`swipee`),
  ADD KEY `swipee` (`swipee`);

--
-- Index pour la table `phone_twitter_accounts`
--
ALTER TABLE `phone_twitter_accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_twitter_follows`
--
ALTER TABLE `phone_twitter_follows`
  ADD PRIMARY KEY (`followed`,`follower`),
  ADD KEY `follower` (`follower`);

--
-- Index pour la table `phone_twitter_follow_requests`
--
ALTER TABLE `phone_twitter_follow_requests`
  ADD PRIMARY KEY (`requester`,`requestee`),
  ADD KEY `requestee` (`requestee`);

--
-- Index pour la table `phone_twitter_hashtags`
--
ALTER TABLE `phone_twitter_hashtags`
  ADD PRIMARY KEY (`hashtag`);

--
-- Index pour la table `phone_twitter_likes`
--
ALTER TABLE `phone_twitter_likes`
  ADD PRIMARY KEY (`tweet_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_twitter_messages`
--
ALTER TABLE `phone_twitter_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`sender`),
  ADD KEY `recipient` (`recipient`);

--
-- Index pour la table `phone_twitter_notifications`
--
ALTER TABLE `phone_twitter_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `from` (`from`);

--
-- Index pour la table `phone_twitter_promoted`
--
ALTER TABLE `phone_twitter_promoted`
  ADD PRIMARY KEY (`tweet_id`);

--
-- Index pour la table `phone_twitter_retweets`
--
ALTER TABLE `phone_twitter_retweets`
  ADD PRIMARY KEY (`tweet_id`,`username`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_twitter_tweets`
--
ALTER TABLE `phone_twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Index pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_number` (`phone_number`);

--
-- Index pour la table `phone_yellow_pages_posts`
--
ALTER TABLE `phone_yellow_pages_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `piwel_territoires`
--
ALTER TABLE `piwel_territoires`
  ADD PRIMARY KEY (`zone`) USING BTREE;

--
-- Index pour la table `plaintes`
--
ALTER TABLE `plaintes`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `players_warn`
--
ALTER TABLE `players_warn`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_boutique`
--
ALTER TABLE `player_boutique`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `player_notes`
--
ALTER TABLE `player_notes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player_uids`
--
ALTER TABLE `player_uids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Index pour la table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Index pour la table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playtime`
--
ALTER TABLE `playtime`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Index pour la table `private_garage`
--
ALTER TABLE `private_garage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties_build`
--
ALTER TABLE `properties_build`
  ADD PRIMARY KEY (`propertyID`) USING BTREE;

--
-- Index pour la table `properties_vehicles`
--
ALTER TABLE `properties_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pvp_leaderboard`
--
ALTER TABLE `pvp_leaderboard`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `race_tracks`
--
ALTER TABLE `race_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`item`) USING BTREE;

--
-- Index pour la table `slife_gf_zones`
--
ALTER TABLE `slife_gf_zones`
  ADD PRIMARY KEY (`idtemp`) USING BTREE;

--
-- Index pour la table `slots_inventory`
--
ALTER TABLE `slots_inventory`
  ADD PRIMARY KEY (`UniqueID`);

--
-- Index pour la table `societies_storage`
--
ALTER TABLE `societies_storage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_billing`
--
ALTER TABLE `society_billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `storypass`
--
ALTER TABLE `storypass`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `tebex_accounts`
--
ALTER TABLE `tebex_accounts`
  ADD PRIMARY KEY (`steam`);

--
-- Index pour la table `tebex_commands`
--
ALTER TABLE `tebex_commands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tebex_fidelite`
--
ALTER TABLE `tebex_fidelite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tebex_logs_commands`
--
ALTER TABLE `tebex_logs_commands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_likes`
--
ALTER TABLE `tinder_likes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tinder_messages`
--
ALTER TABLE `tinder_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehiclePlate` (`vehiclePlate`);

--
-- Index pour la table `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`character_id`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `account_number` (`account_number`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `user_outfits`
--
ALTER TABLE `user_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Index pour la table `vbank`
--
ALTER TABLE `vbank`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_code` (`code_boutique`);

--
-- Index pour la table `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account_info`
--
ALTER TABLE `account_info`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40206;

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48522;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `baninfo`
--
ALTER TABLE `baninfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT pour la table `banlisthistory`
--
ALTER TABLE `banlisthistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6065;

--
-- AUTO_INCREMENT pour la table `boutique`
--
ALTER TABLE `boutique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT pour la table `boutique_admins`
--
ALTER TABLE `boutique_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boutique_history`
--
ALTER TABLE `boutique_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boutique_purchases`
--
ALTER TABLE `boutique_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `boutique_scan`
--
ALTER TABLE `boutique_scan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8272;

--
-- AUTO_INCREMENT pour la table `chestbuilder`
--
ALTER TABLE `chestbuilder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `clothes_data`
--
ALTER TABLE `clothes_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clothes_societies`
--
ALTER TABLE `clothes_societies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `darkchat_messages`
--
ALTER TABLE `darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29952;

--
-- AUTO_INCREMENT pour la table `data_inventory`
--
ALTER TABLE `data_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `elevators`
--
ALTER TABLE `elevators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `emotes_binds`
--
ALTER TABLE `emotes_binds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emotes_fav`
--
ALTER TABLE `emotes_fav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gang`
--
ALTER TABLE `gang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT pour la table `gangs2`
--
ALTER TABLE `gangs2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `gang_skin`
--
ALTER TABLE `gang_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT pour la table `id_unique`
--
ALTER TABLE `id_unique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `instagram_posts`
--
ALTER TABLE `instagram_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `inventory_clothes`
--
ALTER TABLE `inventory_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `izey_clothes`
--
ALTER TABLE `izey_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `jobs_farm`
--
ALTER TABLE `jobs_farm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `jobs_skin`
--
ALTER TABLE `jobs_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3295;

--
-- AUTO_INCREMENT pour la table `kq_extra`
--
ALTER TABLE `kq_extra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_conditions_categories`
--
ALTER TABLE `lbtablet_ambulance_conditions_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_logs`
--
ALTER TABLE `lbtablet_ambulance_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_ambulance_tags`
--
ALTER TABLE `lbtablet_ambulance_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_chat_rooms`
--
ALTER TABLE `lbtablet_chat_rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_logs`
--
ALTER TABLE `lbtablet_police_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_offences_categories`
--
ALTER TABLE `lbtablet_police_offences_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_tags`
--
ALTER TABLE `lbtablet_police_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `leboncoin`
--
ALTER TABLE `leboncoin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `owned_themepark`
--
ALTER TABLE `owned_themepark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pending_items`
--
ALTER TABLE `pending_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_clock_alarms`
--
ALTER TABLE `phone_clock_alarms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_mail_messages`
--
ALTER TABLE `phone_mail_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_maps_locations`
--
ALTER TABLE `phone_maps_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_message_channels`
--
ALTER TABLE `phone_message_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_music_playlists`
--
ALTER TABLE `phone_music_playlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_notes`
--
ALTER TABLE `phone_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `phone_phone_calls`
--
ALTER TABLE `phone_phone_calls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_phone_voicemail`
--
ALTER TABLE `phone_phone_voicemail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_services_channels`
--
ALTER TABLE `phone_services_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `phone_services_messages`
--
ALTER TABLE `phone_services_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phone_yellow_pages_posts`
--
ALTER TABLE `phone_yellow_pages_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `players_warn`
--
ALTER TABLE `players_warn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `player_gallery`
--
ALTER TABLE `player_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `player_notes`
--
ALTER TABLE `player_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `player_uids`
--
ALTER TABLE `player_uids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `playlist_songs`
--
ALTER TABLE `playlist_songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `private_garage`
--
ALTER TABLE `private_garage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `properties_build`
--
ALTER TABLE `properties_build`
  MODIFY `propertyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `race_tracks`
--
ALTER TABLE `race_tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `slife_gf_zones`
--
ALTER TABLE `slife_gf_zones`
  MODIFY `idtemp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `societies_storage`
--
ALTER TABLE `societies_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `society_billing`
--
ALTER TABLE `society_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5805;

--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tebex_commands`
--
ALTER TABLE `tebex_commands`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT pour la table `tebex_fidelite`
--
ALTER TABLE `tebex_fidelite`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `tebex_logs_commands`
--
ALTER TABLE `tebex_logs_commands`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `tinder_accounts`
--
ALTER TABLE `tinder_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `tinder_likes`
--
ALTER TABLE `tinder_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tinder_messages`
--
ALTER TABLE `tinder_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `twitter_hashtags`
--
ALTER TABLE `twitter_hashtags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `twitter_mentions`
--
ALTER TABLE `twitter_mentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_outfits`
--
ALTER TABLE `user_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vbank`
--
ALTER TABLE `vbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vip`
--
ALTER TABLE `vip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `whatsapp_chats`
--
ALTER TABLE `whatsapp_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `whatsapp_groups`
--
ALTER TABLE `whatsapp_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `whatsapp_groups_messages`
--
ALTER TABLE `whatsapp_groups_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lbtablet_ambulance_bulletin`
--
ALTER TABLE `lbtablet_ambulance_bulletin`
  ADD CONSTRAINT `lbtablet_ambulance_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_conditions`
--
ALTER TABLE `lbtablet_ambulance_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_conditions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_ambulance_conditions_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_profile_conditions`
--
ALTER TABLE `lbtablet_ambulance_profile_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `lbtablet_ambulance_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_profile_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_profile_tags`
--
ALTER TABLE `lbtablet_ambulance_profile_tags`
  ADD CONSTRAINT `lbtablet_ambulance_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports`
--
ALTER TABLE `lbtablet_ambulance_reports`
  ADD CONSTRAINT `lbtablet_ambulance_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_attachments`
--
ALTER TABLE `lbtablet_ambulance_reports_attachments`
  ADD CONSTRAINT `lbtablet_ambulance_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_conditions`
--
ALTER TABLE `lbtablet_ambulance_reports_conditions`
  ADD CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_conditions_ibfk_2` FOREIGN KEY (`condition_id`) REFERENCES `lbtablet_ambulance_conditions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_doctors`
--
ALTER TABLE `lbtablet_ambulance_reports_doctors`
  ADD CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_doctors_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `lbtablet_ambulance_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_ambulance_reports_tags`
--
ALTER TABLE `lbtablet_ambulance_reports_tags`
  ADD CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_ambulance_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_ambulance_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_ambulance_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_apps_loggedin`
--
ALTER TABLE `lbtablet_apps_loggedin`
  ADD CONSTRAINT `lbtablet_apps_loggedin_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_chat_rooms_members`
--
ALTER TABLE `lbtablet_chat_rooms_members`
  ADD CONSTRAINT `lbtablet_chat_rooms_members_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_chat_rooms_messages`
--
ALTER TABLE `lbtablet_chat_rooms_messages`
  ADD CONSTRAINT `lbtablet_chat_rooms_messages_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `lbtablet_chat_rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_clock_alarms`
--
ALTER TABLE `lbtablet_clock_alarms`
  ADD CONSTRAINT `lbtablet_clock_alarms_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_notes`
--
ALTER TABLE `lbtablet_notes`
  ADD CONSTRAINT `lbtablet_notes_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_notifications`
--
ALTER TABLE `lbtablet_notifications`
  ADD CONSTRAINT `lbtablet_notifications_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photos`
--
ALTER TABLE `lbtablet_photos`
  ADD CONSTRAINT `lbtablet_photos_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photo_albums`
--
ALTER TABLE `lbtablet_photo_albums`
  ADD CONSTRAINT `lbtablet_photo_albums_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_photo_album_photos`
--
ALTER TABLE `lbtablet_photo_album_photos`
  ADD CONSTRAINT `lbtablet_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `lbtablet_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `lbtablet_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_bulletin`
--
ALTER TABLE `lbtablet_police_bulletin`
  ADD CONSTRAINT `lbtablet_police_bulletin_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases`
--
ALTER TABLE `lbtablet_police_cases`
  ADD CONSTRAINT `lbtablet_police_cases_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_charges`
--
ALTER TABLE `lbtablet_police_cases_charges`
  ADD CONSTRAINT `lbtablet_police_cases_charges_ibfk_1` FOREIGN KEY (`case_id`,`criminal`) REFERENCES `lbtablet_police_cases_criminals` (`case_id`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_cases_charges_ibfk_2` FOREIGN KEY (`offence_id`) REFERENCES `lbtablet_police_offences` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_criminals`
--
ALTER TABLE `lbtablet_police_cases_criminals`
  ADD CONSTRAINT `lbtablet_police_cases_criminals_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_evidence`
--
ALTER TABLE `lbtablet_police_cases_evidence`
  ADD CONSTRAINT `lbtablet_police_cases_evidence_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_involved`
--
ALTER TABLE `lbtablet_police_cases_involved`
  ADD CONSTRAINT `lbtablet_police_cases_involved_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_linked_reports`
--
ALTER TABLE `lbtablet_police_cases_linked_reports`
  ADD CONSTRAINT `lbtablet_police_cases_linked_reports_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_cases_linked_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_cases_tags`
--
ALTER TABLE `lbtablet_police_cases_tags`
  ADD CONSTRAINT `lbtablet_police_cases_tags_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_cases_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_jail`
--
ALTER TABLE `lbtablet_police_jail`
  ADD CONSTRAINT `lbtablet_police_jail_ibfk_1` FOREIGN KEY (`related_case`) REFERENCES `lbtablet_police_cases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_offences`
--
ALTER TABLE `lbtablet_police_offences`
  ADD CONSTRAINT `lbtablet_police_offences_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `lbtablet_police_offences_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_profile_tags`
--
ALTER TABLE `lbtablet_police_profile_tags`
  ADD CONSTRAINT `lbtablet_police_profile_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports`
--
ALTER TABLE `lbtablet_police_reports`
  ADD CONSTRAINT `lbtablet_police_reports_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_attachments`
--
ALTER TABLE `lbtablet_police_reports_attachments`
  ADD CONSTRAINT `lbtablet_police_reports_attachments_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_involved`
--
ALTER TABLE `lbtablet_police_reports_involved`
  ADD CONSTRAINT `lbtablet_police_reports_involved_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_reports_tags`
--
ALTER TABLE `lbtablet_police_reports_tags`
  ADD CONSTRAINT `lbtablet_police_reports_tags_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_reports_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants`
--
ALTER TABLE `lbtablet_police_warrants`
  ADD CONSTRAINT `lbtablet_police_warrants_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `lbtablet_police_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_attachments`
--
ALTER TABLE `lbtablet_police_warrants_attachments`
  ADD CONSTRAINT `lbtablet_police_warrants_attachments_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_linked_reports`
--
ALTER TABLE `lbtablet_police_warrants_linked_reports`
  ADD CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_warrants_linked_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `lbtablet_police_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_warrants_tags`
--
ALTER TABLE `lbtablet_police_warrants_tags`
  ADD CONSTRAINT `lbtablet_police_warrants_tags_ibfk_1` FOREIGN KEY (`warrant_id`) REFERENCES `lbtablet_police_warrants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_warrants_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `lbtablet_police_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_wiretaps`
--
ALTER TABLE `lbtablet_police_wiretaps`
  ADD CONSTRAINT `lbtablet_police_wiretaps_ibfk_1` FOREIGN KEY (`creator_tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_police_wiretaps_subscribers`
--
ALTER TABLE `lbtablet_police_wiretaps_subscribers`
  ADD CONSTRAINT `lbtablet_police_wiretaps_subscribers_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lbtablet_police_wiretaps_subscribers_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `lbtablet_police_wiretaps` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lbtablet_registration_licenses`
--
ALTER TABLE `lbtablet_registration_licenses`
  ADD CONSTRAINT `lbtablet_registration_licenses_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lbtablet_registration_properties`
--
ALTER TABLE `lbtablet_registration_properties`
  ADD CONSTRAINT `lbtablet_registration_properties_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lbtablet_registration_vehicles`
--
ALTER TABLE `lbtablet_registration_vehicles`
  ADD CONSTRAINT `lbtablet_registration_vehicles_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `lbtablet_registration_characters` (`character_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lbtablet_voice_memo_recordings`
--
ALTER TABLE `lbtablet_voice_memo_recordings`
  ADD CONSTRAINT `lbtablet_voice_memo_recordings_ibfk_1` FOREIGN KEY (`tablet_id`) REFERENCES `lbtablet_tablets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_backups`
--
ALTER TABLE `phone_backups`
  ADD CONSTRAINT `phone_backups_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_clock_alarms`
--
ALTER TABLE `phone_clock_alarms`
  ADD CONSTRAINT `phone_clock_alarms_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_accounts`
--
ALTER TABLE `phone_darkchat_accounts`
  ADD CONSTRAINT `phone_darkchat_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_members`
--
ALTER TABLE `phone_darkchat_members`
  ADD CONSTRAINT `phone_darkchat_members_ibfk_1` FOREIGN KEY (`channel_name`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_darkchat_members_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_darkchat_messages`
--
ALTER TABLE `phone_darkchat_messages`
  ADD CONSTRAINT `phone_darkchat_messages_ibfk_1` FOREIGN KEY (`channel`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_darkchat_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_accounts`
--
ALTER TABLE `phone_instagram_accounts`
  ADD CONSTRAINT `phone_instagram_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_comments`
--
ALTER TABLE `phone_instagram_comments`
  ADD CONSTRAINT `phone_instagram_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `phone_instagram_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_instagram_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_follows`
--
ALTER TABLE `phone_instagram_follows`
  ADD CONSTRAINT `phone_instagram_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_follow_requests`
--
ALTER TABLE `phone_instagram_follow_requests`
  ADD CONSTRAINT `phone_instagram_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_likes`
--
ALTER TABLE `phone_instagram_likes`
  ADD CONSTRAINT `phone_instagram_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_messages`
--
ALTER TABLE `phone_instagram_messages`
  ADD CONSTRAINT `phone_instagram_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_notifications`
--
ALTER TABLE `phone_instagram_notifications`
  ADD CONSTRAINT `phone_instagram_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_instagram_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_posts`
--
ALTER TABLE `phone_instagram_posts`
  ADD CONSTRAINT `phone_instagram_posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_stories`
--
ALTER TABLE `phone_instagram_stories`
  ADD CONSTRAINT `phone_instagram_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_instagram_stories_views`
--
ALTER TABLE `phone_instagram_stories_views`
  ADD CONSTRAINT `phone_instagram_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_instagram_stories_views_ibfk_2` FOREIGN KEY (`viewer`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_last_phone`
--
ALTER TABLE `phone_last_phone`
  ADD CONSTRAINT `phone_last_phone_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_logged_in_accounts`
--
ALTER TABLE `phone_logged_in_accounts`
  ADD CONSTRAINT `phone_logged_in_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_mail_deleted`
--
ALTER TABLE `phone_mail_deleted`
  ADD CONSTRAINT `phone_mail_deleted_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `phone_mail_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_mail_deleted_ibfk_2` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_maps_locations`
--
ALTER TABLE `phone_maps_locations`
  ADD CONSTRAINT `phone_maps_locations_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_marketplace_posts`
--
ALTER TABLE `phone_marketplace_posts`
  ADD CONSTRAINT `phone_marketplace_posts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_message_members`
--
ALTER TABLE `phone_message_members`
  ADD CONSTRAINT `phone_message_members_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_message_messages`
--
ALTER TABLE `phone_message_messages`
  ADD CONSTRAINT `phone_message_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_playlists`
--
ALTER TABLE `phone_music_playlists`
  ADD CONSTRAINT `phone_music_playlists_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_saved_playlists`
--
ALTER TABLE `phone_music_saved_playlists`
  ADD CONSTRAINT `phone_music_saved_playlists_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_music_saved_playlists_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_music_songs`
--
ALTER TABLE `phone_music_songs`
  ADD CONSTRAINT `phone_music_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_notes`
--
ALTER TABLE `phone_notes`
  ADD CONSTRAINT `phone_notes_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_notifications`
--
ALTER TABLE `phone_notifications`
  ADD CONSTRAINT `phone_notifications_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photos`
--
ALTER TABLE `phone_photos`
  ADD CONSTRAINT `phone_photos_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photo_albums`
--
ALTER TABLE `phone_photo_albums`
  ADD CONSTRAINT `phone_photo_albums_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photo_album_members`
--
ALTER TABLE `phone_photo_album_members`
  ADD CONSTRAINT `phone_photo_album_members_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_photo_album_members_ibfk_2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_photo_album_photos`
--
ALTER TABLE `phone_photo_album_photos`
  ADD CONSTRAINT `phone_photo_album_photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_photo_album_photos_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_services_messages`
--
ALTER TABLE `phone_services_messages`
  ADD CONSTRAINT `phone_services_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_accounts`
--
ALTER TABLE `phone_tiktok_accounts`
  ADD CONSTRAINT `phone_tiktok_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_channels`
--
ALTER TABLE `phone_tiktok_channels`
  ADD CONSTRAINT `phone_tiktok_channels_ibfk_1` FOREIGN KEY (`member_1`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_channels_ibfk_2` FOREIGN KEY (`member_2`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_comments`
--
ALTER TABLE `phone_tiktok_comments`
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_ibfk_3` FOREIGN KEY (`reply_to`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_comments_likes`
--
ALTER TABLE `phone_tiktok_comments_likes`
  ADD CONSTRAINT `phone_tiktok_comments_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_comments_likes_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_follows`
--
ALTER TABLE `phone_tiktok_follows`
  ADD CONSTRAINT `phone_tiktok_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_likes`
--
ALTER TABLE `phone_tiktok_likes`
  ADD CONSTRAINT `phone_tiktok_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_messages`
--
ALTER TABLE `phone_tiktok_messages`
  ADD CONSTRAINT `phone_tiktok_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_notifications`
--
ALTER TABLE `phone_tiktok_notifications`
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_3` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_pinned_videos`
--
ALTER TABLE `phone_tiktok_pinned_videos`
  ADD CONSTRAINT `phone_tiktok_pinned_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_pinned_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_saves`
--
ALTER TABLE `phone_tiktok_saves`
  ADD CONSTRAINT `phone_tiktok_saves_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_saves_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_unread_messages`
--
ALTER TABLE `phone_tiktok_unread_messages`
  ADD CONSTRAINT `phone_tiktok_unread_messages_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_unread_messages_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_videos`
--
ALTER TABLE `phone_tiktok_videos`
  ADD CONSTRAINT `phone_tiktok_videos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tiktok_views`
--
ALTER TABLE `phone_tiktok_views`
  ADD CONSTRAINT `phone_tiktok_views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tiktok_views_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_accounts`
--
ALTER TABLE `phone_tinder_accounts`
  ADD CONSTRAINT `phone_tinder_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_matches`
--
ALTER TABLE `phone_tinder_matches`
  ADD CONSTRAINT `phone_tinder_matches_ibfk_1` FOREIGN KEY (`phone_number_1`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_matches_ibfk_2` FOREIGN KEY (`phone_number_2`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_messages`
--
ALTER TABLE `phone_tinder_messages`
  ADD CONSTRAINT `phone_tinder_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_tinder_swipes`
--
ALTER TABLE `phone_tinder_swipes`
  ADD CONSTRAINT `phone_tinder_swipes_ibfk_1` FOREIGN KEY (`swiper`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_tinder_swipes_ibfk_2` FOREIGN KEY (`swipee`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_accounts`
--
ALTER TABLE `phone_twitter_accounts`
  ADD CONSTRAINT `phone_twitter_accounts_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_follows`
--
ALTER TABLE `phone_twitter_follows`
  ADD CONSTRAINT `phone_twitter_follows_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_follows_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_follow_requests`
--
ALTER TABLE `phone_twitter_follow_requests`
  ADD CONSTRAINT `phone_twitter_follow_requests_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_follow_requests_ibfk_2` FOREIGN KEY (`requestee`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_likes`
--
ALTER TABLE `phone_twitter_likes`
  ADD CONSTRAINT `phone_twitter_likes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_messages`
--
ALTER TABLE `phone_twitter_messages`
  ADD CONSTRAINT `phone_twitter_messages_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_messages_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_notifications`
--
ALTER TABLE `phone_twitter_notifications`
  ADD CONSTRAINT `phone_twitter_notifications_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_twitter_notifications_ibfk_2` FOREIGN KEY (`from`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_promoted`
--
ALTER TABLE `phone_twitter_promoted`
  ADD CONSTRAINT `phone_twitter_promoted_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `phone_twitter_retweets`
--
ALTER TABLE `phone_twitter_retweets`
  ADD CONSTRAINT `phone_twitter_retweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_twitter_tweets`
--
ALTER TABLE `phone_twitter_tweets`
  ADD CONSTRAINT `phone_twitter_tweets_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_voice_memos_recordings`
--
ALTER TABLE `phone_voice_memos_recordings`
  ADD CONSTRAINT `phone_voice_memos_recordings_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `phone_wallet_transactions`
--
ALTER TABLE `phone_wallet_transactions`
  ADD CONSTRAINT `phone_wallet_transactions_ibfk_1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

-- --------------------------------------------------------
-- Tables ajoutées lors de l'audit sécurité (session 00h) : référencées par le
-- code Lua mais absentes du dump initial. Schémas déduits des requêtes existantes.
-- --------------------------------------------------------

--
-- Structure de la table `gangs`
-- Utilisée par : resources/[Core]/Gamemode/gameManager/modules/server/personal/sv_main.lua (getGangsAccount)
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `label` varchar(128) NOT NULL,
  `coords` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Structure de la table `elevator_floors`
-- Utilisée par : resources/[Shyroz]/[Script]/kay_elevator/server/sv_elevator.lua
--

CREATE TABLE IF NOT EXISTS `elevator_floors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elevator_id` int(11) NOT NULL,
  `floor_name` varchar(255) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `elevator_id` (`elevator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =====================================================================
-- Tables référencées par le code Lua mais absentes du dump initial
-- (ajoutées par l'audit — schémas dérivés des requêtes INSERT/SELECT)
-- =====================================================================

--
-- Table `Koy_afk_players`
-- Réf : Core/src/server/afk/main.lua (INSERT UniqueID, time, points, inZone, skin, playerName)
--
CREATE TABLE IF NOT EXISTS `Koy_afk_players` (
  `UniqueID` int(11) NOT NULL,
  `time` longtext DEFAULT NULL,
  `points` longtext DEFAULT NULL,
  `inZone` tinyint(1) NOT NULL DEFAULT 0,
  `skin` longtext DEFAULT NULL,
  `playerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UniqueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table `KoyCase_codes`
-- Réf : [GameMode]/MysteryCase/server/main.lua (INSERT code, creditCount)
--
CREATE TABLE IF NOT EXISTS `KoyCase_codes` (
  `code` varchar(255) NOT NULL,
  `creditCount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table `eInvest`
-- Réf : Kays/game/afk/server/server.lua (INSERT license, time, type)
--
CREATE TABLE IF NOT EXISTS `eInvest` (
  `license` varchar(60) NOT NULL,
  `time` longtext DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
