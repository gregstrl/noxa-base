-- Boissons (Bouteilles)
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('bouteilleeau', 'Bouteille d''eau', 0.5, 0, 1),
('bouteille_jusorange', 'Bouteille de jus d''orange', 0.5, 0, 1),
('bouteille_justomate', 'Bouteille de jus de tomate', 0.5, 0, 1),
('bouteille_vodkapure', 'Bouteille de vodka pure', 1.0, 0, 1),
('bouteille_rhum20', 'Bouteille de rhum 20 ans', 1.0, 0, 1),
('bouteille_lait', 'Bouteille de lait', 0.5, 0, 1),
('bouteille_grenadine', 'Sirop de grenadine', 0.5, 0, 1),
('bouteille_sparklingwater', 'Eau gazeuse', 0.5, 0, 1),
('bouteille_vodka', 'Bouteille de vodka', 1.0, 0, 1),
('bouteille_coca', 'Bouteille de coca', 0.5, 0, 1),
('bouteille_gin', 'Bouteille de gin', 1.0, 0, 1),
('bouteille_whitewine', 'Bouteille de vin blanc', 1.0, 0, 1),
('bouteille_champagne', 'Bouteille de champagne', 1.0, 0, 1),
('bouteille_campari', 'Bouteille de campari', 1.0, 0, 1),
('bouteille_loveliquor', 'Liqueur d''amour', 1.0, 0, 1),
('bouteille_frenchwhisky', 'Whisky français', 1.0, 0, 1);

-- Ingrédients (Farm)
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('citron', 'Citron', 0.1, 0, 1),
('citron_vert', 'Citron vert', 0.1, 0, 1),
('menthe', 'Menthe', 0.1, 0, 1),
('cerise', 'Cerise', 0.1, 0, 1),
('framboise', 'Framboise', 0.1, 0, 1),
('fraise', 'Fraise', 0.1, 0, 1),
('miel', 'Miel', 0.2, 0, 1);

-- Nourriture
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('mangue', 'Mangue', 0.2, 0, 1),
('raisin', 'Raisin', 0.2, 0, 1),
('cacahuetes', 'Cacahuètes', 0.2, 0, 1),
('chips', 'Chips', 0.2, 0, 1),
('bonbons', 'Bonbons', 0.1, 0, 1),
('sucre', 'Sucre', 0.1, 0, 1),
('creme_cacao', 'Crème de cacao', 0.3, 0, 1);

-- Vaisselle
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('verre', 'Verre', 0.5, 0, 1),
('bol', 'Bol', 0.5, 0, 1),
('cuillere', 'Cuillère', 0.1, 0, 1);

-- Cocktails Signature
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('cocktail_manhattan', 'Le Manhattan', 0.3, 0, 1),
('cocktail_chouquette', 'Le Chouquette', 0.3, 0, 1),
('cocktail_tvn', 'Le TVN', 0.3, 0, 1),
('cocktail_siraxe', 'Le Siraxe', 0.3, 0, 1),
('cocktail_ca2frere', 'Le Ca2frere', 0.3, 0, 1);

-- Cocktails Avancés
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('cocktail_americano', 'Americano', 0.3, 0, 1),
('cocktail_airmail', 'Air Mail', 0.3, 0, 1),
('cocktail_blackrussian', 'Black Russian', 0.3, 0, 1),
('cocktail_bloodymary', 'Bloody Mary', 0.3, 0, 1),
('cocktail_bronx', 'Bronx', 0.3, 0, 1);

-- Cocktails Simples
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('cocktail_gintonic', 'Gin Tonic', 0.3, 0, 1),
('cocktail_kir', 'Kir', 0.3, 0, 1),
('cocktail_vodkacoca', 'Vodka Coca', 0.3, 0, 1),
('cocktail_vodkacitron', 'Vodka Citron', 0.3, 0, 1),
('cocktail_oldcuban', 'Old Cuban', 0.3, 0, 1);

-- Boissons Simples
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('verre_coca', 'Verre de Coca', 0.3, 0, 1),
('verre_jusorange', 'Verre de jus d''orange', 0.3, 0, 1),
('verre_eau', 'Verre d''eau', 0.3, 0, 1);

-- Plats
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('salade_fruits', 'Salade de fruits', 0.4, 0, 1),
('bol_chips', 'Bol de chips', 0.3, 0, 1),
('bol_raisin', 'Bol de raisin', 0.3, 0, 1),
('bol_cacahuetes', 'Bol de cacahuètes', 0.3, 0, 1);

-- Ingrédients supplémentaires
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('glacons', 'Glaçons', 0.1, 0, 1); 