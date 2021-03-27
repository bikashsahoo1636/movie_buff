Create Table Account (
  account_ID int(11) NOT NULL AUTO_INCREMENT,
  password varchar(255) NOT NULL,
  username varchar(255) NOT NULL UNIQUE,
  PRIMARY KEY(account_ID)
);

CREATE TABLE Member
(
    email VARCHAR(70) NOT NULL,
    name VARCHAR(70) NOT NULL,
    account_ID INT NOT NULL,
    company VARCHAR(70),
    PRIMARY KEY(email),
    FOREIGN KEY(account_ID) REFERENCES Account(account_ID)
        On Delete Cascade  
);

CREATE TABLE Movie ( 
    movieID INT(11) AUTO_INCREMENT , 
    title VARCHAR(255) NOT NULL , 
    director VARCHAR(255) NOT NULL , 
    producer VARCHAR(255) NOT NULL , 
    gross INT NOT NULL , 
    totalAudiScore INT NOT NULL DEFAULT 0, 
    totalCriticScore INT NOT NULL DEFAULT 0,
    PRIMARY KEY (movieID)
);

CREATE TABLE Cast (  
    movieID INT NOT NULL ,
    actorName VARCHAR(255) NOT NULL , 
    PRIMARY KEY (movieID, actorName) ,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID)
);

CREATE TABLE Rating_Entry (
    ratingID int(11) AUTO_INCREMENT PRIMARY KEY, 
    movieID int(11) NOT NULL, 
    account_ID int NOT NULL,
    score tinyint NOT NULL, 
    explanation text NOT NULL,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    FOREIGN KEY (account_ID) REFERENCES Account(account_ID)
        On Delete Cascade
);


CREATE TABLE Groups(
    groupID INT NOT NULL AUTO_INCREMENT,
    groupName VARCHAR(255) NOT NULL,
    PRIMARY KEY(groupID)
);

CREATE TABLE Apart_Of
(
    groupID INT NOT NULL,
    email VARCHAR(30) NOT NULL,
    FOREIGN KEY(groupID) REFERENCES Groups(groupID)
        On Delete Cascade,
    FOREIGN KEY(email) REFERENCES Member(email)
        On Delete Cascade,
    PRIMARY KEY(email,groupID)

);


