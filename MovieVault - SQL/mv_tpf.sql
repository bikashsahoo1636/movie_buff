DELIMITER $$
CREATE TRIGGER `ovr_score_crit_insert` AFTER INSERT ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movieID)
    WHERE Movie.movieID = NEW.movieID;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_insert` AFTER INSERT ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movieID)
    WHERE Movie.movieID = NEW.movieID;
END$$

DELIMITER $$
CREATE TRIGGER `ovr_score_crit_update` AFTER UPDATE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(NEW.movieID)
    WHERE Movie.movieID = NEW.movieID;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_update` AFTER UPDATE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(NEW.movieID)
    WHERE Movie.movieID = NEW.movieID;
END$$

DELIMITER $$
CREATE TRIGGER `ovr_score_crit_delete` AFTER DELETE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalCriticScore = getAvgCriticScore(OLD.movieID)
    WHERE Movie.movieID = OLD.movieID;
END $$

DELIMITER $$
CREATE TRIGGER `ovr_score_aud_delete` AFTER DELETE ON `Rating_Entry`
 FOR EACH ROW BEGIN
    UPDATE Movie
    SET totalAudiScore = getAvgAudScore(OLD.movieID)
    WHERE Movie.movieID = OLD.movieID;
END$$







DELIMITER $$
CREATE FUNCTION `getAvgCriticScore`(`MovieIDInput` INT) RETURNS int(11)
BEGIN
    DECLARE fin INT(11);

    SELECT AVG(r.score) INTO fin
    FROM Rating_Entry AS r 
    INNER JOIN Member AS m ON r.Account_ID = m.Account_ID
    WHERE (r.MovieID = MovieIDInput
        AND m.company IS Not NULL);
        
    return fin;
END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION `getAvgAudScore`(`MovieIDInput` INT) RETURNS int(11)
BEGIN
    DECLARE fin INT(11);

    SELECT AVG(r.score) INTO fin
    FROM Rating_Entry AS r 
    INNER JOIN Member AS m ON r.Account_ID = m.Account_ID
    WHERE (r.MovieID = MovieIDInput
        AND m.company IS NULL);
        
    return fin;
END$$
DELIMITER ;






DELIMITER $$
CREATE PROCEDURE `createAccount`(IN email_ varchar(100), IN name_ varchar(100), IN company_ varchar(100), IN username_ varchar(100), In password_ varchar(100) )
BEGIN
    Insert Into Account (username, password)
    Values (username_, password_);
    
    INSERT INTO Member (email, name, company, account_ID)
    VALUES (email_, name_, company_, (Select account_ID From Account a Where a.username=username_) );    
END$$
DELIMITER ;