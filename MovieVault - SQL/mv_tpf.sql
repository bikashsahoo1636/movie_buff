DELIMITER $$
CREATE TRIGGER `ovr_score_crit_insert` AFTER INSERT ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_insert` AFTER INSERT ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END$$

DELIMITER $$
CREATE TRIGGER `ovr_score_crit_update` AFTER UPDATE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_update` AFTER UPDATE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movie_id)
    WHERE Movie.movie_id = NEW.movie_id;
END$$

DELIMITER $$
CREATE TRIGGER `ovr_score_crit_delete` AFTER DELETE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(OLD.movie_id)
    WHERE Movie.movie_id = OLD.movie_id;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_delete` AFTER DELETE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(OLD.movie_id)
    WHERE Movie.movie_id = OLD.movie_id;
END$$







DELIMITER $$
CREATE FUNCTION `getAvgCriticScore`(`MovieIDInput` INT) RETURNS int(11)
BEGIN
    DECLARE fin INT(11);

    SELECT AVG(r.score) INTO fin
    FROM Rating_Entry AS r 
    INNER JOIN Users AS u ON r.Account_ID = m.Account_ID
    WHERE (r.MovieID = MovieIDInput
        AND m.company IS Not NULL);
        
    return fin;
END$$
DELIMITER ;








DELIMITER $$
CREATE PROCEDURE `createAccount`(IN username_ varchar(30), IN email_id_ varchar(40), IN password_ varchar(30), IN date_of_birth_ date, IN phone_no_ varchar(10) , IN street_ varchar(20) , IN city_ varchar(20) , IN state_ varchar(20) , IN country_ varchar(20) , IN zipcode_ varchar(11))
BEGIN
    INSERT INTO Users (username,email_id, `password`, date_of_birth, phone_no)
    VALUES (username_,email_id_, password_, date_of_birth_, phone_no_); 
    INSERT INTO Address (street, city, `state`, country, zipcode, user_id)
    VALUES (street_, city_, state_, country_, zipcode_, (Select user_id From Users u Where u.username=username_) );     
END$$
DELIMITER ;