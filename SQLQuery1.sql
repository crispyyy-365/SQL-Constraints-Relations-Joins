CREATE DATABASE Database1

CREATE TABLE Students (
    [Name] NVARCHAR(100) NOT NULL,
    Surname NVARCHAR(100) DEFAULT 'XXX',
    Age INT CHECK (Age >= 18),
    AvgPoint DECIMAL CHECK (AvgPoint >= 0.0 AND AvgPoint <= 100.0)
);

INSERT INTO Students VALUES('Hüseyn', 'Abbasov', 19, 66.6)
INSERT INTO Students VALUES('Elşən', 'Mahmudov', 18, 94.7) 
INSERT INTO Students VALUES('Arif', 'Məmmədov', 20, 56.8)
INSERT INTO Students VALUES('Akif', 'Rüstəmov', 36, 99.9)

SELECT * 
FROM Students 
WHERE AvgPoint > 51 AND AvgPoint < 90;

SELECT * 
FROM Students 
WHERE Name LIKE 'A%f';


CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY,  
    [Name] VARCHAR(100) NOT NULL              
);


CREATE TABLE Users (
    Username VARCHAR(100) PRIMARY KEY NOT NULL,
    [Password] VARCHAR(255) NOT NULL,
    RoleID INT REFERENCES Roles(RoleId)
);

INSERT INTO Roles (Name) VALUES ('Admin');
INSERT INTO Roles (Name) VALUES ('Moderator');
INSERT INTO Roles (Name) VALUES ('User');

INSERT INTO Users (Username, Password) 
VALUES ('john_wick', 'AUYE123'); 

INSERT INTO Users (Username, Password, RoleID) 
VALUES ('jane_smith', 'AYE456', 1);  

INSERT INTO Users (Username, Password, RoleID)
VALUES ('jesse_pinkman', 'cApTAInCOok2341', 3)
        
INSERT INTO Users (Username, Password, RoleID)
VALUES ('josh_hutcher', 'FIVENIGHTS2341', 2)

SELECT Users.Username, Roles.Name FROM Users
LEFT JOIN Roles
ON Users.RoleID = Roles.RoleID 