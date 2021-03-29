-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2021 at 04:31 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.2.24-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_new`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `createAccount` (IN `username_` VARCHAR(30), IN `email_id_` VARCHAR(40), IN `password_` VARCHAR(30), IN `date_of_birth_` DATE, IN `phone_no_` VARCHAR(10), IN `street_` VARCHAR(20), IN `city_` VARCHAR(20), IN `state_` VARCHAR(20), IN `country_` VARCHAR(20), IN `zipcode_` VARCHAR(11))  BEGIN
    INSERT INTO Users (username,email_id, `password`, date_of_birth, phone_no)
    VALUES (username_,email_id_, password_, date_of_birth_, phone_no_); 
    INSERT INTO Address (street, city, `state`, country, zipcode, user_id)
    VALUES (street_, city_, state_, country_, zipcode_, (Select user_id From Users u Where u.username=username_) );     
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getAvgCriticScore` (`MovieIDInput` INT) RETURNS INT(11) BEGIN
    DECLARE fin INT(11);

    SELECT AVG(r.score) INTO fin
    FROM Rating_Entry AS r 
    INNER JOIN Users AS u ON r.Account_ID = m.Account_ID
    WHERE (r.MovieID = MovieIDInput
        AND m.company IS Not NULL);
        
    return fin;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `account_ID` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`account_ID`, `password`, `username`) VALUES
