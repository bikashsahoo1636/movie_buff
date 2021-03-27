--Queries

-- get all movies
SELECT movieID as id, title From Movie

-- get rating entries of current loggin in user
SELECT title, score, explanation, ratingID From Rating_Entry Inner Join Movie on Rating_Entry.movieID=Movie.movieID WHERE account_ID = $account_ID

-- get all groups
SELECT groupName, groupID From Groups

-- get specific rating entry by ID
SELECT title, score, explanation, ratingID From Rating_Entry Inner Join Movie on Rating_Entry.movieID=Movie.movieID Where ratingID = $ratingID

-- get specific movie
SELECT director, producer, gross, totalAudiScore, totalCriticScore From Movie WHERE movieID = $movieID

-- get cast for movie
SELECT actorName From Cast WHERE movieID = $movieID

-- get groups of specific user
SELECT groupName From Groups AS g INNER JOIN Apart_Of AS a ON g.groupID = a.groupID LEFT JOIN Member AS m ON a.email = m.email WHERE m.account_ID = $currentAccountID

-- get groups current users are apart of
SELECT groupID as id, groupName From Groups NATURAL JOIN Apart_Of NATURAL JOIN Member WHERE account_ID = $currentAccountID

-- get current users email
SELECT email FROM Member INNER JOIN Account ON Member.account_ID WHERE Member.account_ID = $currentAccountID

-- get movie info
SELECT director, producer, gross, totalAudiScore, totalCriticScore From Movie WHERE movieID = $movieID

-- get cast
SELECT actorName From Cast WHERE movieID = $movieID


-- Insert Rating Entry
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES ($currentMovie, $currentAccount, $scoreInput, $explanationInut); 

--insert member to apart of group
INSERT INTO Apart_Of (groupID, email) VALUES ($groupID,$email);

-- insert group
INSERT INTO Groups (groupName) VALUES (?)





--Update Rating Entry
UPDATE Rating_Entry SET score=$newScore, explanation = $newExplanation WHERE ratingID=$ratingID

UPDATE Groups SET groupName = $groupName WHERE groupID = $groupID





--Delete a rating entry
DELETE FROM Rating_Entry WHERE ratingID = $ratingID
DELETE FROM Apart_Of WHERE groupID = $groupID
DELETE FROM Groups WHERE groupID = $groupID
DELETE FROM Apart_Of WHERE groupID = $groupID and email = $email



