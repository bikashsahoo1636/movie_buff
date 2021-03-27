Insert Into Account (username,password)
Values
    (
        "t.nguyen", "asdf"
    ),
    (
        "r.le","abcd" 
    ),
    (
        "tankman", "12345" 
    ),
    (
        "ianJohn" ,"abc123" 
    ),
    (
        "kevFilm", "FRaNK" 
    ),
    (
        "MCRem" , "abcd1234"
    ),
    (
        "Atran" , "asjdfl"
    ),
    (
        "HiYi", "wlr"
    ),
    (
        "QT", "feet"
    ),
    (
        "Katie_Mac" ,"asdf"
    ),
    (
        "SlickG" , "abcd"
    ),
    (
        "MaryPoppin" , "12345"
    ),
    (
         "Marty" ,"abc123"
    ),
    (
        "LegenWill"  , "FRaNK"
    ),
    (
        "RobinWill" ,"abcd1234"
    ),
    (
        "Bubbles" ,"fff"
    ),
    (
        "jjroc" , "wlr"
    ),
    (
        "bowjang" , "wlr"
    ),
    (
        "beaubeau" , "butterfly_effect"
    ),
    (
        "zosh" ,"feet"
    );


INSERT INTO Member (email, name, account_ID, company)
VALUES
("tracy.nguyen@gmail.com","Tracy Nugyen",1, "Times"),
("robert.le@yahoo.com","Rober Le",2, "LA Times"),
("james.tank@gmail.com","James Tank",3,"New York Times"),
("ian.johnson@hotmail.com","Ian Johnson",4, "Huffington Post"),
("kevin.film@yahoo.com","Kevin Film",5,"IMDB"),
("remi.lam@gmail.com","Remi Lam",6,"New Yorker"),
("alicia.tran@gmail.com","Alicia Tran",7, "Times"),
("heidi.yi@aol.com","Heidi Yi",8,"Film Galore"),
("quentin.tarantino@gmail.com","Quentin Tarantino",9, "The Shop"),
("katie.mac@yahoo.com","Katie Mac",10,"Film Noir"),
("SlickG@gmail.com","Kade Gonzalez",11, NULL),
("MaryIsPoppin@yahoo.com","Mary Poppins",12, NULL),
("MartyFarty@gmail.com","Martin Smith",13,NULL),
("IAmLegend@hotmail.com","Will Smith",14,NULL),
("Doubtfire@yahoo.com","Robin Williams",15,NULL),
("Bubbles@gmail.com","Mike Smith",16,NULL),
("J-Roc@gmail.com","Jonathan Torrens",17, NULL),
("BowJangles@aol.com","Toby Tedrow",18,NULL),
("Beau-Beau@gmail.com","Beau Smithson",19, NULL),
("Zosh@yahoo.com","Percy Mescudi",20,NULL);

INSERT INTO Movie (title, director, producer, gross)
VALUES
('Parasite','Bong Joon Ho', 'NEON', 267000000),

('Avengers: Endgame','Joe Russo', 'Marvel Studios',312900000),

('Us','Jordan Peele', 'Universal Pictures', 26000000),

('Knives Out','Rian Johnson', 'Lionsgate', 312900000),

('Toy Story 4','Josh Cooley', 'Disney', 1073000000),

('The Irishman','Martin Scorsese', 'Netflix', 119000000),

('Little Women','Greta Gerwig', 'Sony Pictures', 206000000),

('Booksmart','Olivia Wilde', 'United Artists', 24900000),

('The Farewell','Lulu Wang', 'A24', 22500000),

('Marriage Story','Noah Baumbach', 'Netflix', 2300000);


