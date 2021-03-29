-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2021 at 08:36 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.2.24-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csdb`
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
(1, 'cornlia', 'kharagpur', 'west bengal', 'India', 833102);

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

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `email` varchar(70) NOT NULL,
  `name` varchar(70) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `company` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`email`, `name`, `account_ID`, `company`) VALUES
('alicia.tran@gmail.com', 'Alicia Tran', 7, 'Times'),
('Beau-Beau@gmail.com', 'Beau Smithson', 19, NULL),
('bikash', 'bikash123@gmail.com', 21, 'qwerty'),
('BowJangles@aol.com', 'Toby Tedrow', 18, NULL),
('Bubbles@gmail.com', 'Mike Smith', 16, NULL),
('Doubtfire@yahoo.com', 'Robin Williams', 15, NULL),
('heidi.yi@aol.com', 'Heidi Yi', 8, 'Film Galore'),
('IAmLegend@hotmail.com', 'Will Smith', 14, NULL),
('ian.johnson@hotmail.com', 'Ian Johnson', 4, 'Huffington Post'),
('J-Roc@gmail.com', 'Jonathan Torrens', 17, NULL),
('james.tank@gmail.com', 'James Tank', 3, 'New York Times'),
('katie.mac@yahoo.com', 'Katie Mac', 10, 'Film Noir'),
('kevin.film@yahoo.com', 'Kevin Film', 5, 'IMDB'),
('MartyFarty@gmail.com', 'Martin Smith', 13, NULL),
('MaryIsPoppin@yahoo.com', 'Mary Poppins', 12, NULL),
('quentin.tarantino@gmail.com', 'Quentin Tarantino', 9, 'The Shop'),
('remi.lam@gmail.com', 'Remi Lam', 6, 'New Yorker'),
('robert.le@yahoo.com', 'Rober Le', 2, 'LA Times'),
('SlickG@gmail.com', 'Kade Gonzalez', 11, NULL),
('tracy.nguyen@gmail.com', 'Tracy Nugyen', 1, 'Times'),
('Zosh@yahoo.com', 'Percy Mescudi', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Movie`
--

CREATE TABLE `Movie` (
  `movie_id` int(11) NOT NULL,
  `movie_duration` time NOT NULL,
  `trailer_link` VARCHAR(255),
  `movie_title` varchar(255) NOT NULL,
  `release_date` DATE NOT NULL,
  `language` varchar(40) NOT NULL,
  `country` varchar(40) NOT NULL,
  `user_watched` INT DEFAULT 0,
  `description` VARCHAR(255) NOT NULL,
  `streaming_platform` varchar(40)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Movie`
--

INSERT INTO `Movie` (`movie_id`, `movie_title`, `movie_duration`, `trailer_link`, `release_date`, `language`, `country`,`user_watched`, `description`, `streaming_platform`) VALUES
(1, 'Parasite', '00:00:00', NULL, '2008-11-11', 'English', 'America', 2, 'Amazing Movie', 'Netflix');


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
(1, 'bikash', 'qwerty', 'bikash123@gmail.com', '2000-04-20', '2021-03-28 15:03:54', '9876543210');

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
-- Indexes for table `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`email`),
  ADD KEY `account_ID` (`account_ID`);

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
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Rating_Entry`
--
ALTER TABLE `Rating_Entry`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Cast`
--
ALTER TABLE `Cast`
  ADD CONSTRAINT `Cast_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movie` (`movie_id`);

--
-- Constraints for table `Genre`
--
ALTER TABLE `Genre`
  ADD CONSTRAINT `Genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movie` (`movie_id`);

--
-- Constraints for table `Member`
--
ALTER TABLE `Member`
  ADD CONSTRAINT `Member_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `Account` (`account_ID`) ON DELETE CASCADE;

--
-- Constraints for table `Rating_Entry`
--
ALTER TABLE `Rating_Entry`
  ADD CONSTRAINT `Rating_Entry_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `Movie` (`movie_id`),
  ADD CONSTRAINT `Rating_Entry_ibfk_2` FOREIGN KEY (`account_ID`) REFERENCES `Account` (`account_ID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
