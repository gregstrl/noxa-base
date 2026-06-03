INSERT INTO `jobs` (`name`, `label`, `societyType`, `canWashMoney`, `canUseOffshore`) VALUES
('journalist', 'Journaliste', 1, 1, 0);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(759, 'unicorn', 0, 'stagiaire', 'Stagiaire', 1, '{}', '{}'),
(768, 'unicorn', 1, 'reporter', 'Reporter', 1, '{}', '{}'),
(777, 'unicorn', 2, 'investigator', 'Investigateur', 1, '{}', '{}'),
(786, 'unicorn', 3, 'boss', 'Directeur', 1, '{}', '{}');

INSERT INTO `societies_storage` (`id`, `name`, `label`, `vehicles`, `items`, `weapons`, `money`, `dirty_money`) VALUES
(9503, 'journalist', 'Journaliste', '[]', '[]', '[]', 1000, 0);