(1, 'asdf', 't.nguyen'),
(2, 'abcd', 'r.le'),
(3, '12345', 'tankman'),
(4, 'abc123', 'ianJohn'),
(5, 'FRaNK', 'kevFilm'),
(6, 'abcd1234', 'MCRem'),
(7, 'asjdfl', 'Atran'),
(8, 'wlr', 'HiYi'),
(9, 'feet', 'QT'),
(10, 'asdf', 'Katie_Mac'),
(11, 'abcd', 'SlickG'),
(12, '12345', 'MaryPoppin'),
(13, 'abc123', 'Marty'),
(14, 'FRaNK', 'LegenWill'),
(15, 'abcd1234', 'RobinWill'),
(16, 'fff', 'Bubbles'),
(17, 'wlr', 'jjroc'),
(18, 'wlr', 'bowjang'),
(19, 'butterfly_effect', 'beaubeau'),
(20, 'feet', 'zosh'),
(21, '9876543210', '2000-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `user_id` int(11) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`user_id`, `street`, `city`, `state`, `country`, `zipcode`) VALUES
(1, 'cornlia', 'kharagpur', 'west bengal', 'India', 833102),
(2, 'kgp', 'jsr', 'jk', 'india', 876543),
(3, 'asd', 'dsa', 'fdsa', 'india', 123543);

-- --------------------------------------------------------

--
-- Table structure for table `Cast`
--

CREATE TABLE `Cast` (
  `movie_id` int(11) NOT NULL,
  `actorName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cast`
--

INSERT INTO `Cast` (`movie_id`, `actorName`) VALUES
(1, 'Cho Yeo-jeong'),
(1, 'Choi Woo-shik'),
(1, 'Park So-dam'),
(2, 'Chris Evans'),
(2, 'Josh Brolin'),
(2, 'Robert Downey Jr.'),
(2, 'Scarlet Johansson'),
(3, 'Lupita Nyongo'),
(3, 'Winston Duke'),
(4, 'Chris Evans'),
(4, 'Daniel Craig'),
(5, 'Tim Allen'),
(5, 'Tom Hanks'),
(6, 'Al Pacino'),
(6, 'Joe Pesci'),
(6, 'Robert Deniro'),
(7, 'Timothee Chalamet'),
(8, 'Diana Silvers'),
(8, 'Kaitlyn Dever'),
(9, 'Awkwafina'),
(9, 'Tzi Ma'),
(10, 'Adam Driver'),
(10, 'Scarlet Johansson');

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `movie_id` int(11) NOT NULL,
  `Drama` tinyint(1) DEFAULT '0',
  `Comedy` tinyint(1) DEFAULT '0',
  `Horror` tinyint(1) DEFAULT '0',
  `Adventure` tinyint(1) DEFAULT '0',
  `Sci_Fi` tinyint(1) DEFAULT '0',
  `Thriller` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`movie_id`, `Drama`, `Comedy`, `Horror`, `Adventure`, `Sci_Fi`, `Thriller`) VALUES
(1, 1, 1, 0, 0, 0, 1),
(2, 0, 1, 0, 1, 0, 0),
(3, 0, 1, 0, 1, 1, 0),
(4, 0, 1, 0, 0, 0, 0),
(5, 1, 1, 0, 0, 0, 0),
(6, 0, 1, 0, 0, 0, 0),
(7, 1, 1, 0, 0, 0, 1),
(8, 1, 1, 0, 0, 0, 0),
(9, 1, 1, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 1),
(11, 0, 0, 0, 1, 0, 1),
(12, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Movie`
--

CREATE TABLE `Movie` (
  `movie_id` int(11) NOT NULL,
  `movie_duration` varchar(30) NOT NULL,
  `trailer_link` varchar(255) DEFAULT NULL,
  `movie_title` varchar(255) NOT NULL,
  `release_date` varchar(30) NOT NULL,
  `language` varchar(40) NOT NULL,
  `country` varchar(40) NOT NULL,
  `user_watched` int(11) DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `streaming_platform` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Movie`
--

INSERT INTO `Movie` (`movie_id`, `movie_duration`, `trailer_link`, `movie_title`, `release_date`, `language`, `country`, `user_watched`, `description`, `streaming_platform`) VALUES
(1, '132 min', NULL, 'Parasite', '30 May 2019', 'English', 'America', 2, 'The struggling Kim family sees an opportunity when the son starts working for the wealthy Park family. Soon, all of them find a way to work within the same household and start living a parasitic life.', 'Netflix'),
(2, '01:21:00', NULL, 'Toy Story', '1995-11-25', 'English', 'USA', 0, 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy\'s room.', NULL),
(3, '104 min', NULL, 'Jumanji', '15 Dec 1995', 'English,French', 'USA', 0, 'When two kids find and play a magical board game, they release a man trapped in it for decades - and a host of dangers that can only be stopped by finishing the game', NULL),
(4, '101 min', NULL, 'Grumpier Old Men', '22 Dec 1995', 'English,German', 'USA', 0, 'John and Max resolve to save their beloved bait shop from turning into an Italian restaurant, just as its new female owner catches Max\'s attention.', NULL),
(5, '121 min', NULL, 'Waiting to Exhale', '22 Dec 1995', 'English', 'USA', 0, 'Based on Terry McMillan\'s novel, this film follows four very different African-American women and their relationships with the male gender.', NULL),
(6, '106 min', NULL, 'Father of the Bride Part II', '08 Dec 1995', 'English', 'USA', 0, 'George Banks must deal not only with the pregnancy of his daughter, but also with the unexpected pregnancy of his wife.', NULL),
(7, '170 min', NULL, 'Heat', '15 Dec 1995', 'English', 'USA', 0, 'A group of professional bank robbers start to feel the heat from police when they unknowingly leave a clue at their latest heist.', NULL),
(8, '100 min', NULL, 'Now and Then', '20 Oct 1995', 'English', 'USA', 0, 'Four 12-year-old girls grow up together during an eventful small-town summer in 1970.', NULL),
(9, '96 min', NULL, 'Tom and Huck', '22 Dec 1995', 'English', 'USA', 0, 'Two best friends witness a murder and embark on a series of adventures in order to prove the innocence of the man wrongly accused of the crime.', NULL),
(10, '111  min', NULL, 'Sudden Death', '22 Dec 1995', 'English', 'USA', 0, 'A former fireman takes on a group of terrorists holding the Vice President and others hostage during the seventh game of the NHL Stanley Cup finals.', NULL),
(11, '130 min', NULL, 'GoldenEye', '17 Nov 1995', 'English', 'USA', 0, 'Years after a friend and fellow 00 agent is killed on a joint mission, a secret space based weapons program known as \\"GoldenEye\\" is stolen. James Bond sets out to stop a Russian crime syndicate from using the weapon.', NULL),
(12, '114 min', NULL, 'The American President', '17 Nov 1995', 'English,Spanish,French', 'USA', 0, 'A widowed U.S. President running for reelection and an environmental lobbyist fall in love. It\'s all above-board, but \\"politics is perception,\\" and sparks fly anyway.', NULL),
(13, '85 min', NULL, 'Dracula: Dead and Loving It', '22 Dec 1995', 'English', 'France,USA', 0, 'Mel Brooks \' parody of the classic vampire story and its famous film adaptations.', NULL),
(14, '95 min', NULL, 'Balto', '22 Dec 1995', 'English', 'USA', 0, 'An outcast Husky risks his life with other sled dogs to prevent a deadly epidemic from ravaging Nome, Alaska.', NULL),
(15, '192 min', NULL, 'Nixon', '05 Jan 1996', 'English,Russian,Mandarin', 'USA', 0, 'A biographical story of former U.S. President Richard Nixon, from his days as a young boy, to his eventual Presidency, which ended in shame.', NULL),
(16, '124 min', NULL, 'Cutthroat Island', '22 Dec 1995', 'English', 'France,Italy,Germany,USA', 0, 'A female pirate and her companion race against their rivals to find a hidden island that contains a fabulous treasure.', NULL),
(17, '178 min', NULL, 'Casino', '22 Nov 1995', 'English', 'France, USA', 0, 'A tale of greed, deception, money, power, and murder occur between two best friends: a mafia enforcer and a casino executive, compete against each other over a gambling empire, and over a fast living and fast loving socialite.', NULL),
(18, '136 min', NULL, 'Sense and Sensibility', '26 Jan 1996', 'English,French', 'USA, UK', 0, 'Rich Mr. Dashwood dies, leaving his second wife and her three daughters poor by the rules of inheritance. The two eldest daughters are the title opposites.', NULL),
(19, '98 min', NULL, 'Four Rooms', '25 Dec 1995', 'English', 'USA', 0, 'Four interlocking tales that take place in a fading hotel on New Year\'s Eve.', NULL),
(20, '90 min', NULL, 'Ace Ventura: When Nature Calls', '10 Nov 1995', 'English', 'US', 0, 'Ace Ventura, Pet Detective, returns from a spiritual quest to investigate the disappearance of a rare white bat, the sacred animal of a tribe in Africa.', NULL),
(21, '110 min', NULL, 'Money Train', '22 Nov 1995', 'English', 'USA', 0, 'A vengeful New York City transit cop decides to steal a trainload of subway fares. His foster brother, a fellow cop, tries to protect him.', NULL),
(22, '105 min', NULL, 'Get Shorty', '20 Oct 1995', 'English', 'USA', 0, 'A mobster travels to Hollywood to collect a debt, and discovers that the movie business is much the same as his current job.', NULL),
(23, '123 min', NULL, 'Copycat', '27 Oct 1995', 'English', 'USA', 0, 'An agoraphobic psychologist and a female detective must work together to take down a serial killer who copies serial killers from the past.', NULL),
(24, '132 min', NULL, 'Assassins', '06 Oct 1995', 'English,Dutch,Spanish', 'France, USA', 0, 'Professional hit-man Robert Rath wants to fulfill a few more contracts before retiring but unscrupulous ambitious newcomer hit-man Miguel Bain keeps killing Rath\'s targets.', NULL),
(25, '111 min', NULL, 'Powder', '27 Oct 1995', 'English', 'USA', 0, 'An off the charts genius who is home schooled and shunned after his last relative dies shows the unconscious residents of his town about connection awareness and the generosity of the spirit.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Rating_Entry`
--

CREATE TABLE `Rating_Entry` (
  `ratingID` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `explanation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Rating_Entry`
--

INSERT INTO `Rating_Entry` (`ratingID`, `movie_id`, `account_ID`, `score`, `explanation`) VALUES
(1, 1, 1, 90, 'Amazing Film'),
(2, 2, 2, 98, 'Great way to end the series.'),
(3, 3, 3, 78, 'Not as good as Get Out. Entertaining but questionable at times.'),
(4, 4, 5, 94, 'A great who-done-it film.'),
(5, 5, 2, 99, 'Pixar does it again'),
(6, 5, 3, 84, 'Great for the family, but not as good as previous installments.'),
(7, 6, 4, 89, 'Martin Scorsese is masterful.'),
(8, 7, 7, 89, 'Amazing film'),
(9, 8, 6, 89, 'Funny and original'),
(10, 9, 5, 94, 'Very good film.'),
(11, 10, 8, 89, 'Scarlet Johansson gives an amazing performance.'),
(12, 1, 11, 94, 'Outstanding Film'),
(13, 2, 12, 96, 'Marvel does it again'),
(14, 3, 13, 67, 'Made no sense to me.'),
(15, 4, 15, 96, 'Myster films are the best!.'),
(16, 5, 12, 94, 'Made me laugh throughout.'),
(17, 6, 13, 94, 'Gangstas are always a great time at the movies.'),
(18, 6, 14, 89, 'Martin Scorsese masters his craft in this one.'),
(19, 7, 17, 84, 'Fantastic film and story'),
(20, 8, 16, 72, 'It was aight'),
(21, 9, 15, 78, 'Just average.'),
(22, 10, 18, 84, 'Scarlet Johansson and Adam Driver are amazing together.'),
(23, 2, 9, 95, 'hello'),
(24, 1, 9, 45, 'goody');

--
-- Triggers `Rating_Entry`
--
DELIMITER $$
CREATE TRIGGER `ovr_score_aud_delete` AFTER DELETE ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(OLD.movie_id)
    WHERE Movie.movie_id = OLD.movie_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ovr_score_aud_insert` AFTER INSERT ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ovr_score_aud_update` AFTER UPDATE ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ovr_score_crit_delete` AFTER DELETE ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(OLD.movie_id)
    WHERE Movie.movie_id = OLD.movie_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ovr_score_crit_insert` AFTER INSERT ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ovr_score_crit_update` AFTER UPDATE ON `Rating_Entry` FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email_id` varchar(40) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password`, `email_id`, `date_of_birth`, `date_of_registration`, `phone_no`) VALUES
(1, 'bikash', 'qwerty', 'bikash123@gmail.com', '2000-04-20', '2021-03-28 15:03:54', '9876543210'),
(2, 'bikash1', 'qwerty', 'bikash12@gmail.com', '2000-03-20', '2021-03-29 08:02:37', '9876987612'),
(3, 'Bikash124', 'qwerty', 'bikash124@gmail.com', '2000-04-20', '2021-03-29 10:19:59', '9876543121');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`account_ID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `Cast`
--
ALTER TABLE `Cast`
  ADD PRIMARY KEY (`movie_id`,`actorName`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `Rating_Entry`
--
ALTER TABLE `Rating_Entry`
  ADD PRIMARY KEY (`ratingID`),
  ADD KEY `movieID` (`movie_id`),
  ADD KEY `account_ID` (`account_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `Rating_Entry`
--
ALTER TABLE `Rating_Entry`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