INSERT INTO Cast (actorName, movieID)
VALUES
('Cho Yeo-jeong', (SELECT movieID FROM Movie WHERE title = 'Parasite')),
('Choi Woo-shik', (SELECT movieID FROM Movie WHERE title = 'Parasite')),
('Park So-dam', (SELECT movieID FROM Movie WHERE title = 'Parasite')),
('Josh Brolin', (SELECT movieID FROM Movie WHERE title = 'Avengers: Endgame')),
('Robert Downey Jr.', (SELECT movieID FROM Movie WHERE title = 'Avengers: Endgame')),
('Scarlet Johansson', (SELECT movieID FROM Movie WHERE title = 'Avengers: Endgame')),
('Chris Evans', (SELECT movieID FROM Movie WHERE title = 'Avengers: Endgame')),
('Winston Duke', (SELECT movieID FROM Movie WHERE title = 'Us')),
('Lupita Nyongo', (SELECT movieID FROM Movie WHERE title = 'Us')),
('Daniel Craig', (SELECT movieID FROM Movie WHERE title = 'Knives Out')),
('Chris Evans', (SELECT movieID FROM Movie WHERE title = 'Knives Out')),
('Tom Hanks', (SELECT movieID FROM Movie WHERE title = 'Toy Story 4')),
('Tim Allen', (SELECT movieID FROM Movie WHERE title = 'Toy Story 4')),
('Robert Deniro', (SELECT movieID FROM Movie WHERE title = 'The Irishman')),
('Al Pacino', (SELECT movieID FROM Movie WHERE title = 'The Irishman')),
('Joe Pesci', (SELECT movieID FROM Movie WHERE title = 'The Irishman')),
('Timothee Chalamet', (SELECT movieID FROM Movie WHERE title = 'Little Women')),
('Diana Silvers', (SELECT movieID FROM Movie WHERE title = 'Booksmart')),
('Kaitlyn Dever', (SELECT movieID FROM Movie WHERE title = 'Booksmart')),
('Awkwafina', (SELECT movieID FROM Movie WHERE title = 'The Farewell')),
('Tzi Ma', (SELECT movieID FROM Movie WHERE title = 'The Farewell')),
('Scarlet Johansson', (SELECT movieID FROM Movie WHERE title = 'Marriage Story')),
('Adam Driver', (SELECT movieID FROM Movie WHERE title = 'Marriage Story'));


INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (1, 1, 90, "Amazing Film");
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (2, 2, 98, "Great way to end the series."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (3, 3, 78, "Not as good as Get Out. Entertaining but questionable at times."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (4, 5, 94, "A great who-done-it film."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (5, 2, 99, "Pixar does it again"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (5, 3, 84, "Great for the family, but not as good as previous installments."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (6, 4, 89, "Martin Scorsese is masterful."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (7, 7, 89, "Amazing film"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (8, 6, 89, "Funny and original"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (9, 5, 94, "Very good film."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (10, 8, 89, "Scarlet Johansson gives an amazing performance."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (1, 11, 94, "Outstanding Film");
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (2, 12, 96, "Marvel does it again"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (3, 13, 67, "Made no sense to me."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (4, 15, 96, "Myster films are the best!."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (5, 12, 94, "Made me laugh throughout."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (6, 13, 94, "Gangstas are always a great time at the movies."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (6, 14, 89, "Martin Scorsese masters his craft in this one."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (7, 17, 84, "Fantastic film and story"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (8, 16, 72, "It was aight"); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (9, 15, 78, "Just average."); 
INSERT INTO Rating_Entry (movieID, account_ID, score, explanation) VALUES (10, 18, 84, "Scarlet Johansson and Adam Driver are amazing together."); 


INSERT INTO Groups (groupName)
VALUES
("LeoFans"),
("WillSmithFans"),
("RobinWFans"),
("MattDamonFans"),
("AlecBaldFans"),
("ChrisFarleyFans"),
("DavidSpadeFans"),
("LOTRFans"),
("StarWarsFans"),
("HPFans");


INSERT INTO Apart_Of (groupID,email)
VALUES
((SELECT groupID FROM Groups WHERE Groups.groupName = "LeoFans"),"tracy.nguyen@gmail.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "WillSmithFans"),"robert.le@yahoo.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "RobinWFans"),"james.tank@gmail.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "MattDamonFans"),"ian.johnson@hotmail.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "AlecBaldFans"),"kevin.film@yahoo.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "ChrisFarleyFans"),"MaryIsPoppin@yahoo.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "DavidSpadeFans"),"J-Roc@gmail.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "LOTRFans"),"BowJangles@aol.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "StarWarsFans"),"Beau-Beau@gmail.com"),
((SELECT groupID FROM Groups WHERE Groups.groupName = "HPFans"),"Zosh@yahoo.com");
