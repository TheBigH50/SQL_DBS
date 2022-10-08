-- New DB for users, access rights, and data

-- Create new DB
CREATE SCHEMA notes;

-- Use the new DB
USE notes;

-- Create tables

-- 1. users
CREATE TABLE users (
	UserID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    FisrtName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    RoleID INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_roleid FOREIGN KEY (RoleID)
REFERENCES roles(RoleID)
-- Cannot create a User that does not correlate to a role
);
-- 2. roles
CREATE TABLE roles (
RoleID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Name VARCHAR(20) NOT NULL
);
-- 3. posts
CREATE TABLE posts (
PostID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Title VARCHAR(80) NOT NULL,
SubTitle VARCHAR(80),
AuthorID INT NOT NULL,
Content TEXT,
CONSTRAINT fk_authorid FOREIGN KEY (AuthorID)
REFERENCES users(UserID)
-- Cannot create a post that does not correlate to a user
);

-- Fill tables

INSERT INTO roles
SET Name = "Guest";
INSERT INTO roles
SET Name = "Author";
INSERT INTO roles
SET Name = "Editor";
INSERT INTO roles
SET Name = "Member";
INSERT INTO roles
SET Name = "Admin";

SELECT * FROM roles;