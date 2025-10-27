-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 27 oct. 2025 à 17:45
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `disney_stream_clone`
--
DROP DATABASE IF EXISTS `disney_stream_clone`;
CREATE DATABASE IF NOT EXISTS `disney_stream_clone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `disney_stream_clone`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `original_title` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `runtime_minutes` int(11) DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `poster_url` varchar(512) DEFAULT NULL,
  `universe_id` int(11) DEFAULT NULL,
  `franchise_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`id`, `title`, `original_title`, `release_date`, `runtime_minutes`, `synopsis`, `poster_url`, `universe_id`, `franchise_id`, `created_at`) VALUES
(47, 'Star Wars: A New Hope', 'Star Wars', '1977-05-25', 121, 'Luke Skywalker joins forces with a Jedi Knight to save the galaxy.', NULL, 1, 1, '2025-10-14 09:26:12'),
(48, 'Star Wars: The Empire Strikes Back', 'Star Wars: The Empire Strikes Back', '1980-05-21', 124, 'The Empire strikes back against the Rebel Alliance.', NULL, 1, 1, '2025-10-14 09:26:12'),
(49, 'Star Wars: Return of the Jedi', 'Star Wars: Return of the Jedi', '1983-05-25', 131, 'Luke Skywalker faces Darth Vader and the Emperor.', NULL, 1, 1, '2025-10-14 09:26:12'),
(50, 'Star Wars: The Phantom Menace', 'Star Wars: The Phantom Menace', '1999-05-19', 136, 'Two Jedi Knights protect Queen Amidala from the Trade Federation.', NULL, 1, 1, '2025-10-14 09:26:12'),
(51, 'Star Wars: Attack of the Clones', 'Star Wars: Attack of the Clones', '2002-05-16', 142, 'Anakin Skywalker becomes a Jedi while a separatist war begins.', NULL, 1, 1, '2025-10-14 09:26:12'),
(52, 'Star Wars: Revenge of the Sith', 'Star Wars: Revenge of the Sith', '2005-05-19', 140, 'Anakin succumbs to the dark side and becomes Darth Vader.', NULL, 1, 1, '2025-10-14 09:26:12'),
(53, 'Star Wars: The Force Awakens', 'Star Wars: The Force Awakens', '2015-12-18', 135, 'A new hero emerges as the dark side rises again.', NULL, 1, 1, '2025-10-14 09:26:12'),
(54, 'Star Wars: The Last Jedi', 'Star Wars: The Last Jedi', '2017-12-15', 152, 'Rey trains with Luke Skywalker while the Resistance fights the First Order.', NULL, 1, 1, '2025-10-14 09:26:12'),
(55, 'Star Wars: The Rise of Skywalker', 'Star Wars: The Rise of Skywalker', '2019-12-20', 142, 'The final battle against the Sith concludes the Skywalker saga.', NULL, 1, 1, '2025-10-14 09:26:12'),
(56, 'Iron Man', 'Iron Man', '2008-05-02', 126, 'Tony Stark becomes Iron Man to fight evil after a kidnapping.', NULL, 2, 2, '2025-10-14 09:26:12'),
(57, 'The Incredible Hulk', 'The Incredible Hulk', '2008-06-13', 112, 'Bruce Banner struggles with his monstrous alter ego.', NULL, 2, 2, '2025-10-14 09:26:12'),
(58, 'Iron Man 2', 'Iron Man 2', '2010-05-07', 124, 'Tony Stark faces new enemies while dealing with his legacy.', NULL, 2, 2, '2025-10-14 09:26:12'),
(59, 'Thor', 'Thor', '2011-05-06', 115, 'The Norse god Thor is banished to Earth and must prove his worth.', NULL, 2, 2, '2025-10-14 09:26:12'),
(60, 'Captain America: The First Avenger', 'Captain America: The First Avenger', '2011-07-22', 124, 'Steve Rogers becomes the super-soldier Captain America.', NULL, 2, 2, '2025-10-14 09:26:12'),
(61, 'The Avengers', 'The Avengers', '2012-05-04', 143, 'Earth\'s mightiest heroes unite to stop Loki.', NULL, 2, 2, '2025-10-14 09:26:12'),
(62, 'Iron Man 3', 'Iron Man 3', '2013-05-03', 130, 'Tony faces the Mandarin while coping with PTSD.', NULL, 2, 2, '2025-10-14 09:26:12'),
(63, 'Thor: The Dark World', 'Thor: The Dark World', '2013-11-08', 112, 'Thor must save the Nine Realms from Malekith.', NULL, 2, 2, '2025-10-14 09:26:12'),
(64, 'Captain America: The Winter Soldier', 'Captain America: The Winter Soldier', '2014-04-04', 136, 'Steve uncovers a conspiracy inside S.H.I.E.L.D.', NULL, 2, 2, '2025-10-14 09:26:12'),
(65, 'Guardians of the Galaxy', 'Guardians of the Galaxy', '2014-08-01', 121, 'A group of misfits bands together to save the galaxy.', NULL, 2, 2, '2025-10-14 09:26:12'),
(66, 'Avengers: Age of Ultron', 'Avengers: Age of Ultron', '2015-05-01', 141, 'The Avengers must defeat the rogue AI Ultron.', NULL, 2, 2, '2025-10-14 09:26:12'),
(67, 'Ant-Man', 'Ant-Man', '2015-07-17', 117, 'A thief becomes a hero using a shrinking suit.', NULL, 2, 2, '2025-10-14 09:26:12'),
(68, 'Captain America: Civil War', 'Captain America: Civil War', '2016-05-06', 147, 'The Avengers fracture into two opposing factions.', NULL, 2, 2, '2025-10-14 09:26:12'),
(69, 'Doctor Strange', 'Doctor Strange', '2016-11-04', 115, 'A surgeon learns the mystic arts after a tragic accident.', NULL, 2, 2, '2025-10-14 09:26:12'),
(70, 'Guardians of the Galaxy Vol. 2', 'Guardians of the Galaxy Vol. 2', '2017-05-05', 136, 'The Guardians uncover family secrets and face new threats.', NULL, 2, 2, '2025-10-14 09:26:12'),
(71, 'Spider-Man: Homecoming', 'Spider-Man: Homecoming', '2017-07-07', 133, 'Peter Parker balances high school life and being Spider-Man.', NULL, 2, 2, '2025-10-14 09:26:12'),
(72, 'Thor: Ragnarok', 'Thor: Ragnarok', '2017-11-03', 130, 'Thor must stop Hela from destroying Asgard.', NULL, 2, 2, '2025-10-14 09:26:12'),
(73, 'Black Panther', 'Black Panther', '2018-02-16', 134, 'T’Challa returns home to Wakanda to take his rightful throne.', NULL, 2, 2, '2025-10-14 09:26:12'),
(74, 'Avengers: Infinity War', 'Avengers: Infinity War', '2018-04-27', 149, 'The Avengers face Thanos, who seeks all Infinity Stones.', NULL, 2, 2, '2025-10-14 09:26:12'),
(75, 'Ant-Man and the Wasp', 'Ant-Man and the Wasp', '2018-07-06', 118, 'Scott teams with Hope to uncover secrets from the past.', NULL, 2, 2, '2025-10-14 09:26:12'),
(76, 'Captain Marvel', 'Captain Marvel', '2019-03-08', 123, 'Carol Danvers becomes one of the universe\'s most powerful heroes.', NULL, 2, 2, '2025-10-14 09:26:12'),
(77, 'Avengers: Endgame', 'Avengers: Endgame', '2019-04-26', 181, 'The Avengers attempt to undo the devastation caused by Thanos.', NULL, 2, 2, '2025-10-14 09:26:12'),
(78, 'Spider-Man: Far From Home', 'Spider-Man: Far From Home', '2019-07-02', 129, 'Peter Parker deals with the aftermath of Endgame.', NULL, 2, 2, '2025-10-14 09:26:12'),
(79, 'X-Men', 'X-Men', '2000-07-14', 104, 'Mutants struggle to coexist with humans while facing Magneto.', NULL, 2, 3, '2025-10-14 09:26:13'),
(80, 'X2: X-Men United', 'X2: X-Men United', '2003-05-02', 133, 'The X-Men battle William Stryker and protect mutants.', NULL, 2, 3, '2025-10-14 09:26:13'),
(81, 'X-Men: The Last Stand', 'X-Men: The Last Stand', '2006-05-26', 104, 'A cure for mutation divides the X-Men.', NULL, 2, 3, '2025-10-14 09:26:13'),
(82, 'X-Men: First Class', 'X-Men: First Class', '2011-06-03', 132, 'Young mutants face a global threat.', NULL, 2, 3, '2025-10-14 09:26:13'),
(83, 'X-Men: Days of Future Past', 'X-Men: Days of Future Past', '2014-05-23', 131, 'The X-Men send Wolverine back in time to prevent a war.', NULL, 2, 3, '2025-10-14 09:26:13'),
(84, 'X-Men: Apocalypse', 'X-Men: Apocalypse', '2016-05-27', 144, 'Mutants must stop Apocalypse from destroying the world.', NULL, 2, 3, '2025-10-14 09:26:13'),
(85, 'X-Men: Dark Phoenix', 'X-Men: Dark Phoenix', '2019-06-07', 114, 'Jean Grey becomes the Phoenix, threatening the X-Men.', NULL, 2, 3, '2025-10-14 09:26:13'),
(86, 'Toy Story', 'Toy Story', '1995-11-22', 81, 'Woody and Buzz Lightyear come to life when humans aren’t around.', NULL, 3, 4, '2025-10-14 09:26:13'),
(87, 'Toy Story 2', 'Toy Story 2', '1999-11-24', 92, 'Woody is kidnapped, and Buzz must rescue him.', NULL, 3, 4, '2025-10-14 09:26:13'),
(88, 'Toy Story 3', 'Toy Story 3', '2010-06-18', 103, 'The toys face an uncertain future as Andy prepares for college.', NULL, 3, 4, '2025-10-14 09:26:13'),
(89, 'Toy Story 4', 'Toy Story 4', '2019-06-21', 100, 'Woody and Forky go on a new adventure.', NULL, 3, 4, '2025-10-14 09:26:13'),
(90, 'Finding Nemo', 'Finding Nemo', '2003-05-30', 100, 'A clownfish crosses the ocean to find his missing son.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(91, 'Finding Dory', 'Finding Dory', '2016-06-17', 97, 'Dory searches for her long-lost parents.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(92, 'Inside Out', 'Inside Out', '2015-06-19', 95, 'Emotions inside a young girl’s mind guide her through life changes.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(93, 'Coco', 'Coco', '2017-11-22', 105, 'A boy journeys to the Land of the Dead to discover his family’s history.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(94, 'Ratatouille', 'Ratatouille', '2007-06-29', 111, 'A rat dreams of becoming a top chef in Paris.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(95, 'Up', 'Up', '2009-05-29', 96, 'An elderly man and a boy scout go on an unexpected adventure.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(96, 'Monsters, Inc.', 'Monsters, Inc.', '2001-11-02', 92, 'Monsters generate energy by scaring children, but one child changes everything.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(97, 'Monsters University', 'Monsters University', '2013-06-21', 104, 'Mike and Sulley meet at college and become friends.', NULL, 3, NULL, '2025-10-14 09:26:13'),
(98, 'Pirates of the Caribbean: The Curse of the Black Pearl', 'Pirates of the Caribbean', '2003-07-09', 143, 'Captain Jack Sparrow races to recover his ship from cursed pirates.', NULL, 4, 7, '2025-10-14 09:26:13'),
(99, 'Pirates of the Caribbean: Dead Man\'s Chest', 'Pirates of the Caribbean', '2006-07-07', 151, 'Jack Sparrow searches for the heart of Davy Jones.', NULL, 4, 7, '2025-10-14 09:26:13'),
(100, 'Pirates of the Caribbean: At World\'s End', 'Pirates of the Caribbean', '2007-05-25', 169, 'Jack Sparrow faces old enemies and new alliances.', NULL, 4, 7, '2025-10-14 09:26:13'),
(101, 'Indiana Jones: Raiders of the Lost Ark', 'Indiana Jones', '1981-06-12', 115, 'Archaeologist Indiana Jones races Nazis to find the Ark of the Covenant.', NULL, 4, 6, '2025-10-14 09:26:13'),
(102, 'Indiana Jones and the Temple of Doom', 'Indiana Jones', '1984-05-23', 118, 'Indy travels to India to recover sacred stones.', NULL, 4, 6, '2025-10-14 09:26:13'),
(103, 'Indiana Jones and the Last Crusade', 'Indiana Jones', '1989-05-24', 127, 'Indy seeks the Holy Grail before the Nazis.', NULL, 4, 6, '2025-10-14 09:26:13'),
(104, 'Avatar', 'Avatar', '2009-12-18', 162, 'A paraplegic Marine explores a new world on Pandora.', NULL, 4, 11, '2025-10-14 09:26:13'),
(105, 'Tron', 'Tron', '1982-07-09', 96, 'A computer programmer is transported inside a digital world.', NULL, 4, 12, '2025-10-14 09:26:13'),
(106, 'Tron: Legacy', 'Tron: Legacy', '2010-12-17', 125, 'Sam Flynn searches for his missing father in the Grid.', NULL, 4, 12, '2025-10-14 09:26:13'),
(107, 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', 'Narnia', '2005-12-09', 143, 'Four siblings discover a magical world through a wardrobe.', NULL, 4, 18, '2025-10-14 09:26:13'),
(108, 'Mamma Mia!', 'Mamma Mia!', '2008-07-18', 108, 'A woman invites three men to her wedding, searching for her father.', NULL, 4, NULL, '2025-10-14 09:26:13'),
(109, 'The Parent Trap', 'The Parent Trap', '1998-07-29', 128, 'Twin sisters separated at birth meet at summer camp.', NULL, 4, NULL, '2025-10-14 09:26:13'),
(110, 'Alvin and the Chipmunks', 'Alvin and the Chipmunks', '2007-12-14', 92, 'Three singing chipmunks cause chaos in the city.', NULL, 5, 13, '2025-10-14 09:26:13'),
(111, 'Independence Day', 'Independence Day', '1996-07-03', 145, 'Humans unite to repel an alien invasion.', NULL, 5, 20, '2025-10-14 09:26:13'),
(112, 'Diary of a Wimpy Kid', 'Diary of a Wimpy Kid', '2010-03-19', 92, 'A middle school kid navigates school and friends.', NULL, 5, 21, '2025-10-14 09:26:13'),
(113, 'Percy Jackson & the Olympians: The Lightning Thief', 'Percy Jackson', '2010-02-12', 119, 'A teen discovers he is the son of a Greek god.', NULL, 5, 25, '2025-10-14 09:26:13'),
(114, 'Taken', 'Taken', '2008-02-27', 90, 'A retired agent must rescue his kidnapped daughter.', NULL, 5, 28, '2025-10-14 09:26:13'),
(115, 'Narnia: Prince Caspian', 'Narnia', '2008-05-16', 150, 'The Pevensie siblings return to Narnia to battle King Miraz.', NULL, 5, 18, '2025-10-14 09:26:13'),
(116, 'Kingsman: The Secret Service', 'Kingsman', '2014-02-13', 129, 'A young man joins a secret spy organization.', NULL, 5, 22, '2025-10-14 09:26:13'),
(117, 'La Nuit au Musée', 'Night at the Museum', '2006-12-22', 108, 'Museum exhibits come to life at night.', NULL, 5, 24, '2025-10-14 09:26:13'),
(118, 'La Malédiction', 'The Omen', '1976-06-25', 111, 'A child is revealed to be the Antichrist.', NULL, 5, 19, '2025-10-14 09:26:13'),
(119, 'Michael Shayne', 'Michael Shayne', '2005-01-01', 95, 'Detective Michael Shayne solves a murder mystery.', NULL, 5, 23, '2025-10-14 09:26:13'),
(120, 'Ernest Goes to Camp', 'Ernest', '1987-07-31', 89, 'Ernest works at a summer camp and faces hilarious adventures.', NULL, 6, 29, '2025-10-14 09:26:13'),
(121, 'Scream', 'Scream', '1996-12-20', 111, 'A masked killer terrorizes a small town.', NULL, 6, 34, '2025-10-14 09:26:13'),
(122, 'Spy Kids', 'Spy Kids', '2001-03-30', 100, 'Two children become secret agents to save their parents.', NULL, 6, 35, '2025-10-14 09:26:13'),
(123, 'Sexy Dance', 'Step Up', '2006-08-11', 104, 'A dancer struggles to impress while joining a team.', NULL, 6, 31, '2025-10-14 09:26:13'),
(124, 'Dimension', 'Dimension', '2012-01-01', 90, 'Sci-fi adventure in multiple realities.', NULL, 6, 32, '2025-10-14 09:26:13'),
(125, 'Halloween', 'Halloween', '1978-10-25', 91, 'Michael Myers returns to terrorize a small town.', NULL, 6, 33, '2025-10-14 09:26:13'),
(126, 'Highlander', 'Highlander', '1986-03-07', 116, 'Immortals fight across centuries until only one remains.', NULL, 6, 19, '2025-10-14 09:26:13'),
(127, 'Die Hard', 'Die Hard', '1988-07-15', 132, 'An NYPD officer fights terrorists in a skyscraper.', NULL, 6, 10, '2025-10-14 09:26:13'),
(128, 'Mr. Belvédère', 'Mr. Belvedere', '1985-01-01', 96, 'A British housekeeper works with a busy family.', NULL, 6, 26, '2025-10-14 09:26:13'),
(129, 'Mr. Moto', 'Mr. Moto', '1965-01-01', 85, 'Detective Mr. Moto solves a mysterious case.', NULL, 6, 27, '2025-10-14 09:26:13');

-- --------------------------------------------------------

--
-- Structure de la table `film_categories`
--

CREATE TABLE `film_categories` (
  `film_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `franchises`
--

CREATE TABLE `franchises` (
  `id` int(11) NOT NULL,
  `universe_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `franchises`
--

INSERT INTO `franchises` (`id`, `universe_id`, `name`, `slug`, `description`) VALUES
(1, 1, 'Star Wars', 'star-wars', NULL),
(2, 2, 'Marvel Cinematic Universe', 'marvel-cinematic-universe', NULL),
(3, 2, 'X-Men Cinematic Universe', 'x-men-cinematic-universe', NULL),
(4, 2, 'Spider-Man', 'spider-man', NULL),
(5, 2, 'Blade', 'blade', NULL),
(6, 2, 'Les Quatre Fantastiques', 'four-fantastic', NULL),
(7, 2, 'Men in Black', 'men-in-black', NULL),
(8, 4, 'Indiana Jones', 'indiana-jones', NULL),
(9, 4, 'Pirates des Caraïbes', 'pirates-des-caribes', NULL),
(10, 4, 'La Coccinelle', 'la-coccinelle', NULL),
(11, 4, 'La Planète des Singes', 'la-planete-des-singes', NULL),
(12, 4, 'Alien et Predator', 'alien-predator', NULL),
(13, 4, 'Die Hard', 'die-hard', NULL),
(14, 4, 'Avatar', 'avatar', NULL),
(15, 4, 'Tron', 'tron', NULL),
(16, 4, 'Benjamin Gates', 'benjamin-gates', NULL),
(17, 4, 'Dexter Riley', 'dexter-riley', NULL),
(18, 4, 'Flubber', 'flubber', NULL),
(19, 4, 'Freaky Friday', 'freaky-friday', NULL),
(20, 4, 'L\'Incroyable Voyage', 'incroyable-voyage', NULL),
(21, 4, 'La Montagne Ensorcelée', 'montagne-ensorcelee', NULL),
(22, 4, 'Le Monde de Narnia', 'monde-narnia', NULL),
(23, 4, 'Les Muppets', 'muppets', NULL),
(24, 4, 'Les Petits Champions', 'petits-champions', NULL),
(25, 4, 'Shaggy Dog', 'shaggy-dog', NULL),
(26, 4, 'Super Noël', 'super-noel', NULL),
(27, 5, 'Alvin et les Chipmunks', 'alvin-chipmunks', NULL),
(28, 5, 'Big Mamma', 'big-mamma', NULL),
(29, 5, 'Charlie Chan', 'charlie-chan', NULL),
(30, 5, 'Cisco Kid', 'cisco-kid', NULL),
(31, 5, 'Docteur Dolittle', 'docteur-dolittle', NULL),
(32, 5, 'Flicka', 'flicka', NULL),
(33, 5, 'Hercule Poirot', 'hercule-poirot', NULL),
(34, 5, 'Highlander', 'highlander', NULL),
(35, 5, 'Independence Day', 'independence-day', NULL),
(36, 5, 'Jones Family', 'jones-family', NULL),
(37, 5, 'Journal d\'un Dégonflé', 'journal-degonfle', NULL),
(38, 5, 'Kingsman', 'kingsman', NULL),
(39, 5, 'L\'Inspecteur Hornleigh', 'inspecteur-hornleigh', NULL),
(40, 5, 'La Malédiction', 'la-malediction', NULL),
(41, 5, 'La Mouche', 'la-mouche', NULL),
(42, 5, 'La Nuit au Musée', 'nuit-au-musee', NULL),
(43, 5, 'Le Labyrinthe', 'labyrinthe', NULL),
(44, 5, 'Les Cavaliers de la Sauge Pourprée', 'cavaliers-sauge', NULL),
(45, 5, 'Maman, J\'ai Raté l\'Avion', 'maman-rate-avion', NULL),
(46, 5, 'Michael Shayne', 'michael-shayne', NULL),
(47, 5, 'Mr. Belvédère', 'mr-belvedere', NULL),
(48, 5, 'Mr. Moto', 'mr-moto', NULL),
(49, 5, 'Percy Jackson', 'percy-jackson', NULL),
(50, 5, 'Porky\'s', 'porkys', NULL),
(51, 5, 'Quirt & Flagg', 'quirt-flagg', NULL),
(52, 5, 'Taken', 'taken', NULL),
(53, 5, 'Treize à la Douzaine', 'treize-douzaine', NULL),
(54, 6, 'Touchstone', 'touchstone', NULL),
(55, 6, 'Ernest', 'ernest', NULL),
(56, 6, 'Sexy Dance', 'sexy-dance', NULL),
(57, 6, 'Dimension', 'dimension', NULL),
(58, 6, 'Halloween', 'halloween', NULL),
(59, 6, 'Scary Movie', 'scary-movie', NULL),
(60, 6, 'Scream', 'scream', NULL),
(61, 6, 'Spy Kids', 'spy-kids', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `universes`
--

CREATE TABLE `universes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `universes`
--

INSERT INTO `universes` (`id`, `name`, `slug`, `description`, `created_at`) VALUES
(1, 'Star Wars', 'star-wars', NULL, '2025-10-14 09:13:57'),
(2, 'Marvel', 'marvel', NULL, '2025-10-14 09:13:57'),
(3, 'Pixar', 'pixar', NULL, '2025-10-14 09:13:57'),
(4, 'Disney', 'disney', NULL, '2025-10-14 09:13:57'),
(5, '20th Century Studios', '20th-century-studios', NULL, '2025-10-14 09:13:57'),
(6, 'Touchstone', 'touchstone', NULL, '2025-10-14 09:13:57'),
(7, 'Autres', 'others', NULL, '2025-10-14 09:13:57');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_films`
--

CREATE TABLE `user_films` (
  `user_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `status` enum('watched','want_to_watch','owned','want_to_sell') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_films_universe` (`universe_id`),
  ADD KEY `idx_films_franchise` (`franchise_id`);

--
-- Index pour la table `film_categories`
--
ALTER TABLE `film_categories`
  ADD PRIMARY KEY (`film_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `franchises`
--
ALTER TABLE `franchises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universe_id` (`universe_id`);

--
-- Index pour la table `universes`
--
ALTER TABLE `universes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `user_films`
--
ALTER TABLE `user_films`
  ADD PRIMARY KEY (`user_id`,`film_id`,`status`),
  ADD KEY `idx_user_films_user` (`user_id`),
  ADD KEY `idx_user_films_film` (`film_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT pour la table `franchises`
--
ALTER TABLE `franchises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `universes`
--
ALTER TABLE `universes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`universe_id`) REFERENCES `universes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `films_ibfk_2` FOREIGN KEY (`franchise_id`) REFERENCES `franchises` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `film_categories`
--
ALTER TABLE `film_categories`
  ADD CONSTRAINT `film_categories_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `film_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `franchises`
--
ALTER TABLE `franchises`
  ADD CONSTRAINT `franchises_ibfk_1` FOREIGN KEY (`universe_id`) REFERENCES `universes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_films`
--
ALTER TABLE `user_films`
  ADD CONSTRAINT `user_films_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_films_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
