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

INSERT INTO `account_info` (`account_id`, `license`, `steam`, `xbl`, `discord`, `live`, `shopgift`, `fivem`, `name`, `ip`, `guid`, `first_connection`) VALUES
(40166, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'steam:11000015b92ae1b', 'xbl:2535451769415070', '', 'live:1055519757629289', 0, '', '5129 3929 1920 2019 3910', '26.106.232.214', '148618792003094509', '2025-04-27 22:51:55'),
(40167, 'license:889f0d96d7e5b365c6921a856b44258bb17c0868', 'steam:1100001431387cd', '', 'discord:1321901468504035380', '', 1, 'fivem:1159227', 'Mister', '26.108.78.218', '148618792014132758', '2025-04-27 23:56:12'),
(40168, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'steam:1100001703f92b2', 'xbl:2535428279336930', 'discord:980532233943261274', 'live:985155475126644', 1, 'fivem:9141304', 'Eva.lpq', '51.210.126.15', '148618792341387883', '2025-08-30 13:02:30'),
(40169, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'steam:110000168ce3765', '', 'discord:749258273449836677', '', 1, '', '13Tpc', '176.133.204.6', '148618792025798040', '2025-08-31 20:55:38'),
(40170, 'license:f7691c3c253b9ba4571deb872fbb4378a548dd22', 'steam:11000010f2bee67', 'xbl:2533274852608105', 'discord:722072847828385832', 'live:1829581090713358', 0, 'fivem:16129274', 'H || Teyko || CDT || 11 || Juan Hernandez', '92.91.130.85', '148618792339046201', '2025-09-01 14:14:38'),
(40171, 'license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', 'steam:1100001551ab872', 'xbl:2535456444018481', 'discord:518364636190343179', 'live:985154918007056', 1, '', 'meetballseater', '153.94.16.91', '148618792012104993', '2025-09-09 12:13:33'),
(40177, 'license:44cd1ef37b4fda00d53702007fb2c5cec6356919', '', 'xbl:2535462579062807', 'discord:898673240254328853', 'live:914801468312569', 1, 'fivem:8110601', 'Neo', '31.33.226.19', '148618792009385258', '2025-09-11 19:50:43'),
(40172, 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'steam:110000149577c8a', '', 'discord:1292474364960313406', '', 1, 'fivem:13351934', 'SBMD', '94.107.164.85', '148618792048559805', '2025-09-09 16:06:07'),
(40178, 'license:c4a0eb2bf2fe32c0f616b4b18e075a9c181717d9', '', 'xbl:2535451806471494', 'discord:1122138705956712468', 'live:1055519728333451', 0, '', 'petit', '82.122.132.84', '148618791998542368', '2025-09-12 16:34:06'),
(40173, 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', '', 'xbl:2535425079411194', 'discord:810116130915090443', 'live:1055519063570527', 1, 'fivem:7924653', 'SayonSoon', '86.244.4.140', '148618791998278790', '2025-09-09 16:36:01'),
(40174, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'steam:110000149b59db1', 'xbl:2535469584096718', 'discord:873493653975334973', 'live:844426020416766', 1, 'fivem:15010377', 'R I C H Y ', '89.84.160.107', '148618791998270555', '2025-09-10 14:28:27'),
(40175, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 'steam:11000015dfeaf23', '', 'discord:1100896231510790195', '', 0, '', 'Rss4', '91.165.126.205', '148618792358683180', '2025-09-10 19:15:32'),
(40176, 'license:c25cd13ce096742893d9d010335e7e148877d361', '', '', 'discord:423226260735524865', '', 0, 'fivem:9745193', '[M] Razmo2.7', '91.171.170.223', '148618792016302274', '2025-09-10 21:34:12'),
(40179, 'license:85e8937833a05423627d78865cb0da6ab013652b', 'steam:1100001682983c4', '', 'discord:1399066877195714592', '', 1, 'fivem:17526033', 'BacKey', '37.67.100.177', '148618793056330806', '2025-09-12 18:19:44'),
(40180, 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'steam:1100001718399bb', '', 'discord:1025770976111243345', '', 1, 'fivem:17049513', 'Hivann', '31.39.170.43', '148618792013904196', '2025-09-12 18:30:43'),
(40181, 'license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', 'steam:11000011a69fe96', 'xbl:2535430905460164', 'discord:819672516733173780', 'live:985158097052482', 1, 'fivem:8705535', 'Chinois', '109.9.87.130', '148618792138259055', '2025-09-12 18:32:17'),
(40182, 'license:88afb341c54c6ed2006bd7be158667299b00d341', 'steam:110000155e26122', 'xbl:2535471213286282', 'discord:418004010478338048', 'live:1055522568579778', 1, 'fivem:9737729', 'SPECMOIT\'AIMELESHOMMES', '92.138.39.70', '148618792107284211', '2025-09-12 18:34:14'),
(40183, '', '', '', '', '', 0, '', NULL, NULL, NULL, '2025-09-12 18:46:31'),
(40184, 'license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', 'steam:11000015862bcd3', 'xbl:2535467344193100', 'discord:1018137605180772352', 'live:985154517884558', 1, 'fivem:10403284', 'Diamonds', '91.168.23.142', '148618792007953415', '2025-09-12 18:53:28'),
(40185, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 'steam:110000164fffe1a', '', 'discord:1355469418909536426', '', 1, 'fivem:17406911', 'Tim', '88.183.241.156', '148618792031144383', '2025-09-12 19:22:32'),
(40190, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', 'steam:110000172752a7c', 'xbl:2535417480104789', 'discord:1166523819872235544', 'live:844431724456027', 1, 'fivem:8328191', 'Rimoo', '90.76.170.14', '148618791999750633', '2025-09-13 03:56:28'),
(40186, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', '', 'xbl:2535429938588939', 'discord:593849034842832897', 'live:1055519467626155', 1, 'fivem:14480406', 'WASK', '83.192.13.123', '148618792005470852', '2025-09-12 19:29:00'),
(40187, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', '', '', 'discord:853762504056635423', '', 1, 'fivem:12639573', 'Utilisateur', '90.79.99.165', '148618792035769227', '2025-09-12 20:08:39'),
(40191, 'license:effa1ffd386df938a94332c73611cf8003bdbf36', '', '', 'discord:835091428610146306', '', 1, 'fivem:9904507', '\'mamad', '88.174.129.205', '148618791999149180', '2025-09-13 10:17:49'),
(40188, 'license:5702e6e4c5207718991892da312aca4d700333b3', 'steam:11000016e512e8f', '', 'discord:1329202937250975834', '', 0, 'fivem:16485159', 'inesla92iii', '88.186.22.205', '148618792016994071', '2025-09-12 20:24:03'),
(40189, 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f', '', '', '', '', 0, '', 'JteRushEnQuamis', '86.221.93.65', '148618792001670836', '2025-09-12 21:19:33'),
(40192, 'license:bd7372e5293d8536f66d64ef9ba5056eff7993a5', 'steam:11000015a184342', 'xbl:2535465229109027', 'discord:744533231633956895', 'live:1055519149294178', 0, 'fivem:9949995', 'Ne3Ne3', '88.177.133.3', '148618792010818930', '2025-09-13 12:06:12'),
(40193, 'license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', '', '', '', '', 0, '', 'kjhjk', '82.66.123.209', '148618792050986758', '2025-09-13 13:29:59'),
(40194, 'license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', 'steam:110000117886052', '', 'discord:516241634833334325', '', 1, 'fivem:1137998', '20h', '88.139.217.250', '148618792001887836', '2025-09-13 14:37:00'),
(40195, 'license:5b72f58116e111c998f65cc2446b28716b1c6656', '', 'xbl:2535455750848799', 'discord:1321327162221006919', 'live:914804503654849', 1, 'fivem:15914073', 'Zey', '31.37.166.227', '148618792003450305', '2025-09-13 15:01:22'),
(40196, 'license:dc3ce3ee6e5b3842fa1cadd850be3fa9272eb4bb', '', '', 'discord:1134664855098511380', '', 0, 'fivem:11758808', '™ tw_Lvkatron', '88.160.137.82', '148618791999997368', '2025-09-13 18:02:18'),
(40197, 'license:2d3bf527a3daf2e686ea0446f622abe95b591441', 'steam:1100001561caf2f', 'xbl:2535407399951082', 'discord:1113143580626784297', 'live:985155528656235', 0, '', 'BARBIE EN Y', '62.35.143.26', '148618792032396243', '2025-09-13 19:10:37'),
(40198, 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', '', '', 'discord:1147835790777405510', '', 1, 'fivem:10775537', 'MT | lito', '91.163.141.215', '148618792015968900', '2025-09-13 19:22:30'),
(40199, 'license:455f58044f988017e2a1eafe39970040aa2ecaf3', 'steam:110000157fbbf32', '', 'discord:1041107501912965160', '', 1, 'fivem:13513617', 'Petrouchka', '176.165.150.65', '148618792029641211', '2025-09-14 17:50:24'),
(40200, 'license:c22273042664c8be00ea1a43f764385f57495fb8', '', 'xbl:2535422806761098', 'discord:838111023046328352', 'live:914804595120160', 0, 'fivem:5162073', 'dams6', '90.60.207.115', '148618792203811149', '2025-09-14 18:47:34'),
(40201, 'license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', 'steam:110000160421c84', '', 'discord:1171897239791227014', '', 1, 'fivem:5386085', 'Taeck1s', '81.254.60.203', '148618792044705336', '2025-09-14 23:26:34'),
(40202, 'license:e3d6d7770360b919247209fbe422f0103682305a', '', '', 'discord:1136739245122388040', '', 0, 'fivem:17612132', 'monst', '78.113.135.154', '148618792085488227', '2025-09-15 16:17:41'),
(40203, 'license:86f18a2d6f24691336c74f6987dd645cdb65e45a', 'steam:11000014ab7838d', 'xbl:2535436572719125', 'discord:847959669620473886', 'live:1688851324404201', 1, 'fivem:17567329', 'WaR', '85.98.199.25', '148618792041938618', '2025-09-17 07:23:35'),
(40204, 'license:5a462e16ff3e0af65da0ac6c653e479c8b4a3436', '', '', '', '', 0, '', 'FlowUP', '178.51.156.223', '148618792004539197', '2025-09-20 07:20:28'),
(40205, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '', 'xbl:2535428279336930', 'discord:980532233943261274', 'live:985155475126644', 0, 'fivem:9141304', 'dimit', '192.168.1.184', '148618792073983461', '2025-10-08 04:59:44');

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

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(45288, 'society_test10', 25000, NULL),
(45531, 'society_cardealer', 9999999999, NULL),
(48494, 'society_avocat', 0, NULL),
(48495, 'society_Kays', 0, NULL),
(48496, 'society_bahamas', 0, NULL),
(48497, 'society_ambulance', 0, NULL),
(48498, 'society_boatseller', 0, NULL),
(48499, 'society_boatshop', 0, NULL),
(48500, 'society_brinks', 0, NULL),
(48501, 'society_cardealer2', 0, NULL),
(48502, 'society_carshop', 0, NULL),
(48503, 'society_fib', 0, NULL),
(48504, 'society_gouv', 0, NULL),
(48505, 'society_k2r', 0, NULL),
(48506, 'society_kk', 0, NULL),
(48507, 'society_mecano', 0, NULL),
(48508, 'society_mecano2', 0, NULL),
(48509, 'society_planeseller', 0, NULL),
(48510, 'society_planeshop', 0, NULL),
(48511, 'society_police', 0, NULL),
(48512, 'society_rap', 0, NULL),
(48513, 'society_realestateagent', 0, NULL),
(48514, 'society_roxsherif', 0, NULL),
(48515, 'society_tabac', 0, NULL),
(48516, 'society_taxi', 0, NULL),
(48517, 'society_test1', 0, NULL),
(48518, 'society_testk', 0, NULL),
(48519, 'society_unicorn', 0, NULL),
(48520, 'society_vigne', 0, NULL),
(48521, 'society_vigneron', 0, NULL);

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

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_police', 'kevlar', 11, NULL),
(2, 'society_police', 'coke_pooch', 4, NULL),
(3, 'society_police', 'weed_pooch', 4, NULL),
(4, 'society_police', 'weed', 5, NULL),
(5, 'society_police', 'coke', 15, NULL),
(6, 'society_police', 'phone', 15, NULL),
(7, 'society_police', 'clip', 237, NULL),
(8, 'society_police', 'lsd', 1, NULL),
(9, 'society_15', 'bandage', 1, NULL),
(10, 'society_police', 'radio', 12, NULL),
(11, 'society_police', 'meth_pooch', 1, NULL),
(13, 'society_police', 'lsd_pooch', 1, NULL),
(14, 'society_police', 'silencer', 1, NULL),
(15, 'society_police', 'meth', 1, NULL),
(17, 'society_police', 'bread', 19, NULL),
(19, 'society_police', 'kevlarvip', 1, NULL),
(20, 'society_gouv', 'phone', 1, NULL),
(22, 'society_police', 'water', 7, NULL);

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

INSERT INTO `baninfo` (`id`, `license`, `identifier`, `liveid`, `xblid`, `discord`, `playerip`, `playername`, `Token`) VALUES
(1, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'steam:1100001703f92b2', 'live:985155475126644', 'xbl:2535428279336930', 'discord:980532233943261274', 'ip:51.210.126.15', 'Eva.lpq', NULL),
(2, 'license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', 'steam:1100001551ab872', 'live:985154918007056', 'xbl:2535456444018481', 'discord:518364636190343179', 'ip:153.94.16.91', 'meetballseater', NULL),
(3, 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'steam:110000149577c8a', NULL, NULL, 'discord:1292474364960313406', 'ip:94.107.164.85', 'SBMD', NULL),
(4, 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', NULL, 'live:1055519063570527', 'xbl:2535425079411194', 'discord:810116130915090443', 'ip:86.244.4.140', 'SayonSoon', NULL),
(5, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'steam:110000168ce3765', NULL, NULL, 'discord:749258273449836677', 'ip:176.133.204.6', '13Tpc', NULL),
(6, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'steam:110000149b59db1', 'live:844426020416766', 'xbl:2535469584096718', 'discord:873493653975334973', 'ip:89.84.160.107', 'R I C H Y ', NULL),
(7, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 'steam:11000015dfeaf23', NULL, NULL, 'discord:1100896231510790195', 'ip:91.165.126.205', 'Rss4', NULL),
(8, 'license:44cd1ef37b4fda00d53702007fb2c5cec6356919', NULL, 'live:914801468312569', 'xbl:2535462579062807', 'discord:898673240254328853', 'ip:31.33.226.19', 'Neo', NULL),
(9, 'license:85e8937833a05423627d78865cb0da6ab013652b', 'steam:1100001682983c4', NULL, NULL, 'discord:1399066877195714592', 'ip:37.67.100.177', 'BacKey', NULL),
(10, 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'steam:1100001718399bb', NULL, NULL, 'discord:1025770976111243345', 'ip:31.39.170.43', 'Hivann', NULL),
(11, 'license:88afb341c54c6ed2006bd7be158667299b00d341', 'steam:110000155e26122', 'live:1055522568579778', 'xbl:2535471213286282', 'discord:418004010478338048', 'ip:92.138.39.70', 'SPECMOIT\'AIMELESHOMMES', NULL),
(12, 'license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', 'steam:11000011a69fe96', 'live:985158097052482', 'xbl:2535430905460164', 'discord:819672516733173780', 'ip:109.9.87.130', 'Chinois', NULL),
(13, 'license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', 'steam:11000015862bcd3', 'live:985154517884558', 'xbl:2535467344193100', 'discord:1018137605180772352', 'ip:91.168.23.142', 'Diamonds', NULL),
(14, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 'steam:110000164fffe1a', NULL, NULL, 'discord:1355469418909536426', 'ip:88.183.241.156', 'Tim', NULL),
(15, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', NULL, 'live:1055519467626155', 'xbl:2535429938588939', 'discord:593849034842832897', 'ip:83.192.13.123', 'WASK', NULL),
(16, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', NULL, NULL, NULL, 'discord:853762504056635423', 'ip:90.79.99.165', 'Utilisateur', NULL),
(17, 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f', NULL, NULL, NULL, NULL, 'ip:86.221.93.65', 'JteRushEnQuamis', NULL),
(18, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', 'steam:110000172752a7c', 'live:844431724456027', 'xbl:2535417480104789', 'discord:1166523819872235544', 'ip:90.76.170.14', 'Rimoo', NULL),
(19, 'license:effa1ffd386df938a94332c73611cf8003bdbf36', NULL, NULL, NULL, 'discord:835091428610146306', 'ip:88.174.129.205', '\'mamad', NULL),
(20, 'license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', NULL, NULL, NULL, NULL, 'ip:82.66.123.209', 'kjhjk', NULL),
(21, 'license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', 'steam:110000117886052', NULL, NULL, 'discord:516241634833334325', 'ip:88.139.217.250', '20h', NULL),
(22, 'license:5b72f58116e111c998f65cc2446b28716b1c6656', NULL, 'live:914804503654849', 'xbl:2535455750848799', 'discord:1321327162221006919', 'ip:31.37.166.227', 'Zey', NULL),
(23, 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', NULL, NULL, NULL, 'discord:1147835790777405510', 'ip:91.163.141.215', 'MT | lito', NULL),
(24, 'license:455f58044f988017e2a1eafe39970040aa2ecaf3', 'steam:110000157fbbf32', NULL, NULL, 'discord:1041107501912965160', 'ip:176.165.150.65', 'Petrouchka', NULL),
(25, 'license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', 'steam:110000160421c84', NULL, NULL, 'discord:1171897239791227014', 'ip:81.254.60.203', 'Taeck1s', NULL),
(26, 'license:86f18a2d6f24691336c74f6987dd645cdb65e45a', 'steam:11000014ab7838d', 'live:1688851324404201', 'xbl:2535436572719125', 'discord:847959669620473886', 'ip:85.98.199.25', 'WaR', NULL),
(27, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', NULL, 'live:985155475126644', 'xbl:2535428279336930', 'discord:980532233943261274', 'ip:192.168.1.184', 'dimit', NULL);

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

INSERT INTO `bank_transactions` (`id`, `identifier`, `type`, `amount`, `sender`, `receiver`, `label`, `date`) VALUES
(1, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'withdraw', 10000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-23 15:04:01'),
(2, 'license:6aa69b1bc8c1f5af088caec06c3081b96405b6d7', 'deposit', 51000, 'license:6aa69b1bc8c1f5af088caec06c3081b96405b6d7', NULL, NULL, '2025-04-23 15:12:02'),
(3, 'license:f8dbab11e14794e12a3f48c39cfdb3f0d2f48c3a', 'deposit', 1000, 'license:f8dbab11e14794e12a3f48c39cfdb3f0d2f48c3a', NULL, NULL, '2025-04-23 15:41:06'),
(4, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 10000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-23 15:42:58'),
(5, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'deposit', 23000, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-23 16:01:03'),
(6, 'license:df6d2d3d929b44e62cc134e43b2c9b2a6b75c944', 'deposit', 20000, 'license:df6d2d3d929b44e62cc134e43b2c9b2a6b75c944', NULL, NULL, '2025-04-23 16:02:01'),
(7, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', 'withdraw', 3000, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', NULL, NULL, '2025-04-23 16:07:42'),
(8, 'license:ff7f48cc05a860a37148e531f5982444db596da1', 'withdraw', 10000, 'license:ff7f48cc05a860a37148e531f5982444db596da1', NULL, NULL, '2025-04-23 16:18:18'),
(9, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 3000, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-23 16:32:56'),
(10, 'license:c8cdc950992855f1d13004a5238c4e5e4492ddd2', 'deposit', 25000, 'license:c8cdc950992855f1d13004a5238c4e5e4492ddd2', NULL, NULL, '2025-04-23 17:10:01'),
(11, 'license:c8cdc950992855f1d13004a5238c4e5e4492ddd2', 'withdraw', 1000, 'license:c8cdc950992855f1d13004a5238c4e5e4492ddd2', NULL, NULL, '2025-04-23 17:12:20'),
(12, 'license:d8fd6f841115a49967e95521833602fd1023254b', 'withdraw', 100000, 'license:d8fd6f841115a49967e95521833602fd1023254b', NULL, NULL, '2025-04-23 17:37:54'),
(13, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', 'withdraw', 2500, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', NULL, NULL, '2025-04-23 17:46:48'),
(14, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', 'deposit', 55000, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', NULL, NULL, '2025-04-23 18:50:42'),
(15, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'deposit', 4400, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-23 18:53:53'),
(16, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', 'deposit', 87000000, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', NULL, NULL, '2025-04-23 18:56:07'),
(17, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', 'withdraw', 10000, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', NULL, NULL, '2025-04-23 19:50:52'),
(18, 'license:1331309793d9606f7273e6d206dccb05356e99b1', 'deposit', 111, 'license:1331309793d9606f7273e6d206dccb05356e99b1', NULL, NULL, '2025-04-23 20:32:26'),
(19, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', 'deposit', 25000, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', NULL, NULL, '2025-04-23 20:49:25'),
(20, 'license:e301399c93fff9a601fa9b7d3870b4aefe9d0030', 'withdraw', 120000, 'license:e301399c93fff9a601fa9b7d3870b4aefe9d0030', NULL, NULL, '2025-04-23 21:41:14'),
(21, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', 'deposit', 15000, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', NULL, NULL, '2025-04-23 22:51:51'),
(22, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', 'withdraw', 1100, 'license:17f382dfcc41bde96bc653d29fa22f5f4b683123', NULL, NULL, '2025-04-23 23:33:10'),
(23, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', 'deposit', 40000, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', NULL, NULL, '2025-04-24 05:56:32'),
(24, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 2500, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-24 07:35:25'),
(25, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'deposit', 1000, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-24 09:40:13'),
(26, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', 'deposit', 75000, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', NULL, NULL, '2025-04-24 10:02:57'),
(27, 'license:e0041ae1baa917030050b93169d8e39c996557cc', 'deposit', 50000, 'license:e0041ae1baa917030050b93169d8e39c996557cc', NULL, NULL, '2025-04-24 10:33:42'),
(28, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', 'deposit', 50000, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', NULL, NULL, '2025-04-24 10:34:19'),
(29, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', 'deposit', 80, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', NULL, NULL, '2025-04-24 11:21:08'),
(30, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 3000, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-24 11:28:46'),
(31, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'deposit', 145000, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-24 12:21:45'),
(32, 'license:949aa32e9267de064a30d1b833304b8cc1ba1f19', 'deposit', 25000, 'license:949aa32e9267de064a30d1b833304b8cc1ba1f19', NULL, NULL, '2025-04-24 12:38:42'),
(33, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', 'withdraw', 10000, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', NULL, NULL, '2025-04-24 14:40:48'),
(34, 'license:0537fda9299ad1126c9908234711edf465767d9d', 'withdraw', 3000, 'license:0537fda9299ad1126c9908234711edf465767d9d', NULL, NULL, '2025-04-24 16:31:24'),
(35, 'license:d373c81fb2c64427e016a7911c236281e9279936', 'withdraw', 2000, 'license:d373c81fb2c64427e016a7911c236281e9279936', NULL, NULL, '2025-04-24 17:05:59'),
(36, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 4000, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-24 17:39:07'),
(37, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', 'withdraw', 150000, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', NULL, NULL, '2025-04-24 17:39:23'),
(38, 'license:85719cf4a910cf328a26f57ffa81fbd248524427', 'deposit', 25000, 'license:85719cf4a910cf328a26f57ffa81fbd248524427', NULL, NULL, '2025-04-24 18:25:55'),
(39, 'license:85719cf4a910cf328a26f57ffa81fbd248524427', 'withdraw', 5000, 'license:85719cf4a910cf328a26f57ffa81fbd248524427', NULL, NULL, '2025-04-24 18:26:08'),
(40, 'license:f59aaa1c21810573ec12c32dd329a07d88ed96df', 'deposit', 120000000, 'license:f59aaa1c21810573ec12c32dd329a07d88ed96df', NULL, NULL, '2025-04-24 18:43:31'),
(41, 'license:89712de164a1393d86d079452f5763a76500d123', 'deposit', 35000, 'license:89712de164a1393d86d079452f5763a76500d123', NULL, NULL, '2025-04-24 19:09:21'),
(42, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'withdraw', 1500, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-24 19:27:29'),
(43, 'license:3ed9c0687d7b69423a2a5e0e1aa7abbfada7a636', 'deposit', 1100000, 'license:3ed9c0687d7b69423a2a5e0e1aa7abbfada7a636', NULL, NULL, '2025-04-24 19:29:00'),
(44, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 2550, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-24 19:46:32'),
(45, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', 'withdraw', 25000, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', NULL, NULL, '2025-04-24 19:52:10'),
(46, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'withdraw', 5000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-24 20:02:56'),
(47, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'deposit', 1000000, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-24 20:03:13'),
(48, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'withdraw', 1000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-24 20:08:29'),
(49, 'license:d373c81fb2c64427e016a7911c236281e9279936', 'deposit', 20000, 'license:d373c81fb2c64427e016a7911c236281e9279936', NULL, NULL, '2025-04-24 20:09:02'),
(50, 'license:091c57cbec13d84ba5ca856492e68ae13771cdaf', 'deposit', 170000, 'license:091c57cbec13d84ba5ca856492e68ae13771cdaf', NULL, NULL, '2025-04-24 20:14:47'),
(51, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 7000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-24 20:18:06'),
(52, 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'deposit', 40000, 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', NULL, NULL, '2025-04-24 20:28:56'),
(53, 'license:44364f3cd4525ba3ca6f39fb67a3d66eab35dc94', 'withdraw', 30000, 'license:44364f3cd4525ba3ca6f39fb67a3d66eab35dc94', NULL, NULL, '2025-04-24 20:32:19'),
(54, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', 'deposit', 30000, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', NULL, NULL, '2025-04-24 20:36:25'),
(55, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 30000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-24 20:41:35'),
(56, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', 'deposit', 25000, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', NULL, NULL, '2025-04-24 20:42:11'),
(57, 'license:3fcadb733981fa3f2ab536e202a3e47f3d9bf814', 'deposit', 2000, 'license:3fcadb733981fa3f2ab536e202a3e47f3d9bf814', NULL, NULL, '2025-04-24 20:42:55'),
(58, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', 'withdraw', 2500, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', NULL, NULL, '2025-04-24 20:54:18'),
(59, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'withdraw', 2500, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-24 21:01:54'),
(60, 'license:3961a8ba02456763c06776e410af02c467de6aa4', 'withdraw', 10000, 'license:3961a8ba02456763c06776e410af02c467de6aa4', NULL, NULL, '2025-04-24 21:06:00'),
(61, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'withdraw', 1700, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-24 23:10:46'),
(62, 'license:89712de164a1393d86d079452f5763a76500d123', 'withdraw', 400000, 'license:89712de164a1393d86d079452f5763a76500d123', NULL, NULL, '2025-04-24 23:11:21'),
(63, 'license:ae029d5841a7c755d1066ceaa27b66ff62d4fa8d', 'withdraw', 30000, 'license:ae029d5841a7c755d1066ceaa27b66ff62d4fa8d', NULL, NULL, '2025-04-24 23:11:36'),
(64, 'license:262f3e64de21f530d76b2e9d3797fa6f034dc163', 'deposit', 15000, 'license:262f3e64de21f530d76b2e9d3797fa6f034dc163', NULL, NULL, '2025-04-24 23:25:17'),
(65, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', 'withdraw', 1500, 'license:4ad68eafec47fe4d24fd29df13b896e7025dab92', NULL, NULL, '2025-04-24 23:55:58'),
(66, 'license:2fd41ddb3cc780c1e0dbd73a43950ec059a236cc', 'withdraw', 218969, 'license:2fd41ddb3cc780c1e0dbd73a43950ec059a236cc', NULL, NULL, '2025-04-25 00:31:42'),
(67, 'license:6648b3c221b9f2db934923bc789b09afd6c83045', 'deposit', 968, 'license:6648b3c221b9f2db934923bc789b09afd6c83045', NULL, NULL, '2025-04-25 01:00:35'),
(68, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 1500, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-25 08:28:04'),
(69, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 11000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-25 09:14:11'),
(70, 'license:d373c81fb2c64427e016a7911c236281e9279936', 'withdraw', 2500, 'license:d373c81fb2c64427e016a7911c236281e9279936', NULL, NULL, '2025-04-25 10:24:05'),
(71, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', 'deposit', 25000, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', NULL, NULL, '2025-04-25 10:25:10'),
(72, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', 'withdraw', 3000, 'license:0fcef6b679717db2f29635f8a9e1c2e804e230a9', NULL, NULL, '2025-04-25 10:26:27'),
(73, 'license:d373c81fb2c64427e016a7911c236281e9279936', 'withdraw', 350, 'license:d373c81fb2c64427e016a7911c236281e9279936', NULL, NULL, '2025-04-25 10:59:56'),
(74, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', 'withdraw', 6500, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', NULL, NULL, '2025-04-25 11:14:15'),
(75, 'license:aaf19def12c6ed83352642e4e0a09465b188310a', 'withdraw', 5000, 'license:aaf19def12c6ed83352642e4e0a09465b188310a', NULL, NULL, '2025-04-25 11:14:16'),
(76, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', 'withdraw', 3000, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', NULL, NULL, '2025-04-25 11:31:02'),
(77, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', 'withdraw', 300000, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', NULL, NULL, '2025-04-25 11:36:47'),
(78, 'license:3799c92a03a707a3e9e9873b3dc7919edbb78ae0', 'deposit', 24400, 'license:3799c92a03a707a3e9e9873b3dc7919edbb78ae0', NULL, NULL, '2025-04-25 11:40:46'),
(79, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', 'withdraw', 2000, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', NULL, NULL, '2025-04-25 12:41:59'),
(80, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', 'withdraw', 100000, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', NULL, NULL, '2025-04-25 13:02:52'),
(81, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'withdraw', 500, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-25 13:14:14'),
(82, 'license:372db15c8e62dfc63599a53a7d7c0ae5818e6432', 'withdraw', 1000000, 'license:372db15c8e62dfc63599a53a7d7c0ae5818e6432', NULL, NULL, '2025-04-25 14:41:33'),
(83, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', 'withdraw', 4998, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', NULL, NULL, '2025-04-25 14:47:43'),
(84, 'license:7f553e36905ea02d3c933e4365abd9b5fa35105f', 'withdraw', 1500, 'license:7f553e36905ea02d3c933e4365abd9b5fa35105f', NULL, NULL, '2025-04-25 15:06:19'),
(85, 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'deposit', 100000, 'license:992a9d318863137fba6c8c551ec018a37029d2d9', NULL, NULL, '2025-04-25 15:22:16'),
(86, 'license:460b599566dbd1907d865474e807ce664ca3051f', 'deposit', 20000, 'license:460b599566dbd1907d865474e807ce664ca3051f', NULL, NULL, '2025-04-25 15:37:54'),
(87, 'license:464f241480f08471d04a23aaf92f86e679b1ca54', 'deposit', 20000, 'license:464f241480f08471d04a23aaf92f86e679b1ca54', NULL, NULL, '2025-04-25 16:11:02'),
(88, 'license:2da14804b4b600a1022bd94e0898261fe363d417', 'withdraw', 174000, 'license:2da14804b4b600a1022bd94e0898261fe363d417', NULL, NULL, '2025-04-25 16:12:11'),
(89, 'license:2da14804b4b600a1022bd94e0898261fe363d417', 'withdraw', 700, 'license:2da14804b4b600a1022bd94e0898261fe363d417', NULL, NULL, '2025-04-25 16:12:19'),
(90, 'license:2da14804b4b600a1022bd94e0898261fe363d417', 'deposit', 191000, 'license:2da14804b4b600a1022bd94e0898261fe363d417', NULL, NULL, '2025-04-25 16:17:26'),
(91, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'deposit', 54000, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-25 16:19:29'),
(92, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', 'withdraw', 1500, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', NULL, NULL, '2025-04-25 17:17:03'),
(93, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', 'deposit', 2000000, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', NULL, NULL, '2025-04-25 17:25:23'),
(94, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'deposit', 22000, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-25 17:39:38'),
(95, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'deposit', 75500, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-25 18:39:17'),
(96, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', 'deposit', 70000, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', NULL, NULL, '2025-04-25 19:10:40'),
(97, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', 'withdraw', 17000000, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', NULL, NULL, '2025-04-25 19:20:35'),
(98, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', 'withdraw', 126000000, 'license:44fee60b44c25bca5fe6cf7688291b1b50bb24b2', NULL, NULL, '2025-04-25 19:20:53'),
(99, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 1700000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-25 19:24:29'),
(100, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 20000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-25 19:24:43'),
(101, 'license:9f1496e628c7e846f2029eb97cf0b9fdabe40b57', 'deposit', 9000000, 'license:9f1496e628c7e846f2029eb97cf0b9fdabe40b57', NULL, NULL, '2025-04-25 19:32:20'),
(102, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', 'withdraw', 10000, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', NULL, NULL, '2025-04-25 20:12:43'),
(103, 'license:6f20e22ea0436aca953946d8841023487415505c', 'deposit', 243000, 'license:6f20e22ea0436aca953946d8841023487415505c', NULL, NULL, '2025-04-25 20:22:13'),
(104, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 60000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-25 20:38:25'),
(105, 'license:e804ed68b654ba2cda298d844af95f8e573bbf54', 'withdraw', 15000, 'license:e804ed68b654ba2cda298d844af95f8e573bbf54', NULL, NULL, '2025-04-25 20:48:20'),
(106, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'withdraw', 2000, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-25 20:48:48'),
(107, 'license:14d8525084302e3d906a5bd8b6b7093cbe96d1a9', 'deposit', 450000, 'license:14d8525084302e3d906a5bd8b6b7093cbe96d1a9', NULL, NULL, '2025-04-25 20:48:53'),
(108, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', 'deposit', 500000, 'license:4811d79bf7e8951f7caab7214f0b4a6c2a98c6c6', NULL, NULL, '2025-04-25 21:02:08'),
(109, 'license:372db15c8e62dfc63599a53a7d7c0ae5818e6432', 'deposit', 50000, 'license:372db15c8e62dfc63599a53a7d7c0ae5818e6432', NULL, NULL, '2025-04-25 21:10:54'),
(110, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', 'withdraw', 160000, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', NULL, NULL, '2025-04-25 21:42:37'),
(111, 'license:20e2b50501d169b2e7f4b98afe57feaaf6370cb3', 'withdraw', 200000, 'license:20e2b50501d169b2e7f4b98afe57feaaf6370cb3', NULL, NULL, '2025-04-25 21:42:54'),
(112, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', 'deposit', 43000, 'license:8c9788147a2dbeedb37811d1a8e55d52e02043d3', NULL, NULL, '2025-04-25 21:55:06'),
(113, 'license:2aa1e28b88874458af262384e3f70b4e3e84ec71', 'deposit', 25000, 'license:2aa1e28b88874458af262384e3f70b4e3e84ec71', NULL, NULL, '2025-04-25 22:04:20'),
(114, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', 'deposit', 25000, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', NULL, NULL, '2025-04-25 22:04:27'),
(115, 'license:2aa1e28b88874458af262384e3f70b4e3e84ec71', 'withdraw', 10000, 'license:2aa1e28b88874458af262384e3f70b4e3e84ec71', NULL, NULL, '2025-04-25 22:06:07'),
(116, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 27000000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:10:56'),
(117, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 30000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:12:06'),
(118, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 29000000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:12:35'),
(119, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 1780000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:12:59'),
(120, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 7900000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:23:46'),
(121, 'license:c6d6239b9037927cc45ff61dca6fce28b806b59b', 'withdraw', 20000, 'license:c6d6239b9037927cc45ff61dca6fce28b806b59b', NULL, NULL, '2025-04-25 22:47:38'),
(122, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'deposit', 15000000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:50:22'),
(123, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'deposit', 50000000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:54:11'),
(124, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'deposit', 1000000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-25 22:54:22'),
(125, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', 'deposit', 350000, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', NULL, NULL, '2025-04-25 23:12:04'),
(126, 'license:9bff33d0474382000bae1aa8aff777e03d57e45a', 'withdraw', 24000, 'license:9bff33d0474382000bae1aa8aff777e03d57e45a', NULL, NULL, '2025-04-26 03:38:44'),
(127, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', 'deposit', 3100000, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', NULL, NULL, '2025-04-26 08:45:48'),
(128, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', 'deposit', 500000, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', NULL, NULL, '2025-04-26 08:45:57'),
(129, 'license:6ebae076b47c87ece58cda1b02fcf9de69a81656', 'withdraw', 10000, 'license:6ebae076b47c87ece58cda1b02fcf9de69a81656', NULL, NULL, '2025-04-26 09:40:12'),
(130, 'license:2971b20f502ad2b4f2b40d65545cf25df8b29c0a', 'withdraw', 5000, 'license:2971b20f502ad2b4f2b40d65545cf25df8b29c0a', NULL, NULL, '2025-04-26 11:34:23'),
(131, 'license:d8fd6f841115a49967e95521833602fd1023254b', 'deposit', 900000, 'license:d8fd6f841115a49967e95521833602fd1023254b', NULL, NULL, '2025-04-26 11:34:39'),
(132, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 700, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-26 11:46:24'),
(133, 'license:a7d95dcb35fc915738409379b192a91b80918949', 'withdraw', 1500, 'license:a7d95dcb35fc915738409379b192a91b80918949', NULL, NULL, '2025-04-26 11:52:13'),
(134, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'deposit', 239300, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-26 12:16:15'),
(135, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'deposit', 2153000, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-26 12:16:37'),
(136, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', 'withdraw', 1000, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', NULL, NULL, '2025-04-26 13:14:16'),
(137, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', 'deposit', 149000, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', NULL, NULL, '2025-04-26 13:19:45'),
(138, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', 'withdraw', 10000, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', NULL, NULL, '2025-04-26 13:19:59'),
(139, 'license:4df23be37a41be293441e40cf81022ad974f73fa', 'deposit', 10600, 'license:4df23be37a41be293441e40cf81022ad974f73fa', NULL, NULL, '2025-04-26 13:29:39'),
(140, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', 'withdraw', 5000, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', NULL, NULL, '2025-04-26 13:32:55'),
(141, 'license:e45e20910c7dabe3691749dd78efd5998bae4b64', 'deposit', 100000, 'license:e45e20910c7dabe3691749dd78efd5998bae4b64', NULL, NULL, '2025-04-26 13:47:03'),
(142, 'license:d998b50e91bb3a478a740e412e5f724553a61941', 'deposit', 1000000, 'license:d998b50e91bb3a478a740e412e5f724553a61941', NULL, NULL, '2025-04-26 14:03:02'),
(143, 'license:d998b50e91bb3a478a740e412e5f724553a61941', 'deposit', 1, 'license:d998b50e91bb3a478a740e412e5f724553a61941', NULL, NULL, '2025-04-26 14:03:13'),
(144, 'license:62d61ebaac275e851a9ebc30320bfdfaafc81984', 'deposit', 50000, 'license:62d61ebaac275e851a9ebc30320bfdfaafc81984', NULL, NULL, '2025-04-26 14:08:58'),
(145, 'license:6f20e22ea0436aca953946d8841023487415505c', 'deposit', 1200000, 'license:6f20e22ea0436aca953946d8841023487415505c', NULL, NULL, '2025-04-26 14:09:44'),
(146, 'license:87c87fb41d7ba3147b6608000858d895ab7b6533', 'deposit', 23000, 'license:87c87fb41d7ba3147b6608000858d895ab7b6533', NULL, NULL, '2025-04-26 14:32:54'),
(147, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'deposit', 13273, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-26 14:37:35'),
(148, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', 'withdraw', 5000, 'license:ade9226cd285b624cab0c50062f7859be63a6e8c', NULL, NULL, '2025-04-26 14:38:10'),
(149, 'license:119ffd0cdcba3d51f18e96eb3cc46d30a0131069', 'deposit', 300000, 'license:119ffd0cdcba3d51f18e96eb3cc46d30a0131069', NULL, NULL, '2025-04-26 15:04:43'),
(150, 'license:7f553e36905ea02d3c933e4365abd9b5fa35105f', 'withdraw', 1500, 'license:7f553e36905ea02d3c933e4365abd9b5fa35105f', NULL, NULL, '2025-04-26 15:06:38'),
(151, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 1500, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-26 15:18:59'),
(152, 'license:28a77e9f51f942ad866e7ed63be23121e0f91c67', 'withdraw', 10000, 'license:28a77e9f51f942ad866e7ed63be23121e0f91c67', NULL, NULL, '2025-04-26 15:34:43'),
(153, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 180000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-26 16:31:11'),
(154, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', 'withdraw', 8000, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', NULL, NULL, '2025-04-26 16:39:30'),
(155, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', 'deposit', 20000, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', NULL, NULL, '2025-04-26 17:06:49'),
(156, 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'withdraw', 20000, 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', NULL, NULL, '2025-04-26 17:16:30'),
(157, 'license:c38a5ab14fb255a350dd8c302c2b776f136aed31', 'withdraw', 30000, 'license:c38a5ab14fb255a350dd8c302c2b776f136aed31', NULL, NULL, '2025-04-26 17:17:43'),
(158, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', 'deposit', 5800, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', NULL, NULL, '2025-04-26 17:27:46'),
(159, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'withdraw', 1500, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', NULL, NULL, '2025-04-26 17:28:59'),
(160, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'withdraw', 3000, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-26 17:48:21'),
(161, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', 'withdraw', 30000, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', NULL, NULL, '2025-04-26 17:48:27'),
(162, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', 'withdraw', 20000, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', NULL, NULL, '2025-04-26 17:48:43'),
(163, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', 'withdraw', 20000, 'license:dbd618b367bf465a8aa4bed7630f5c067a0adb56', NULL, NULL, '2025-04-26 17:48:56'),
(164, 'license:3b58b0d93c7ad0e1524daa356185beba34773e25', 'withdraw', 524000, 'license:3b58b0d93c7ad0e1524daa356185beba34773e25', NULL, NULL, '2025-04-26 18:03:16'),
(165, 'license:110e09b4d81d58586a0c73862a7b5ea6991fe731', 'deposit', 549000, 'license:110e09b4d81d58586a0c73862a7b5ea6991fe731', NULL, NULL, '2025-04-26 18:04:08'),
(166, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 3000, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-26 18:08:32'),
(167, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 1500, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-26 18:11:12'),
(168, 'license:28a77e9f51f942ad866e7ed63be23121e0f91c67', 'deposit', 7861, 'license:28a77e9f51f942ad866e7ed63be23121e0f91c67', NULL, NULL, '2025-04-26 18:12:50'),
(169, 'license:44e074cc9cad198b7c237e3552aa5f3fa8c5ac24', 'deposit', 227725, 'license:44e074cc9cad198b7c237e3552aa5f3fa8c5ac24', NULL, NULL, '2025-04-26 18:18:05'),
(170, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', 'deposit', 70000, 'license:4cf69bdf5723b7925cc515253b68f96d0f2cb55d', NULL, NULL, '2025-04-26 18:24:09'),
(171, 'license:56ae480a54f3fde8ce8ee39f013a4198096a2931', 'deposit', 24000, 'license:56ae480a54f3fde8ce8ee39f013a4198096a2931', NULL, NULL, '2025-04-26 18:41:01'),
(172, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'withdraw', 5000, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-26 18:57:07'),
(173, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'withdraw', 15000, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', NULL, NULL, '2025-04-26 19:05:06'),
(174, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', 'deposit', 20000, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', NULL, NULL, '2025-04-26 19:12:27'),
(175, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', 'deposit', 12000, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', NULL, NULL, '2025-04-26 19:12:36'),
(176, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', 'withdraw', 3000, 'license:3d3150a434e4e0fabef097c0e564362e33bdd10c', NULL, NULL, '2025-04-26 19:46:13'),
(177, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'deposit', 490039, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', NULL, NULL, '2025-04-26 19:48:16'),
(178, 'license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'withdraw', 400000, 'license:b4adbf0ba66d9be0b0afa73f361b55c461871506', NULL, NULL, '2025-04-26 20:10:51'),
(179, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 1500, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-26 20:12:27'),
(180, 'license:e5255269094b288f237c38596f5e8f90b3d168ed', 'deposit', 1000000, 'license:e5255269094b288f237c38596f5e8f90b3d168ed', NULL, NULL, '2025-04-26 20:15:40'),
(181, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', 'deposit', 345000, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', NULL, NULL, '2025-04-26 20:15:41'),
(182, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'withdraw', 1500, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', NULL, NULL, '2025-04-26 20:26:33'),
(183, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', 'withdraw', 1500, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', NULL, NULL, '2025-04-26 20:55:36'),
(184, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 50000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-26 21:30:20'),
(185, 'license:44e074cc9cad198b7c237e3552aa5f3fa8c5ac24', 'withdraw', 5000, 'license:44e074cc9cad198b7c237e3552aa5f3fa8c5ac24', NULL, NULL, '2025-04-26 21:59:29'),
(186, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', 'deposit', 30000, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', NULL, NULL, '2025-04-26 22:14:30'),
(187, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 15000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-26 22:18:43'),
(188, 'license:42ac93f942ed2415dfaf76d72947fc9bda7f5d4e', 'deposit', 20000, 'license:42ac93f942ed2415dfaf76d72947fc9bda7f5d4e', NULL, NULL, '2025-04-26 22:23:47'),
(189, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', 'deposit', 12000, 'license:e5fa3082b5ea55e80e51d347c58ccf304c77658e', NULL, NULL, '2025-04-27 00:39:32'),
(190, 'license:82b355d263d8d326df95ec75fb84ec23b5dedd15', 'deposit', 179000, 'license:82b355d263d8d326df95ec75fb84ec23b5dedd15', NULL, NULL, '2025-04-27 01:07:27'),
(191, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'withdraw', 1500, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', NULL, NULL, '2025-04-27 08:09:04'),
(192, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 77000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-27 09:21:10'),
(193, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', 'withdraw', 971000, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', NULL, NULL, '2025-04-27 09:37:20'),
(194, 'license:d2c02b8de24354dfa0ad1afb2568ba7bd088b68a', 'withdraw', 500, 'license:d2c02b8de24354dfa0ad1afb2568ba7bd088b68a', NULL, NULL, '2025-04-27 11:03:49'),
(195, 'license:b060a8c9b6da4678702a5fde63980c72a7d94b76', 'withdraw', 5000, 'license:b060a8c9b6da4678702a5fde63980c72a7d94b76', NULL, NULL, '2025-04-27 11:22:57'),
(196, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', 'deposit', 470000, 'license:bfa5e5a9d07fc23b6147e6b45cf067c7bd35afc8', NULL, NULL, '2025-04-27 12:53:15'),
(197, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', 'withdraw', 1500, 'license:bdb03167521489b32f6d62a3c3d10cbbe819e992', NULL, NULL, '2025-04-27 12:57:20'),
(198, 'license:d2c02b8de24354dfa0ad1afb2568ba7bd088b68a', 'deposit', 5925, 'license:d2c02b8de24354dfa0ad1afb2568ba7bd088b68a', NULL, NULL, '2025-04-27 13:03:49'),
(199, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', 'deposit', 1550000, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', NULL, NULL, '2025-04-27 13:16:56'),
(200, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', 'deposit', 500000, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', NULL, NULL, '2025-04-27 13:17:16'),
(201, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', 'deposit', 100000, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', NULL, NULL, '2025-04-27 13:17:27'),
(202, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'withdraw', 40000, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', NULL, NULL, '2025-04-27 13:27:35'),
(203, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', 'deposit', 40000, 'license:cccf9c6770b6fcce31672ec6bb6b40e140fb9afb', NULL, NULL, '2025-04-27 13:30:03'),
(204, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', 'deposit', 100000, 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', NULL, NULL, '2025-04-27 13:30:13'),
(205, 'license:d373c81fb2c64427e016a7911c236281e9279936', 'withdraw', 10000, 'license:d373c81fb2c64427e016a7911c236281e9279936', NULL, NULL, '2025-04-27 13:35:09'),
(206, 'license:65b0659a318f1166cf6e5101863432b3e346f7a3', 'deposit', 247000, 'license:65b0659a318f1166cf6e5101863432b3e346f7a3', NULL, NULL, '2025-04-27 13:44:31'),
(207, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', 'deposit', 35000, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', NULL, NULL, '2025-04-27 14:00:52'),
(208, 'license:1ea8292a8ed118bf560148d864cb5ba9f93c0249', 'deposit', 30000, 'license:1ea8292a8ed118bf560148d864cb5ba9f93c0249', NULL, NULL, '2025-04-27 14:01:04'),
(209, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', 'deposit', 200000, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', NULL, NULL, '2025-04-27 14:01:06'),
(210, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', 'deposit', 3000, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', NULL, NULL, '2025-04-27 14:01:14'),
(211, 'license:1ea8292a8ed118bf560148d864cb5ba9f93c0249', 'withdraw', 40000, 'license:1ea8292a8ed118bf560148d864cb5ba9f93c0249', NULL, NULL, '2025-04-27 14:01:26'),
(212, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', 'deposit', 42830, 'license:787289c5e5a3b9e3b8ae6be01460833c6c958484', NULL, NULL, '2025-04-27 14:01:42'),
(213, 'license:415b0f1c8d732e8f413e5bfb897c9c9c4bba7d7e', 'deposit', 14800000, 'license:415b0f1c8d732e8f413e5bfb897c9c9c4bba7d7e', NULL, NULL, '2025-04-27 14:11:55'),
(214, 'license:57a961a8112554d8545ce0f16e212f4932dc5722', 'deposit', 123000, 'license:57a961a8112554d8545ce0f16e212f4932dc5722', NULL, NULL, '2025-04-27 14:46:35'),
(215, 'license:415b0f1c8d732e8f413e5bfb897c9c9c4bba7d7e', 'withdraw', 5000000, 'license:415b0f1c8d732e8f413e5bfb897c9c9c4bba7d7e', NULL, NULL, '2025-04-27 15:21:33'),
(216, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', 'deposit', 1000000, 'license:4a4bcdde2bfb84410af1466e7d104f4aaea9ad56', NULL, NULL, '2025-04-27 15:38:34'),
(217, 'license:6648b3c221b9f2db934923bc789b09afd6c83045', 'withdraw', 5000, 'license:6648b3c221b9f2db934923bc789b09afd6c83045', NULL, NULL, '2025-04-27 16:00:51'),
(218, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'withdraw', 2500, 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', NULL, NULL, '2025-04-27 16:42:29'),
(219, 'license:71d85170ec93066094d9be4e875187517fb3b0a0', 'deposit', 24000, 'license:71d85170ec93066094d9be4e875187517fb3b0a0', NULL, NULL, '2025-04-27 16:55:42'),
(220, 'license:57a961a8112554d8545ce0f16e212f4932dc5722', 'withdraw', 3000, 'license:57a961a8112554d8545ce0f16e212f4932dc5722', NULL, NULL, '2025-04-27 17:38:39'),
(221, 'license:22129576d0bdb9d675f642f1c03bd9d3496babd2', 'withdraw', 1000000, 'license:22129576d0bdb9d675f642f1c03bd9d3496babd2', NULL, NULL, '2025-04-27 17:48:38'),
(222, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', 'withdraw', 1500, 'license:b3640903ac0a61e285f9b29f6df860d4f7079b20', NULL, NULL, '2025-04-27 17:56:26'),
(223, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', 'withdraw', 30000, 'license:d8124fa81d8fd02fc33768bec0ba05c510df5fe2', NULL, NULL, '2025-04-27 18:36:54'),
(224, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', 'withdraw', 1500000, 'license:a87a6ad65e5e62a6e03c9b60e3e3c1c03a4424d6', NULL, NULL, '2025-04-27 18:59:41'),
(225, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', 'withdraw', 6000, 'license:3f36152e73807ccfa6ed3e65dcb325efb8fd42c6', NULL, NULL, '2025-04-27 19:03:21'),
(226, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'withdraw', 992, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', NULL, NULL, '2025-04-27 19:10:25'),
(227, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', 'deposit', 100000, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', NULL, NULL, '2025-04-27 20:34:15'),
(228, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', 'deposit', 48000, 'license:4d04e37eb7b6e6330fefe28db1d1abcf6c42c099', NULL, NULL, '2025-04-27 20:34:27'),
(229, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'deposit', 500000, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', NULL, NULL, '2025-04-27 21:23:03'),
(230, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'deposit', 2342, 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', NULL, NULL, '2025-04-27 21:23:14'),
(231, 'license:d8fd6f841115a49967e95521833602fd1023254b', 'deposit', 2500000, 'license:d8fd6f841115a49967e95521833602fd1023254b', NULL, NULL, '2025-04-27 22:39:37');

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

INSERT INTO `banlist` (`license`, `ban_id`, `identifier`, `liveid`, `xblid`, `discord`, `playerip`, `targetplayername`, `sourceplayername`, `reason`, `timeat`, `expiration`, `permanent`) VALUES
('license:2e35218c23bd014dcb89d25164f85957a1af2a7f', '8549-26205', NULL, NULL, NULL, NULL, 'ip:86.221.93.65', 'JteRushEnQuamis', 'H I KYZOO', 'CHEAT', '1757712368', '1757712368', 1);

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

INSERT INTO `banlisthistory` (`id`, `ban_id`, `license`, `identifier`, `liveid`, `xblid`, `discord`, `playerip`, `targetplayername`, `sourceplayername`, `reason`, `timeat`, `added`, `expiration`, `permanent`) VALUES
(1, '8549-26205', 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f', NULL, NULL, NULL, NULL, 'ip:86.221.93.65', 'JteRushEnQuamis', 'H I KYZOO', 'CHEAT', 1757712368, 'Fri Sep 12 23:26:08 2025', 1757712368, 1);

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

INSERT INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES
(224, 'license:ca0a679b80bb292d86cfb8bad759f1026db4ece0', 'license:129eb4d7228f3ab6ea1af825257f9d5c91e9cf72', 'society', 'mecano2', 'Ls Custom', 185750),
(249, 'license:5a7ef1803d1599a20ec1b4a833be3eaf66d12e67', 'license:990107d100e47c1876c058d12be837449159f661', 'society', 'unicorn', 'Unicorn', 100000),
(250, 'license:81ed811166d7d48b18895dd9de3965b6ee9bfb74', 'license:990107d100e47c1876c058d12be837449159f661', 'society', 'unicorn', 'Unicorn', 100000),
(376, 'license:03d6f0e1765a75f940b46a6dd382e333d6156ad8', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'mecano', 'Benny\'s', 1500),
(436, 'license:0bf63158a66b4cae5156e32dcff191a2aec13226', 'license:75dcacba70de0958b65834f65c8d5b594ceee500', 'society', 'mecano', 'Benny\'s', 2000),
(458, 'license:c341b1ab37d1fc8c6c43ca26bab3d42daa29aeac', 'license:3374fdc966455e2070518e284507d66ce2b8d3f2', 'society', 'unicorn', 'Unicorn', 10000),
(462, 'license:9ce2e1a3bb7d12b813d40a73fc05787d30de206b', 'license:0009f0849ee47d5130455edc8738297b960197eb', 'society', 'mecano', 'Benny\'s', 1000000),
(472, 'license:6045933713352a4c67cbee619eff87a04d16fbc4', 'license:6a6ff47d5ad13997de84ad2f317be2daf5547a67', 'society', 'unicorn', 'Unicorn', 2500),
(483, 'license:37f3856425373ae876d1fdac50dd27e4cccd7800', 'license:3374fdc966455e2070518e284507d66ce2b8d3f2', 'society', 'unicorn', 'Unicorn', 150000),
(496, 'license:ba5d14a677c4e56b35b2d7c0e5b243d388bed888', 'license:dc25f86736c4674860290e70efb3dae974c593fb', 'society', 'autoexotic', 'AutoExotic', 1000),
(514, 'license:27ef128b15f21b3f4ce85be0e64a182dca7605c6', 'license:3374fdc966455e2070518e284507d66ce2b8d3f2', 'society', 'unicorn', 'Unicorn', 100000),
(515, 'license:ac4bee262f6a35ad3dd165e7f10283a5c54cf565', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 4000),
(573, 'license:9c6a87b2314428779f1ac986ead8e92ca6c84ad0', 'license:4718b7033ae7e67af0781c723abf3e6aeafec7af', 'society', 'ambulance', 'Ambulance', 5000),
(618, 'license:d6b909ae96f67fdddc79318de4d1c0d9c5c0727a', 'license:4718b7033ae7e67af0781c723abf3e6aeafec7af', 'society', 'ambulance', 'Ambulance', 5000),
(662, 'license:e7afa32641b12c882eb9ddf0df86579434887274', 'license:fcecfe30e9ae2bb32d40b7fa9e0e4d8c317a540c', 'society', 'mecano2', 'Ls Custom', 750),
(667, 'license:c0c01dfad835c90acfcd8ca9b638f0d17fdf6259', 'license:8a471e919d7a37c21d2384a0d7f442741a971591', 'society', 'ambulance', 'Ambulance', 5000),
(675, 'license:565b081cd9306660d4fcedbef8ec34739bb0ed6a', 'license:3374fdc966455e2070518e284507d66ce2b8d3f2', 'society', 'unicorn', 'Unicorn', 150000),
(692, 'license:4776bfb4a0e6bd4bd87d9a1592602b7ef748ef47', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 750),
(694, 'license:76571224eaa308f33d62e07a833868459bad7ff5', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 750),
(696, 'license:d3e4fdaac8a3f5be0d0c57f3aabbf24f837c8a69', 'license:1a7fa3d59e04a8fcff8af44482c3d8a920ccc4bf', 'society', 'autoexotic', 'AutoExotic', 500),
(708, 'license:7c96518c27e6433a61dfaa769e32ff7ce0d58630', 'license:dbb7a2adb46b066ef000720d5ea547a28fb6b959', 'society', 'ambulance', 'Ambulance', 5000),
(745, 'license:c27e451408bc9e4a164f53f9cebb47fdd1eb2a2e', 'license:c341b1ab37d1fc8c6c43ca26bab3d42daa29aeac', 'society', 'mecano2', 'Ls Custom', 90000),
(762, 'license:b12aeaa8aada3b0ef9279ab324731c8719d91290', 'license:8a471e919d7a37c21d2384a0d7f442741a971591', 'society', 'ambulance', 'Ambulance', 5000),
(767, 'license:fe9c1b8252ade87f3843bc96a76ac78d2c510363', 'license:dbb7a2adb46b066ef000720d5ea547a28fb6b959', 'society', 'ambulance', 'Ambulance', 5000),
(786, 'license:eee70ff1aa6b068938dd907c99a3c0a471dc9b36', 'license:dbb7a2adb46b066ef000720d5ea547a28fb6b959', 'society', 'ambulance', 'Ambulance', 5000),
(805, 'license:3320e9bb626fab38915fa74197d776c08226f147', 'license:dbb7a2adb46b066ef000720d5ea547a28fb6b959', 'society', 'ambulance', 'Ambulance', 5000),
(912, 'license:4479920449b43bdb0e85783b821d6851e1f65f33', 'license:719eb63806746adc24d3372df6767bfa6c111200', 'society', 'ambulance', 'Ambulance', 1000),
(914, 'license:8bebf20d39581893d711490aed3ab1bf7a6c8fde', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 750),
(918, 'license:3028583825416c22d2984ff8d01a7635e6b9a086', 'license:183813b8ebdb1f447bd7e2c04197693a5848d629', 'society', 'ambulance', 'Ambulance', 2000),
(926, 'license:628f94310c7d29d5ae57900f338f39298f14babd', 'license:183813b8ebdb1f447bd7e2c04197693a5848d629', 'society', 'ambulance', 'Ambulance', 2000),
(934, 'license:d886151932b075cbb28299c2c270cca13901a990', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 4700),
(949, 'license:8704caa90e2753cd520518c00933dcd9bc21db87', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 4700),
(955, 'license:064adad8d9e530c58988e9156c3131a0165bcc7a', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 9000),
(969, 'license:e4c436ca67440cbae089be85768c43c63c53e295', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(972, 'license:591c19a5735234db550c19f61e2a66550b98d4da', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(977, 'license:0a3d16c6266d57c9b2e8e60796e8eea668360eec', 'license:719eb63806746adc24d3372df6767bfa6c111200', 'society', 'ambulance', 'Ambulance', 4000),
(982, 'license:1761cecc3b8f13b5f95d7359a46af832721f301d', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 9999),
(986, 'license:84ec14209589bad343164d0a3599fa08b2fdeeb7', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(992, 'license:f6e2921adee6b787d40e5e3bf595feccedc641ac', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(994, 'license:f0faa5d8c5c6d3eb62df44354693993d7470c26b', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(1005, 'license:7cbe74316a86d67d000e7142a73926028e2175be', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(1007, 'license:db8a7b452736736cef6aa9155d1660080814b411', 'license:719eb63806746adc24d3372df6767bfa6c111200', 'society', 'ambulance', 'Ambulance', 4500),
(1013, 'license:6f4fc32173ff863c4a8213b0b5a535e478f1e8b6', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 5700),
(1028, 'license:c89c7c309b634afbd3a3b7075e570d75f6cc7995', 'license:183813b8ebdb1f447bd7e2c04197693a5848d629', 'society', 'ambulance', 'Ambulance', 3000),
(1037, 'license:c864ed5a5b44b8aa12aabc5d6ebfe0edfeef841a', 'license:dbb7a2adb46b066ef000720d5ea547a28fb6b959', 'society', 'ambulance', 'Ambulance', 5000),
(1068, 'license:4b81abc4cfd85ef52855bdd6b24d8bfcbf7968f9', 'license:3dd827b24892a4dbf8e0b90abbfaad1bb4878cee', 'society', 'ambulance', 'Ambulance', 5000),
(1079, 'license:67d7f6ef151d9bd1b9c473c662e7f430aeacf379', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 1400),
(1115, 'license:4fc86a0bf1b67ed7d321e9a3d55279deab279848', 'license:37b09e2fdb6def73168ed6ee4e3d24d230dccb33', 'society', 'mecano2', 'Ls Custom', 2000),
(1127, 'license:56c15d157074c06405dc948a48f050279e692ef8', 'license:c809fbef7fa84bf978a4492ba7257ff684027b98', 'society', 'mecano', 'Benny\'s', 1000),
(1213, 'license:509502d482dd4d0bd295379210215bf0cfbcbf9d', 'license:3f2ef4438c1bebffbff938d3cd5992ecccc2a5cf', 'society', 'mecano', 'Benny\'s', 1000),
(1218, 'license:d84842d26aa8d3a5ff824ddc9ae93cb98d14401d', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 9999),
(1259, 'license:1527292f990d8ae74439b3535554786d30e30fe3', 'license:219c8b66bbd8c9abc7c7a9c91986b1e38ef1f911', 'society', 'ambulance', 'Ambulance', 9999),
(1329, 'license:acf4fe77ea7abd4da15afa92572771f1a6bf4bb5', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 2500),
(1336, 'license:1a5edabfbaa0a37286ede8d6326077f1f6c4992a', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'ambulance', 'Ambulance', 3500),
(1338, 'license:b6a960185c55b4e8107d71f58731a01c180c1e35', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 3500),
(1345, 'license:e29614725bd8940c530a48380a123f45f4ba0cba', 'license:49000ac324e1035712ee9868346629d208e6406d', 'society', 'ambulance', 'Ambulance', 6500),
(1346, 'license:6cb39d4bcd9bc5ca4d63e3e69258de48acbd35c3', 'license:49000ac324e1035712ee9868346629d208e6406d', 'society', 'ambulance', 'Ambulance', 5000),
(1351, 'license:026dd8e9eae83c66997eceab25a98f926165a89c', 'license:49000ac324e1035712ee9868346629d208e6406d', 'society', 'ambulance', 'Ambulance', 5000),
(1357, 'license:3ccc6fa0dde65c5d806f1ee1c7bc24714e18c812', 'license:e8702506de4c6a3e3008202c69b72d362c69c31d', 'society', 'ambulance', 'Ambulance', 5000),
(1393, 'license:f75a049392ac7b270ea31e22028ecf9b82e96f51', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 2000),
(1398, 'license:c1ad3138b7392eee9650d4eee03833185a2c4530', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'ambulance', 'Ambulance', 1250),
(1405, 'license:743d21263d5cdd3a48706da7b882880a3a72d1ab', 'license:e900ee8198b90f286f2be3155f98e75e9659daba', 'society', 'mecano2', 'Ls Custom', 999),
(1413, 'license:6bf617a08791ebe5e21565a9db84506d6fee444d', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 2000),
(1422, 'license:44cb666cd87ae164030dfd27e8ad0facd7f972b4', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 3000),
(1425, 'license:e0a77ce62ad3e36dce5a4dcfce132f5cd3b30fc0', 'license:03a54d22cb209e462f317fdeb3cf7be1a0b50129', 'society', 'mecano', 'Benny\'s', 1000),
(1435, 'license:06f4b4ce9150237eb38e5e3569a28c757d0b3fda', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 5000),
(1438, 'license:0efc24db5c6dbc070f6e609b6f05ff6dc053bab5', 'license:10332b10077007aa5b33d0d417cd2e099472b776', 'society', 'mecano', 'Benny\'s', 1000),
(1465, 'license:cdaa467be92fe01a12b76249605492526f3dda92', 'license:374711dcb39b875e148dac664fdf105bcacffe07', 'society', 'ambulance', 'Ambulance', 2500),
(1501, 'license:ad30473bb6c166cd5ac66e5e70e683e4a7b610b2', 'license:10332b10077007aa5b33d0d417cd2e099472b776', 'society', 'mecano', 'Benny\'s', 1000),
(1520, 'license:0a3d16c6266d57c9b2e8e60796e8eea668360eec', 'license:a4947ba20d1a5fa98421b026043c2d5363861e1e', 'society', 'society_realestateagent', 'AgenceImmo', 1000),
(1587, 'license:615ba725cd60785a38038d2d9262c3213b0cef02', 'license:03a54d22cb209e462f317fdeb3cf7be1a0b50129', 'society', 'mecano', 'Benny\'s', 1000),
(1598, 'license:565f40b6131bd5a70585204303aad8dd6f0aaea6', 'license:ea02dd49e5ae38393ced082242eff25477419fc1', 'society', 'mecano', 'Benny\'s', 1000),
(1625, 'license:93b24fee5e7c9298ca2c447ce9aca335fe69880a', 'license:22129576d0bdb9d675f642f1c03bd9d3496babd2', 'society', 'society_realestateagent', 'AgenceImmo', 450000),
(1649, 'license:03a54d22cb209e462f317fdeb3cf7be1a0b50129', 'license:2c223add12b238d468ce710084ce4cc69228f482', 'society', 'mecano', 'Benny\'s', 1000),
(1678, 'license:1d8207adce4e589c14ce2260202f49545a8efa6f', 'license:2c223add12b238d468ce710084ce4cc69228f482', 'society', 'mecano', 'Benny\'s', 1000),
(1707, 'license:b7cce05eaf258dbabd28b59a4f5b6ea197079a47', 'license:1d8c692f0d8ecee989180bfa84f46a0f6dba2c84', 'society', 'mecano', 'Benny\'s', 1000),
(1713, 'license:8a6f69f3d1f5ccab1c8646cede229a17767d3234', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 500),
(1721, 'license:16edb28bb9865fa17cdd5ddf5d819891f9e9056d', 'license:ea02dd49e5ae38393ced082242eff25477419fc1', 'society', 'mecano', 'Benny\'s', 1000),
(1726, 'license:91581bee68a441db771cfe2ffb9cff8192a0935b', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 300),
(1824, 'license:fd8d4acf64e88d8dcf3de8cf05c959d059be8762', 'license:03a54d22cb209e462f317fdeb3cf7be1a0b50129', 'society', 'mecano', 'Benny\'s', 1000),
(1916, 'license:17cd7c6834adae53bb7d7b2f5e8ee3b6f0cc58a1', 'license:7e0859d9f8aca1be3690587295e3c0dd0bf9d197', 'society', 'mecano', 'Benny\'s', 2000),
(1931, 'license:3f6ef20ca71a174440be809d1944a4d9fa79c446', 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'society', 'mecano', 'Benny\'s', 1000),
(1981, 'license:71b69e41cdbadaf61a1fecfaecd0541fd3754fb0', 'license:f54cdb9b833eaa8f530e45b15fde0fd4c694553d', 'society', 'autoexotic', 'AutoExotic', 1500),
(2040, 'license:136f4d49a5ca6d661b124793b1d64cd2a1556328', 'license:b4648b9f3ccc8aaa6eb4f48db3909657eaabd19b', 'society', 'bahamas', 'Bahamas', 5000),
(2073, 'license:f4953ec8f186768f4487201c6cf0c3c0170fb2da', 'license:056d2b334a5d1ed5690d75ac46cc95d52a0a5269', 'society', 'autoexotic', 'AutoExotic', 1000),
(2089, 'license:f693e6c81ca1ff1af2afbd74602fb61d7a5e70cd', 'license:0407e7867d027a51a521be7612e0b9dc468f1eaa', 'society', 'mecano', 'Benny\'s', 1000),
(2099, 'license:3374fdc966455e2070518e284507d66ce2b8d3f2', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'ambulance', 'Ambulance', 5000),
(2119, 'license:9d2a40629adbdead220df2a17dba7985790df476', 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'society', 'mecano', 'Benny\'s', 1000),
(2164, 'license:27bdef4aa356434c2e0f69e2df3309551c112999', 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'society', 'mecano', 'Benny\'s', 1000),
(2211, 'license:10110287e6ecc4778f2bc8f5f97627dfc7589e8d', 'license:ff839fc77285da0b57cede9d3db8a4cb8e56a2a6', 'society', 'ambulance', 'Ambulance', 1500),
(2212, 'license:ebe09475ad6362c2a11c1f0b8b771f907fe7e348', 'license:ff839fc77285da0b57cede9d3db8a4cb8e56a2a6', 'society', 'ambulance', 'Ambulance', 3000),
(2213, 'license:5d2c09ff6860c27dd957b0b8e271150d9456702c', 'license:ff839fc77285da0b57cede9d3db8a4cb8e56a2a6', 'society', 'ambulance', 'Ambulance', 1500),
(2238, 'license:bae7b6506e2ae28227ee21a3c2b8a9793bedb184', 'license:4718b7033ae7e67af0781c723abf3e6aeafec7af', 'society', 'ambulance', 'Ambulance', 2500),
(2279, 'license:0af895c4b3bc639e87026f8fbe8a266d456862f9', 'license:b4efa4731c8814dcb0ec1cdaf474691dae11ced8', 'society', 'larrys', 'Larrys', 5000),
(2293, 'license:f2cf8eba26e4d51804ddc3aa995ca6284f6493a2', 'license:c67194b37651887c5aa0d0d87203cb4e0ff4aebf', 'society', 'larrys', 'Larrys', 2000),
(2329, 'license:90e900b3193844942a468689878713661ba3d8b2', 'license:b4efa4731c8814dcb0ec1cdaf474691dae11ced8', 'society', 'larrys', 'Larrys', 5000),
(2331, 'license:34e396a86038d0284c501081df7ea236ec9bdcbc', 'license:d50f38ed148f510704665eb07a56b0b43e544d3f', 'society', 'ambulance', 'Ambulance', 9999),
(2344, 'license:5af3b9984b3d232010c98756b24f61d4a469700f', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 1500),
(2427, 'license:4fc436db975a990c4ae3b0268938dd7f2f20a279', 'license:6aa69b1bc8c1f5af088caec06c3081b96405b6d7', 'society', 'mecano', 'Benny\'s', 1000),
(2468, 'license:5f16b6c670e16f29b02879f6ea41471a6d968258', 'license:6aa69b1bc8c1f5af088caec06c3081b96405b6d7', 'society', 'mecano', 'Benny\'s', 1000),
(2495, 'license:2b9f35918134bf6b18934d4cadec59a9170fcde3', 'license:beb4eb988f059358cd353141084078ef93c1ea14', 'society', 'mecano', 'Benny\'s', 1000),
(2524, 'license:ab2b60115becec221399c0e6dfe9d2fbc4e05580', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 1500),
(2536, 'license:5bcba2e7e734a68645bdbf505269b8d6f9fcb319', 'license:55633c5ed820cfa78ab36f6bc9b02d5f522ec077', 'society', 'beanmachine', 'beanmachine', 3500),
(2611, 'license:ead057abd554a7ae78ea08662615aac2455e4241', 'license:ec2d51a212f6270509f2c98e86c09a2bd9789e09', 'society', 'mecano2', 'Ls Custom', 2000),
(2615, 'license:131826acf42c1edac524ef3b282765d84a7dd26b', 'license:10381fe556e6da8a45406d4072ec7412b973064c', 'society', 'beanmachine', 'beanmachine', 25000),
(2697, 'license:2497ebb2936312f9a94657ec987072da3e5d5581', 'license:ec196f64c46825160e071e1b9858b0f2f4796573', 'society', 'mecano', 'Benny\'s', 1000),
(2726, 'license:23afbbd589c4a3d76a924e372670b2cc20ff3c2a', 'license:0c9beb9cf016c5d203b0719841f1b2e800d07f13', 'society', 'mecano', 'Benny\'s', 1000),
(2775, 'license:25dc9f5b254029c813e68101c978c50cf6eef79d', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'ambulance', 'Ambulance', 2546),
(2782, 'license:5ecb5a8a936175ea5a45534c9578b477bd3025be', 'license:0c9beb9cf016c5d203b0719841f1b2e800d07f13', 'society', 'mecano', 'Benny\'s', 486000),
(2870, 'license:4c842e40c28e119060f14920ed95fbe2974539ff', 'license:3a227ba87af9bc048544e4687e8122b9d1cb406f', 'society', 'ambulance', 'Ambulance', 4000),
(2963, 'license:9ae264d1064b3879e3e5465a7238421b5288f661', 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'society', 'mecano', 'Benny\'s', 1000),
(2967, 'license:9b007cc82e9a4b741a983e6871b5d1f613aa5fd2', 'license:992a9d318863137fba6c8c551ec018a37029d2d9', 'society', 'mecano', 'Benny\'s', 1000),
(3024, 'license:b647678adc6850cee0748a023566024915d01622', 'license:3a227ba87af9bc048544e4687e8122b9d1cb406f', 'society', 'ambulance', 'Ambulance', 3000),
(3034, 'license:9e9625dbe1c52887b49186c6b7a83fe00c6cd843', 'license:d0f8955047c52b2c790800921f1f2a64ae751ab5', 'society', 'mecano', 'Benny\'s', 1000),
(3053, 'license:647558ca81d0293d270d0b7b1ebbf3590eca8d3a', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 2000),
(3072, 'license:a3d351bd85411971f3caea17b3d0525df97ba0a7', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 3000),
(3092, 'license:6fcdc544aff8f71ab82a23852a8e13c93ed590a7', 'license:3a227ba87af9bc048544e4687e8122b9d1cb406f', 'society', 'ambulance', 'Ambulance', 5000),
(3134, 'license:d6f08a616b57148cfb03a58df2e16f00d12abab7', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 7500),
(3149, 'license:339e81f40461530dd31745e934c464b105eb7692', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 9999),
(3154, 'license:4faa1713f864350530de4017039d642f3e23c749', 'license:eac3acc90fe8a8d7ac3a5a7e907ebdcfcf33d69c', 'society', 'larrys', 'Larrys', 2500),
(3156, 'license:c8dfb382d85182735dafe5dfc43e820652ee767d', 'license:3e3d74b19f5c599b793ac15f2a5f2c3236dd5e96', 'society', 'mecano2', 'Ls Custom', 3000),
(3205, 'license:b963ff6faee7316e3fbb04429e0713653c4120c4', 'license:d5252a0307ab96eadf534c7f8faadbbd28668e47', 'society', 'autoexotic', 'AutoExotic', 1500),
(3238, 'license:f242941454bb237c504be93949b9c62a291967b0', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 2500),
(3240, 'license:09714c4a2e8d658c9cb02201995db4fe16318d85', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'ambulance', 'Ambulance', 9999),
(3258, 'license:d62dc4051888d49cd507e6d3f4cfbe9a6943ec57', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'ambulance', 'Ambulance', 5000),
(3368, 'license:2cc95e821de90e7688665f53d2e67f3a77efcaf5', 'license:fa46be5a111eec5439f5affcf943af27a178055c', 'society', 'club77', 'club77', 200000),
(3379, 'license:0b1fcac18b4491e1626de19a0f7ad75bc9c1c12a', 'license:415b0f1c8d732e8f413e5bfb897c9c9c4bba7d7e', 'society', 'ambulance', 'Ambulance', 2000),
(3388, 'license:5215e309424b0dd3114d97e0c2bd199fc11e3d5f', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 500),
(3426, 'license:2b254fef35ae6f7895dd796249d5e302945b078e', 'license:c46da29705b3d7f695ec7f0286374bee88d346c5', 'society', 'unicorn', 'Unicorn', 2000),
(3456, 'license:5906ab8d14619dc3a5e9ae6e1c0779651f9bec85', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 2000),
(3465, 'license:820280bc67d6d94cf0eab4b7d3a82f1cb8c1423c', 'license:dd2c8b9f986592b23b2ff12552eed0f54b283148', 'society', 'autoexotic', 'AutoExotic', 1500),
(3474, 'license:c34c20d4d38f8e4f73dbd5bd7cb96448cac7e2c2', 'license:c36a6508c9e2092c1c4e6890177a097e58355a72', 'society', 'ambulance', 'Ambulance', 7500),
(3525, 'license:b7ae87640b66b6e80bb706e05b23718e78ccf740', 'license:3581cd17d91447461f4aabb52a869ae0860cdf68', 'society', 'mecano', 'Benny\'s', 1000),
(3558, 'license:fc90a365cc7c2a9bef32b1f14138ba5fb4374d99', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 1000),
(3653, 'license:0c44bf893d6f576ee5dc2ae01becd54890188bc0', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 3500),
(3712, 'license:e62c49b1f25daa5c680298dc847a791b487f35a5', 'license:0bde5bddafebe7d6ad93b9056dfef81b4548aa1e', 'society', 'mecano', 'Benny\'s', 1000),
(3724, 'license:40cacf25038269e92cf3b1ff98ced5e7b04f74f8', 'license:e901b63e5dc5b846047228e05086cef701ffa2f5', 'society', 'mecano', 'Benny\'s', 1000),
(3825, 'license:95189451efc91b6806358476fe067966e1f3cf9d', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 3100),
(3834, 'license:e3f2404e2d0c9cd5a7fb3042b5f1fcc9fc06b459', 'license:ec65e13383b200edb35d3e681a77933190c0a356', 'society', 'bahamas', 'Bahamas', 5000),
(3863, 'license:4c6b9b46ead8081ec6e86bc35cd2e5abe0260fcb', 'license:543d0aa836aeba3f4bd3055db4c8af2d8d5202a5', 'society', 'ambulance', 'Ambulance', 2000),
(3919, 'license:f3a40f9527471e302c725d4b03b0717a4fdda2cb', 'license:dd2c8b9f986592b23b2ff12552eed0f54b283148', 'society', 'autoexotic', 'AutoExotic', 2000),
(3967, 'license:8ad74deee5308bca3e45c2adc0504a3b24088259', 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'society', 'mecano', 'Benny\'s', 10000),
(4059, 'license:834449e64d145140300b96d03f7b99d0f5c24b54', 'license:51cf1b7cb57bc96338d9a088c36bb739cedabdd9', 'society', 'mecano', 'Benny\'s', 1000),
(4060, 'license:fba03d83799a1ba8cebacc25026c26526677d0c8', 'license:7ab8b58018a73b18f7957ab1561356a25d0dba3d', 'society', 'ambulance', 'Ambulance', 2000),
(4062, 'license:c8c5482e836dd0f0395a751d1f8dcd930036f8c7', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 800),
(4077, 'license:34bcd123b2d9e62b46a8b09680162d896fd79373', 'license:6caeec777267cd716b8ef935b01864deab9718eb', 'society', 'taxi', 'Taxi', 1500),
(4135, 'license:90b6978d83b1773678b30ce73fce2c97d4c20f83', 'license:dd2c8b9f986592b23b2ff12552eed0f54b283148', 'society', 'autoexotic', 'AutoExotic', 1500),
(4143, 'license:a02d9882ed9c88a411edaab411bf3b28c537895c', 'license:bd35490d07fd1ec674542556120484f9bea8ba0a', 'society', 'mecano2', 'Ls Custom', 2000),
(4188, 'license:0974cc20f24351275169343977d272a1df161229', 'license:90b6d322321076505465330066dab133b8ed455f', 'society', 'mecano', 'Benny\'s', 1000),
(4235, 'license:82c39336a2961c35905574eec37fa7b20533b9c1', 'license:3f1a4c833c17ae336328509d0c94d835be945429', 'society', 'mecano', 'Benny\'s', 1000),
(4260, 'license:5be4628db24ed1757c4f08f033cf1ba748ffea65', 'license:b5ed48cdb76ab94137cbdad6b19a806b7e23ef54', 'society', 'autoexotic', 'AutoExotic', 1000),
(4265, 'license:7cf82beea2751b4869ad544c1081ce11e8be93c0', 'license:4a88154ee9f7220e83fe57a1c47b5747279fbd01', 'society', 'mecano', 'Benny\'s', 1000),
(4346, 'license:1a093deee7cef3065bc667825354c71f4f657707', 'license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'society', 'mecano', 'Benny\'s', 1000),
(4429, 'license:0c120bada226523224cacd497f4d6db0a43948e9', 'license:888cc6a4e84b4d4920423a5c913ebb6ad69f3548', 'society', 'gouv', 'Gouvernement', 7000000),
(4434, 'license:26aa2225d3ed32fa2a75ebcd24f21f1310feddd1', 'license:44276e3cf553d18a2ecb062b8b620c1ba356698d', 'society', 'mecano', 'Benny\'s', 2000),
(4436, 'license:9c7a3bae70695b66bf901598ed8e7d99be3a0ace', 'license:7f41d245b3956ceb329909a07e1f029697b42f0c', 'society', 'realestateagent', 'Agence Immobilier', 150000),
(4602, 'license:32c7dc8eedaaa33bd8fbc894467ce0ee909a1e41', 'license:5be940699b383252a8f73d6bd29f8b5095ae427c', 'society', 'mecano', 'Benny\'s', 1000),
(4675, 'license:3e24f3704024eba06bb414abfac5b59e48ea9948', 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'society', 'mecano', 'Benny\'s', 2500),
(4686, 'license:bbf87eed68647e37f7be1c70bf3bbc531a5e298e', 'license:5be940699b383252a8f73d6bd29f8b5095ae427c', 'society', 'mecano', 'Benny\'s', 1000),
(4723, 'license:98e1a942b5b7e8d7bd004e012a69ba8ba37f9dae', 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'society', 'mecano', 'Benny\'s', 1000),
(4731, 'license:888cc6a4e84b4d4920423a5c913ebb6ad69f3548', 'license:2ebad25eb0458ca2d770ffe59ed8a723f6ff3be6', 'society', 'bahamas', 'Bahamas', 3000),
(4796, 'license:9fac6e8df6183c48e5667afa73c48c1f6134820d', 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'society', 'mecano', 'Benny\'s', 1000),
(4800, 'license:faf511cd1ad929a9bde02dfc922c32c7514eaa27', 'license:5be940699b383252a8f73d6bd29f8b5095ae427c', 'society', 'mecano', 'Benny\'s', 3000),
(4801, 'license:4ca5817b7d439847d1c6eac93042e1641b57a55e', 'license:5be940699b383252a8f73d6bd29f8b5095ae427c', 'society', 'mecano', 'Benny\'s', 1000),
(4891, 'license:5222a97946bb4bf0dfab758930cc890482681dd1', 'license:f853ce8e5c4562dedfafe96cf6c82532ea95b821', 'society', 'ambulance', 'Ambulance', 1500),
(4893, 'license:f6e50e6c8141d6cca89cd3a63761394836f29edc', 'license:5be940699b383252a8f73d6bd29f8b5095ae427c', 'society', 'mecano', 'Benny\'s', 2000),
(4895, 'license:25c568740dfac8759625519a430022a23ec7ba8d', 'license:ca6f4243cbbf5c8e41b8eb3cc42203be0ec20eba', 'society', 'mecano', 'Benny\'s', 1000),
(4896, 'license:c4a22d44053962b0c4bf7236a5db1b8a3376ae58', 'license:f6fea662c55bbfa743b6bec3e79684489e464cbb', 'society', 'mecano', 'Benny\'s', 1000),
(4907, 'license:9b3681f4a95b832bd98134b82b8bb4d23ed45eb7', 'license:f853ce8e5c4562dedfafe96cf6c82532ea95b821', 'society', 'ambulance', 'Ambulance', 2000),
(4915, 'license:f6835f8a13d308a480a328e2a5b0e1b759b48994', 'license:4a88154ee9f7220e83fe57a1c47b5747279fbd01', 'society', 'mecano', 'Benny\'s', 1000),
(4929, 'license:d3248eff5c84a0051aa489e5039dea2f78f5bd12', 'license:05577ec12d74dc746e65997c37c7309e45606477', 'society', 'autoexotic', 'AutoExotic', 1000),
(4958, 'license:bcdb97b64ecfd09b1a80680beadf070d604a8486', 'license:ea0fdfaa9953923b795488bd427cb8d873fa6eb1', 'society', 'autoexotic', 'AutoExotic', 1000),
(5028, 'license:d546a155645b5d7b644b68ac0f2a860bd5ca7cc2', 'license:f853ce8e5c4562dedfafe96cf6c82532ea95b821', 'society', 'ambulance', 'Ambulance', 7000),
(5089, 'license:13480bb92a2cd60284d6e1d7022b9636e4b33b18', 'license:9b577d35369450138f2093470d09aeb179ef8f71', 'society', 'beanmachine', 'beanmachine', 200),
(5100, 'license:ae596b89dac62ce714caf53e68c6c96237fa9eb4', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5137, 'license:06a4f1786e86ebb1491235341d02d7484476772e', 'license:06c2298ac60d5e2e77a54566e8d2c2e28e5dec62', 'society', 'ambulance', 'Ambulance', 5000),
(5169, 'license:74fab3a85633700d73a5de1f0e166dc91175b63c', 'license:d5252a0307ab96eadf534c7f8faadbbd28668e47', 'society', 'ambulance', 'Ambulance', 6000),
(5205, 'license:89754f4d308af96ff6072cdb94dbf08dcee1bb2a', 'license:ffc23e20938923b24fa21d4d3d40bb220fae2217', 'society', 'autoexotic', 'AutoExotic', 1000000),
(5338, 'license:0744e2910e964c1115f035ddf5ce5b4959926c53', 'license:f689565b783cca7dcc818f6a189e8f6e5d8eab1e', 'society', 'ambulance', 'Ambulance', 5000),
(5413, 'license:79b6ac8a0afa99495fdae3a64e6b444c487f5ec0', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5414, 'license:c286f8f52c9ffbc429d3e3b082b783a7dfb1de92', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5444, 'license:818ea21e315a5d2c0def5e75563dc69c38abcf53', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5468, 'license:c736c01a266205f6b8974ef686d2e9c680c0fc3e', 'license:30f6a3c80e73247d807bc72ef33c81bac49fd1e8', 'society', 'ambulance', 'Ambulance', 5000),
(5495, 'license:d4e0ac1a9eea37b59e313e86b82f4933d99d3e60', 'license:88398899f0bc1863cf9bef5ffe982bc59d2b4eb4', 'society', 'ambulance', 'Ambulance', 1000),
(5501, 'license:228ebfc00cd98f249db5bb6912d7800f3a55709d', 'license:ad4b9585640ad49bcbe7ea6d72c1592396340b7c', 'society', 'ambulance', 'Ambulance', 5000),
(5519, 'license:0d288cd2b0e6793f0eaef35c8bf9a7653853c612', 'license:ae029d5841a7c755d1066ceaa27b66ff62d4fa8d', 'society', 'ambulance', 'Ambulance', 5000),
(5522, 'license:e79f26cf47ea8adbdfba4940669ba67a5e20ed74', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5523, 'license:7421a93943205771f33512318d26b8522d5d632a', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'Ambulance', 2000),
(5554, 'license:11a3f15ef0cd80026d6ea88ea854219e1ecd651d', 'license:bc58ff344d7e583db6aa110dbfeb9e5bbf744f23', 'society', 'mecano2', 'Ls Custom', 3500),
(5559, 'license:06890d384ded385eed1eda3d8197866c838a97e8', 'license:13ef6d4582dffd11d26ec5d26770710eeb1a83a3', 'society', 'realestateagent', 'Agence Immobilière', 2100000),
(5718, 'license:0546649e4992daaa34226cdcb4a38a5ce0c41840', 'license:bcfcdc249deb1676289e39f8bb4840ebc9c76988', 'society', 'mecano2', 'Ls Custom', 2000),
(5733, 'license:6e4f6407a93db6c78f288aa3845d2fdece46becb', 'license:53ef27ba383d6ff93f6fbff7ba0ccec922f5e8ea', 'society', 'bahamas', 'Bahamas', 5000),
(5735, 'license:10d674664fee45d7d628ae8135ddc7cb9bf70d44', 'license:53ef27ba383d6ff93f6fbff7ba0ccec922f5e8ea', 'society', 'bahamas', 'Bahamas', 5000),
(5841, 'license:c38a5ab14fb255a350dd8c302c2b776f136aed31', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'ambulance', 2000),
(5842, 'license:a0f89b508fe2114bb851fe158e7230f81a9a4a1d', 'license:4aba057457609fe331df77868154a09c45734a41', 'society', 'ambulance', 'ambulance', 5000),
(5845, 'license:5a3e99f6a49157609cf760ea0c9284a9c6f5ca5b', 'license:4aba057457609fe331df77868154a09c45734a41', 'society', 'ambulance', 'ambulance', 5000),
(5846, 'license:1bcb2f8f413ebb3f30b437dc7e7017fb54d9c0f8', 'license:4aba057457609fe331df77868154a09c45734a41', 'society', 'ambulance', 'ambulance', 6000),
(5847, 'license:89191c5cac8003bb1b84bf830175727a5a396fa4', 'license:4aba057457609fe331df77868154a09c45734a41', 'society', 'ambulance', 'ambulance', 6000),
(5877, 'license:91c3d8104c4ed79ebf96ed65e0a6cbf9cf5a9906', 'license:eb6acfecca23d96283a2868b7d81c5785ab89b81', 'society', 'ambulance', 'ambulance', 1000),
(5887, 'license:78ad300022fdb7091ecbb5b41e1cab35d7571737', 'license:eb6acfecca23d96283a2868b7d81c5785ab89b81', 'society', 'ambulance', 'ambulance', 1000),
(5888, 'license:38906927c25d9b3d6d1fcb32d50149f833bb6f2c', 'license:eb6acfecca23d96283a2868b7d81c5785ab89b81', 'society', 'ambulance', 'ambulance', 1000),
(5894, 'license:bb7febe3db4453a238e02e61b4961948496933dd', 'license:084e5cfe5971795695079135ff5315b1574c8461', 'society', 'mecano2', 'Ls Custom', 2000),
(5896, 'license:d4c048cadac08972334dae10a31d424f8177f457', 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'society', 'ambulance', 'ambulance', 6000),
(5915, 'license:cfb18d050a330696ac71008ea1d09f4279c91a0a', 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'society', 'ambulance', 'ambulance', 1000),
(5916, 'license:82b355d263d8d326df95ec75fb84ec23b5dedd15', 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'society', 'ambulance', 'ambulance', 1000),
(5933, 'license:f931b67fe313990d73f5046b0f78907742766c8e', 'license:eb6acfecca23d96283a2868b7d81c5785ab89b81', 'society', 'ambulance', 'ambulance', 5000),
(5936, 'license:dbe0b6fb18724ad4c03f9b55726f299679d1138d', 'license:3e3d74b19f5c599b793ac15f2a5f2c3236dd5e96', 'society', 'mecano2', 'Ls Custom', 1),
(5943, 'license:ff839fc77285da0b57cede9d3db8a4cb8e56a2a6', 'license:c73c2874e8d94975757b3bc0c290686db3203c43', 'society', 'gouv', 'Gouvernement', 5000),
(5946, 'license:114eb614acbeefbe23972c8c770f77e2c0980a49', 'license:430d0a8677c1ea13776b56560271e460c6a18a9d', 'society', 'realestateagent', 'Agence Immobilière', 5000),
(5969, 'license:c809fbef7fa84bf978a4492ba7257ff684027b98', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'ambulance', 5000),
(5978, 'license:6648b3c221b9f2db934923bc789b09afd6c83045', 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'society', 'ambulance', 'ambulance', 1000),
(5984, 'license:889f0d96d7e5b365c6921a856b44258bb17c0868', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'player', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'Ambulance', 500),
(6002, 'license:b2b58b25147bd6bb7367da9e6d606d9dbfb5ae28', 'license:42b4ed4d68aa4c1e3698985fdc4140d6614cbbd1', 'society', 'ambulance', 'ambulance', 1000),
(6054, 'license:1bebe471acd8cc3240d8e8dd727bbfd180025b6a', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'player', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'Ambulance', 6000),
(6055, 'license:c6bb1583ac7c5c84670d018f4608bc48fb087046', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'player', 'license:9f448c1074f27ee973af04a9f2b2be247d7c540f', 'Ambulance', 6000),
(6063, 'license:eea19740d2664f85d7a3705dc776140c9e6353d8', 'license:1b64a60e8afbd2d4ccaad54dd1563f228d2b9ff0', 'society', 'ambulance', 'ambulance', 2000);

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

INSERT INTO `casier` (`identifier`, `Prenom`, `Nom`, `naissance`, `raison`, `auteur`) VALUES
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'emiliano', 'fernandez', '29/11/2000', 'braquage de superette', 'lborg'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'ibrahim', 'larech', '07/02/2000', 'outrage a agent, delit de fuite, refue d\'obtemperer', 'lborg'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'basile', 'galette', '23/01/2000', 'intimidation physique sur agent de l\'etat', 'lborg'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'ousseman', 'smith', '04/12/1999', 'tentative de meutre sur agent de l\'etat, refus d\'obtemperer, trouble l\'rodre publique', 'lborg'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'Antoine', 'Ravier', '17/12/1997', 'road rage/ port d\'arme illegal', 'Captus'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'raes', 'diaz', '11/06/1999', 'port d\'armes illegal', 'lborg'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'yzcine', 'lassari', '11/04/1999', 'prise d\'otage sur agent de l\'etat, tentative de meutre sur agent de l\'etat, deluit de fuite', 'lborg'),
('license:f8c6e6dae9b85089114fe7b75f090a79d28caf06', 'Rayan', 'Santana', '11/11/1999', 'Tentative de meurtre sur agent de l\'etat, Tire sur agent de l\'etat, refus d\'obtemperer ', 'baro'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'Mouloude', 'aboudabi', '23/01/1987', 'braquage de superette', 'ouioui'),
('license:a5681a4b1474ef335eaf9630953801494d0f6026', 'Rayan', 'Medosa', '23/06/1999', 'Tentative de meutre sur agent de l\'etat x2 , recidiviste', 'Mathieu Valbuena'),
('license:1477427e34b223d110381ccdc3efb3d152b749ec', 'Leo', 'Garcia', '12/077/1995', 'refus obtempere ', 'tymeo'),
('license:f8c6e6dae9b85089114fe7b75f090a79d28caf06', 'Abdel', 'Chtaref', '19/02/1980', 'Tire sur Agent de l\'etat, braquage de superrete, refus d\'obtemperer.', 'baro'),
('license:8b397c8cedfb167692f68b452e110f4fdf1d7350', 'yusuf', 'jebarry', '13/03/2010', 'tentatif de meutre sur agent de l\'etat,  tire sur agent de l\'etat, braquage de superette', 'lborg'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'croco', 'Davi', 'x/x/x', 'suspicion port d arme', 'Captus'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'croco', 'Davi', 'x/x/x', 'suspicion port d arme', 'Captus'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'Alvaro ', 'Rodriguez', 'x/x/x', 'suspicion port d arme', 'Captus'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'Jack', 'Urus', 'x/x/x', 'suspicion port d arme', 'Captus'),
('license:7645077e3f89b072131b7a9366e0abe070926fc5', 'Livio', 'Lopez', 'x/x/x', 'suspicion port d arme', 'Captus'),
('license:f8c6e6dae9b85089114fe7b75f090a79d28caf06', 'Leo', 'Lipton', '02/06/2000', 'Braquage de supperrete et tire sur agent de l\'etat.', 'Hayder'),
('license:528f9c4d17eb9727f1b38c173a31ed210bdd5cc1', 'Baro', 'Madrazo', '27/02/2000', 'braquage a main armee, outrage a agent, tentaive de meurtre sur agent de l\'etat ', 'Strolex'),
('license:9ff7566dd165d36b78c13857c81dce01a7ba4347', 'Adam ', 'Salawi', '27/06/1999', 'Complicité de braquage, détention d\'arme de type fusil d\'assault, argent supérieur a 10000$, outrage', 'johan'),
('license:528f9c4d17eb9727f1b38c173a31ed210bdd5cc1', 'Travis', 'Brooks', '10/10/2000', 'Tentative de meutre sur agent de l\'etat, port d\'arme illegale ', 'Strolex'),
('license:8a471e919d7a37c21d2384a0d7f442741a971591', 'Miguel', 'Mirandez', '04/04/2001', 'Prise d\'otage sur agent d\'état', 'Pomme'),
('license:528f9c4d17eb9727f1b38c173a31ed210bdd5cc1', 'HAIDEN', 'valencia', '02/05/2000', 'Delit de fuite', 'Strolex'),
('license:4396d8be1382e3f181eb063516e35bcf45675581', 'Pablo', 'Bonito', '16/01/2000', 'conduite dangereuse + outrage a agent + delit de fuite ', 'Blue'),
('license:c92f70e392e104daeb65b30f416537a9d9592aef', 'rayan', 'bortye', '23/01/2006', 'tire sur agent de l\'état', 'neykoz.gf'),
('license:a4947ba20d1a5fa98421b026043c2d5363861e1e', 'Kays ', 'Kays', 'Kays', 'Kays', 'Kays'),
('license:a4947ba20d1a5fa98421b026043c2d5363861e1e', 'Kays ', 'Kays', 'Kays', 'Kays', 'Kays'),
('license:2eca20666e149434da58b6bdeb8e99c562532095', 'james', 'stark', '', 'controlle routier', 'Lawideee'),
('license:eee70ff1aa6b068938dd907c99a3c0a471dc9b36', 'andrew', 'pearce', '04/12/1990', 'braquage refus de contempairer ', 'yassin besaid'),
('license:2eca20666e149434da58b6bdeb8e99c562532095', 'JACKSON', 'SANTA', '08/09/1999', 'délit de fuite port d\'arme illégal', 'Lawideee'),
('license:dcf14d9b6bdfe16b1ab6d543330673908c8ab956', 'RILEY', 'LAWS', '10/12/1995', 'Prise d otage sur etat major plus delit de fuite ', 'OUELASTREET'),
('license:617dd87c57a13dc8bb8b403d52954e28af07562e', 'Jeans', 'Hary', '03/05/2000', 'Arreter le 15/12/2024 pour tir sur civil,refus d entanperer', 'alexb'),
('license:9da41b6ed4e61699340fb881663ff2073c5cb490', 'walid', 'brabus', '01/01/2000', 'gay', 'ILIES'),
('license:d5e92a346416599b9ce550a88873e8f5ca58c73d', 'Pablo', 'Diaz', '30/01/2005', 'delit de fuite argent non declarer', 'Sous3gDeJaune'),
('license:617dd87c57a13dc8bb8b403d52954e28af07562e', 'Jay', 'Woodley', '11/02/2000', 'Interpeller le 19/12/2024 pour prise d otage contre un LSPD et delui de fuite.', 'Adil Bahar'),
('license:c455c23736957833eeda27560964f5d0ee408096', 'Cris', 'Woder', '24/12/2000', 'Braquage + prise d\'otage', 'lorio_zy0mi7x'),
('license:fc90a365cc7c2a9bef32b1f14138ba5fb4374d99', 'CARLOS', 'DOSSANTOS', '01/02/2000', 'prise d\'otage, refus d\'obtemperer, posesion d\'arme a feu', 'Seña'),
('license:35037513499ad1e3b99ceb77fef6dd912572651d', 'NESTOR', 'LAWSON', '02/12/1990', 'Tir sur agent de l\'etat (lspd) + port d\'arme illegal', 'YarrHaut'),
('license:2fc1dd3876051ef90635482914e99e2e8b7ac21d', 'pablo ', 'diaz', '30/11/2007', 'arme illegal tentative de meurtre ', 'auria'),
('license:6caeec777267cd716b8ef935b01864deab9718eb', 'MEREYA', 'MARCO', '28/08/1996', 'fleeca deli de fuite', 'FHOVIX'),
('license:6caeec777267cd716b8ef935b01864deab9718eb', 'JUSKO', 'ORYAK', '12/12/2004', 'Délit de fuit', 'FHOVIX'),
('license:6caeec777267cd716b8ef935b01864deab9718eb', 'JUSKO', 'ORYAK', '12/12/2004', 'Délit de fuit', 'FHOVIX'),
('license:6caeec777267cd716b8ef935b01864deab9718eb', 'ALVAROS', 'TITO', '09/02/1986', 'Délit de fuit + pas de permis', 'FHOVIX'),
('license:666f90bfe9da71b245b0ccbe40925df87d2cf53d', 'RAYZER', 'LEROY', '26/04/2004', 'la personne a fait un braquage et ensuite a fait une course poursuite. il avait une batte sur lui', 'Alexoun17'),
('license:666f90bfe9da71b245b0ccbe40925df87d2cf53d', 'Lucas', 'MOHARY', '18/06/2000', 'la personne a fait un braquage de superete a main arme et a fait une course poursuite en passager.', 'Alexoun17'),
('license:666f90bfe9da71b245b0ccbe40925df87d2cf53d', 'Predro', 'Sanchez', '07/07/2000', 'braquage d\'une maison', 'Alexoun17'),
('license:63866f9a798530d4015f3e2e0f6942472ab2ac5f', 'akai', 'lingard', '20/12/2002', 'prise otage agent de l\'etat,braquage de banque,porte d\'arme illegal', 'SLAZE'),
('license:83603ce8fe59bfbea6d2ce46f146782c73f26a70', 'VAGOS', 'PUTOS', '11-10-2001', 'LA DARON A L UNDERSHERIF CETRTE PUTE ', 'RP? c quoi ? ^^ '),
('license:ddd7768a1f89ce68a4b7801c160bdc06ec7f8b0f', 'ZACK', 'FERNANDO', '10/08/2000', 'braquage de bangue et refus d\'obtemperer', 'dokisqr'),
('license:81aeae9b61c001a28ca87f9aa059b3d218f87e75', 'andrea', 'BART', '01/02/2000', 'cambriolage delit de fuite ', 'LAMIMI'),
('license:c91b60202aa79ca8cea5dcb9c9e4b5280502ec39', 'Kevyn', 'Doklas', '22/04/2000', 'braquage magasin Pas de permis d\'arme', 'M | Pchenitchnikov Alex LoKuZ'),
('license:f9c84195cc32d799d1ead76b8d494ec566e5f5e6', 'émille', 'louis', '01/05/2000', 'passager de course pursuite a de la weed sur lui et de la coke n\'a pas le ppa', 'vino itacho'),
('license:0c9beb9cf016c5d203b0719841f1b2e800d07f13', 'baro', 'ash', '27/02/2000', ' conduite sans permis', ' alexy lastar'),
('license:10381fe556e6da8a45406d4072ec7412b973064c', 'GABRIEL', 'Renée', '28/08/2000', 'Refus d\'optemperer , Delit de fuite , Exces de vitesse ', ' Snoww'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Stanislas', 'Dako', '26/01/2002', 'Braquage de superette , Délit de fuite , Argent salle sur lui', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Stanislas', 'Dako', '26/01/2002', 'Braquage de superette , Délit de fuite , Argent salle sur lui', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Louis ', 'Fournel', '17/02/1997', 'Braquage des superette , Délit de fuite , Prise d\'otage sur civil', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Louis ', 'Fournel', '17/02/1997', 'Braquage des superette , Délit de fuite , Prise d\'otage sur civil', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Jackson', 'Teller', '01/01/1997', 'Braquage des superette , Délit de fuite , Prise d\'otage sur civil', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Jackson', 'Teller', '01/01/1997', 'Braquage des superette , Délit de fuite , Prise d\'otage sur civil', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Mologusto ', 'Volkov', '25/08/2000', 'Délit de fuite ', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Mologusto ', 'Volkov', '25/08/2000', 'Délit de fuite ', 'HTD'),
('license:7e9e98e4cb32b328bb1a4113ec72e707ac7a30d0', 'neyvadius', 'demun', '27/02/2005', 'bracage de supérette', 'mathew'),
('license:7e9e98e4cb32b328bb1a4113ec72e707ac7a30d0', 'neyvadius', 'demun', '27/02/2005', 'bracage de supérette', 'mathew'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Maiky', 'Gleeson', '01/01/1999', 'Braquage de banque , Prise d\'oatge sur civil , Délit de fuite *', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Maiky', 'Gleeson', '01/01/1999', 'Braquage de banque , Prise d\'oatge sur civil , Délit de fuite *', 'machu'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'Shawn', 'hood', '11/12/1999', 'Délit de fuite,refus d\'optemberer', 'eternel'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'Shawn', 'hood', '11/12/1999', 'Délit de fuite,refus d\'optemberer', 'eternel'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan', 'Ako', '05/06/1998', 'Refus d\'op + tire sur agent', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan', 'Ako', '05/06/1998', 'Refus d\'op + tire sur agent', 'léo pheter'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'John ', 'Carter', '02/01/1999', 'délit de fuite,refus d\'op,meurtre sur agent de l\'état', 'eternel'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'John ', 'Carter', '02/01/1999', 'délit de fuite,refus d\'op,meurtre sur agent de l\'état', 'eternel'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'Ashka', 'fony', '14/03/2000', 'délit de fuite,refus d\'op,meurtre sur agent de l\'état', 'eternel'),
('license:ba502a86ae219ceeedf1754fb520eb580a528783', 'Ashka', 'fony', '14/03/2000', 'délit de fuite,refus d\'op,meurtre sur agent de l\'état', 'eternel'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'ZACK', 'JOHN', '25/06/2000', 'possetion de drogue', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'ZACK', 'JOHN', '25/06/2000', 'possetion de drogue', 'léo pheter'),
('license:7e9e98e4cb32b328bb1a4113ec72e707ac7a30d0', 'Yanis', 'Kader', '29/07/2006', 'complice de déli de fuite', 'mathew'),
('license:7e9e98e4cb32b328bb1a4113ec72e707ac7a30d0', 'Yanis', 'Kader', '29/07/2006', 'complice de déli de fuite', 'mathew'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Bilal', 'Lalib', '09/12/1943', 'Tire sur agent et délit de fuite ', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Bilal', 'Lalib', '09/12/1943', 'Tire sur agent et délit de fuite ', 'machu'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Léo', 'Garcia', '12/05/1995', 'Refus d\"optempérer', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Léo', 'Garcia', '12/05/1995', 'Refus d\"optempérer', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Pedro', 'Alvaro', '16/20/1998', 'Refus d\'optempérer, port d\'arme illégal, pas de ppa', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Pedro', 'Alvaro', '16/20/1998', 'Refus d\'optempérer, port d\'arme illégal, pas de ppa', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Jean Joseph', 'Garoux', '13/10/2004', 'Détention de stupéfiant +10', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Jean Joseph', 'Garoux', '13/10/2004', 'Détention de stupéfiant +10', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Marcus', 'Stone', '11/10/1997', 'Détention de stupéfiant +10', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Marcus', 'Stone', '11/10/1997', 'Détention de stupéfiant +10', 'Neuneuil11'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Serguei', 'Kriskolvie', '16/03/1970', 'Délit de fuite , Arme de catégorie 4', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Serguei', 'Kriskolvie', '16/03/1970', 'Délit de fuite , Arme de catégorie 4', 'machu'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Travis', 'Stone', '17/04/1999', 'REfus d\'op', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Travis', 'Stone', '17/04/1999', 'REfus d\'op', 'léo pheter'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Rickys', 'Azimov', '20/01/2000', 'Délit de fuite , arme de catégorie 2', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Rickys', 'Azimov', '20/01/2000', 'Délit de fuite , arme de catégorie 2', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Hervé', 'Alacote', '16/08/2003', 'Délit de fuite', 'machu'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Hervé', 'Alacote', '16/08/2003', 'Délit de fuite', 'machu'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Bario', 'Garcia', '24/03/1995', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Bario', 'Garcia', '24/03/1995', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Pablo', 'Escuchar', '09/06/2000', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Pablo', 'Escuchar', '09/06/2000', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Travis', 'Stone', '17/04/1999', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Travis', 'Stone', '17/04/1999', 'Prise d\'otage sur agent de l\'état', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Mac', 'Conor', '01/01/2000', 'Conduite dangeureuse, excés de vitesse.', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Mac', 'Conor', '01/01/2000', 'Conduite dangeureuse, excés de vitesse.', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Mac', 'Conor', '01/01/2000', 'Conduite dangeureuse, excés de vitesse.', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Mac', 'Conor', '01/01/2000', 'Conduite dangeureuse, excés de vitesse.', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Aron', 'Cooper', '28/05/2003', 'Prise d\'otage sur civil, braquage de supérette, détention d\'arme sur voie publique.', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Aron', 'Cooper', '28/05/2003', 'Prise d\'otage sur civil, braquage de supérette, détention d\'arme sur voie publique.', 'Neuneuil11'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan', 'Ako', '05/06/1998', 'Refus d\'op, Outrage X11, msie en danger de la vie d\'autrui', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan', 'Ako', '05/06/1998', 'Refus d\'op, Outrage X11, msie en danger de la vie d\'autrui', 'léo pheter'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Sofiane', 'La Pommade', '02/06/2003', 'Braquage de supérette, éxhibition', 'Neuneuil11'),
('license:418e452ebf287002cad9d0d43333c5686cbc0047', 'Sofiane', 'La Pommade', '02/06/2003', 'Braquage de supérette, éxhibition', 'Neuneuil11'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Rickys', 'Azimov', '20/01/2000', 'Délit de fuite ', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Rickys', 'Azimov', '20/01/2000', 'Délit de fuite ', 'HTD'),
('license:bfd67c8eba4cb2d6c87709b78db3b904130f4a3b', 'Jay', 'Wood', '20/02/1991', 'port d\'arme illégal sorti en ville et également gilet pare-balles lourd porter ', 'LaMach00'),
('license:bfd67c8eba4cb2d6c87709b78db3b904130f4a3b', 'Jay', 'Wood', '20/02/1991', 'port d\'arme illégal sorti en ville et également gilet pare-balles lourd porter ', 'LaMach00'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Dino', 'Buzzati', '16/02/1999', 'Braquage de superette , Port d\'arme de categorie 1 sans PPA , Argent salle sur lui ', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Dino', 'Buzzati', '16/02/1999', 'Braquage de superette , Port d\'arme de categorie 1 sans PPA , Argent salle sur lui ', 'HTD'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Jose', 'Russo', '01.01.2003', '- Refus d\'optempéré ; - Conduite dangereuse ; - Détention d\'une grande quantité d\'argent sale ', 'nonoa'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Jose', 'Russo', '01.01.2003', '- Refus d\'optempéré ; - Conduite dangereuse ; - Détention d\'une grande quantité d\'argent sale ', 'nonoa'),
('license:920cfa818da694bde1738a1985e6e73770bdb4b1', 'Jose', 'Russo', '01/01/2003', 'Possesion d\'argent sale delit de fuite', 'ducdylden'),
('license:920cfa818da694bde1738a1985e6e73770bdb4b1', 'Jose', 'Russo', '01/01/2003', 'Possesion d\'argent sale delit de fuite', 'ducdylden'),
('license:b0bcfd7ec39253bca3e1159e606652767427b955', 'RAYAN', 'LEZOUI', '01/02/2000', 'PORT DARME ILLEGAL ARME ILEEGAL MENACE SUR AGENT ', 'John Anderson | Maxou88'),
('license:b0bcfd7ec39253bca3e1159e606652767427b955', 'RAYAN', 'LEZOUI', '01/02/2000', 'PORT DARME ILLEGAL ARME ILEEGAL MENACE SUR AGENT ', 'John Anderson | Maxou88'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Sofian', 'Benzou', '12/10/2000', 'Refus d\'op', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Sofian', 'Benzou', '12/10/2000', 'Refus d\'op', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Karim', 'Walili', '05/06/2000', 'Refus d\'op + braquage a main armé + Prise d\'otage', 'newyo'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Karim', 'Walili', '05/06/2000', 'Refus d\'op + braquage a main armé + Prise d\'otage', 'newyo'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Karim', 'Walili', '05/06/2000', 'Refus d\'op + braquage a main armé + Prise d\'otage', 'newyo'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Karim', 'Walili', '05/06/2000', 'Refus d\'op + braquage a main armé + Prise d\'otage', 'newyo'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Many', 'Santane', '22/01/2003', 'Refus d\'op + braquage a main armé + prise d\'otage', 'newyo'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Many', 'Santane', '22/01/2003', 'Refus d\'op + braquage a main armé + prise d\'otage', 'newyo'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Leroy', 'Walker', '23/06/1997', 'Délit de fuite , braquage de banque , prise d\'otage sur civil ', 'HTD'),
('license:b4adbf0ba66d9be0b0afa73f361b55c461871506', 'Leroy', 'Walker', '23/06/1997', 'Délit de fuite , braquage de banque , prise d\'otage sur civil ', 'HTD'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Jay', 'Stone', 'xx.xx.xxxx', 'Delit de fuite ; Dégradation de la voie publique ; conduite à contre sens', 'nonoa'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Jay', 'Stone', 'xx.xx.xxxx', 'Delit de fuite ; Dégradation de la voie publique ; conduite à contre sens', 'nonoa'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Juan', 'West', '03.02.2006', 'Détention d\'argent illégale ; Présence sur un lieu illégale', 'nonoa'),
('license:de097d7cb07af2171545f71cefc055300b638e6d', 'Juan', 'West', '03.02.2006', 'Détention d\'argent illégale ; Présence sur un lieu illégale', 'nonoa'),
('license:fd4dfcce9b84b62c03153382186fb35342614a44', 'Dexter', 'Zulu', '11/09/2000', 'tentative d\'omicide a main armé, tentative de meurtre ', 'Nozerqlf'),
('license:fd4dfcce9b84b62c03153382186fb35342614a44', 'Dexter', 'Zulu', '11/09/2000', 'tentative d\'omicide a main armé, tentative de meurtre ', 'Nozerqlf'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'enes', 'treak', '04/03/1999', 'vole voiture tentavie de meurtre vole voiture refu dop ectt', 'YOUTUBE'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'enes', 'treak', '04/03/1999', 'vole voiture tentavie de meurtre vole voiture refu dop ectt', 'YOUTUBE'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'WOOD', 'SMITH', '24/05/2000', 'delit de fuite , tire sur agent , possétion d\'affaire illégal', 'YOUTUBE'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'WOOD', 'SMITH', '24/05/2000', 'delit de fuite , tire sur agent , possétion d\'affaire illégal', 'YOUTUBE'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'WOOD', 'SMITH', '24/05/2000', 'corruption , outrage ', 'YOUTUBE'),
('license:19ffcb9c010c72236a139fdaff6ce9057196778b', 'WOOD', 'SMITH', '24/05/2000', 'corruption , outrage ', 'YOUTUBE'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Léon', 'Lévis', 'XX/XX/XXXX', 'Tentative de meurte sur agent de l\'état + Outrage a agent', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Léon', 'Lévis', 'XX/XX/XXXX', 'Tentative de meurte sur agent de l\'état + Outrage a agent', 'léo pheter'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:478458b22cf3159847d43b2ac16637e04d8eabf1', 'Salah', 'Abdelsalam', '03/05/2003', 'tire sur argent de la police', 'Aggrah | Marc Marletti'),
('license:1c38932ae5d335f39ffdddc2e4899800621dd479', 'Marlon', 'Jackson', '05/07/2008', 'Refus d\'optempérer , Délit de fuite, Port d\'arme illégal TTC : 77.000$', '🧢'),
('license:1c38932ae5d335f39ffdddc2e4899800621dd479', 'Marlon', 'Jackson', '05/07/2008', 'Refus d\'optempérer , Délit de fuite, Port d\'arme illégal TTC : 77.000$', '🧢'),
('license:ee4b06121ee2cd486bd0a0144fac2bb7c4b3b9fb', 'OMAR', 'DARINGSON', '01/01/2000', 'MENACE VERS UN CIVIL ', 'crbtkeliane'),
('license:ee4b06121ee2cd486bd0a0144fac2bb7c4b3b9fb', 'OMAR', 'DARINGSON', '01/01/2000', 'MENACE VERS UN CIVIL ', 'crbtkeliane'),
('license:58abec24d406d72dcd7480da521606450fde43fd', 'Johson', 'Carter', '02/01/1999', 'Prise otage sasp', 'Yashog'),
('license:58abec24d406d72dcd7480da521606450fde43fd', 'Johson', 'Carter', '02/01/1999', 'Prise otage sasp', 'Yashog'),
('license:e804ed68b654ba2cda298d844af95f8e573bbf54', 'Steve', 'Williams', '13/05/1989', 'test', 'French.Off'),
('license:e804ed68b654ba2cda298d844af95f8e573bbf54', 'Steve', 'Williams', '13/05/1989', 'test', 'French.Off'),
('license:63866f9a798530d4015f3e2e0f6942472ab2ac5f', 'rio', 'garcia', '24/03/1995', 'vente de drogue', 'slaze le meilleur'),
('license:63866f9a798530d4015f3e2e0f6942472ab2ac5f', 'rio', 'garcia', '24/03/1995', 'vente de drogue', 'slaze le meilleur'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Peter', 'Wace', '20/07/1985', 'Refus de se soumettre', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Peter', 'Wace', '20/07/1985', 'Refus de se soumettre', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Abdel', 'Ernandez', '12/12/2000', 'Refus d\'op + mise en danger de la vie d\'autrui + racisme X2 + outrage a agent', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Abdel', 'Ernandez', '12/12/2000', 'Refus d\'op + mise en danger de la vie d\'autrui + racisme X2 + outrage a agent', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Matheo', 'Bouchet', '12/10/1984', 'Braquage de superette', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Matheo', 'Bouchet', '12/10/1984', 'Braquage de superette', 'léo pheter'),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'TOM', 'CORTEZ', '13/07/2000', 'PREND SON TELEPHONE EN CELLULE OUTRAGE A AGENT ', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'TOM', 'CORTEZ', '13/07/2000', 'PREND SON TELEPHONE EN CELLULE OUTRAGE A AGENT ', 'KLN '),
('license:f44038374d1b070c2d9c22d6c5e04432bc559bd7', 'Oni', 'Bedo', '03/03/2006', 'Braquage de superette', 'Bobytacos'),
('license:f44038374d1b070c2d9c22d6c5e04432bc559bd7', 'Oni', 'Bedo', '03/03/2006', 'Braquage de superette', 'Bobytacos'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan ', 'Ako', '05/06/1998', 'Refus d\'op + mise en danger de la vie d\'autrui + possesion de drogue', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Yan ', 'Ako', '05/06/1998', 'Refus d\'op + mise en danger de la vie d\'autrui + possesion de drogue', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Carlos', 'Alvareza', '02/06/1995', 'Refus d\'op', 'léo pheter'),
('license:e64f85e5c04512a45ff67e3c3cb4a3d111c7ae6a', 'Carlos', 'Alvareza', '02/06/1995', 'Refus d\'op', 'léo pheter'),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'JOSH', 'MAYERS', '12/12/2000', 'REFUS D\'OBTEMPERER ', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'JOSH', 'MAYERS', '12/12/2000', 'REFUS D\'OBTEMPERER ', 'KLN '),
('license:5b84f344d279b98a876c70b9ac5df54a1c5fef04', 'walid', 'gonzales', 'inconnu', 'mort du gouverneur + braquage + prise d otage', 'snayzox'),
('license:5b84f344d279b98a876c70b9ac5df54a1c5fef04', 'walid', 'gonzales', 'inconnu', 'mort du gouverneur + braquage + prise d otage', 'snayzox'),
('license:495468996223a6bc3b211e42d660239283f49fac', 'Sofianne', 'LA POMMADE', '02/06/2003', 'Refus d\'obtempérer, Conduite hors route / hors piste, circulation à contresens, outrage à l\'agent x5', 'BibiTheGhost'),
('license:495468996223a6bc3b211e42d660239283f49fac', 'Sofianne', 'LA POMMADE', '02/06/2003', 'Refus d\'obtempérer, Conduite hors route / hors piste, circulation à contresens, outrage à l\'agent x5', 'BibiTheGhost'),
('license:495468996223a6bc3b211e42d660239283f49fac', 'Bob', 'Taiyo', '08/01/2004', 'Cambriolage maison, refus d\'obtempérer.', 'BibiTheGhost'),
('license:495468996223a6bc3b211e42d660239283f49fac', 'Bob', 'Taiyo', '08/01/2004', 'Cambriolage maison, refus d\'obtempérer.', 'BibiTheGhost'),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'SOFIAN ', 'BENZOU', '13/07/2000', 'REFUS D\'OBTEMPERER ET TENTATIVE DE BRAQUAGE SUR AGENT US MARSAHL', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'SOFIAN ', 'BENZOU', '13/07/2000', 'REFUS D\'OBTEMPERER ET TENTATIVE DE BRAQUAGE SUR AGENT US MARSAHL', 'KLN '),
('license:b060a8c9b6da4678702a5fde63980c72a7d94b76', 'Ryan', 'Jefferson', '31/10/2000', 'Complicité braquage de bank', 'na2s.dp'),
('license:b060a8c9b6da4678702a5fde63980c72a7d94b76', 'Ryan', 'Jefferson', '31/10/2000', 'Complicité braquage de bank', 'na2s.dp'),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'keys', 'johnson', '13/07/2000', 'refus d\'obtemperer et confiscation de canon scié', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'keys', 'johnson', '13/07/2000', 'refus d\'obtemperer et confiscation de canon scié', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'NATHAN', 'ORTEGA', '13/07/2000', 'CONPLICE SUR TIRE SUR AGENT DE L\'ETAT', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'NATHAN', 'ORTEGA', '13/07/2000', 'CONPLICE SUR TIRE SUR AGENT DE L\'ETAT', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'YAN', 'AKO', '13/07/2000', 'TIR SUR AGENT US MARSHALS ET CIVIL', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'YAN', 'AKO', '13/07/2000', 'TIR SUR AGENT US MARSHALS ET CIVIL', 'KLN '),
('license:6377d543cbadbece72966db1542a263063442ecc', 'Dylan', 'ARBRERO', '08/04/2005', 'prise d\'otage sur agent sasp plus civil', 'fcaro'),
('license:6377d543cbadbece72966db1542a263063442ecc', 'Dylan', 'ARBRERO', '08/04/2005', 'prise d\'otage sur agent sasp plus civil', 'fcaro'),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'MATHIEU', 'RAYMOND', '13/03/2000', 'AGGRESSION SUR AGENT US MARSHAL( GIFLE ) refus d\'obtemperer et outrage agent', 'KLN '),
('license:fa46be5a111eec5439f5affcf943af27a178055c', 'MATHIEU', 'RAYMOND', '13/03/2000', 'AGGRESSION SUR AGENT US MARSHAL( GIFLE ) refus d\'obtemperer et outrage agent', 'KLN '),
('license:889f0d96d7e5b365c6921a856b44258bb17c0868', 'sq', 'Miptr', '10/03/2000', 'Soert', 'Oest'),
('license:889f0d96d7e5b365c6921a856b44258bb17c0868', 'sq', 'Miptr', '10/03/2000', 'Soert', 'Oest');

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

INSERT INTO `clothes_societies` (`id`, `label`, `skin`, `identifier`, `type`, `equip`) VALUES
(3, 'tene 1', '{\"tshirt_1\":15,\"torso_1\":73,\"arms_2\":0,\"arms\":0,\"decals_2\":0,\"ears_2\":0,\"shoes_2\":0,\"glasses_1\":0,\"bproof_2\":0,\"shoes_1\":274,\"mask_2\":0,\"ears_1\":-1,\"chain_1\":0,\"bags_2\":0,\"glasses_2\":0,\"pants_1\":25,\"helmet_1\":-1,\"tshirt_2\":0,\"pants_2\":1,\"bags_1\":0,\"decals_1\":0,\"chain_2\":0,\"torso_2\":0,\"bproof_1\":65,\"mask_1\":0}', 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'vetement', 'n');

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

INSERT INTO `datastore_data` (`id`, `name`, `data`, `owner`) VALUES
(9561, 'society_gouv', '{\"weapons\":[{\"count\":1,\"name\":\"WEAPON_SPECIALCARBINE\"},{\"count\":1,\"name\":\"WEAPON_FN502\"},{\"count\":1,\"name\":\"WEAPON_BAT\"},{\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"name\":\"WEAPON_MACHETE\",\"count\":3},{\"name\":\"WEAPON_SCARSC\",\"count\":1},{\"name\":\"WEAPON_KNR\",\"count\":1}]}', NULL),
(11012, 'society_police', '{\"weapons\":[{\"name\":\"WEAPON_ANARCHY\",\"count\":1},{\"name\":\"WEAPON_PISTOL\",\"count\":12},{\"name\":\"WEAPON_LR300\",\"count\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"count\":2},{\"name\":\"WEAPON_PISTOL50\",\"count\":4},{\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"count\":1},{\"name\":\"WEAPON_PISTOL_MK2\",\"count\":1},{\"name\":\"WEAPON_REVOLVER\",\"count\":2},{\"name\":\"WEAPON_KNIFE\",\"count\":2},{\"name\":\"WEAPON_G3_2\",\"count\":1},{\"name\":\"WEAPON_FN502\",\"count\":3},{\"name\":\"WEAPON_MACHETE\",\"count\":4},{\"name\":\"WEAPON_KNR\",\"count\":1},{\"name\":\"WEAPON_H2SMG\",\"count\":1},{\"name\":\"WEAPON_MICROSMG\",\"count\":1},{\"name\":\"WEAPON_MACHINEPISTOL\",\"count\":1},{\"name\":\"WEAPON_BAT\",\"count\":1}]}', NULL),
(13814, 'society_15', '[]', NULL),
(29932, 'society_ambulance', '{}', NULL),
(29933, 'society_Kays', '{}', NULL),
(29934, 'society_avocat', '{}', NULL),
(29935, 'society_bahamas', '{}', NULL),
(29936, 'society_boatshop', '{}', NULL),
(29937, 'society_brinks', '{}', NULL),
(29938, 'society_carshop', '{}', NULL),
(29939, 'society_k2r', '{}', NULL),
(29940, 'society_kk', '{}', NULL),
(29941, 'society_mecano', '{}', NULL),
(29942, 'society_mecano2', '{}', NULL),
(29943, 'society_planeshop', '{}', NULL),
(29944, 'society_roxsherif', '{}', NULL),
(29945, 'society_realestateagent', '{}', NULL),
(29946, 'society_taxi', '{}', NULL),
(29947, 'society_test1', '{}', NULL),
(29948, 'society_test10', '{}', NULL),
(29949, 'society_testk', '{}', NULL),
(29950, 'society_unicorn', '{}', NULL),
(29951, 'society_vigne', '{}', NULL);

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

INSERT INTO `drugs` (`id`, `createdBy`, `createdAt`, `label`, `drugsInfos`) VALUES
(10, 'none', 'none', 'Bitcoin', '{\"harvest\":{\"x\":1273.3175048828126,\"y\":-1711.863037109375,\"z\":54.77141952514648},\"sellCount\":\"1\",\"treatedItem\":\"bitcoin\",\"harvestCount\":\"1\",\"rawItem\":\"bitcoin\",\"treatmentReward\":\"1\",\"name\":\"Bitcoin\",\"treatement\":{\"x\":6945.98388671875,\"y\":-668.0714721679688,\"z\":-188.35848999023438},\"treatmentCount\":\"1\",\"sale\":\"0\",\"sellRewardPerCount\":\"90\",\"vendor\":{\"x\":605.7781372070313,\"y\":-3088.163330078125,\"z\":6.06926107406616}}'),
(11, 'none', 'none', 'Tabac', '{\"sellCount\":\"1\",\"harvestCount\":\"1\",\"name\":\"Tabac\",\"harvest\":{\"y\":4597.51220703125,\"x\":2854.02587890625,\"z\":47.86069107055664},\"treatmentCount\":\"2\",\"treatedItem\":\"tabacbrun\",\"sellRewardPerCount\":\"170\",\"treatement\":{\"y\":3039.24,\"x\":1997.21,\"z\":47.02},\"treatmentReward\":\"1\",\"vendor\":{\"y\":3842.948974609375,\"x\":1953.5892333984376,\"z\":32.18350982666015},\"rawItem\":\"tabac\",\"sale\":\"0\"}'),
(19, 'none', 'none', 'coke', '{\"vendor\":{\"x\":1728.43359375,\"y\":4730.76953125,\"z\":42.06525039672851},\"harvest\":{\"x\":1388.9068603515626,\"y\":3605.141845703125,\"z\":38.94192886352539},\"sellRewardPerCount\":\"176\",\"sellCount\":\"2\",\"rawItem\":\"coke\",\"sale\":\"1\",\"treatmentReward\":\"2\",\"treatmentCount\":\"3\",\"name\":\"coke\",\"treatement\":{\"x\":3823.250244140625,\"y\":4442.19189453125,\"z\":2.80632281303405},\"harvestCount\":\"4\",\"treatedItem\":\"coke_pooch\"}'),
(20, 'none', 'none', 'meth', '{\"vendor\":{\"x\":-291.1665344238281,\"y\":2525.2265625,\"z\":74.63885498046875},\"harvest\":{\"x\":1342.6734619140626,\"y\":4388.25732421875,\"z\":44.34379959106445},\"sellRewardPerCount\":\"196\",\"sellCount\":\"2\",\"rawItem\":\"meth\",\"sale\":\"1\",\"treatmentReward\":\"2\",\"treatmentCount\":\"3\",\"name\":\"meth\",\"treatement\":{\"x\":425.0657958984375,\"y\":2999.30126953125,\"z\":40.38022232055664},\"harvestCount\":\"4\",\"treatedItem\":\"meth_pooch\"}');

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

INSERT INTO `gang2_car` (`gang_name`, `plate`, `model`, `properties`, `stored`, `time_out`) VALUES
('Kays', '0068JTBE', 'sultan', '{\"color\":2}', 0, '2025-04-23 12:29:50'),
('Kays', '3491BQYC', 'sultan', '{\"color\":6}', 0, '2025-04-23 12:30:32'),
('Kays', '4642ASKR', 'sultan', '{\"color\":1}', 0, '2025-04-23 12:28:24'),
('Kays', '9422LWWE', 'sultan', '{\"color\":30}', 0, '2025-04-23 12:31:12'),
('Kays', 'GANG1085', 'buffalo', '{\"color\":1}', 0, '2025-04-23 04:43:50'),
('Kays', 'GANG9647', 'baller', '{\"color\":1}', 0, '2025-04-23 04:44:11'),
('kk', '2102KOSE', '970598228', '{\"color\":1}', 0, '2025-04-23 05:41:50'),
('kk', '3580HLTL', '970598228', '{\"color\":2}', 0, '2025-04-23 05:36:30'),
('kk', '3635IRLA', 'sultan', '{\"color\":1}', 1, NULL),
('kk', '4718STLF', '970598228', '{\"color\":1}', 1, NULL),
('kk', '4896XNNP', '970598228', '{\"color\":1}', 0, '2025-04-23 05:20:46'),
('kk', '5310OJWR', 'sultan', '{\"color\":1}', 0, '2025-04-23 05:46:12'),
('kk', '7277GBKS', '970598228', '{\"color\":1}', 0, '2025-04-23 05:40:17'),
('kk', '9406MNGO', '970598228', '{\"color\":1}', 0, '2025-04-23 05:39:40'),
('test1', '2049ASPU', 'sultan', '{\"color\":1}', 0, '2025-04-23 12:49:27'),
('test1', '3511WDUH', 'sultan', '{\"color\":111}', 0, '2025-04-23 12:34:41'),
('test10', 'GANG9240', 'kuruma', '{\"color\":1}', 1, NULL),
('testk', '7287CPEE', 'sultan', '{\"color\":1}', 0, '2025-04-23 12:49:19');

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

INSERT INTO `gang2_chest` (`gang_name`, `type`, `item`, `count`) VALUES
('test1', 'item_standard', 'drill', 1),
('test1', 'item_weapon', 'WEAPON_ASSAULTRIFLE', 0);

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

INSERT INTO `gang2_clothes` (`gang`, `label`, `skin`, `creator`) VALUES
('Kays', 'clow', '{\"makeup_1\":0,\"eyebrows_2\":10,\"eyebrows_4\":0,\"blemishes_2\":0,\"eye_color\":0,\"skin_md_weight\":0,\"dad\":1,\"eyebrows_6\":0,\"complexion_1\":0,\"chin_3\":0,\"pants_2\":2,\"decals_1\":0,\"nose_2\":0,\"hair_2\":0,\"moles_1\":0,\"bodyb_4\":0,\"eyebrows_1\":0,\"eyebrows_3\":0,\"chest_2\":0,\"cheeks_1\":0,\"mask_1\":95,\"beard_1\":0,\"pants_1\":29,\"watches_2\":0,\"sun_1\":0,\"torso_2\":0,\"arms_2\":0,\"bproof_1\":0,\"helmet_2\":0,\"cheeks_2\":0,\"bracelets_2\":0,\"chin_2\":0,\"makeup_4\":0,\"moles_2\":0,\"lipstick_1\":0,\"jaw_1\":0,\"age_2\":0,\"arms\":15,\"nose_5\":0,\"hair_color_2\":0,\"blush_3\":0,\"hair_color_1\":0,\"chin_4\":0,\"bracelets_1\":-1,\"ears_2\":0,\"decals_2\":0,\"glasses_2\":0,\"bodyb_3\":-1,\"makeup_3\":0,\"chain_1\":271,\"glasses_1\":0,\"sex\":0,\"blemishes_1\":0,\"hair_1\":0,\"makeup_2\":0,\"shoes_1\":199,\"blush_2\":0,\"bproof_2\":0,\"chain_2\":0,\"shoes_2\":0,\"nose_6\":0,\"nose_1\":0,\"helmet_1\":0,\"lipstick_3\":0,\"bags_2\":0,\"ears_1\":-1,\"bodyb_2\":0,\"tshirt_2\":0,\"bags_1\":0,\"neck_thickness\":0,\"lip_thickness\":0,\"nose_4\":0,\"age_1\":0,\"mask_2\":6,\"cheeks_3\":0,\"watches_1\":-1,\"chest_1\":0,\"lipstick_2\":0,\"chest_3\":0,\"nose_3\":0,\"jaw_2\":0,\"beard_4\":0,\"tshirt_1\":15,\"lipstick_4\":0,\"beard_3\":0,\"mom\":36,\"complexion_2\":0,\"beard_2\":0,\"blush_1\":0,\"sun_2\":0,\"face_md_weight\":93,\"bodyb_1\":-1,\"torso_1\":45,\"eyebrows_5\":0,\"chin_1\":0,\"eye_squint\":0}', 'Enzo Lipton'),
('test1', 'bas', '{\"chest_3\":0,\"watches_2\":0,\"blush_2\":0,\"nose_1\":0,\"sun_2\":0,\"bodyb_3\":-1,\"torso_2\":2,\"cheeks_2\":0,\"beard_2\":0,\"eyebrows_5\":0,\"eye_squint\":0,\"hair_2\":0,\"eyebrows_3\":0,\"blush_3\":0,\"bproof_2\":0,\"glasses_1\":0,\"bproof_1\":0,\"cheeks_1\":0,\"beard_4\":0,\"nose_6\":0,\"torso_1\":3,\"beard_1\":0,\"lip_thickness\":0,\"bodyb_1\":-1,\"eyebrows_4\":0,\"arms\":6,\"hair_color_1\":0,\"jaw_1\":0,\"hair_color_2\":0,\"tshirt_1\":23,\"jaw_2\":0,\"chain_2\":0,\"pants_1\":388,\"blemishes_1\":0,\"chin_1\":0,\"blush_1\":0,\"lipstick_3\":0,\"mask_2\":0,\"beard_3\":0,\"chest_2\":0,\"complexion_1\":0,\"age_1\":0,\"nose_2\":0,\"moles_2\":0,\"makeup_1\":0,\"bodyb_2\":0,\"helmet_2\":0,\"skin_md_weight\":50,\"nose_5\":0,\"pants_2\":0,\"arms_2\":0,\"mask_1\":0,\"lipstick_4\":0,\"makeup_3\":0,\"watches_1\":-1,\"tshirt_2\":0,\"makeup_4\":0,\"blemishes_2\":0,\"bags_1\":44,\"chin_3\":0,\"chin_4\":0,\"neck_thickness\":0,\"eyebrows_1\":0,\"face_md_weight\":50,\"eyebrows_6\":0,\"eyebrows_2\":0,\"bracelets_2\":0,\"bags_2\":0,\"complexion_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"nose_3\":0,\"helmet_1\":-1,\"bracelets_1\":-1,\"dad\":4,\"glasses_2\":0,\"shoes_2\":2,\"hair_1\":60,\"shoes_1\":160,\"lipstick_1\":0,\"ears_1\":-1,\"nose_4\":0,\"sex\":0,\"decals_1\":0,\"moles_1\":0,\"chin_2\":0,\"makeup_2\":0,\"cheeks_3\":0,\"eye_color\":0,\"decals_2\":0,\"sun_1\":0,\"age_2\":0,\"chest_1\":0,\"mom\":25,\"bodyb_4\":0,\"chain_1\":0}', 'Kays Lamoula');

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

INSERT INTO `gofast_cooldown` (`identifier`, `cooldown`) VALUES
('license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', 1745549141),
('steam:110000111e0b9ce', 1744501408),
('steam:1100001320d66f8', 1745289806),
('steam:11000013be76958', 1745099229),
('steam:110000149b59db1', 1744501414),
('steam:11000014cd51f21', 1743698391),
('steam:110000154777afc', 1745667925),
('steam:11000015e5434b9', 1745357523),
('steam:11000015edaed33', 1745183145);

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

INSERT INTO `inventory_4_items` (`uniqueID`, `type`, `items`, `originX`, `originY`, `originZ`, `expires`) VALUES
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'player', '[]', NULL, NULL, NULL, NULL);

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

INSERT INTO `izey_clothes` (`id`, `type`, `identifier`, `name`, `data`, `trunk`) VALUES
(1, 'bags', '2447SMMS', 'Sac', '{\"bags_2\":0,\"bags_1\":82}', NULL),
(6, 'helmet', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Chapeau', '{\"helmet_1\":104,\"helmet_2\":20}', NULL),
(7, 'glasses', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Lunette', '{\"glasses_1\":24,\"glasses_2\":2}', NULL),
(8, 'bags', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Sac', '{\"bags_2\":0,\"bags_1\":81}', NULL),
(9, 'mask', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Masque 169', '{\"mask_1\":169,\"mask_2\":0}', NULL),
(10, 'shoes', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Chaussure ', '{\"shoes_1\":6,\"shoes_2\":0}', NULL),
(11, 'bags', 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'Sac', '{\"bags_1\":82,\"bags_2\":0}', NULL),
(12, 'outfit', 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 'en amont', '{\"shoes_2\":0,\"helmet_1\":-1,\"pants_1\":10,\"tshirt_1\":15,\"mask_2\":0,\"bproof_1\":0,\"shoes_1\":10,\"pants_2\":0,\"decals_2\":0,\"torso_1\":139,\"chain_2\":0,\"tshirt_2\":0,\"arms\":22,\"mask_1\":0,\"bproof_2\":0,\"chain_1\":0,\"helmet_2\":0,\"torso_2\":3,\"decals_1\":0,\"arms_2\":0}', NULL),
(13, 'outfit', 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'Josh', '{\"shoes_2\":2,\"helmet_1\":-1,\"pants_1\":388,\"tshirt_1\":2,\"mask_2\":0,\"bproof_1\":0,\"shoes_1\":160,\"pants_2\":0,\"decals_2\":0,\"torso_1\":69,\"chain_2\":0,\"tshirt_2\":0,\"arms\":6,\"mask_1\":0,\"torso_2\":0,\"chain_1\":0,\"helmet_2\":0,\"bproof_2\":0,\"decals_1\":0,\"arms_2\":0}', NULL),
(14, 'outfit', 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 'Bg', '{\"chain_1\":-1,\"decals_2\":0,\"bproof_2\":0,\"mask_1\":0,\"chain_2\":0,\"pants_1\":56,\"torso_1\":680,\"arms_2\":0,\"helmet_1\":-1,\"torso_2\":1,\"decals_1\":0,\"mask_2\":0,\"shoes_2\":13,\"pants_2\":0,\"helmet_2\":0,\"tshirt_2\":0,\"tshirt_1\":15,\"arms\":11,\"shoes_1\":-1,\"bproof_1\":0}', NULL),
(15, 'shoes', 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 'Chaussure ', '{\"shoes_2\":13,\"shoes_1\":150}', NULL),
(16, 'glasses', 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 'Lunette', '{\"glasses_1\":45,\"glasses_2\":13}', NULL),
(17, 'pants', 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'Pantalon ', '{\"pants_1\":181,\"pants_2\":5}', NULL),
(18, 'outfit', 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'KYZOO', '{\"chain_1\":-1,\"decals_2\":0,\"bproof_2\":0,\"helmet_2\":0,\"chain_2\":0,\"pants_1\":181,\"torso_1\":712,\"arms_2\":0,\"helmet_1\":83,\"torso_2\":0,\"decals_1\":0,\"mask_2\":0,\"shoes_2\":25,\"mask_1\":0,\"arms\":5,\"pants_2\":5,\"tshirt_1\":23,\"shoes_1\":134,\"tshirt_2\":0,\"bproof_1\":0}', NULL),
(19, 'outfit', 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 'KYZOOW', '{\"chain_1\":-1,\"decals_2\":0,\"bproof_2\":0,\"helmet_2\":0,\"chain_2\":0,\"pants_1\":181,\"torso_1\":712,\"arms_2\":0,\"helmet_1\":83,\"torso_2\":0,\"decals_1\":0,\"mask_2\":0,\"shoes_2\":25,\"mask_1\":0,\"arms\":8,\"pants_2\":5,\"tshirt_1\":23,\"shoes_1\":134,\"tshirt_2\":0,\"bproof_1\":0}', NULL),
(20, 'pants', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Pantalon ', '{\"pants_1\":25,\"pants_2\":1}', NULL),
(21, 'shoes', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Chaussure ', '{\"shoes_2\":1,\"shoes_1\":279}', NULL),
(22, 'helmet', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Chapeau', '{\"helmet_1\":237,\"helmet_2\":1}', NULL),
(23, 'glasses', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'Lunette', '{\"glasses_1\":46,\"glasses_2\":1}', NULL),
(25, 'outfit', 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 'kays', '{\"chain_1\":0,\"decals_2\":0,\"bproof_2\":0,\"helmet_2\":1,\"chain_2\":0,\"pants_1\":25,\"torso_1\":73,\"arms_2\":0,\"helmet_1\":237,\"arms\":0,\"decals_1\":0,\"mask_2\":0,\"shoes_2\":1,\"torso_2\":0,\"pants_2\":1,\"tshirt_2\":0,\"tshirt_1\":15,\"shoes_1\":279,\"mask_1\":169,\"bproof_1\":146}', NULL),
(26, 'outfit', 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'Jsh', '{\"shoes_1\":269,\"decals_2\":0,\"bproof_2\":0,\"helmet_2\":0,\"chain_2\":0,\"pants_1\":56,\"torso_1\":237,\"arms_2\":0,\"helmet_1\":-1,\"torso_2\":0,\"decals_1\":0,\"mask_2\":0,\"shoes_2\":0,\"mask_1\":0,\"chain_1\":207,\"pants_2\":0,\"tshirt_1\":15,\"arms\":5,\"tshirt_2\":0,\"bproof_1\":0}', NULL),
(27, 'outfit', 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 'dgdf', '{\"torso_2\":1,\"bproof_1\":0,\"shoes_1\":273,\"helmet_2\":0,\"pants_2\":0,\"helmet_1\":-1,\"arms\":6,\"decals_1\":0,\"bproof_2\":4,\"shoes_2\":0,\"chain_1\":0,\"chain_2\":0,\"decals_2\":0,\"mask_2\":0,\"mask_1\":0,\"tshirt_1\":5,\"torso_1\":251,\"pants_1\":98,\"tshirt_2\":0,\"arms_2\":0}', NULL),
(28, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'lspd', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":26,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":65,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":25,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":121,\"mask_1\":0}', NULL),
(29, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'ems', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":726,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":25,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":121,\"mask_1\":0}', NULL),
(30, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'lspd', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":318,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":25,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":121,\"mask_1\":0}', NULL),
(31, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'lspd', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":190,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":25,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":121,\"mask_1\":0}', NULL),
(32, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'benny', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":65,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":25,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":121,\"mask_1\":0}', NULL),
(33, 'pants', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Pantalon ', '{\"pants_1\":283,\"pants_2\":1}', NULL),
(34, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 's', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":34,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":7,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":24,\"mask_1\":0}', NULL),
(35, 'top', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Haut 575', '{\"arms\":11,\"arms_2\":0,\"tshirt_1\":164,\"bproof_2\":0,\"tshirt_2\":0,\"torso_2\":0,\"torso_1\":575,\"bproof_1\":0}', NULL),
(36, 'shoes', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Chaussure ', '{\"shoes_1\":129,\"shoes_2\":1}', NULL),
(37, 'glasses', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Lunette', '{\"glasses_2\":3,\"glasses_1\":53}', NULL),
(38, 'watches', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Montre', '{\"watches_2\":29,\"watches_1\":20}', NULL),
(39, 'mask', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Masque 54', '{\"mask_1\":54,\"mask_2\":30}', NULL),
(40, 'mask', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Masque 54', '{\"mask_1\":54,\"mask_2\":30}', NULL),
(41, 'mask', 'license:85e8937833a05423627d78865cb0da6ab013652b', 'Masque 54', '{\"mask_1\":54,\"mask_2\":30}', NULL),
(42, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'lunettes', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":6,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":34,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":63,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":7,\"shoes_2\":0,\"helmet_1\":0,\"mask_2\":0,\"pants_1\":24,\"mask_1\":0}', NULL),
(43, 'outfit', 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 'lunettes', '{\"chain_2\":0,\"torso_2\":0,\"tshirt_1\":15,\"decals_1\":6,\"bproof_2\":0,\"helmet_2\":0,\"torso_1\":34,\"arms_2\":0,\"decals_2\":0,\"pants_2\":0,\"chain_1\":63,\"bproof_1\":58,\"arms\":5,\"tshirt_2\":0,\"shoes_1\":7,\"shoes_2\":0,\"helmet_1\":0,\"mask_2\":0,\"pants_1\":24,\"mask_1\":0}', NULL),
(44, 'outfit', 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 'tenu 1', '{\"chain_2\":0,\"torso_2\":0,\"shoes_1\":-1,\"mask_1\":0,\"bproof_2\":0,\"helmet_2\":0,\"arms_2\":0,\"tshirt_1\":207,\"decals_2\":0,\"pants_2\":0,\"chain_1\":0,\"bproof_1\":0,\"arms\":0,\"tshirt_2\":0,\"decals_1\":0,\"shoes_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"pants_1\":300,\"torso_1\":661}', NULL),
(45, 'shoes', 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 'Chaussure ', '{\"shoes_1\":76,\"shoes_2\":26}', NULL),
(46, 'helmet', 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 'Chapeau', '{\"helmet_1\":237,\"helmet_2\":0}', NULL),
(47, 'helmet', 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 'Chapeau', '{\"helmet_1\":52,\"helmet_2\":0}', NULL),
(48, 'chain', 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 'Chaine', '{\"chain_2\":0,\"chain_1\":188}', NULL),
(49, 'shoes', 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 'Chaussure ', '{\"shoes_2\":3,\"shoes_1\":156}', NULL),
(50, 'helmet', 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 'Chapeau', '{\"helmet_1\":-1,\"helmet_2\":0}', NULL),
(51, 'top', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 'Haut 724', '{\"arms\":1,\"arms_2\":0,\"torso_2\":0,\"bproof_2\":0,\"torso_1\":724,\"tshirt_2\":0,\"bproof_1\":0,\"tshirt_1\":4}', NULL),
(52, 'pants', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 'Pantalon ', '{\"pants_2\":0,\"pants_1\":10}', NULL),
(53, 'shoes', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":10}', NULL),
(54, 'glasses', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 'Lunette', '{\"glasses_2\":0,\"glasses_1\":8}', NULL),
(55, 'ears', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 'Oreille', '{\"ears_2\":0,\"ears_1\":4}', NULL),
(56, 'outfit', 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'Tenu 1', '{\"arms_2\":0,\"chain_1\":0,\"bproof_2\":0,\"chain_2\":0,\"decals_1\":0,\"helmet_2\":0,\"pants_1\":25,\"pants_2\":1,\"mask_1\":0,\"tshirt_2\":0,\"mask_2\":0,\"torso_1\":73,\"helmet_1\":-1,\"bproof_1\":65,\"arms\":0,\"shoes_2\":0,\"decals_2\":0,\"tshirt_1\":15,\"torso_2\":0,\"shoes_1\":-1}', NULL),
(57, 'shoes', 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'Chaussure ', '{\"shoes_2\":0,\"shoes_1\":274}', NULL);

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

INSERT INTO `izey_trunk` (`info`, `data`, `id`) VALUES
('{\"weight\":0.0,\"maxweight\":50,\"plate\":\"2447SMMS\"}', '{\"weapons\":[],\"accounts\":[],\"clothes\":[{\"weight\":0.0,\"count\":1,\"label\":\"Sac\",\"name\":\"bags\",\"id\":1}],\"items\":[]}', 73512),
('{\"plate\":\"1235LWON\",\"maxweight\":50,\"weight\":0.0}', '{\"items\":[],\"weapons\":[],\"clothes\":[],\"accounts\":[]}', 268785),
('{\"plate\":\"LOCA3978\",\"maxweight\":10,\"weight\":0}', '{\"accounts\":{\"cash\":{\"count\":-10000000000001}},\"items\":[],\"clothes\":[],\"weapons\":[]}', 268952),
('{\"plate\":\"3535XZNO\",\"maxweight\":50,\"weight\":13.0}', '{\"items\":{\"jerican\":{\"weight\":4,\"count\":1,\"label\":\"Jerican\",\"name\":\"jerican\"},\"kq_outfitbag\":{\"weight\":4,\"count\":1,\"label\":\"Outfit bag\",\"name\":\"kq_outfitbag\"},\"medikit\":{\"weight\":5.0,\"count\":10,\"label\":\"Medikit\",\"name\":\"medikit\"}},\"weapons\":[],\"clothes\":[],\"accounts\":[]}', 513801),
('{\"weight\":0.0,\"maxweight\":10,\"plate\":\"29FBZ744\"}', '{\"weapons\":[],\"accounts\":{\"dirtycash\":{\"count\":1310}},\"clothes\":[],\"items\":[]}', 989623);

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

INSERT INTO `koy_afk_players` (`UniqueID`, `points`, `time`, `inZone`, `skin`, `playerName`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '5', '3', 0, '{\"chest_1\":0,\"moles_2\":0,\"torso_2\":0,\"skin_md_weight\":50,\"nose_5\":0,\"bags_1\":0,\"nose_2\":0,\"bodyb_1\":-1,\"decals_1\":0,\"lipstick_1\":0,\"sun_2\":0,\"chest_2\":0,\"mask_1\":0,\"lip_thickness\":0,\"ears_2\":0,\"eyebrows_2\":0,\"helmet_1\":-1,\"mask_2\":0,\"makeup_1\":0,\"makeup_3\":0,\"blemishes_2\":0,\"blush_1\":0,\"pants_1\":25,\"tshirt_2\":0,\"hair_1\":0,\"beard_4\":0,\"mom\":21,\"age_2\":0,\"pants_2\":1,\"lipstick_4\":0,\"hair_color_2\":0,\"torso_1\":73,\"arms\":0,\"age_1\":0,\"makeup_4\":0,\"dad\":0,\"bags_2\":0,\"watches_2\":0,\"eyebrows_3\":0,\"beard_3\":0,\"bproof_1\":65,\"eyebrows_4\":0,\"glasses_2\":0,\"cheeks_2\":0,\"jaw_2\":0,\"eyebrows_6\":0,\"bracelets_2\":0,\"shoes_2\":0,\"nose_1\":0,\"eyebrows_1\":0,\"chin_4\":0,\"cheeks_3\":0,\"chain_1\":0,\"ears_1\":-1,\"glasses_1\":0,\"helmet_2\":0,\"bproof_2\":0,\"beard_1\":0,\"chain_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"beard_2\":0,\"hair_color_1\":0,\"bodyb_3\":-1,\"sex\":0,\"neck_thickness\":0,\"eyebrows_5\":0,\"eye_color\":0,\"bodyb_4\":0,\"tshirt_1\":15,\"watches_1\":-1,\"nose_3\":0,\"jaw_1\":0,\"bodyb_2\":0,\"nose_4\":0,\"arms_2\":0,\"cheeks_1\":0,\"moles_1\":0,\"nose_6\":0,\"chin_3\":0,\"chin_1\":0,\"chin_2\":0,\"chest_3\":0,\"blush_2\":0,\"decals_2\":0,\"shoes_1\":274,\"face_md_weight\":50,\"lipstick_3\":0,\"makeup_2\":0,\"complexion_2\":0,\"complexion_1\":0,\"hair_2\":0,\"lipstick_2\":0,\"blush_3\":0,\"bracelets_1\":-1,\"eye_squint\":0}', 'Shyroz'),
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', '0', '0', 0, '{\"bproof_2\":0,\"bracelets_1\":-1,\"eyebrows_6\":0,\"pants_1\":12,\"makeup_3\":0,\"nose_2\":0,\"nose_1\":0,\"eyebrows_2\":0,\"eye_color\":0,\"lipstick_2\":0,\"dad\":2,\"bodyb_3\":-1,\"pants_2\":7,\"age_1\":0,\"mask_1\":169,\"age_2\":0,\"bracelets_2\":0,\"torso_2\":0,\"makeup_2\":0,\"glasses_2\":2,\"eyebrows_5\":0,\"watches_2\":0,\"chest_2\":0,\"hair_1\":0,\"glasses_1\":24,\"torso_1\":5,\"sun_2\":0,\"chain_1\":-1,\"bproof_1\":0,\"cheeks_2\":0,\"bodyb_1\":-1,\"nose_5\":0,\"blush_1\":0,\"beard_2\":10,\"chin_3\":0,\"blemishes_1\":0,\"chin_2\":0,\"makeup_1\":0,\"skin_md_weight\":100,\"mom\":23,\"helmet_1\":104,\"makeup_4\":0,\"arms_2\":0,\"nose_4\":0,\"mask_2\":0,\"tshirt_1\":15,\"sun_1\":0,\"tshirt_2\":0,\"sex\":0,\"beard_4\":0,\"helmet_2\":20,\"hair_2\":0,\"beard_3\":0,\"blemishes_2\":0,\"bodyb_2\":0,\"chest_1\":0,\"lipstick_4\":0,\"cheeks_3\":0,\"bags_1\":81,\"complexion_2\":0,\"moles_2\":0,\"decals_2\":0,\"jaw_2\":0,\"moles_1\":0,\"jaw_1\":0,\"chain_2\":0,\"eyebrows_1\":0,\"complexion_1\":0,\"watches_1\":-1,\"decals_1\":0,\"eye_squint\":0,\"lip_thickness\":0,\"eyebrows_4\":0,\"blush_2\":0,\"hair_color_2\":0,\"bodyb_4\":0,\"blush_3\":0,\"eyebrows_3\":0,\"chin_4\":0,\"lipstick_3\":0,\"chin_1\":0,\"nose_6\":0,\"ears_2\":0,\"neck_thickness\":0,\"beard_1\":3,\"shoes_1\":6,\"chest_3\":0,\"nose_3\":0,\"shoes_2\":0,\"arms\":5,\"face_md_weight\":71,\"cheeks_1\":0,\"ears_1\":-1,\"bags_2\":0,\"hair_color_1\":0,\"lipstick_1\":0}', 'Shyroz'),
('license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', '1365', '819', 1, '{\"hair_color_2\":9,\"eyebrows_5\":0,\"moles_2\":0,\"bodyb_3\":-1,\"bags_2\":0,\"blemishes_1\":0,\"torso_2\":2,\"lip_thickness\":0,\"nose_5\":0,\"chain_1\":0,\"watches_2\":0,\"sun_1\":0,\"bodyb_2\":0,\"makeup_4\":0,\"glasses_2\":0,\"blush_2\":0,\"eyebrows_6\":0,\"ears_1\":-1,\"decals_2\":0,\"cheeks_1\":0,\"beard_3\":17,\"chin_4\":0,\"beard_1\":10,\"bodyb_1\":-1,\"bags_1\":0,\"pants_1\":388,\"lipstick_4\":0,\"sex\":0,\"moles_1\":0,\"eye_squint\":0,\"nose_1\":0,\"cheeks_3\":0,\"mask_1\":0,\"tshirt_1\":23,\"decals_1\":0,\"bracelets_1\":-1,\"blush_1\":0,\"hair_1\":337,\"makeup_2\":0,\"blemishes_2\":0,\"beard_2\":10,\"hair_2\":0,\"nose_6\":0,\"makeup_3\":0,\"nose_2\":0,\"blush_3\":0,\"makeup_1\":0,\"complexion_1\":0,\"skin_md_weight\":78,\"lipstick_2\":0,\"chest_3\":0,\"chest_1\":0,\"watches_1\":-1,\"sun_2\":0,\"chest_2\":0,\"jaw_2\":0,\"helmet_2\":0,\"chin_3\":0,\"eye_color\":4,\"jaw_1\":0,\"hair_color_1\":17,\"cheeks_2\":0,\"ears_2\":0,\"nose_3\":0,\"tshirt_2\":0,\"lipstick_1\":0,\"beard_4\":0,\"mask_2\":0,\"eyebrows_2\":10,\"arms_2\":0,\"chin_1\":0,\"chain_2\":0,\"age_1\":0,\"shoes_2\":2,\"shoes_1\":160,\"torso_1\":3,\"age_2\":0,\"neck_thickness\":0,\"bproof_2\":0,\"complexion_2\":0,\"bracelets_2\":0,\"helmet_1\":-1,\"arms\":6,\"bodyb_4\":0,\"mom\":31,\"eyebrows_3\":0,\"chin_2\":0,\"dad\":44,\"face_md_weight\":100,\"glasses_1\":0,\"lipstick_3\":0,\"nose_4\":0,\"bproof_1\":0,\"pants_2\":0,\"eyebrows_1\":1,\"eyebrows_4\":0}', 'egger');

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

INSERT INTO `lbtablet_police_accounts` (`id`, `display_name`, `avatar`, `callsign`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'Angel Holl', NULL, '74-3207');

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

INSERT INTO `lbtablet_tablets` (`id`, `tablet_name`, `settings`, `battery`, `is_setup`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'Shyroz\'s Tablet', '{\"lockscreen\":{\"color\":\"gradient\",\"fontStyle\":1},\"time\":{\"twelveHourClock\":false},\"sound\":{\"silent\":false,\"volume\":0.45},\"airplaneMode\":false,\"locale\":\"fr\",\"display\":{\"theme\":\"dark\",\"frameColor\":\"#bc8d8d\",\"brightness\":1},\"wallpaper\":{\"background\":\"gradient\",\"blur\":false},\"streamerMode\":false,\"doNotDisturb\":false,\"apps\":[[\"Notes\",\"Mail\",\"Camera\",\"Photos\"],[\"Settings\",\"Browser\",\"Maps\",\"Ambulance\",\"Police\",\"Calculator\",\"Apps\",\"VoiceMemo\",\"Services\",\"Clock\",\"Registration\"]]}', 100, 1);

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

INSERT INTO `leboncoin` (`id`, `owner`, `plate`, `vehicle`, `price`, `location`, `locationId`, `buyed`) VALUES
(10, 'license:a4947ba20d1a5fa98421b026043c2d5363861e1e', '47ZLI236', '{\"modFender\":-1,\"modHood\":-1,\"modOrnaments\":-1,\"windowsBroken\":{\"0\":true,\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"5\":true,\"6\":false,\"7\":true},\"modBackWheels\":-1,\"modSeats\":-1,\"modEngine\":-1,\"modAPlate\":-1,\"modAerials\":-1,\"modLivery\":1,\"neonEnabled\":[false,false,false,false],\"modTrunk\":-1,\"extras\":[],\"modGrille\":-1,\"modStruts\":-1,\"doorsBroken\":{\"0\":false,\"1\":false},\"color2\":0,\"neonColor\":[0,0,0],\"dirtLevel\":4.0,\"wheels\":6,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modXenon\":false,\"modExhaust\":-1,\"windowTint\":-1,\"modFrontWheels\":-1,\"modPlateHolder\":-1,\"color1\":0,\"modRightFender\":-1,\"tankHealth\":995.0,\"model\":-891462355,\"plateIndex\":0,\"modDashboard\":-1,\"modSideSkirt\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modTank\":-1,\"modArmor\":-1,\"modFrontBumper\":-1,\"modFrame\":-1,\"modVanityPlate\":-1,\"pearlescentColor\":0,\"modEngineBlock\":-1,\"tyreBurst\":{\"0\":false,\"4\":false},\"modShifterLeavers\":-1,\"plate\":\"47ZLI236\",\"modTrimB\":-1,\"modHorns\":-1,\"modSmokeEnabled\":false,\"engineHealth\":1000.0,\"modDial\":-1,\"modDoorR\":-1,\"modAirFilter\":-1,\"xenonColor\":255,\"modLightbar\":-1,\"modSuspension\":-1,\"wheelColor\":156,\"modBrakes\":-1,\"bodyHealth\":990.0,\"modSteeringWheel\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modRoof\":-1,\"modTransmission\":-1,\"fuelLevel\":64.4,\"modArchCover\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1}', '50000', 'sandyshore', 4, 0),
(16, 'license:76978bbead67870129be8762c48e67f6ca28ac2a', '29OSE286', '{\"modRightFender\":-1,\"windowsBroken\":{\"1\":false,\"2\":false,\"7\":false,\"0\":false,\"5\":true,\"6\":false,\"3\":false,\"4\":true},\"windowTint\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"tankHealth\":996.2,\"modRearBumper\":-1,\"modRoof\":-1,\"modHood\":-1,\"modTank\":-1,\"color2\":1,\"modTrimA\":-1,\"modSpoilers\":-1,\"tyreBurst\":{\"5\":false,\"0\":false,\"1\":false,\"4\":false},\"modSideSkirt\":-1,\"plate\":\"29OSE286\",\"neonColor\":[0,0,0],\"engineHealth\":999.0,\"modShifterLeavers\":-1,\"modGrille\":-1,\"wheelColor\":0,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modSeats\":-1,\"modDoorR\":-1,\"modFender\":-1,\"pearlescentColor\":2,\"modStruts\":-1,\"modAirFilter\":-1,\"modHorns\":-1,\"dirtLevel\":0.9,\"plateIndex\":0,\"modSuspension\":-1,\"customSecondaryColor\":[0,0,0],\"modXenon\":false,\"modDashboard\":-1,\"tyreSmokeColor\":[255,255,255],\"extras\":[],\"modDial\":-1,\"modVanityPlate\":-1,\"modTransmission\":-1,\"modBackWheels\":-1,\"modBrakes\":-1,\"modLightbar\":-1,\"modHydrolic\":-1,\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"modAerials\":-1,\"modEngine\":-1,\"modFrontBumper\":-1,\"modLivery\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"fuelLevel\":46.9,\"modSteeringWheel\":-1,\"customPrimaryColor\":[0,0,0],\"modArchCover\":-1,\"doorsBroken\":{\"1\":false,\"2\":false,\"0\":false,\"3\":false,\"4\":false},\"color1\":0,\"wheels\":0,\"modOrnaments\":-1,\"modPlateHolder\":-1,\"modAPlate\":-1,\"bodyHealth\":977.6,\"modFrame\":-1,\"model\":1304459735,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modDoorSpeaker\":-1,\"xenonColor\":255}', '65000', 'lossantos', 3, 0);

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

INSERT INTO `open_car` (`id`, `owner`, `plate`, `NB`) VALUES
(1, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', '03DMV263', 0),
(2, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', '01UJG649', 0),
(3, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', '86TCP858', 0),
(4, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', '29FBZ744', 0),
(5, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'BYQP9511', 0),
(6, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'UKSF8727', 0),
(7, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'PLGX9519', 0),
(8, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', '28DLO741', 0),
(9, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', '25TGN879', 0),
(10, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'FJQO3943', 0);

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

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `state`, `boutique`, `selling`, `carseller`, `stored`, `propertyID`, `vehicletv`) VALUES
('license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', '01UJG649', '{\"modDoorSpeaker\":-1,\"modArmor\":-1,\"modFrame\":-1,\"extras\":{\"12\":false,\"10\":false},\"modAPlate\":-1,\"wheels\":0,\"neonColor\":[255,0,255],\"color1\":7,\"modFender\":-1,\"modSideSkirt\":-1,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modTransmission\":-1,\"modShifterLeavers\":-1,\"doorsBroken\":{\"0\":false,\"1\":false,\"2\":false,\"3\":false,\"4\":false},\"modFrontWheels\":-1,\"fuelLevel\":65.0,\"modTrimA\":-1,\"modSmokeEnabled\":false,\"engineHealth\":1000.0,\"windowsBroken\":{\"0\":false,\"1\":false,\"2\":false,\"3\":false,\"4\":true,\"5\":true,\"6\":false,\"7\":false},\"modSpoilers\":-1,\"modSuspension\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"modStruts\":-1,\"windowTint\":-1,\"tyreBurst\":{\"0\":false,\"1\":false,\"4\":false,\"5\":false},\"modLightbar\":-1,\"xenonColor\":255,\"modTurbo\":false,\"modRightFender\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modBackWheels\":-1,\"modTank\":-1,\"color2\":0,\"wheelColor\":156,\"modFrontBumper\":-1,\"modAirFilter\":-1,\"modEngine\":-1,\"modExhaust\":-1,\"modSpeakers\":-1,\"dirtLevel\":0.0,\"modHydrolic\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"pearlescentColor\":5,\"modHorns\":-1,\"bodyHealth\":1000.0,\"modRoof\":-1,\"modGrille\":-1,\"modLivery\":-1,\"model\":-344943009,\"modBrakes\":-1,\"modXenon\":false,\"modVanityPlate\":-1,\"plate\":\"01UJG649\",\"tankHealth\":1000.0,\"modDoorR\":-1,\"modSteeringWheel\":-1,\"modDashboard\":-1,\"modAerials\":-1}', 'car', 0, 0, 0, 0, 1, 0, 0),
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', '03DMV263', '{\"tyreSmokeColor\":[255,255,255],\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"modBackWheels\":-1,\"modDoorR\":-1,\"modShifterLeavers\":-1,\"modLightbar\":-1,\"doorsBroken\":{\"2\":false,\"3\":false,\"0\":false,\"1\":false},\"modHydrolic\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modAerials\":-1,\"model\":1987142870,\"modHorns\":-1,\"modStruts\":-1,\"modPlateHolder\":-1,\"modEngine\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"tankHealth\":1000.0,\"modAPlate\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"modTrunk\":-1,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modArchCover\":-1,\"modDial\":-1,\"plate\":\"03DMV263\",\"modFrontBumper\":-1,\"windowsBroken\":{\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false,\"4\":true,\"5\":true},\"color1\":99,\"modHood\":-1,\"modRightFender\":-1,\"modSpeakers\":-1,\"fuelLevel\":64.8,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":3,\"windowTint\":-1,\"modAirFilter\":-1,\"modEngineBlock\":-1,\"xenonColor\":255,\"modFrontWheels\":-1,\"modOrnaments\":-1,\"extras\":[],\"modDoorSpeaker\":-1,\"modTrimA\":-1,\"modArmor\":-1,\"modTrimB\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255],\"color2\":1,\"dirtLevel\":2.0,\"modSideSkirt\":-1,\"modBrakes\":-1,\"modVanityPlate\":-1,\"wheelColor\":0,\"modXenon\":false,\"plateIndex\":0,\"modSpoilers\":-1,\"modDashboard\":-1,\"modRearBumper\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"4\":false,\"5\":false},\"wheels\":7,\"modFender\":-1}', 'car', 0, 0, 0, 0, 1, 0, 0),
('license:88830294ccd5ffe723158350adb3f2046b1fe30c', '25TGN879', '{\"modHood\":-1,\"modRoof\":-1,\"engineHealth\":952.0,\"modArchCover\":-1,\"modTurbo\":false,\"pearlescentColor\":0,\"model\":-114291515,\"modFrontBumper\":-1,\"extras\":[],\"modEngineBlock\":-1,\"modShifterLeavers\":-1,\"modDoorR\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"modTrimA\":-1,\"windowsBroken\":{\"4\":true,\"3\":true,\"6\":false,\"5\":true,\"0\":true,\"7\":true,\"2\":true,\"1\":true},\"modHorns\":-1,\"color1\":27,\"modTank\":-1,\"color2\":27,\"plateIndex\":3,\"modDial\":-1,\"modTrimB\":-1,\"modLivery\":-1,\"bodyHealth\":998.5,\"modTransmission\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"tankHealth\":999.3,\"modSuspension\":-1,\"modAerials\":-1,\"modSpoilers\":-1,\"plate\":\"25TGN879\",\"fuelLevel\":96.2,\"windowTint\":-1,\"neonEnabled\":[false,false,false,false],\"modVanityPlate\":-1,\"tyreBurst\":{\"0\":false,\"4\":false},\"modOrnaments\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modXenon\":false,\"modPlateHolder\":-1,\"xenonColor\":255,\"modFender\":-1,\"modBrakes\":-1,\"modBackWheels\":-1,\"modAirFilter\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"wheelColor\":27,\"modSideSkirt\":-1,\"dirtLevel\":6.1,\"modLightbar\":-1,\"modSmokeEnabled\":false,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"modSteeringWheel\":-1,\"doorsBroken\":{\"0\":false,\"1\":false},\"tyreSmokeColor\":[255,255,255],\"wheels\":6,\"modStruts\":-1,\"modArmor\":-1,\"modHydrolic\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255]}', 'car', 0, 0, 0, 0, 1, 0, 0),
('license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', '28DLO741', '{\"modSuspension\":-1,\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"tyreSmokeColor\":[255,255,255],\"modTank\":-1,\"modHood\":-1,\"modPlateHolder\":-1,\"modFrontBumper\":-1,\"modHorns\":-1,\"fuelLevel\":65.0,\"modDial\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"modTransmission\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"modArmor\":-1,\"wheelColor\":156,\"customPrimaryColor\":[0,0,0],\"doorsBroken\":{\"0\":false,\"2\":false,\"1\":false,\"4\":false,\"3\":false,\"6\":false,\"5\":false},\"modLightbar\":-1,\"modSmokeEnabled\":false,\"pearlescentColor\":57,\"extras\":[],\"modTrimA\":-1,\"modXenon\":false,\"modArchCover\":-1,\"modShifterLeavers\":-1,\"modSeats\":-1,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"xenonColor\":255,\"windowsBroken\":{\"0\":false,\"7\":false,\"2\":false,\"1\":false,\"4\":true,\"3\":false,\"6\":false,\"5\":true},\"modEngineBlock\":-1,\"model\":872704284,\"color1\":50,\"modGrille\":-1,\"modRoof\":-1,\"modEngine\":-1,\"modVanityPlate\":-1,\"modLivery\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"customSecondaryColor\":[0,0,0],\"modStruts\":-1,\"modOrnaments\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"plateIndex\":0,\"modFender\":-1,\"tyreBurst\":{\"4\":false,\"0\":false,\"1\":false,\"5\":false},\"dirtLevel\":0.0,\"modFrame\":-1,\"modAirFilter\":-1,\"tankHealth\":1000.0,\"wheels\":5,\"modDashboard\":-1,\"modRightFender\":-1,\"modExhaust\":-1,\"bodyHealth\":1000.0,\"color2\":50,\"modAerials\":-1,\"modSteeringWheel\":-1,\"plate\":\"28DLO741\",\"modHydrolic\":-1,\"modTrunk\":-1,\"modSpeakers\":-1,\"modDoorR\":-1,\"modTurbo\":false}', 'car', 0, 0, 0, 0, 0, 0, 0),
('license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', '29FBZ744', '{\"color1\":132,\"modArchCover\":-1,\"pearlescentColor\":132,\"modBrakes\":-1,\"modBackWheels\":-1,\"modRightFender\":-1,\"modTrimA\":-1,\"modTrunk\":-1,\"plateIndex\":0,\"tyreBurst\":{\"4\":false,\"0\":false},\"windowsBroken\":{\"5\":true,\"6\":false,\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"7\":true,\"0\":true},\"dirtLevel\":3.0,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"wheels\":6,\"fuelLevel\":65.0,\"windowTint\":-1,\"doorsBroken\":{\"1\":false,\"0\":false},\"modFender\":-1,\"modSuspension\":-1,\"model\":11251904,\"neonEnabled\":[false,false,false,false],\"modArmor\":-1,\"modVanityPlate\":-1,\"modHydrolic\":-1,\"neonColor\":[255,0,255],\"modDoorSpeaker\":-1,\"extras\":[],\"modFrontWheels\":-1,\"modSteeringWheel\":-1,\"modTurbo\":false,\"modLivery\":-1,\"modSeats\":-1,\"modAerials\":-1,\"modHood\":-1,\"modAirFilter\":-1,\"modOrnaments\":-1,\"xenonColor\":255,\"modEngineBlock\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"bodyHealth\":1000.0,\"wheelColor\":156,\"modRoof\":-1,\"modGrille\":-1,\"modTank\":-1,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modXenon\":false,\"modPlateHolder\":-1,\"modDial\":-1,\"plate\":\"29FBZ744\",\"modSideSkirt\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"modRearBumper\":-1,\"modLightbar\":-1,\"tankHealth\":1000.0,\"modEngine\":-1,\"modFrontBumper\":-1,\"color2\":132,\"modFrame\":-1,\"modSpeakers\":-1,\"modSpoilers\":-1,\"modTransmission\":-1,\"modDoorR\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":false}', 'car', 0, 0, 0, 0, 0, 0, 0),
('license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', '86TCP858', '{\"modAPlate\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modArchCover\":-1,\"modTurbo\":false,\"modEngineBlock\":-1,\"modSeats\":-1,\"modDoorSpeaker\":-1,\"color1\":10,\"model\":65402552,\"modTrunk\":-1,\"windowTint\":-1,\"modEngine\":-1,\"modRearBumper\":-1,\"wheels\":5,\"modXenon\":false,\"extras\":[],\"modRightFender\":-1,\"modFrame\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"dirtLevel\":7.2,\"modHood\":-1,\"tankHealth\":997.8,\"modSmokeEnabled\":false,\"neonColor\":[255,0,255],\"modAerials\":-1,\"modTank\":-1,\"modFender\":-1,\"doorsBroken\":{\"0\":false,\"5\":false,\"3\":false,\"4\":false,\"1\":false,\"2\":false},\"modSteeringWheel\":-1,\"modArmor\":-1,\"modLivery\":-1,\"modGrille\":-1,\"modSpoilers\":-1,\"modOrnaments\":-1,\"modSuspension\":-1,\"modBackWheels\":-1,\"pearlescentColor\":5,\"fuelLevel\":53.8,\"modTransmission\":-1,\"modHydrolic\":-1,\"windowsBroken\":{\"7\":true,\"0\":false,\"5\":true,\"6\":false,\"3\":false,\"4\":true,\"1\":false,\"2\":false},\"modDial\":-1,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"color2\":0,\"bodyHealth\":978.3,\"modLightbar\":-1,\"modTrimB\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"xenonColor\":255,\"modDoorR\":-1,\"wheelColor\":156,\"engineHealth\":17000.0,\"modPlateHolder\":-1,\"plate\":\"86TCP858\",\"modRoof\":-1,\"plateIndex\":3,\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"modStruts\":-1,\"modFrontWheels\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false}}', 'car', 0, 0, 0, 0, 1, 0, 0),
('license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'BYQP9511', '{\"model\":333640189,\"plate\":\"BYQP9511\"}', 'car', 1, 1, 0, 0, 1, 0, 0),
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'FJQO3943', '{\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modDashboard\":-1,\"modBrakes\":-1,\"modRightFender\":-1,\"modTrunk\":-1,\"modHood\":-1,\"modLivery\":-1,\"tyreBurst\":{\"1\":false,\"5\":false,\"0\":false,\"4\":false},\"engineHealth\":955.2,\"pearlescentColor\":10,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modSpeakers\":-1,\"modSideSkirt\":-1,\"doorsBroken\":{\"0\":false,\"2\":false,\"1\":false,\"4\":false,\"3\":false},\"modFrontBumper\":-1,\"modPlateHolder\":-1,\"modEngine\":-1,\"dirtLevel\":7.1,\"modFender\":-1,\"wheels\":0,\"modExhaust\":-1,\"extras\":[],\"modTransmission\":-1,\"modXenon\":false,\"bodyHealth\":996.5,\"modBackWheels\":-1,\"modHydrolic\":-1,\"modRearBumper\":-1,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"wheelColor\":156,\"color2\":88,\"modSeats\":-1,\"neonEnabled\":[false,false,false,false],\"modDoorR\":-1,\"fuelLevel\":64.4,\"modAPlate\":-1,\"modHorns\":-1,\"modLightbar\":-1,\"neonColor\":[255,0,255],\"modDoorSpeaker\":-1,\"windowTint\":-1,\"modFrame\":-1,\"windowsBroken\":{\"6\":false,\"5\":true,\"0\":true,\"7\":false,\"2\":false,\"1\":false,\"4\":true,\"3\":false},\"modRoof\":-1,\"modArmor\":-1,\"xenonColor\":255,\"modDial\":-1,\"modTank\":-1,\"color1\":111,\"plate\":\"FJQO3943\",\"modTrimA\":-1,\"modStruts\":-1,\"modTurbo\":false,\"modSpoilers\":-1,\"modOrnaments\":-1,\"modAerials\":-1,\"modAirFilter\":-1,\"plateIndex\":0,\"model\":1759947181,\"modSuspension\":-1,\"modArchCover\":-1,\"modEngineBlock\":-1,\"tankHealth\":999.6}', 'car', 1, 1, 0, 0, 1, 0, 0),
('license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'PLGX9519', '{\"model\":1075432268,\"plate\":\"PLGX9519\"}', 'aircraft', 1, 1, 0, 0, 1, 0, 0),
('license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 'UKSF8727', '{\"model\":1861786828,\"plate\":\"UKSF8727\"}', 'boat', 1, 1, 0, 0, 1, 0, 0);

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

INSERT INTO `phone_backups` (`id`, `phone_number`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '5550690');

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

INSERT INTO `phone_instagram_accounts` (`display_name`, `username`, `password`, `profile_image`, `bio`, `post_count`, `story_count`, `follower_count`, `following_count`, `phone_number`, `private`, `verified`, `date_joined`) VALUES
('Kays', 'kaysservice', '$2a$11$k8SdIChV2cS7i30hstg74uLz2X7zCIyS1fVxeSKcc5wJLrhbFKnK.', NULL, NULL, 0, 0, 0, 0, '5550690', 0, 0, '2025-10-09 14:10:36');

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

INSERT INTO `phone_logged_in_accounts` (`phone_number`, `app`, `username`, `active`) VALUES
('5550690', 'Instagram', 'kaysservice', 1),
('5550690', 'Twitter', 'kaysservice', 1);

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

INSERT INTO `phone_phones` (`id`, `owner_id`, `phone_number`, `name`, `pin`, `face_id`, `settings`, `is_setup`, `assigned`, `battery`, `last_seen`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '5550690', 'Téléphone de Angel', '2211', 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '{\"streamerMode\":false,\"name\":\"Téléphone de Angel\",\"locale\":\"fr\",\"wallpaper\":{\"blur\":false,\"background\":\"cloud\"},\"sound\":{\"volume\":0.5,\"texttone\":\"default\",\"callVolume\":0.5,\"ringtone\":\"default\",\"silent\":false},\"airplaneMode\":false,\"latestVersion\":\"2.3.7\",\"weather\":{\"celcius\":false},\"notifications\":[],\"time\":{\"twelveHourClock\":false},\"doNotDisturb\":false,\"apps\":[[\"Phone\",\"Messages\",\"Camera\",\"Photos\"],[\"Settings\",\"AppStore\",\"Clock\",\"Mail\",\"Weather\",\"Wallet\",\"Garage\",\"Home\",\"Maps\",\"Notes\",\"Calculator\",\"VoiceMemo\",\"Music\",\"Services\",\"Instagram\",\"Tinder\",\"Twitter\",\"TikTok\"]],\"storage\":{\"used\":8800028.920000002,\"total\":128000000},\"display\":{\"size\":0.7,\"theme\":\"dark\",\"automatic\":false,\"brightness\":1},\"security\":{\"faceId\":false,\"pinCode\":false},\"lockscreen\":{\"fontStyle\":1,\"color\":\"gradient\",\"layout\":1},\"phone\":{\"showCallerId\":true},\"version\":\"0.0.1\"}', 1, 0, 100, '2025-10-10 22:28:22');

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

INSERT INTO `phone_photos` (`id`, `phone_number`, `link`, `is_video`, `size`, `metadata`, `is_favourite`, `timestamp`) VALUES
(1, '5550690', 'https://r2.fivemanage.com/jgREfMNsQFdTGra1rVbsw/AYrqNFt9dZLF.webp', 0, 156.08, NULL, 0, '2025-10-09 14:48:27'),
(2, '5550690', 'https://r2.fivemanage.com/jgREfMNsQFdTGra1rVbsw/K7VU9HlEzbgh.webp', 0, 326.21, NULL, 0, '2025-10-09 15:18:04'),
(3, '5550690', 'https://r2.fivemanage.com/jgREfMNsQFdTGra1rVbsw/ort1ymQgsCzq.webp', 0, 215.63, NULL, 0, '2025-10-09 17:03:01');

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

INSERT INTO `phone_services_channels` (`id`, `phone_number`, `company`, `last_message`, `timestamp`) VALUES
(1, '5550690', 'sasp', 'kay', '2025-10-10 22:29:40');

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

INSERT INTO `phone_services_messages` (`id`, `channel_id`, `sender`, `message`, `x_pos`, `y_pos`, `timestamp`) VALUES
(1, 1, '5550690', 'kay', -373, -130, '2025-10-10 22:29:40');

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

INSERT INTO `phone_twitter_accounts` (`display_name`, `username`, `password`, `phone_number`, `bio`, `profile_image`, `profile_header`, `pinned_tweet`, `verified`, `follower_count`, `following_count`, `private`, `date_joined`) VALUES
('kays', 'kaysservice', '$2a$11$vrNNnkA8sBarSLJBRu73QeXIea2VPfGiiQC.VSG8lmP1muGTwQmXe', '5550690', NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2025-10-09 14:19:39');

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

INSERT INTO `piwel_territoires` (`zone`, `id_crew_owner`, `crews_points`) VALUES
('Chantier Paleto', NULL, '{}'),
('Davis', NULL, '{}'),
('Grand Senora Desert', NULL, '{}'),
('GrapeSeed', NULL, '{}'),
('Mirror Park', NULL, '{}'),
('San Andreas', NULL, '{}'),
('Vinewood Boulevard', NULL, '{}');

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

INSERT INTO `plaintes` (`identifier`, `Prenom`, `Nom`, `Num`, `Prenom1`, `Nom1`, `Num1`, `raison`, `auteur`) VALUES
('license:22f81345d6a4cfd83cdb6bf9d6f37301cbf95de6', 'Smith', 'Mike', '/', '/', '/', '/', 'Arme - Carabine Spéciale a vous donner', 'Mike'),
('license:6caeec777267cd716b8ef935b01864deab9718eb', 'BONJOUR', 'AURVOIR', '06 36 63 45 54', 'DOCTEUR ', 'MEDECIN', '06 07 34 23 65', 'Y A DIT BONJOUR LE SOIR', 'FHOVIX'),
('license:797a0e3622aa173a6cd4bd018a4804c15c125f50', 'Cailloux', 'Pierre', '18965415', 'Meyers', 'Robert', 'J ai pas', 'Viol a plusieur reprise', '.Zayros'),
('license:d2c898f434411deb914a859262c0ee27d900388d', 'myer', 'Henryco', '06 52 44 24 94', 'myer', 'Robert', '002020203033', 'viole sur mineur', 'Henrycoo');

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

INSERT INTO `playerstattoos` (`identifier`, `tattoos`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', '[]'),
('license:19cd4d4c04b7f410e6fc179619e618dcc7528757', '[]'),
('license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', '[]'),
('license:2e35218c23bd014dcb89d25164f85957a1af2a7f', '[]'),
('license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', '[]'),
('license:44cd1ef37b4fda00d53702007fb2c5cec6356919', '[]'),
('license:52953829a66104dfd4a1cf30f3ef7f5990714968', '[]'),
('license:5b72f58116e111c998f65cc2446b28716b1c6656', '[]'),
('license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', '[]'),
('license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', '[]'),
('license:85e8937833a05423627d78865cb0da6ab013652b', '[]'),
('license:86f18a2d6f24691336c74f6987dd645cdb65e45a', '[]'),
('license:88830294ccd5ffe723158350adb3f2046b1fe30c', '[]'),
('license:88afb341c54c6ed2006bd7be158667299b00d341', '[]'),
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', '[]'),
('license:a3eefd2be737902bcc0a3d5048b8ad611602000c', '[]'),
('license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', '[{\"texture\":\"MP_LUXE_TAT_009_F\",\"collection\":\"mpluxe_overlays\"},{\"texture\":\"MP_MP_ImportExport_Tat_007_F\",\"collection\":\"mpimportexport_overlays\"}]'),
('license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', '[]'),
('license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', '[]'),
('license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', '[{\"texture\":\"MP_Buis_M_Neck_003\",\"collection\":\"mpbusiness_overlays\"},{\"texture\":\"MP_LR_Tat_006_F\",\"collection\":\"mplowrider2_overlays\"},{\"texture\":\"MP_LR_Tat_035_F\",\"collection\":\"mplowrider2_overlays\"},{\"texture\":\"MP_LR_Tat_018_F\",\"collection\":\"mplowrider2_overlays\"},{\"texture\":\"FM_Tat_F_027\",\"collection\":\"multiplayer_overlays\"},{\"texture\":\"FM_Tat_M_000\",\"collection\":\"multiplayer_overlays\"}]'),
('license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', '[]'),
('license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', '[]'),
('license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', '[]'),
('license:dee2edc22852c38e04ab150a05d65c454db22ab3', '[]'),
('license:effa1ffd386df938a94332c73611cf8003bdbf36', '[]'),
('license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', '[]');

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

INSERT INTO `player_outfits` (`id`, `identifier`, `name`, `outfit`) VALUES
(1, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"torso\":{\"texture\":0,\"drawable\":87},\"undershirt\":{\"texture\":0,\"drawable\":15},\"pants\":{\"texture\":0,\"drawable\":1},\"shoes\":{\"texture\":0,\"drawable\":0},\"accessories\":{\"texture\":0,\"drawable\":0},\"arms\":{\"texture\":0,\"drawable\":0}}'),
(2, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'caca', '{\"torso\":{\"drawable\":6,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"accessories\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0}}'),
(3, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"accessories\":{\"drawable\":0,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"torso\":{\"drawable\":6,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0}}'),
(4, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"accessories\":{\"drawable\":0,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"torso\":{\"drawable\":10,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0}}'),
(5, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"accessories\":{\"drawable\":0,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"torso\":{\"drawable\":6,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0}}'),
(6, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"accessories\":{\"drawable\":0,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"torso\":{\"drawable\":51,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0}}'),
(7, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4', 'test', '{\"accessories\":{\"drawable\":0,\"texture\":0},\"pants\":{\"drawable\":1,\"texture\":0},\"shoes\":{\"drawable\":0,\"texture\":0},\"torso\":{\"drawable\":43,\"texture\":0},\"arms\":{\"drawable\":0,\"texture\":0},\"undershirt\":{\"drawable\":15,\"texture\":0}}');

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

INSERT INTO `player_uids` (`id`, `uid`, `identifier`) VALUES
(1, 1, 'license:3310914fc4f9f87dd05b0fb4fe52519a2d0702d4'),
(2, 2, 'license:889f0d96d7e5b365c6921a856b44258bb17c0868'),
(4, 3, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2'),
(5, 4, 'license:214315ffb6b1f4899c249364bc1b44dfd5a690e1'),
(6, 5, 'license:52953829a66104dfd4a1cf30f3ef7f5990714968'),
(7, 6, 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1'),
(8, 7, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded'),
(9, 8, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3'),
(10, 9, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a'),
(11, 10, 'license:44cd1ef37b4fda00d53702007fb2c5cec6356919'),
(12, 11, 'license:85e8937833a05423627d78865cb0da6ab013652b'),
(13, 12, 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757'),
(14, 13, 'license:88afb341c54c6ed2006bd7be158667299b00d341'),
(15, 14, 'license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f'),
(16, 15, 'license:d80d72c120d125db77e208fec6c02ffd4d14ef6b'),
(17, 16, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce'),
(18, 17, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f'),
(19, 18, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c'),
(20, 19, 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f'),
(21, 20, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6'),
(22, 21, 'license:effa1ffd386df938a94332c73611cf8003bdbf36'),
(23, 22, 'license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394'),
(24, 23, 'license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8'),
(25, 24, 'license:5b72f58116e111c998f65cc2446b28716b1c6656'),
(26, 25, 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c'),
(27, 26, 'license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c'),
(28, 27, 'license:86f18a2d6f24691336c74f6987dd645cdb65e45a'),
(29, 28, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1');

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

INSERT INTO `playtime` (`identifier`, `timeplayed`) VALUES
('license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 47700000),
('license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 4740000),
('license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', 27540000),
('license:2e35218c23bd014dcb89d25164f85957a1af2a7f', 180000),
('license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', 780000),
('license:44cd1ef37b4fda00d53702007fb2c5cec6356919', 840000),
('license:455f58044f988017e2a1eafe39970040aa2ecaf3', 1020000),
('license:52953829a66104dfd4a1cf30f3ef7f5990714968', 32700000),
('license:5b72f58116e111c998f65cc2446b28716b1c6656', 720000),
('license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', 2220000),
('license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', 3360000),
('license:85e8937833a05423627d78865cb0da6ab013652b', 3960000),
('license:86f18a2d6f24691336c74f6987dd645cdb65e45a', 480000),
('license:88830294ccd5ffe723158350adb3f2046b1fe30c', 5580000),
('license:88afb341c54c6ed2006bd7be158667299b00d341', 240000),
('license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 44100000),
('license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 2640000),
('license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 10620000),
('license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 4080000),
('license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', 60000),
('license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 18720000),
('license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', 60000),
('license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', 1560000),
('license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 52980000),
('license:dee2edc22852c38e04ab150a05d65c454db22ab3', 2340000),
('license:effa1ffd386df938a94332c73611cf8003bdbf36', 720000),
('license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', 2220000);

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

INSERT INTO `rapports` (`Prenom`, `Nom`, `Type`, `Montant`) VALUES
('sacha ', 'fonoti', 'Réanimation', '5000'),
('sacha ', 'fonoti', 'Réanimation', '5000'),
('nil', 'fonoti', 'Réanimation', '5000'),
('Sacha', 'fonoti', 'Réanimation', '5000'),
('rose', 'je sais pas', 'Grands soins', '1000000');

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

INSERT INTO `slife_gf_zones` (`idtemp`, `id`, `infos`, `players`) VALUES
(4, 1, '{\"name\":\"Dust\",\"maxPlayers\":25}', '[{\"UniqueID\":12238,\"isIn\":false,\"name\":\"Kays\",\"lastKillTime\":34619983,\"kill\":45},{\"UniqueID\":7842,\"isIn\":false,\"name\":\"akito\",\"lastKillTime\":82148165,\"kill\":24},{\"UniqueID\":178,\"isIn\":false,\"name\":\"slayz\",\"kill\":0},{\"UniqueID\":14288,\"isIn\":false,\"name\":\"ydk.dppppppppppp\",\"lastKillTime\":42326139,\"kill\":98},{\"UniqueID\":14419,\"isIn\":false,\"name\":\"cybow93\",\"lastKillTime\":48717568,\"kill\":29},{\"UniqueID\":11130,\"isIn\":false,\"name\":\"Carlos\",\"lastKillTime\":17556901,\"kill\":9},{\"UniqueID\":1330,\"isIn\":false,\"name\":\"az_piwi\",\"lastKillTime\":1238390,\"kill\":3},{\"UniqueID\":9561,\"isIn\":false,\"name\":\"valen\",\"lastKillTime\":60991762,\"kill\":12},{\"UniqueID\":14536,\"isIn\":false,\"name\":\"simba\",\"lastKillTime\":51131277,\"kill\":138},{\"UniqueID\":10315,\"isIn\":false,\"name\":\"amx.fr\",\"lastKillTime\":47768866,\"kill\":50},{\"UniqueID\":11272,\"isIn\":false,\"name\":\"Dexgang95140\",\"lastKillTime\":55655077,\"kill\":157},{\"UniqueID\":14546,\"isIn\":false,\"name\":\"Hawk.Gf\",\"kill\":0},{\"UniqueID\":14101,\"isIn\":false,\"name\":\"KDZ\",\"lastKillTime\":30169615,\"kill\":20},{\"UniqueID\":14100,\"isIn\":false,\"name\":\"Vit\",\"lastKillTime\":19820646,\"kill\":10},{\"UniqueID\":14249,\"isIn\":false,\"name\":\"hld\",\"kill\":0},{\"UniqueID\":14277,\"isIn\":false,\"name\":\"sebas\",\"kill\":0},{\"UniqueID\":11824,\"isIn\":false,\"name\":\"soben\",\"kill\":0},{\"UniqueID\":14136,\"isIn\":false,\"name\":\"Silvio\",\"lastKillTime\":30231091,\"kill\":6},{\"UniqueID\":12392,\"isIn\":false,\"name\":\"14bmkytb\",\"kill\":0},{\"UniqueID\":9241,\"isIn\":false,\"name\":\"sskmo\",\"lastKillTime\":35637282,\"kill\":66},{\"UniqueID\":10312,\"isIn\":false,\"name\":\"FZK\",\"lastKillTime\":55373463,\"kill\":79},{\"UniqueID\":1594,\"isIn\":false,\"name\":\"ben93140\",\"lastKillTime\":34005237,\"kill\":11},{\"UniqueID\":13414,\"isIn\":false,\"name\":\"JeremieDasanta\",\"kill\":0},{\"UniqueID\":10047,\"isIn\":false,\"name\":\"ayko\",\"lastKillTime\":59107462,\"kill\":14},{\"UniqueID\":9530,\"isIn\":false,\"name\":\"yashog3\",\"lastKillTime\":22845769,\"kill\":18},{\"UniqueID\":5949,\"isIn\":false,\"name\":\"LewisMillers\",\"lastKillTime\":57609788,\"kill\":130},{\"UniqueID\":7665,\"isIn\":false,\"name\":\"Nafa\",\"lastKillTime\":58917769,\"kill\":82},{\"UniqueID\":5945,\"isIn\":false,\"name\":\"idx_nazo\",\"lastKillTime\":58957221,\"kill\":36},{\"UniqueID\":1658,\"isIn\":false,\"name\":\"LuSky\",\"kill\":0},{\"UniqueID\":1174,\"isIn\":false,\"name\":\"le_joker\",\"lastKillTime\":41379396,\"kill\":25},{\"UniqueID\":4487,\"isIn\":false,\"name\":\"JAMES\",\"lastKillTime\":41527935,\"kill\":33},{\"UniqueID\":8483,\"isIn\":false,\"name\":\"vatos\",\"lastKillTime\":62471601,\"kill\":188},{\"UniqueID\":10483,\"isIn\":false,\"name\":\"Noahhh\",\"kill\":0},{\"UniqueID\":89,\"isIn\":false,\"name\":\"antoi\",\"lastKillTime\":61849239,\"kill\":41},{\"UniqueID\":93,\"isIn\":false,\"name\":\"swg\",\"lastKillTime\":61736966,\"kill\":37},{\"UniqueID\":14588,\"isIn\":false,\"name\":\"Mangaz\",\"lastKillTime\":61026427,\"kill\":17},{\"UniqueID\":14593,\"isIn\":false,\"name\":\"ebgyusiy70\",\"kill\":0},{\"UniqueID\":10467,\"isIn\":false,\"name\":\"Administrateur\",\"kill\":0},{\"UniqueID\":14590,\"isIn\":false,\"name\":\"smoky\",\"kill\":0},{\"UniqueID\":14589,\"isIn\":false,\"name\":\"Mathis\",\"lastKillTime\":55652700,\"kill\":1},{\"UniqueID\":13513,\"isIn\":false,\"name\":\"A2VM\",\"lastKillTime\":59088947,\"kill\":31},{\"UniqueID\":11413,\"isIn\":false,\"name\":\"izzoz21\",\"kill\":0},{\"UniqueID\":14317,\"isIn\":false,\"name\":\"Luney2ns\",\"lastKillTime\":82220353,\"kill\":18},{\"UniqueID\":11473,\"isIn\":false,\"name\":\"jujuhjujuh998\",\"kill\":0},{\"UniqueID\":14092,\"isIn\":false,\"name\":\"Osheun\",\"kill\":0},{\"UniqueID\":11943,\"isIn\":false,\"name\":\"papyj\",\"kill\":0},{\"UniqueID\":8693,\"isIn\":false,\"name\":\"Cristiano\",\"kill\":0},{\"UniqueID\":8689,\"isIn\":false,\"name\":\"Izix\",\"lastKillTime\":64709569,\"kill\":26},{\"UniqueID\":12024,\"isIn\":false,\"name\":\"Maylo\",\"lastKillTime\":40331946,\"kill\":14},{\"UniqueID\":11308,\"isIn\":false,\"name\":\"Kls\",\"kill\":0},{\"UniqueID\":9036,\"isIn\":false,\"name\":\"fierf\",\"kill\":0},{\"UniqueID\":14318,\"isIn\":false,\"name\":\"Rafaelo\",\"kill\":0},{\"UniqueID\":14319,\"isIn\":false,\"name\":\"SK\",\"kill\":0},{\"UniqueID\":13702,\"isIn\":false,\"name\":\"Bandito\",\"kill\":0},{\"UniqueID\":2607,\"isIn\":false,\"name\":\"Craig\",\"lastKillTime\":62390495,\"kill\":39},{\"UniqueID\":4089,\"isIn\":false,\"name\":\"andrew\",\"lastKillTime\":62441426,\"kill\":24},{\"UniqueID\":3622,\"isIn\":false,\"name\":\"NAIIKOO\",\"lastKillTime\":62388128,\"kill\":196},{\"UniqueID\":3273,\"isIn\":false,\"name\":\"zekfr\",\"lastKillTime\":62230203,\"kill\":82},{\"UniqueID\":4136,\"isIn\":false,\"name\":\"iinlaxxu\",\"lastKillTime\":62575093,\"kill\":2},{\"UniqueID\":12983,\"isIn\":false,\"name\":\"Zayros\",\"lastKillTime\":63805574,\"kill\":17}]');

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

INSERT INTO `tebex_accounts` (`steam`, `fivem`, `vip`, `expiration`) VALUES
('1419b137c7211a1e0a7d25079f68a9050287b9a1', '9141304', 3, 1762501673),
('19cd4d4c04b7f410e6fc179619e618dcc7528757', '17049513', 0, 0),
('214315ffb6b1f4899c249364bc1b44dfd5a690e1', '14220563', 0, 0),
('2e35218c23bd014dcb89d25164f85957a1af2a7f', '0', 0, 0),
('3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', '1137998', 0, 0),
('44cd1ef37b4fda00d53702007fb2c5cec6356919', '8110601', 0, 0),
('455f58044f988017e2a1eafe39970040aa2ecaf3', '13513617', 0, 0),
('52953829a66104dfd4a1cf30f3ef7f5990714968', '13351934', 0, 0),
('5b72f58116e111c998f65cc2446b28716b1c6656', '15914073', 0, 0),
('7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', '8328191', 0, 0),
('80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', '14480406', 0, 0),
('85e8937833a05423627d78865cb0da6ab013652b', '17526033', 0, 0),
('86f18a2d6f24691336c74f6987dd645cdb65e45a', '17567329', 0, 0),
('88830294ccd5ffe723158350adb3f2046b1fe30c', '12639573', 0, 0),
('88afb341c54c6ed2006bd7be158667299b00d341', '9737729', 0, 0),
('8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', '9141304', 0, 0),
('a3eefd2be737902bcc0a3d5048b8ad611602000c', '10775537', 0, 0),
('a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', '7924653', 0, 0),
('a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', '0', 0, 0),
('bd0b96bcf0ad850627351145e2cd98ce9fb9b394', '0', 0, 0),
('c6ee6cf33cab4d0a29ec683fdb8042b04471cded', '4479984', 3, 1760314041),
('ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', '5386085', 0, 0),
('d80d72c120d125db77e208fec6c02ffd4d14ef6b', '10403284', 0, 0),
('dc502dade01b28a90ede45a6538b6c1a0794f6ce', '17406911', 0, 0),
('dee2edc22852c38e04ab150a05d65c454db22ab3', '15010377', 0, 0),
('effa1ffd386df938a94332c73611cf8003bdbf36', '9904507', 0, 0),
('ff187a16a8f5e997e2d25dcb92abba25aff5f52f', '8705535', 3, 1760296287);

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

INSERT INTO `tebex_fidelite` (`id`, `license`, `havebuy`, `totalbuy`) VALUES
(1, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 0, 0),
(2, 'license:8f181d9ed17e4d3c6bdbf74a77fd6b5ff2cc0ee2', 0, 0),
(3, 'license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', 0, 0),
(4, 'license:214315ffb6b1f4899c249364bc1b44dfd5a690e1', 0, 0),
(5, 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 0, 0),
(6, 'license:52953829a66104dfd4a1cf30f3ef7f5990714968', 0, 0),
(7, 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 0, 0),
(8, 'license:a3f90caeb2011bbe94ead4782b3ff5832d39bdf1', 0, 0),
(9, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 2500, 17500),
(10, 'license:c6ee6cf33cab4d0a29ec683fdb8042b04471cded', 2500, 17500),
(11, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 0, 0),
(12, 'license:dee2edc22852c38e04ab150a05d65c454db22ab3', 0, 0),
(13, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 0, 0),
(14, 'license:a8f9e7cc2eb121d983f0daa8a77d5641fd32c34a', 0, 0),
(15, 'license:44cd1ef37b4fda00d53702007fb2c5cec6356919', 0, 0),
(16, 'license:44cd1ef37b4fda00d53702007fb2c5cec6356919', 0, 0),
(17, 'license:85e8937833a05423627d78865cb0da6ab013652b', 0, 0),
(18, 'license:85e8937833a05423627d78865cb0da6ab013652b', 0, 0),
(19, 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 0, 0),
(20, 'license:19cd4d4c04b7f410e6fc179619e618dcc7528757', 0, 0),
(21, 'license:88afb341c54c6ed2006bd7be158667299b00d341', 0, 0),
(22, 'license:88afb341c54c6ed2006bd7be158667299b00d341', 0, 0),
(23, 'license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', 2000, 2000),
(24, 'license:ff187a16a8f5e997e2d25dcb92abba25aff5f52f', 2000, 2000),
(25, 'license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', 0, 0),
(26, 'license:d80d72c120d125db77e208fec6c02ffd4d14ef6b', 0, 0),
(27, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 0, 0),
(28, 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce', 0, 0),
(29, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', 0, 0),
(30, 'license:80f2cc0ea0e2d8b3ff8f60d70e18b334baaf873f', 0, 0),
(31, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 0, 0),
(32, 'license:88830294ccd5ffe723158350adb3f2046b1fe30c', 0, 0),
(33, 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f', 0, 0),
(34, 'license:2e35218c23bd014dcb89d25164f85957a1af2a7f', 0, 0),
(35, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', 0, 0),
(36, 'license:7ff6f1946f2f1bfe40b860ecf6100019f1a71bc6', 0, 0),
(37, 'license:effa1ffd386df938a94332c73611cf8003bdbf36', 0, 0),
(38, 'license:effa1ffd386df938a94332c73611cf8003bdbf36', 0, 0),
(39, 'license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', 0, 0),
(40, 'license:bd0b96bcf0ad850627351145e2cd98ce9fb9b394', 0, 0),
(41, 'license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', 0, 0),
(42, 'license:3c2f3c5fb0bd9cf8f0b03f9c87b936d5fb0a87c8', 0, 0),
(43, 'license:5b72f58116e111c998f65cc2446b28716b1c6656', 0, 0),
(44, 'license:5b72f58116e111c998f65cc2446b28716b1c6656', 0, 0),
(45, 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 0, 0),
(46, 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c', 0, 0),
(47, 'license:455f58044f988017e2a1eafe39970040aa2ecaf3', 0, 0),
(48, 'license:455f58044f988017e2a1eafe39970040aa2ecaf3', 0, 0),
(49, 'license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', 0, 0),
(50, 'license:ce5deecf9b52b051d22f5b1f7c9e2fe726a91e1c', 0, 0),
(51, 'license:86f18a2d6f24691336c74f6987dd645cdb65e45a', 0, 0),
(52, 'license:86f18a2d6f24691336c74f6987dd645cdb65e45a', 0, 0),
(53, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 4500, 4500),
(54, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 4500, 4500);

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

INSERT INTO `tebex_logs_commands` (`id`, `fivem`, `command`, `argument`, `transaction`) VALUES
(3, '137', 'removeVip', '3', '0'),
(4, '137', 'removeVip', '3', '1'),
(5, '67', 'removeVip', '3', 'supp'),
(6, '67', 'removeVip', '3', 'supp'),
(7, '67', 'removeVip', '2', 'supp'),
(8, '67', 'removeVip', '1', 'supp'),
(9, '67', 'removeVip', '0', 'supp'),
(10, '5', 'removeVip', '1', '1');

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

INSERT INTO `tebex_players_wallet` (`identifiers`, `transaction`, `price`, `currency`, `points`, `created_at`, `updated_at`) VALUES
('9141304', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-08-30 15:03:10', '2025-08-30 15:03:10'),
('14220563', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-09 12:15:47', '2025-09-09 12:15:47'),
('13333006', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-09 16:07:39', '2025-09-09 16:07:39'),
('7924653', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-09 16:39:56', '2025-09-09 16:39:56'),
('15010377', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-10 14:33:52', '2025-09-10 14:33:52'),
('4479984', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-10 17:38:15', '2025-09-10 17:38:15'),
('8110601', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-11 20:20:16', '2025-09-11 20:20:16'),
('17526033', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 18:25:46', '2025-09-12 18:25:46'),
('17049513', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 18:33:32', '2025-09-12 18:33:32'),
('9737729', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 18:36:50', '2025-09-12 18:36:50'),
('8705535', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 18:38:21', '2025-09-12 18:38:21'),
('10403284', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 18:57:36', '2025-09-12 18:57:36'),
('9737729', 'Ajout de Coins via la console', '0', 'Points', 17000, '2025-09-12 19:03:12', '2025-09-12 19:03:12'),
('8705535', 'Ajout de Coins via la console', '0', 'Points', 17000, '2025-09-12 19:03:21', '2025-09-12 19:03:21'),
('10403284', 'Ajout de Coins via la console', '0', 'Points', 1000, '2025-09-12 19:07:02', '2025-09-12 19:07:02'),
('10403284', 'Ajout de Coins via la console', '0', 'Points', 1500, '2025-09-12 19:08:43', '2025-09-12 19:08:43'),
('8705535', 'Achat de : VIP Diamond 1 Mois', '0', 'Points', -2000, '2025-09-12 19:11:04', '2025-09-12 19:11:04'),
('17406911', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 19:24:21', '2025-09-12 19:24:21'),
('14480406', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 19:30:23', '2025-09-12 19:30:23'),
('4479984', 'Ajout de Coins via la console', '0', 'Points', 500, '2025-09-12 20:00:30', '2025-09-12 20:00:30'),
('14480406', 'Ajout de Coins via la console', '0', 'Points', 8500, '2025-09-12 20:03:11', '2025-09-12 20:03:11'),
('4479984', 'Ajout de Coins via la console', '0', 'Points', 8500, '2025-09-12 20:05:20', '2025-09-12 20:05:20'),
('4479984', 'Ajout de Coins via la console', '0', 'Points', 20000, '2025-09-12 20:05:36', '2025-09-12 20:05:36'),
('12639573', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-12 20:10:23', '2025-09-12 20:10:23'),
('12639573', 'Ajout de Coins via la console', '0', 'Points', 13000, '2025-09-12 20:55:30', '2025-09-12 20:55:30'),
('4479984', 'Achat de : VIP Diamond 1 Mois', '0', 'Points', -2000, '2025-09-13 00:07:15', '2025-09-13 00:07:15'),
('4479984', 'Achat Entreprise', '0', 'Points', -5000, '2025-09-13 00:07:24', '2025-09-13 00:07:24'),
('9141304', 'Ajout de Coins via la console', '0', 'Points', 84374, '2025-09-13 00:08:39', '2025-09-13 00:08:39'),
('4479984', 'Achat de : gblod4', '0', 'Points', -2500, '2025-09-13 00:09:42', '2025-09-13 00:09:42'),
('4479984', 'Achat de : Longfin', '0', 'Points', -3000, '2025-09-13 00:10:29', '2025-09-13 00:10:29'),
('4479984', 'Achat de : Swift Deluxe', '0', 'Points', -5000, '2025-09-13 00:11:12', '2025-09-13 00:11:12'),
('8328191', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-13 04:20:43', '2025-09-13 04:20:43'),
('9904507', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-13 10:32:49', '2025-09-13 10:32:49'),
('1137998', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-13 14:44:10', '2025-09-13 14:44:10'),
('15914073', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-13 15:07:47', '2025-09-13 15:07:47'),
('10775537', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-13 20:50:47', '2025-09-13 20:50:47'),
('13513617', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-14 17:52:23', '2025-09-14 17:52:23'),
('5386085', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-14 23:33:18', '2025-09-14 23:33:18'),
('17567329', 'Cadeau de Bienvenue', '0', 'Points', 1000, '2025-09-17 07:32:02', '2025-09-17 07:32:02'),
('9141304', 'Achat de : VIP Diamond 1 Mois', '0', 'Points', -2000, '2025-10-08 09:47:12', '2025-10-08 09:47:12'),
('9141304', 'Achat de : Schwartzers', '0', 'Points', -2500, '2025-10-09 20:40:22', '2025-10-09 20:40:22');

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

INSERT INTO `users` (`character_id`, `identifier`, `permission_group`, `permission_level`, `position`, `skin`, `accounts`, `inventory`, `loadout`, `job`, `job_grade`, `job2`, `job2_grade`, `isDead`, `status`, `last_property`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `animations`, `tattoos`, `coins`, `jail_time`, `xp`, `rp_rank`, `statuscompte`, `viplevel`, `kills`, `apps`, `widget`, `bt`, `charinfo`, `metadata`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `first_screen_showed`, `adventcalendar`, `ammo`, `IsHurt`, `idhouse`, `idgarage`, `wheel`, `in_property`, `property_id`, `in_garage`, `uid`, `account_number`, `bank`, `image_url`, `code_boutique`, `phone_number`) VALUES
(1, 'license:1419b137c7211a1e0a7d25079f68a9050287b9a1', 'user', 0, '{\"z\":29.70000076293945,\"x\":72.80000305175781,\"y\":-1397.0999755859376}', '{\"chin_2\":0,\"beard_2\":10,\"nose_2\":0,\"blush_2\":0,\"bodyb_2\":0,\"sex\":0,\"face_md_weight\":50,\"torso_1\":73,\"chin_1\":0,\"nose_4\":0,\"chest_1\":0,\"lip_thickness\":0,\"cheeks_2\":0,\"torso_2\":0,\"chain_1\":0,\"sun_2\":0,\"eyebrows_3\":0,\"helmet_1\":-1,\"shoes_1\":274,\"hair_2\":0,\"eyebrows_2\":10,\"pants_2\":1,\"eye_squint\":0,\"lipstick_1\":0,\"age_1\":0,\"complexion_1\":0,\"mask_2\":0,\"blemishes_1\":0,\"lipstick_4\":0,\"bodyb_1\":-1,\"chest_3\":0,\"bags_1\":0,\"moles_1\":0,\"eyebrows_1\":26,\"arms_2\":0,\"bproof_1\":65,\"decals_1\":0,\"tshirt_1\":15,\"mom\":23,\"sun_1\":0,\"tshirt_2\":0,\"nose_6\":0,\"hair_color_2\":0,\"bracelets_1\":-1,\"ears_2\":0,\"cheeks_1\":0,\"chest_2\":0,\"eyebrows_6\":0,\"watches_2\":0,\"bodyb_3\":-1,\"jaw_2\":0,\"mask_1\":0,\"chin_4\":0,\"bproof_2\":0,\"beard_1\":3,\"blush_1\":0,\"nose_3\":0,\"glasses_1\":0,\"ears_1\":-1,\"chin_3\":0,\"bodyb_4\":0,\"eyebrows_5\":0,\"helmet_2\":0,\"beard_4\":0,\"glasses_2\":0,\"neck_thickness\":0,\"watches_1\":-1,\"shoes_2\":0,\"makeup_2\":0,\"age_2\":0,\"nose_5\":0,\"makeup_1\":0,\"complexion_2\":0,\"blemishes_2\":0,\"blush_3\":0,\"lipstick_2\":0,\"cheeks_3\":0,\"chain_2\":0,\"lipstick_3\":0,\"bracelets_2\":0,\"beard_3\":0,\"pants_1\":25,\"arms\":0,\"skin_md_weight\":50,\"dad\":2,\"makeup_4\":0,\"makeup_3\":0,\"hair_1\":246,\"eyebrows_4\":0,\"moles_2\":0,\"jaw_1\":0,\"decals_2\":0,\"hair_color_1\":0,\"nose_1\":0,\"eye_color\":0,\"bags_2\":0}', '[{\"money\":52550,\"name\":\"cash\"},{\"money\":0,\"name\":\"dirtycash\"},{\"money\":324434,\"name\":\"bank\"},{\"money\":0,\"name\":\"chip\"},{\"money\":0,\"name\":\"crypto\"}]', '[{\"count\":1,\"name\":\"jewels\"},{\"count\":5,\"name\":\"water\"},{\"count\":1,\"name\":\"fixkit\"},{\"count\":4,\"name\":\"bread\"},{\"count\":1,\"name\":\"radio\"},{\"count\":1,\"name\":\"phone\"}]', '[]', 'sasp', 6, 'unemployed2', 0, 0, '[{\"percent\":91.27,\"val\":912700,\"name\":\"hunger\"},{\"percent\":78.4525,\"val\":784525,\"name\":\"thirst\"}]', NULL, 'Angel', 'Holl', '02/07/2000', '0', '150', NULL, NULL, 0, 0, 0, 1, 0, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '{\"assault_rifles\":766}', 0, '-1', '-1', NULL, 0, NULL, 0, 28, NULL, 0, NULL, NULL, NULL);

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

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'drive', 'license:dc502dade01b28a90ede45a6538b6c1a0794f6ce'),
(2, 'drive', 'license:a3eefd2be737902bcc0a3d5048b8ad611602000c');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
