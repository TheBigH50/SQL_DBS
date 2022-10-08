-- New DB for users, access rights, and data

-- Create new DB
CREATE SCHEMA leaderboard;

-- Use the new DB
USE leaderboard;

-- Create tables

-- 1. users
CREATE TABLE users (
	UserID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    UserName VARCHAR(25) UNIQUE NOT NULL,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. scores
CREATE TABLE scores (
UserID INT NOT NULL,
ScoreID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
EasyScore TINYINT DEFAULT 0 NOT NULL,
EasyCompletionTime TIME DEFAULT 0 NOT NULL,
HardScore TINYINT DEFAULT 0 NOT NULL,
HardCompletionTime TIME DEFAULT 0 NOT NULL,
OverkillScore TINYINT DEFAULT 0 NOT NULL,
OverkillCompletionTime TIME DEFAULT 0 NOT NULL,
CONSTRAINT fk_UserID FOREIGN KEY (UserID)
REFERENCES users(UserID)
);


INSERT INTO users SET UserName = 'HotWings22';
SELECT * FROM users;
SELECT * FROM scores;
UPDATE scores SET HardScore= 8, HardCompletionTime= 142 WHERE UserID= 19;
SELECT UserName, scores.UserID, EasyScore, HardScore, OverkillScore FROM scores INNER JOIN users ON users.UserID = scores.UserID ORDER BY EasyScore ASC;
SELECT UserName, OverkillScore, OverkillCompletionTime FROM scores INNER JOIN users ON users.UserID = scores.UserID WHERE NOT OverkillScore= 0 ORDER BY OverkillScore, OverkillCompletionTime, HardScore, HardCompletionTime, EasyScore, EasyCompletionTime ASC LIMIT 10;
SELECT UserName, HardScore, HardCompletionTime FROM scores INNER JOIN users ON users.UserID = scores.UserID WHERE NOT HardScore= 0 ORDER BY HardScore, HardCompletionTime, EasyScore, EasyCompletionTime ASC LIMIT 10;
SELECT UserName, EasyScore, EasyCompletionTime FROM scores INNER JOIN users ON users.UserID = scores.UserID WHERE NOT EasyScore= 0 ORDER BY EasyScore, EasyCompletionTime ASC LIMIT 10;
SELECT UserName, EasyScore, EasyCompletionTime, HardScore, HardCompletionTime, OverkillScore, OverkillCompletionTime From scores INNER JOIN users ON users.UserID = scores.UserID WHERE scores.UserID= 18;

SELECT UserName, OverkillScore, OverkillCompletionTime FROM scores INNER JOIN users ON users.UserID = scores.UserID WHERE NOT OverkillScore= 0 ORDER BY OverkillScore, OverkillCompletionTime, HardScore, HardCompletionTime, EasyScore, EasyCompletionTime ASC LIMIT 10;
DELETE FROM users WHERE UserID = 4;
-- INSERT INTO easyscores (UserID)
-- SELECT UserID FROM users WHERE UserName= 'TheBigH34';
INSERT INTO scores SET UserID= '19',
EasyScore= '8', EasyCompletionTime = '123'
;


