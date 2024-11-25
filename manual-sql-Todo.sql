CREATE DATABASE dbTodo;

USE dbTodo

CREATE TABLE Todo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255)
);

INSERT INTO Todo (Name) VALUES ('Snacks');
INSERT INTO Todo (Name) VALUES ('Groceries');
INSERT INTO Todo (Name) VALUES ('Candies');
INSERT INTO Todo (Name) VALUES ('Again and again');
INSERT INTO Todo (Name) VALUES ('blabla');