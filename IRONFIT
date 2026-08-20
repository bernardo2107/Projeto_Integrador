CREATE DATABASE IF NOT EXISTS IRONFIT;
USE IRONFIT;

CREATE TABLE GYM (
GymID INT PRIMARY KEY AUTO_INCREMENT,
GymName VARCHAR (100),
Address VARCHAR (255),
City VARCHAR (100),
PHONE VARCHAR (20)
);

CREATE TABLE SubscriptionPlan (
SusbscriptionPlanID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR (100),
Description VARCHAR (255),
MonthlyPrice DECIMAL (10,2),
Access BOOL,
Level VARCHAR (30)
);

CREATE TABLE GROUPCLASS (
ClassID INT PRIMARY KEY AUTO_INCREMENT,
GymID INT ,
Title VARCHAR (100),
Category VARCHAR (50),
StartTime DATETIME,
Duration TIME,
Capacity INT,
Level VARCHAR (30)
);

CREATE TABLE MEMBER (
MemberID INT PRIMARY KEY AUTO_INCREMENT,
MemberName VARCHAR (100),
Email VARCHAR(255),
phone VARCHAR (20),
RegistrationDate DATE,
MEMBERSTATUS  VARCHAR (20),
GYMID INT,
FOREIGN KEY (GymID) REFERENCES GYM (GYMID)
);

CREATE TABLE Subscription (
SubscriptionID INT PRIMARY KEY AUTO_INCREMENT,
MemberID INT,
SubscriptionPlanID INT,
StartDate DATE,
ENDDATE DATE,
SubscriptionStatus VARCHAR (20),
ChargerdAmount VARCHAR (20),
FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
FOREIGN KEY (SubscriptionPlanID) REFERENCES SUBSCRIPTIONPLAN (SUBSCRIPTIONPLANID)
);

CREATE TABLE CLASSSBOOKING (
BookingID INT PRIMARY KEY AUTO_INCREMENT,
ClassID INT, FOREIGN KEY (ClassID) REFERENCES GroupClass (CLASSID),
MemberID INT , FOREIGN KEY (MemberID) REFERENCES MEMBER (MemberID),
BookingDate DATETIME, 
STATUS VARCHAR (20),
ATTENDANCE BOOL
);

CREATE TABLE PersonalTrainer ( 
PersonalTrainerID INT PRIMARY KEY AUTO_INCREMENT,
gymID INT,
PersonalName VARCHAR(100),
email VARCHAR(255) UNIQUE,
phone VARCHAR(20) UNIQUE,
specialty VARCHAR (100),
Certifications VARCHAR (255),
FOREIGN KEY (gymID) REFERENCES gym (gymid)
);

CREATE TABLE PhysicalAssesment (
AssesmentID INT PRIMARY KEY AUTO_INCREMENT,
MemberID INT,
Personaltrainerid INT,
AssesmentDate DATE,
WeightKG DECIMAL,
Heightcm DECIMAL,
Notes TEXT,
FOREIGN KEY (MemberID)REFERENCES MEMBER (MEMBERID),
FOREIGN KEY (PersonalTrainerID) REFERENCES PersonalTrainer (PersonalTrainerID)
);

CREATE TABLE SessionPT (
SessionID INT PRIMARY KEY AUTO_INCREMENT,
PersonalTrainerID INT, 
MemberID INT,
StartTime DATETIME,
Duration VARCHAR (20),
Status VARCHAR (20),
SessionType Varchar (30),
FOREIGN KEY (PersonalTrainerID) REFERENCES PersonalTrainer (PersonalTrainerID),
FOREIGN KEY (MemberID) REFERENCES Member (MemberID)
);




INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 1', 'Rua das Academias, 1', 'São Paulo', '(11) 90000-0001');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 2', 'Rua das Academias, 2', 'São Paulo', '(11) 90000-0002');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 3', 'Rua das Academias, 3', 'São Paulo', '(11) 90000-0003');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 4', 'Rua das Academias, 4', 'São Paulo', '(11) 90000-0004');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 5', 'Rua das Academias, 5', 'São Paulo', '(11) 90000-0005');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 6', 'Rua das Academias, 6', 'São Paulo', '(11) 90000-0006');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 7', 'Rua das Academias, 7', 'São Paulo', '(11) 90000-0007');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 8', 'Rua das Academias, 8', 'São Paulo', '(11) 90000-0008');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 9', 'Rua das Academias, 9', 'São Paulo', '(11) 90000-0009');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 10', 'Rua das Academias, 10', 'São Paulo', '(11) 90000-0010');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 11', 'Rua das Academias, 11', 'São Paulo', '(11) 90000-0011');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 12', 'Rua das Academias, 12', 'São Paulo', '(11) 90000-0012');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 13', 'Rua das Academias, 13', 'São Paulo', '(11) 90000-0013');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 14', 'Rua das Academias, 14', 'São Paulo', '(11) 90000-0014');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 15', 'Rua das Academias, 15', 'São Paulo', '(11) 90000-0015');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 16', 'Rua das Academias, 16', 'São Paulo', '(11) 90000-0016');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 17', 'Rua das Academias, 17', 'São Paulo', '(11) 90000-0017');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 18', 'Rua das Academias, 18', 'São Paulo', '(11) 90000-0018');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 19', 'Rua das Academias, 19', 'São Paulo', '(11) 90000-0019');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 20', 'Rua das Academias, 20', 'São Paulo', '(11) 90000-0020');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 21', 'Rua das Academias, 21', 'São Paulo', '(11) 90000-0021');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 22', 'Rua das Academias, 22', 'São Paulo', '(11) 90000-0022');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 23', 'Rua das Academias, 23', 'São Paulo', '(11) 90000-0023');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 24', 'Rua das Academias, 24', 'São Paulo', '(11) 90000-0024');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 25', 'Rua das Academias, 25', 'São Paulo', '(11) 90000-0025');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 26', 'Rua das Academias, 26', 'São Paulo', '(11) 90000-0026');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 27', 'Rua das Academias, 27', 'São Paulo', '(11) 90000-0027');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 28', 'Rua das Academias, 28', 'São Paulo', '(11) 90000-0028');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 29', 'Rua das Academias, 29', 'São Paulo', '(11) 90000-0029');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 30', 'Rua das Academias, 30', 'São Paulo', '(11) 90000-0030');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 31', 'Rua das Academias, 31', 'Campinas', '(11) 90000-0031');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 32', 'Rua das Academias, 32', 'Campinas', '(11) 90000-0032');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 33', 'Rua das Academias, 33', 'Campinas', '(11) 90000-0033');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 34', 'Rua das Academias, 34', 'Campinas', '(11) 90000-0034');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 35', 'Rua das Academias, 35', 'Campinas', '(11) 90000-0035');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 36', 'Rua das Academias, 36', 'Campinas', '(11) 90000-0036');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 37', 'Rua das Academias, 37', 'Campinas', '(11) 90000-0037');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 38', 'Rua das Academias, 38', 'Campinas', '(11) 90000-0038');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 39', 'Rua das Academias, 39', 'Campinas', '(11) 90000-0039');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 40', 'Rua das Academias, 40', 'Campinas', '(11) 90000-0040');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 41', 'Rua das Academias, 41', 'Campinas', '(11) 90000-0041');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 42', 'Rua das Academias, 42', 'Campinas', '(11) 90000-0042');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 43', 'Rua das Academias, 43', 'Campinas', '(11) 90000-0043');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 44', 'Rua das Academias, 44', 'Campinas', '(11) 90000-0044');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 45', 'Rua das Academias, 45', 'Campinas', '(11) 90000-0045');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 46', 'Rua das Academias, 46', 'Campinas', '(11) 90000-0046');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 47', 'Rua das Academias, 47', 'Campinas', '(11) 90000-0047');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 48', 'Rua das Academias, 48', 'Campinas', '(11) 90000-0048');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 49', 'Rua das Academias, 49', 'Campinas', '(11) 90000-0049');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 50', 'Rua das Academias, 50', 'Campinas', '(11) 90000-0050');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 51', 'Rua das Academias, 51', 'Campinas', '(11) 90000-0051');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 52', 'Rua das Academias, 52', 'Campinas', '(11) 90000-0052');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 53', 'Rua das Academias, 53', 'Campinas', '(11) 90000-0053');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 54', 'Rua das Academias, 54', 'Campinas', '(11) 90000-0054');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 55', 'Rua das Academias, 55', 'Campinas', '(11) 90000-0055');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 56', 'Rua das Academias, 56', 'Campinas', '(11) 90000-0056');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 57', 'Rua das Academias, 57', 'Campinas', '(11) 90000-0057');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 58', 'Rua das Academias, 58', 'Campinas', '(11) 90000-0058');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 59', 'Rua das Academias, 59', 'Campinas', '(11) 90000-0059');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 60', 'Rua das Academias, 60', 'Campinas', '(11) 90000-0060');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 61', 'Rua das Academias, 61', 'Santos', '(11) 90000-0061');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 62', 'Rua das Academias, 62', 'Santos', '(11) 90000-0062');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 63', 'Rua das Academias, 63', 'Santos', '(11) 90000-0063');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 64', 'Rua das Academias, 64', 'Santos', '(11) 90000-0064');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 65', 'Rua das Academias, 65', 'Santos', '(11) 90000-0065');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 66', 'Rua das Academias, 66', 'Santos', '(11) 90000-0066');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 67', 'Rua das Academias, 67', 'Santos', '(11) 90000-0067');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 68', 'Rua das Academias, 68', 'Santos', '(11) 90000-0068');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 69', 'Rua das Academias, 69', 'Santos', '(11) 90000-0069');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 70', 'Rua das Academias, 70', 'Santos', '(11) 90000-0070');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 71', 'Rua das Academias, 71', 'Santos', '(11) 90000-0071');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 72', 'Rua das Academias, 72', 'Santos', '(11) 90000-0072');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 73', 'Rua das Academias, 73', 'Santos', '(11) 90000-0073');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 74', 'Rua das Academias, 74', 'Santos', '(11) 90000-0074');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 75', 'Rua das Academias, 75', 'Santos', '(11) 90000-0075');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 76', 'Rua das Academias, 76', 'Santos', '(11) 90000-0076');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 77', 'Rua das Academias, 77', 'Santos', '(11) 90000-0077');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 78', 'Rua das Academias, 78', 'Santos', '(11) 90000-0078');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 79', 'Rua das Academias, 79', 'Santos', '(11) 90000-0079');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 80', 'Rua das Academias, 80', 'Santos', '(11) 90000-0080');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 81', 'Rua das Academias, 81', 'Santos', '(11) 90000-0081');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 82', 'Rua das Academias, 82', 'Santos', '(11) 90000-0082');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 83', 'Rua das Academias, 83', 'Santos', '(11) 90000-0083');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 84', 'Rua das Academias, 84', 'Santos', '(11) 90000-0084');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 85', 'Rua das Academias, 85', 'Santos', '(11) 90000-0085');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 86', 'Rua das Academias, 86', 'Santos', '(11) 90000-0086');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 87', 'Rua das Academias, 87', 'Santos', '(11) 90000-0087');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 88', 'Rua das Academias, 88', 'Santos', '(11) 90000-0088');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 89', 'Rua das Academias, 89', 'Santos', '(11) 90000-0089');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 90', 'Rua das Academias, 90', 'Santos', '(11) 90000-0090');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 91', 'Rua das Academias, 91', 'Guarulhos', '(11) 90000-0091');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 92', 'Rua das Academias, 92', 'Guarulhos', '(11) 90000-0092');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 93', 'Rua das Academias, 93', 'Guarulhos', '(11) 90000-0093');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 94', 'Rua das Academias, 94', 'Guarulhos', '(11) 90000-0094');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 95', 'Rua das Academias, 95', 'Guarulhos', '(11) 90000-0095');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 96', 'Rua das Academias, 96', 'Guarulhos', '(11) 90000-0096');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 97', 'Rua das Academias, 97', 'Guarulhos', '(11) 90000-0097');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 98', 'Rua das Academias, 98', 'Guarulhos', '(11) 90000-0098');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 99', 'Rua das Academias, 99', 'Guarulhos', '(11) 90000-0099');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 100', 'Rua das Academias, 100', 'Guarulhos', '(11) 90000-0100');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 101', 'Rua das Academias, 101', 'Guarulhos', '(11) 90000-0101');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 102', 'Rua das Academias, 102', 'Guarulhos', '(11) 90000-0102');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 103', 'Rua das Academias, 103', 'Guarulhos', '(11) 90000-0103');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 104', 'Rua das Academias, 104', 'Guarulhos', '(11) 90000-0104');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 105', 'Rua das Academias, 105', 'Guarulhos', '(11) 90000-0105');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 106', 'Rua das Academias, 106', 'Guarulhos', '(11) 90000-0106');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 107', 'Rua das Academias, 107', 'Guarulhos', '(11) 90000-0107');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 108', 'Rua das Academias, 108', 'Guarulhos', '(11) 90000-0108');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 109', 'Rua das Academias, 109', 'Guarulhos', '(11) 90000-0109');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 110', 'Rua das Academias, 110', 'Guarulhos', '(11) 90000-0110');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 111', 'Rua das Academias, 111', 'Guarulhos', '(11) 90000-0111');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 112', 'Rua das Academias, 112', 'Guarulhos', '(11) 90000-0112');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 113', 'Rua das Academias, 113', 'Guarulhos', '(11) 90000-0113');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 114', 'Rua das Academias, 114', 'Guarulhos', '(11) 90000-0114');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 115', 'Rua das Academias, 115', 'Guarulhos', '(11) 90000-0115');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 116', 'Rua das Academias, 116', 'Guarulhos', '(11) 90000-0116');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 117', 'Rua das Academias, 117', 'Guarulhos', '(11) 90000-0117');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 118', 'Rua das Academias, 118', 'Guarulhos', '(11) 90000-0118');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 119', 'Rua das Academias, 119', 'Guarulhos', '(11) 90000-0119');
INSERT INTO GYM (GymName, Address, City, PHONE) VALUES ('IronFit Unidade 120', 'Rua das Academias, 120', 'Guarulhos', '(11) 90000-0120');

INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 1', 'Plano IronFit número 1', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 2', 'Plano IronFit número 2', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 3', 'Plano IronFit número 3', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 4', 'Plano IronFit número 4', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 5', 'Plano IronFit número 5', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 6', 'Plano IronFit número 6', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 7', 'Plano IronFit número 7', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 8', 'Plano IronFit número 8', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 9', 'Plano IronFit número 9', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 10', 'Plano IronFit número 10', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 11', 'Plano IronFit número 11', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 12', 'Plano IronFit número 12', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 13', 'Plano IronFit número 13', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 14', 'Plano IronFit número 14', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 15', 'Plano IronFit número 15', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 16', 'Plano IronFit número 16', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 17', 'Plano IronFit número 17', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 18', 'Plano IronFit número 18', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 19', 'Plano IronFit número 19', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 20', 'Plano IronFit número 20', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 21', 'Plano IronFit número 21', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 22', 'Plano IronFit número 22', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 23', 'Plano IronFit número 23', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 24', 'Plano IronFit número 24', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 25', 'Plano IronFit número 25', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 26', 'Plano IronFit número 26', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 27', 'Plano IronFit número 27', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 28', 'Plano IronFit número 28', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 29', 'Plano IronFit número 29', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 30', 'Plano IronFit número 30', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 31', 'Plano IronFit número 31', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 32', 'Plano IronFit número 32', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 33', 'Plano IronFit número 33', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 34', 'Plano IronFit número 34', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 35', 'Plano IronFit número 35', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 36', 'Plano IronFit número 36', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 37', 'Plano IronFit número 37', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 38', 'Plano IronFit número 38', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 39', 'Plano IronFit número 39', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 40', 'Plano IronFit número 40', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 41', 'Plano IronFit número 41', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 42', 'Plano IronFit número 42', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 43', 'Plano IronFit número 43', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 44', 'Plano IronFit número 44', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 45', 'Plano IronFit número 45', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 46', 'Plano IronFit número 46', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 47', 'Plano IronFit número 47', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 48', 'Plano IronFit número 48', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 49', 'Plano IronFit número 49', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 50', 'Plano IronFit número 50', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 51', 'Plano IronFit número 51', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 52', 'Plano IronFit número 52', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 53', 'Plano IronFit número 53', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 54', 'Plano IronFit número 54', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 55', 'Plano IronFit número 55', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 56', 'Plano IronFit número 56', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 57', 'Plano IronFit número 57', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 58', 'Plano IronFit número 58', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 59', 'Plano IronFit número 59', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 60', 'Plano IronFit número 60', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 61', 'Plano IronFit número 61', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 62', 'Plano IronFit número 62', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 63', 'Plano IronFit número 63', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 64', 'Plano IronFit número 64', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 65', 'Plano IronFit número 65', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 66', 'Plano IronFit número 66', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 67', 'Plano IronFit número 67', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 68', 'Plano IronFit número 68', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 69', 'Plano IronFit número 69', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 70', 'Plano IronFit número 70', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 71', 'Plano IronFit número 71', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 72', 'Plano IronFit número 72', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 73', 'Plano IronFit número 73', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 74', 'Plano IronFit número 74', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 75', 'Plano IronFit número 75', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 76', 'Plano IronFit número 76', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 77', 'Plano IronFit número 77', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 78', 'Plano IronFit número 78', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 79', 'Plano IronFit número 79', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 80', 'Plano IronFit número 80', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 81', 'Plano IronFit número 81', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 82', 'Plano IronFit número 82', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 83', 'Plano IronFit número 83', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 84', 'Plano IronFit número 84', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 85', 'Plano IronFit número 85', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 86', 'Plano IronFit número 86', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 87', 'Plano IronFit número 87', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 88', 'Plano IronFit número 88', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 89', 'Plano IronFit número 89', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 90', 'Plano IronFit número 90', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 91', 'Plano IronFit número 91', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 92', 'Plano IronFit número 92', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 93', 'Plano IronFit número 93', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 94', 'Plano IronFit número 94', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 95', 'Plano IronFit número 95', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 96', 'Plano IronFit número 96', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 97', 'Plano IronFit número 97', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 98', 'Plano IronFit número 98', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 99', 'Plano IronFit número 99', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 100', 'Plano IronFit número 100', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 101', 'Plano IronFit número 101', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 102', 'Plano IronFit número 102', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 103', 'Plano IronFit número 103', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 104', 'Plano IronFit número 104', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 105', 'Plano IronFit número 105', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 106', 'Plano IronFit número 106', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 107', 'Plano IronFit número 107', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 108', 'Plano IronFit número 108', 199.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 109', 'Plano IronFit número 109', 99.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 110', 'Plano IronFit número 110', 149.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 111', 'Plano IronFit número 111', 179.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 112', 'Plano IronFit número 112', 199.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 113', 'Plano IronFit número 113', 99.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 114', 'Plano IronFit número 114', 149.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 115', 'Plano IronFit número 115', 179.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 116', 'Plano IronFit número 116', 199.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 117', 'Plano IronFit número 117', 99.90, TRUE, 'Avançado');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 118', 'Plano IronFit número 118', 149.90, TRUE, 'Iniciante');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 119', 'Plano IronFit número 119', 179.90, TRUE, 'Intermediário');
INSERT INTO SubscriptionPlan (Name, Description, MonthlyPrice, Access, Level) VALUES ('Plano 120', 'Plano IronFit número 120', 199.90, TRUE, 'Avançado');

INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (1, 'Aula 1', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (2, 'Aula 2', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (3, 'Aula 3', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (4, 'Aula 4', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (5, 'Aula 5', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (6, 'Aula 6', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (7, 'Aula 7', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (8, 'Aula 8', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (9, 'Aula 9', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (10, 'Aula 10', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (11, 'Aula 11', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (12, 'Aula 12', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (13, 'Aula 13', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (14, 'Aula 14', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (15, 'Aula 15', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 30, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (16, 'Aula 16', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 31, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (17, 'Aula 17', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 32, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (18, 'Aula 18', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 33, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (19, 'Aula 19', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 34, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (20, 'Aula 20', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 35, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (21, 'Aula 21', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 15, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (22, 'Aula 22', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (23, 'Aula 23', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (24, 'Aula 24', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (25, 'Aula 25', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (26, 'Aula 26', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (27, 'Aula 27', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (28, 'Aula 28', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (29, 'Aula 29', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (30, 'Aula 30', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (31, 'Aula 31', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (32, 'Aula 32', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (33, 'Aula 33', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (34, 'Aula 34', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (35, 'Aula 35', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (36, 'Aula 36', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 30, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (37, 'Aula 37', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 31, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (38, 'Aula 38', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 32, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (39, 'Aula 39', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 33, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (40, 'Aula 40', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 34, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (41, 'Aula 41', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 35, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (42, 'Aula 42', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 15, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (43, 'Aula 43', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (44, 'Aula 44', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (45, 'Aula 45', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (46, 'Aula 46', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (47, 'Aula 47', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (48, 'Aula 48', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (49, 'Aula 49', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (50, 'Aula 50', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (51, 'Aula 51', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (52, 'Aula 52', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (53, 'Aula 53', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (54, 'Aula 54', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (55, 'Aula 55', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (56, 'Aula 56', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (57, 'Aula 57', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 30, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (58, 'Aula 58', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 31, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (59, 'Aula 59', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 32, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (60, 'Aula 60', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 33, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (61, 'Aula 61', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 34, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (62, 'Aula 62', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 35, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (63, 'Aula 63', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 15, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (64, 'Aula 64', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (65, 'Aula 65', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (66, 'Aula 66', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (67, 'Aula 67', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (68, 'Aula 68', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (69, 'Aula 69', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (70, 'Aula 70', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (71, 'Aula 71', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (72, 'Aula 72', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (73, 'Aula 73', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (74, 'Aula 74', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (75, 'Aula 75', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (76, 'Aula 76', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (77, 'Aula 77', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (78, 'Aula 78', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 30, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (79, 'Aula 79', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 31, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (80, 'Aula 80', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 32, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (81, 'Aula 81', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 33, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (82, 'Aula 82', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 34, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (83, 'Aula 83', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 35, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (84, 'Aula 84', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 15, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (85, 'Aula 85', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (86, 'Aula 86', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (87, 'Aula 87', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (88, 'Aula 88', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (89, 'Aula 89', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (90, 'Aula 90', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (91, 'Aula 91', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (92, 'Aula 92', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (93, 'Aula 93', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (94, 'Aula 94', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (95, 'Aula 95', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (96, 'Aula 96', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (97, 'Aula 97', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (98, 'Aula 98', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (99, 'Aula 99', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 30, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (100, 'Aula 100', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 31, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (101, 'Aula 101', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 32, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (102, 'Aula 102', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 33, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (103, 'Aula 103', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 34, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (104, 'Aula 104', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 35, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (105, 'Aula 105', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 15, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (106, 'Aula 106', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 16, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (107, 'Aula 107', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 17, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (108, 'Aula 108', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 18, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (109, 'Aula 109', 'Musculação', '2026-08-01 07:00:00', '2026-01-01', 19, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (110, 'Aula 110', 'Yoga', '2026-08-01 08:00:00', '2026-01-01', 20, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (111, 'Aula 111', 'Spinning', '2026-08-01 09:00:00', '2026-01-01', 21, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (112, 'Aula 112', 'Funcional', '2026-08-01 10:00:00', '2026-01-01', 22, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (113, 'Aula 113', 'Musculação', '2026-08-01 11:00:00', '2026-01-01', 23, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (114, 'Aula 114', 'Yoga', '2026-08-01 12:00:00', '2026-01-01', 24, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (115, 'Aula 115', 'Spinning', '2026-08-01 13:00:00', '2026-01-01', 25, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (116, 'Aula 116', 'Funcional', '2026-08-01 14:00:00', '2026-01-01', 26, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (117, 'Aula 117', 'Musculação', '2026-08-01 15:00:00', '2026-01-01', 27, 'Avançado');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (118, 'Aula 118', 'Yoga', '2026-08-01 16:00:00', '2026-01-01', 28, 'Iniciante');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (119, 'Aula 119', 'Spinning', '2026-08-01 17:00:00', '2026-01-01', 29, 'Intermediário');
INSERT INTO GROUPCLASS (GymID, Title, Category, StartTime, Duration, Capacity, Level) VALUES (120, 'Aula 120', 'Funcional', '2026-08-01 18:00:00', '2026-01-01', 30, 'Avançado');

INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 1', 'aluno1@ironfit.com', '(11) 91000-0001', '2026-01-01', 'Ativo', 1);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 2', 'aluno2@ironfit.com', '(11) 91000-0002', '2026-01-02', 'Ativo', 2);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 3', 'aluno3@ironfit.com', '(11) 91000-0003', '2026-01-03', 'Ativo', 3);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 4', 'aluno4@ironfit.com', '(11) 91000-0004', '2026-01-04', 'Ativo', 4);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 5', 'aluno5@ironfit.com', '(11) 91000-0005', '2026-01-05', 'Ativo', 5);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 6', 'aluno6@ironfit.com', '(11) 91000-0006', '2026-01-06', 'Ativo', 6);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 7', 'aluno7@ironfit.com', '(11) 91000-0007', '2026-01-07', 'Ativo', 7);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 8', 'aluno8@ironfit.com', '(11) 91000-0008', '2026-01-08', 'Ativo', 8);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 9', 'aluno9@ironfit.com', '(11) 91000-0009', '2026-01-09', 'Ativo', 9);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 10', 'aluno10@ironfit.com', '(11) 91000-0010', '2026-01-10', 'Inativo', 10);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 11', 'aluno11@ironfit.com', '(11) 91000-0011', '2026-01-11', 'Ativo', 11);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 12', 'aluno12@ironfit.com', '(11) 91000-0012', '2026-01-12', 'Ativo', 12);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 13', 'aluno13@ironfit.com', '(11) 91000-0013', '2026-01-13', 'Ativo', 13);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 14', 'aluno14@ironfit.com', '(11) 91000-0014', '2026-01-14', 'Ativo', 14);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 15', 'aluno15@ironfit.com', '(11) 91000-0015', '2026-01-15', 'Ativo', 15);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 16', 'aluno16@ironfit.com', '(11) 91000-0016', '2026-01-16', 'Ativo', 16);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 17', 'aluno17@ironfit.com', '(11) 91000-0017', '2026-01-17', 'Ativo', 17);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 18', 'aluno18@ironfit.com', '(11) 91000-0018', '2026-01-18', 'Ativo', 18);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 19', 'aluno19@ironfit.com', '(11) 91000-0019', '2026-01-19', 'Ativo', 19);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 20', 'aluno20@ironfit.com', '(11) 91000-0020', '2026-01-20', 'Inativo', 20);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 21', 'aluno21@ironfit.com', '(11) 91000-0021', '2026-01-21', 'Ativo', 21);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 22', 'aluno22@ironfit.com', '(11) 91000-0022', '2026-01-22', 'Ativo', 22);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 23', 'aluno23@ironfit.com', '(11) 91000-0023', '2026-01-23', 'Ativo', 23);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 24', 'aluno24@ironfit.com', '(11) 91000-0024', '2026-01-24', 'Ativo', 24);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 25', 'aluno25@ironfit.com', '(11) 91000-0025', '2026-01-25', 'Ativo', 25);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 26', 'aluno26@ironfit.com', '(11) 91000-0026', '2026-01-26', 'Ativo', 26);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 27', 'aluno27@ironfit.com', '(11) 91000-0027', '2026-01-27', 'Ativo', 27);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 28', 'aluno28@ironfit.com', '(11) 91000-0028', '2026-01-28', 'Ativo', 28);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 29', 'aluno29@ironfit.com', '(11) 91000-0029', '2026-01-01', 'Ativo', 29);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 30', 'aluno30@ironfit.com', '(11) 91000-0030', '2026-01-02', 'Inativo', 30);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 31', 'aluno31@ironfit.com', '(11) 91000-0031', '2026-01-03', 'Ativo', 31);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 32', 'aluno32@ironfit.com', '(11) 91000-0032', '2026-01-04', 'Ativo', 32);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 33', 'aluno33@ironfit.com', '(11) 91000-0033', '2026-01-05', 'Ativo', 33);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 34', 'aluno34@ironfit.com', '(11) 91000-0034', '2026-01-06', 'Ativo', 34);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 35', 'aluno35@ironfit.com', '(11) 91000-0035', '2026-01-07', 'Ativo', 35);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 36', 'aluno36@ironfit.com', '(11) 91000-0036', '2026-01-08', 'Ativo', 36);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 37', 'aluno37@ironfit.com', '(11) 91000-0037', '2026-01-09', 'Ativo', 37);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 38', 'aluno38@ironfit.com', '(11) 91000-0038', '2026-01-10', 'Ativo', 38);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 39', 'aluno39@ironfit.com', '(11) 91000-0039', '2026-01-11', 'Ativo', 39);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 40', 'aluno40@ironfit.com', '(11) 91000-0040', '2026-01-12', 'Inativo', 40);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 41', 'aluno41@ironfit.com', '(11) 91000-0041', '2026-01-13', 'Ativo', 41);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 42', 'aluno42@ironfit.com', '(11) 91000-0042', '2026-01-14', 'Ativo', 42);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 43', 'aluno43@ironfit.com', '(11) 91000-0043', '2026-01-15', 'Ativo', 43);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 44', 'aluno44@ironfit.com', '(11) 91000-0044', '2026-01-16', 'Ativo', 44);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 45', 'aluno45@ironfit.com', '(11) 91000-0045', '2026-01-17', 'Ativo', 45);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 46', 'aluno46@ironfit.com', '(11) 91000-0046', '2026-01-18', 'Ativo', 46);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 47', 'aluno47@ironfit.com', '(11) 91000-0047', '2026-01-19', 'Ativo', 47);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 48', 'aluno48@ironfit.com', '(11) 91000-0048', '2026-01-20', 'Ativo', 48);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 49', 'aluno49@ironfit.com', '(11) 91000-0049', '2026-01-21', 'Ativo', 49);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 50', 'aluno50@ironfit.com', '(11) 91000-0050', '2026-01-22', 'Inativo', 50);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 51', 'aluno51@ironfit.com', '(11) 91000-0051', '2026-01-23', 'Ativo', 51);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 52', 'aluno52@ironfit.com', '(11) 91000-0052', '2026-01-24', 'Ativo', 52);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 53', 'aluno53@ironfit.com', '(11) 91000-0053', '2026-01-25', 'Ativo', 53);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 54', 'aluno54@ironfit.com', '(11) 91000-0054', '2026-01-26', 'Ativo', 54);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 55', 'aluno55@ironfit.com', '(11) 91000-0055', '2026-01-27', 'Ativo', 55);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 56', 'aluno56@ironfit.com', '(11) 91000-0056', '2026-01-28', 'Ativo', 56);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 57', 'aluno57@ironfit.com', '(11) 91000-0057', '2026-01-01', 'Ativo', 57);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 58', 'aluno58@ironfit.com', '(11) 91000-0058', '2026-01-02', 'Ativo', 58);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 59', 'aluno59@ironfit.com', '(11) 91000-0059', '2026-01-03', 'Ativo', 59);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 60', 'aluno60@ironfit.com', '(11) 91000-0060', '2026-01-04', 'Inativo', 60);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 61', 'aluno61@ironfit.com', '(11) 91000-0061', '2026-01-05', 'Ativo', 61);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 62', 'aluno62@ironfit.com', '(11) 91000-0062', '2026-01-06', 'Ativo', 62);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 63', 'aluno63@ironfit.com', '(11) 91000-0063', '2026-01-07', 'Ativo', 63);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 64', 'aluno64@ironfit.com', '(11) 91000-0064', '2026-01-08', 'Ativo', 64);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 65', 'aluno65@ironfit.com', '(11) 91000-0065', '2026-01-09', 'Ativo', 65);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 66', 'aluno66@ironfit.com', '(11) 91000-0066', '2026-01-10', 'Ativo', 66);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 67', 'aluno67@ironfit.com', '(11) 91000-0067', '2026-01-11', 'Ativo', 67);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 68', 'aluno68@ironfit.com', '(11) 91000-0068', '2026-01-12', 'Ativo', 68);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 69', 'aluno69@ironfit.com', '(11) 91000-0069', '2026-01-13', 'Ativo', 69);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 70', 'aluno70@ironfit.com', '(11) 91000-0070', '2026-01-14', 'Inativo', 70);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 71', 'aluno71@ironfit.com', '(11) 91000-0071', '2026-01-15', 'Ativo', 71);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 72', 'aluno72@ironfit.com', '(11) 91000-0072', '2026-01-16', 'Ativo', 72);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 73', 'aluno73@ironfit.com', '(11) 91000-0073', '2026-01-17', 'Ativo', 73);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 74', 'aluno74@ironfit.com', '(11) 91000-0074', '2026-01-18', 'Ativo', 74);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 75', 'aluno75@ironfit.com', '(11) 91000-0075', '2026-01-19', 'Ativo', 75);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 76', 'aluno76@ironfit.com', '(11) 91000-0076', '2026-01-20', 'Ativo', 76);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 77', 'aluno77@ironfit.com', '(11) 91000-0077', '2026-01-21', 'Ativo', 77);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 78', 'aluno78@ironfit.com', '(11) 91000-0078', '2026-01-22', 'Ativo', 78);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 79', 'aluno79@ironfit.com', '(11) 91000-0079', '2026-01-23', 'Ativo', 79);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 80', 'aluno80@ironfit.com', '(11) 91000-0080', '2026-01-24', 'Inativo', 80);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 81', 'aluno81@ironfit.com', '(11) 91000-0081', '2026-01-25', 'Ativo', 81);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 82', 'aluno82@ironfit.com', '(11) 91000-0082', '2026-01-26', 'Ativo', 82);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 83', 'aluno83@ironfit.com', '(11) 91000-0083', '2026-01-27', 'Ativo', 83);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 84', 'aluno84@ironfit.com', '(11) 91000-0084', '2026-01-28', 'Ativo', 84);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 85', 'aluno85@ironfit.com', '(11) 91000-0085', '2026-01-01', 'Ativo', 85);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 86', 'aluno86@ironfit.com', '(11) 91000-0086', '2026-01-02', 'Ativo', 86);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 87', 'aluno87@ironfit.com', '(11) 91000-0087', '2026-01-03', 'Ativo', 87);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 88', 'aluno88@ironfit.com', '(11) 91000-0088', '2026-01-04', 'Ativo', 88);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 89', 'aluno89@ironfit.com', '(11) 91000-0089', '2026-01-05', 'Ativo', 89);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 90', 'aluno90@ironfit.com', '(11) 91000-0090', '2026-01-06', 'Inativo', 90);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 91', 'aluno91@ironfit.com', '(11) 91000-0091', '2026-01-07', 'Ativo', 91);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 92', 'aluno92@ironfit.com', '(11) 91000-0092', '2026-01-08', 'Ativo', 92);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 93', 'aluno93@ironfit.com', '(11) 91000-0093', '2026-01-09', 'Ativo', 93);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 94', 'aluno94@ironfit.com', '(11) 91000-0094', '2026-01-10', 'Ativo', 94);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 95', 'aluno95@ironfit.com', '(11) 91000-0095', '2026-01-11', 'Ativo', 95);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 96', 'aluno96@ironfit.com', '(11) 91000-0096', '2026-01-12', 'Ativo', 96);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 97', 'aluno97@ironfit.com', '(11) 91000-0097', '2026-01-13', 'Ativo', 97);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 98', 'aluno98@ironfit.com', '(11) 91000-0098', '2026-01-14', 'Ativo', 98);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 99', 'aluno99@ironfit.com', '(11) 91000-0099', '2026-01-15', 'Ativo', 99);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 100', 'aluno100@ironfit.com', '(11) 91000-0100', '2026-01-16', 'Inativo', 100);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 101', 'aluno101@ironfit.com', '(11) 91000-0101', '2026-01-17', 'Ativo', 101);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 102', 'aluno102@ironfit.com', '(11) 91000-0102', '2026-01-18', 'Ativo', 102);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 103', 'aluno103@ironfit.com', '(11) 91000-0103', '2026-01-19', 'Ativo', 103);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 104', 'aluno104@ironfit.com', '(11) 91000-0104', '2026-01-20', 'Ativo', 104);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 105', 'aluno105@ironfit.com', '(11) 91000-0105', '2026-01-21', 'Ativo', 105);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 106', 'aluno106@ironfit.com', '(11) 91000-0106', '2026-01-22', 'Ativo', 106);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 107', 'aluno107@ironfit.com', '(11) 91000-0107', '2026-01-23', 'Ativo', 107);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 108', 'aluno108@ironfit.com', '(11) 91000-0108', '2026-01-24', 'Ativo', 108);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 109', 'aluno109@ironfit.com', '(11) 91000-0109', '2026-01-25', 'Ativo', 109);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 110', 'aluno110@ironfit.com', '(11) 91000-0110', '2026-01-26', 'Inativo', 110);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 111', 'aluno111@ironfit.com', '(11) 91000-0111', '2026-01-27', 'Ativo', 111);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 112', 'aluno112@ironfit.com', '(11) 91000-0112', '2026-01-28', 'Ativo', 112);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 113', 'aluno113@ironfit.com', '(11) 91000-0113', '2026-01-01', 'Ativo', 113);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 114', 'aluno114@ironfit.com', '(11) 91000-0114', '2026-01-02', 'Ativo', 114);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 115', 'aluno115@ironfit.com', '(11) 91000-0115', '2026-01-03', 'Ativo', 115);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 116', 'aluno116@ironfit.com', '(11) 91000-0116', '2026-01-04', 'Ativo', 116);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 117', 'aluno117@ironfit.com', '(11) 91000-0117', '2026-01-05', 'Ativo', 117);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 118', 'aluno118@ironfit.com', '(11) 91000-0118', '2026-01-06', 'Ativo', 118);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 119', 'aluno119@ironfit.com', '(11) 91000-0119', '2026-01-07', 'Ativo', 119);
INSERT INTO MEMBER (MemberName, Email, phone, RegistrationDate, MEMBERSTATUS, GYMID) VALUES ('Aluno 120', 'aluno120@ironfit.com', '(11) 91000-0120', '2026-01-08', 'Inativo', 120);

INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (1, 1, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (2, 2, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (3, 3, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (4, 4, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (5, 5, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (6, 6, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (7, 7, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (8, 8, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (9, 9, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (10, 10, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (11, 11, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (12, 12, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (13, 13, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (14, 14, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (15, 15, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (16, 16, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (17, 17, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (18, 18, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (19, 19, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (20, 20, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (21, 21, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (22, 22, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (23, 23, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (24, 24, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (25, 25, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (26, 26, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (27, 27, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (28, 28, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (29, 29, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (30, 30, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (31, 31, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (32, 32, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (33, 33, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (34, 34, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (35, 35, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (36, 36, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (37, 37, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (38, 38, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (39, 39, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (40, 40, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (41, 41, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (42, 42, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (43, 43, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (44, 44, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (45, 45, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (46, 46, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (47, 47, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (48, 48, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (49, 49, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (50, 50, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (51, 51, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (52, 52, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (53, 53, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (54, 54, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (55, 55, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (56, 56, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (57, 57, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (58, 58, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (59, 59, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (60, 60, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (61, 61, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (62, 62, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (63, 63, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (64, 64, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (65, 65, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (66, 66, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (67, 67, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (68, 68, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (69, 69, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (70, 70, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (71, 71, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (72, 72, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (73, 73, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (74, 74, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (75, 75, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (76, 76, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (77, 77, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (78, 78, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (79, 79, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (80, 80, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (81, 81, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (82, 82, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (83, 83, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (84, 84, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (85, 85, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (86, 86, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (87, 87, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (88, 88, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (89, 89, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (90, 90, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (91, 91, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (92, 92, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (93, 93, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (94, 94, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (95, 95, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (96, 96, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (97, 97, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (98, 98, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (99, 99, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (100, 100, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (101, 101, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (102, 102, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (103, 103, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (104, 104, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (105, 105, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (106, 106, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (107, 107, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (108, 108, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (109, 109, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (110, 110, '2026-01-01', '2026-12-31', 'Cancelada', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (111, 111, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (112, 112, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (113, 113, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (114, 114, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (115, 115, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (116, 116, '2026-01-01', '2026-12-31', 'Ativa', '199.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (117, 117, '2026-01-01', '2026-12-31', 'Ativa', '99.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (118, 118, '2026-01-01', '2026-12-31', 'Ativa', '149.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (119, 119, '2026-01-01', '2026-12-31', 'Ativa', '179.90');
INSERT INTO Subscription (MemberID, SubscriptionPlanID, StartDate, ENDDATE, SubscriptionStatus, ChargerdAmount) VALUES (120, 120, '2026-01-01', '2026-12-31', 'Cancelada', '199.90');

INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (1, 1, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (2, 2, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (3, 3, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (4, 4, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (5, 5, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (6, 6, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (7, 7, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (8, 8, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (9, 9, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (10, 10, '2026-08-05 16:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (11, 11, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (12, 12, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (13, 13, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (14, 14, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (15, 15, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (16, 16, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (17, 17, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (18, 18, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (19, 19, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (20, 20, '2026-08-05 14:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (21, 21, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (22, 22, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (23, 23, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (24, 24, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (25, 25, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (26, 26, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (27, 27, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (28, 28, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (29, 29, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (30, 30, '2026-08-05 12:00:00', 'Cancelada', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (31, 31, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (32, 32, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (33, 33, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (34, 34, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (35, 35, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (36, 36, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (37, 37, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (38, 38, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (39, 39, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (40, 40, '2026-08-05 10:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (41, 41, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (42, 42, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (43, 43, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (44, 44, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (45, 45, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (46, 46, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (47, 47, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (48, 48, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (49, 49, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (50, 50, '2026-08-05 08:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (51, 51, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (52, 52, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (53, 53, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (54, 54, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (55, 55, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (56, 56, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (57, 57, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (58, 58, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (59, 59, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (60, 60, '2026-08-05 18:00:00', 'Cancelada', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (61, 61, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (62, 62, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (63, 63, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (64, 64, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (65, 65, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (66, 66, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (67, 67, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (68, 68, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (69, 69, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (70, 70, '2026-08-05 16:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (71, 71, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (72, 72, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (73, 73, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (74, 74, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (75, 75, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (76, 76, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (77, 77, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (78, 78, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (79, 79, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (80, 80, '2026-08-05 14:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (81, 81, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (82, 82, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (83, 83, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (84, 84, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (85, 85, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (86, 86, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (87, 87, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (88, 88, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (89, 89, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (90, 90, '2026-08-05 12:00:00', 'Cancelada', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (91, 91, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (92, 92, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (93, 93, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (94, 94, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (95, 95, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (96, 96, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (97, 97, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (98, 98, '2026-08-05 08:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (99, 99, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (100, 100, '2026-08-05 10:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (101, 101, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (102, 102, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (103, 103, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (104, 104, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (105, 105, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (106, 106, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (107, 107, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (108, 108, '2026-08-05 18:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (109, 109, '2026-08-05 07:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (110, 110, '2026-08-05 08:00:00', 'Cancelada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (111, 111, '2026-08-05 09:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (112, 112, '2026-08-05 10:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (113, 113, '2026-08-05 11:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (114, 114, '2026-08-05 12:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (115, 115, '2026-08-05 13:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (116, 116, '2026-08-05 14:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (117, 117, '2026-08-05 15:00:00', 'Concluida', TRUE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (118, 118, '2026-08-05 16:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (119, 119, '2026-08-05 17:00:00', 'Confirmada', FALSE);
INSERT INTO CLASSSBOOKING (ClassID, MemberID, BookingDate, STATUS, ATTENDANCE) VALUES (120, 120, '2026-08-05 18:00:00', 'Cancelada', TRUE);

INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (1, 'Personal Trainer 1', 'personal1@ironfit.com', '(11) 92000-0001', 'Musculação', 'CREF-000001');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (2, 'Personal Trainer 2', 'personal2@ironfit.com', '(11) 92000-0002', 'Crossfit', 'CREF-000002');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (3, 'Personal Trainer 3', 'personal3@ironfit.com', '(11) 92000-0003', 'Funcional', 'CREF-000003');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (4, 'Personal Trainer 4', 'personal4@ironfit.com', '(11) 92000-0004', 'Hipertrofia', 'CREF-000004');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (5, 'Personal Trainer 5', 'personal5@ironfit.com', '(11) 92000-0005', 'Musculação', 'CREF-000005');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (6, 'Personal Trainer 6', 'personal6@ironfit.com', '(11) 92000-0006', 'Crossfit', 'CREF-000006');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (7, 'Personal Trainer 7', 'personal7@ironfit.com', '(11) 92000-0007', 'Funcional', 'CREF-000007');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (8, 'Personal Trainer 8', 'personal8@ironfit.com', '(11) 92000-0008', 'Hipertrofia', 'CREF-000008');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (9, 'Personal Trainer 9', 'personal9@ironfit.com', '(11) 92000-0009', 'Musculação', 'CREF-000009');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (10, 'Personal Trainer 10', 'personal10@ironfit.com', '(11) 92000-0010', 'Crossfit', 'CREF-000010');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (11, 'Personal Trainer 11', 'personal11@ironfit.com', '(11) 92000-0011', 'Funcional', 'CREF-000011');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (12, 'Personal Trainer 12', 'personal12@ironfit.com', '(11) 92000-0012', 'Hipertrofia', 'CREF-000012');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (13, 'Personal Trainer 13', 'personal13@ironfit.com', '(11) 92000-0013', 'Musculação', 'CREF-000013');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (14, 'Personal Trainer 14', 'personal14@ironfit.com', '(11) 92000-0014', 'Crossfit', 'CREF-000014');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (15, 'Personal Trainer 15', 'personal15@ironfit.com', '(11) 92000-0015', 'Funcional', 'CREF-000015');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (16, 'Personal Trainer 16', 'personal16@ironfit.com', '(11) 92000-0016', 'Hipertrofia', 'CREF-000016');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (17, 'Personal Trainer 17', 'personal17@ironfit.com', '(11) 92000-0017', 'Musculação', 'CREF-000017');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (18, 'Personal Trainer 18', 'personal18@ironfit.com', '(11) 92000-0018', 'Crossfit', 'CREF-000018');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (19, 'Personal Trainer 19', 'personal19@ironfit.com', '(11) 92000-0019', 'Funcional', 'CREF-000019');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (20, 'Personal Trainer 20', 'personal20@ironfit.com', '(11) 92000-0020', 'Hipertrofia', 'CREF-000020');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (21, 'Personal Trainer 21', 'personal21@ironfit.com', '(11) 92000-0021', 'Musculação', 'CREF-000021');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (22, 'Personal Trainer 22', 'personal22@ironfit.com', '(11) 92000-0022', 'Crossfit', 'CREF-000022');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (23, 'Personal Trainer 23', 'personal23@ironfit.com', '(11) 92000-0023', 'Funcional', 'CREF-000023');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (24, 'Personal Trainer 24', 'personal24@ironfit.com', '(11) 92000-0024', 'Hipertrofia', 'CREF-000024');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (25, 'Personal Trainer 25', 'personal25@ironfit.com', '(11) 92000-0025', 'Musculação', 'CREF-000025');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (26, 'Personal Trainer 26', 'personal26@ironfit.com', '(11) 92000-0026', 'Crossfit', 'CREF-000026');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (27, 'Personal Trainer 27', 'personal27@ironfit.com', '(11) 92000-0027', 'Funcional', 'CREF-000027');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (28, 'Personal Trainer 28', 'personal28@ironfit.com', '(11) 92000-0028', 'Hipertrofia', 'CREF-000028');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (29, 'Personal Trainer 29', 'personal29@ironfit.com', '(11) 92000-0029', 'Musculação', 'CREF-000029');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (30, 'Personal Trainer 30', 'personal30@ironfit.com', '(11) 92000-0030', 'Crossfit', 'CREF-000030');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (31, 'Personal Trainer 31', 'personal31@ironfit.com', '(11) 92000-0031', 'Funcional', 'CREF-000031');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (32, 'Personal Trainer 32', 'personal32@ironfit.com', '(11) 92000-0032', 'Hipertrofia', 'CREF-000032');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (33, 'Personal Trainer 33', 'personal33@ironfit.com', '(11) 92000-0033', 'Musculação', 'CREF-000033');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (34, 'Personal Trainer 34', 'personal34@ironfit.com', '(11) 92000-0034', 'Crossfit', 'CREF-000034');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (35, 'Personal Trainer 35', 'personal35@ironfit.com', '(11) 92000-0035', 'Funcional', 'CREF-000035');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (36, 'Personal Trainer 36', 'personal36@ironfit.com', '(11) 92000-0036', 'Hipertrofia', 'CREF-000036');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (37, 'Personal Trainer 37', 'personal37@ironfit.com', '(11) 92000-0037', 'Musculação', 'CREF-000037');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (38, 'Personal Trainer 38', 'personal38@ironfit.com', '(11) 92000-0038', 'Crossfit', 'CREF-000038');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (39, 'Personal Trainer 39', 'personal39@ironfit.com', '(11) 92000-0039', 'Funcional', 'CREF-000039');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (40, 'Personal Trainer 40', 'personal40@ironfit.com', '(11) 92000-0040', 'Hipertrofia', 'CREF-000040');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (41, 'Personal Trainer 41', 'personal41@ironfit.com', '(11) 92000-0041', 'Musculação', 'CREF-000041');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (42, 'Personal Trainer 42', 'personal42@ironfit.com', '(11) 92000-0042', 'Crossfit', 'CREF-000042');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (43, 'Personal Trainer 43', 'personal43@ironfit.com', '(11) 92000-0043', 'Funcional', 'CREF-000043');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (44, 'Personal Trainer 44', 'personal44@ironfit.com', '(11) 92000-0044', 'Hipertrofia', 'CREF-000044');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (45, 'Personal Trainer 45', 'personal45@ironfit.com', '(11) 92000-0045', 'Musculação', 'CREF-000045');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (46, 'Personal Trainer 46', 'personal46@ironfit.com', '(11) 92000-0046', 'Crossfit', 'CREF-000046');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (47, 'Personal Trainer 47', 'personal47@ironfit.com', '(11) 92000-0047', 'Funcional', 'CREF-000047');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (48, 'Personal Trainer 48', 'personal48@ironfit.com', '(11) 92000-0048', 'Hipertrofia', 'CREF-000048');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (49, 'Personal Trainer 49', 'personal49@ironfit.com', '(11) 92000-0049', 'Musculação', 'CREF-000049');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (50, 'Personal Trainer 50', 'personal50@ironfit.com', '(11) 92000-0050', 'Crossfit', 'CREF-000050');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (51, 'Personal Trainer 51', 'personal51@ironfit.com', '(11) 92000-0051', 'Funcional', 'CREF-000051');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (52, 'Personal Trainer 52', 'personal52@ironfit.com', '(11) 92000-0052', 'Hipertrofia', 'CREF-000052');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (53, 'Personal Trainer 53', 'personal53@ironfit.com', '(11) 92000-0053', 'Musculação', 'CREF-000053');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (54, 'Personal Trainer 54', 'personal54@ironfit.com', '(11) 92000-0054', 'Crossfit', 'CREF-000054');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (55, 'Personal Trainer 55', 'personal55@ironfit.com', '(11) 92000-0055', 'Funcional', 'CREF-000055');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (56, 'Personal Trainer 56', 'personal56@ironfit.com', '(11) 92000-0056', 'Hipertrofia', 'CREF-000056');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (57, 'Personal Trainer 57', 'personal57@ironfit.com', '(11) 92000-0057', 'Musculação', 'CREF-000057');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (58, 'Personal Trainer 58', 'personal58@ironfit.com', '(11) 92000-0058', 'Crossfit', 'CREF-000058');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (59, 'Personal Trainer 59', 'personal59@ironfit.com', '(11) 92000-0059', 'Funcional', 'CREF-000059');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (60, 'Personal Trainer 60', 'personal60@ironfit.com', '(11) 92000-0060', 'Hipertrofia', 'CREF-000060');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (61, 'Personal Trainer 61', 'personal61@ironfit.com', '(11) 92000-0061', 'Musculação', 'CREF-000061');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (62, 'Personal Trainer 62', 'personal62@ironfit.com', '(11) 92000-0062', 'Crossfit', 'CREF-000062');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (63, 'Personal Trainer 63', 'personal63@ironfit.com', '(11) 92000-0063', 'Funcional', 'CREF-000063');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (64, 'Personal Trainer 64', 'personal64@ironfit.com', '(11) 92000-0064', 'Hipertrofia', 'CREF-000064');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (65, 'Personal Trainer 65', 'personal65@ironfit.com', '(11) 92000-0065', 'Musculação', 'CREF-000065');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (66, 'Personal Trainer 66', 'personal66@ironfit.com', '(11) 92000-0066', 'Crossfit', 'CREF-000066');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (67, 'Personal Trainer 67', 'personal67@ironfit.com', '(11) 92000-0067', 'Funcional', 'CREF-000067');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (68, 'Personal Trainer 68', 'personal68@ironfit.com', '(11) 92000-0068', 'Hipertrofia', 'CREF-000068');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (69, 'Personal Trainer 69', 'personal69@ironfit.com', '(11) 92000-0069', 'Musculação', 'CREF-000069');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (70, 'Personal Trainer 70', 'personal70@ironfit.com', '(11) 92000-0070', 'Crossfit', 'CREF-000070');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (71, 'Personal Trainer 71', 'personal71@ironfit.com', '(11) 92000-0071', 'Funcional', 'CREF-000071');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (72, 'Personal Trainer 72', 'personal72@ironfit.com', '(11) 92000-0072', 'Hipertrofia', 'CREF-000072');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (73, 'Personal Trainer 73', 'personal73@ironfit.com', '(11) 92000-0073', 'Musculação', 'CREF-000073');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (74, 'Personal Trainer 74', 'personal74@ironfit.com', '(11) 92000-0074', 'Crossfit', 'CREF-000074');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (75, 'Personal Trainer 75', 'personal75@ironfit.com', '(11) 92000-0075', 'Funcional', 'CREF-000075');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (76, 'Personal Trainer 76', 'personal76@ironfit.com', '(11) 92000-0076', 'Hipertrofia', 'CREF-000076');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (77, 'Personal Trainer 77', 'personal77@ironfit.com', '(11) 92000-0077', 'Musculação', 'CREF-000077');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (78, 'Personal Trainer 78', 'personal78@ironfit.com', '(11) 92000-0078', 'Crossfit', 'CREF-000078');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (79, 'Personal Trainer 79', 'personal79@ironfit.com', '(11) 92000-0079', 'Funcional', 'CREF-000079');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (80, 'Personal Trainer 80', 'personal80@ironfit.com', '(11) 92000-0080', 'Hipertrofia', 'CREF-000080');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (81, 'Personal Trainer 81', 'personal81@ironfit.com', '(11) 92000-0081', 'Musculação', 'CREF-000081');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (82, 'Personal Trainer 82', 'personal82@ironfit.com', '(11) 92000-0082', 'Crossfit', 'CREF-000082');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (83, 'Personal Trainer 83', 'personal83@ironfit.com', '(11) 92000-0083', 'Funcional', 'CREF-000083');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (84, 'Personal Trainer 84', 'personal84@ironfit.com', '(11) 92000-0084', 'Hipertrofia', 'CREF-000084');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (85, 'Personal Trainer 85', 'personal85@ironfit.com', '(11) 92000-0085', 'Musculação', 'CREF-000085');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (86, 'Personal Trainer 86', 'personal86@ironfit.com', '(11) 92000-0086', 'Crossfit', 'CREF-000086');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (87, 'Personal Trainer 87', 'personal87@ironfit.com', '(11) 92000-0087', 'Funcional', 'CREF-000087');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (88, 'Personal Trainer 88', 'personal88@ironfit.com', '(11) 92000-0088', 'Hipertrofia', 'CREF-000088');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (89, 'Personal Trainer 89', 'personal89@ironfit.com', '(11) 92000-0089', 'Musculação', 'CREF-000089');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (90, 'Personal Trainer 90', 'personal90@ironfit.com', '(11) 92000-0090', 'Crossfit', 'CREF-000090');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (91, 'Personal Trainer 91', 'personal91@ironfit.com', '(11) 92000-0091', 'Funcional', 'CREF-000091');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (92, 'Personal Trainer 92', 'personal92@ironfit.com', '(11) 92000-0092', 'Hipertrofia', 'CREF-000092');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (93, 'Personal Trainer 93', 'personal93@ironfit.com', '(11) 92000-0093', 'Musculação', 'CREF-000093');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (94, 'Personal Trainer 94', 'personal94@ironfit.com', '(11) 92000-0094', 'Crossfit', 'CREF-000094');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (95, 'Personal Trainer 95', 'personal95@ironfit.com', '(11) 92000-0095', 'Funcional', 'CREF-000095');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (96, 'Personal Trainer 96', 'personal96@ironfit.com', '(11) 92000-0096', 'Hipertrofia', 'CREF-000096');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (97, 'Personal Trainer 97', 'personal97@ironfit.com', '(11) 92000-0097', 'Musculação', 'CREF-000097');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (98, 'Personal Trainer 98', 'personal98@ironfit.com', '(11) 92000-0098', 'Crossfit', 'CREF-000098');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (99, 'Personal Trainer 99', 'personal99@ironfit.com', '(11) 92000-0099', 'Funcional', 'CREF-000099');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (100, 'Personal Trainer 100', 'personal100@ironfit.com', '(11) 92000-0100', 'Hipertrofia', 'CREF-000100');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (101, 'Personal Trainer 101', 'personal101@ironfit.com', '(11) 92000-0101', 'Musculação', 'CREF-000101');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (102, 'Personal Trainer 102', 'personal102@ironfit.com', '(11) 92000-0102', 'Crossfit', 'CREF-000102');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (103, 'Personal Trainer 103', 'personal103@ironfit.com', '(11) 92000-0103', 'Funcional', 'CREF-000103');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (104, 'Personal Trainer 104', 'personal104@ironfit.com', '(11) 92000-0104', 'Hipertrofia', 'CREF-000104');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (105, 'Personal Trainer 105', 'personal105@ironfit.com', '(11) 92000-0105', 'Musculação', 'CREF-000105');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (106, 'Personal Trainer 106', 'personal106@ironfit.com', '(11) 92000-0106', 'Crossfit', 'CREF-000106');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (107, 'Personal Trainer 107', 'personal107@ironfit.com', '(11) 92000-0107', 'Funcional', 'CREF-000107');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (108, 'Personal Trainer 108', 'personal108@ironfit.com', '(11) 92000-0108', 'Hipertrofia', 'CREF-000108');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (109, 'Personal Trainer 109', 'personal109@ironfit.com', '(11) 92000-0109', 'Musculação', 'CREF-000109');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (110, 'Personal Trainer 110', 'personal110@ironfit.com', '(11) 92000-0110', 'Crossfit', 'CREF-000110');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (111, 'Personal Trainer 111', 'personal111@ironfit.com', '(11) 92000-0111', 'Funcional', 'CREF-000111');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (112, 'Personal Trainer 112', 'personal112@ironfit.com', '(11) 92000-0112', 'Hipertrofia', 'CREF-000112');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (113, 'Personal Trainer 113', 'personal113@ironfit.com', '(11) 92000-0113', 'Musculação', 'CREF-000113');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (114, 'Personal Trainer 114', 'personal114@ironfit.com', '(11) 92000-0114', 'Crossfit', 'CREF-000114');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (115, 'Personal Trainer 115', 'personal115@ironfit.com', '(11) 92000-0115', 'Funcional', 'CREF-000115');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (116, 'Personal Trainer 116', 'personal116@ironfit.com', '(11) 92000-0116', 'Hipertrofia', 'CREF-000116');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (117, 'Personal Trainer 117', 'personal117@ironfit.com', '(11) 92000-0117', 'Musculação', 'CREF-000117');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (118, 'Personal Trainer 118', 'personal118@ironfit.com', '(11) 92000-0118', 'Crossfit', 'CREF-000118');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (119, 'Personal Trainer 119', 'personal119@ironfit.com', '(11) 92000-0119', 'Funcional', 'CREF-000119');
INSERT INTO PersonalTrainer (gymID, PersonalName, email, phone, specialty, Certifications) VALUES (120, 'Personal Trainer 120', 'personal120@ironfit.com', '(11) 92000-0120', 'Hipertrofia', 'CREF-000120');

INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (1, 1, '2026-02-01', 61.5, 161, 'Avaliação física do aluno 1');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (2, 2, '2026-02-02', 62.5, 162, 'Avaliação física do aluno 2');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (3, 3, '2026-02-03', 63.5, 163, 'Avaliação física do aluno 3');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (4, 4, '2026-02-04', 64.5, 164, 'Avaliação física do aluno 4');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (5, 5, '2026-02-05', 65.5, 165, 'Avaliação física do aluno 5');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (6, 6, '2026-02-06', 66.5, 166, 'Avaliação física do aluno 6');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (7, 7, '2026-02-07', 67.5, 167, 'Avaliação física do aluno 7');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (8, 8, '2026-02-08', 68.5, 168, 'Avaliação física do aluno 8');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (9, 9, '2026-02-09', 69.5, 169, 'Avaliação física do aluno 9');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (10, 10, '2026-02-10', 70.5, 170, 'Avaliação física do aluno 10');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (11, 11, '2026-02-11', 71.5, 171, 'Avaliação física do aluno 11');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (12, 12, '2026-02-12', 72.5, 172, 'Avaliação física do aluno 12');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (13, 13, '2026-02-13', 73.5, 173, 'Avaliação física do aluno 13');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (14, 14, '2026-02-14', 74.5, 174, 'Avaliação física do aluno 14');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (15, 15, '2026-02-15', 75.5, 175, 'Avaliação física do aluno 15');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (16, 16, '2026-02-16', 76.5, 176, 'Avaliação física do aluno 16');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (17, 17, '2026-02-17', 77.5, 177, 'Avaliação física do aluno 17');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (18, 18, '2026-02-18', 78.5, 178, 'Avaliação física do aluno 18');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (19, 19, '2026-02-19', 79.5, 179, 'Avaliação física do aluno 19');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (20, 20, '2026-02-20', 80.5, 180, 'Avaliação física do aluno 20');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (21, 21, '2026-02-21', 81.5, 181, 'Avaliação física do aluno 21');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (22, 22, '2026-02-22', 82.5, 182, 'Avaliação física do aluno 22');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (23, 23, '2026-02-23', 83.5, 183, 'Avaliação física do aluno 23');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (24, 24, '2026-02-24', 84.5, 184, 'Avaliação física do aluno 24');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (25, 25, '2026-02-25', 85.5, 185, 'Avaliação física do aluno 25');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (26, 26, '2026-02-26', 86.5, 186, 'Avaliação física do aluno 26');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (27, 27, '2026-02-27', 87.5, 187, 'Avaliação física do aluno 27');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (28, 28, '2026-02-28', 88.5, 188, 'Avaliação física do aluno 28');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (29, 29, '2026-02-01', 89.5, 189, 'Avaliação física do aluno 29');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (30, 30, '2026-02-02', 90.5, 190, 'Avaliação física do aluno 30');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (31, 31, '2026-02-03', 91.5, 191, 'Avaliação física do aluno 31');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (32, 32, '2026-02-04', 92.5, 192, 'Avaliação física do aluno 32');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (33, 33, '2026-02-05', 93.5, 193, 'Avaliação física do aluno 33');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (34, 34, '2026-02-06', 94.5, 194, 'Avaliação física do aluno 34');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (35, 35, '2026-02-07', 95.5, 160, 'Avaliação física do aluno 35');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (36, 36, '2026-02-08', 96.5, 161, 'Avaliação física do aluno 36');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (37, 37, '2026-02-09', 97.5, 162, 'Avaliação física do aluno 37');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (38, 38, '2026-02-10', 98.5, 163, 'Avaliação física do aluno 38');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (39, 39, '2026-02-11', 99.5, 164, 'Avaliação física do aluno 39');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (40, 40, '2026-02-12', 60.5, 165, 'Avaliação física do aluno 40');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (41, 41, '2026-02-13', 61.5, 166, 'Avaliação física do aluno 41');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (42, 42, '2026-02-14', 62.5, 167, 'Avaliação física do aluno 42');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (43, 43, '2026-02-15', 63.5, 168, 'Avaliação física do aluno 43');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (44, 44, '2026-02-16', 64.5, 169, 'Avaliação física do aluno 44');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (45, 45, '2026-02-17', 65.5, 170, 'Avaliação física do aluno 45');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (46, 46, '2026-02-18', 66.5, 171, 'Avaliação física do aluno 46');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (47, 47, '2026-02-19', 67.5, 172, 'Avaliação física do aluno 47');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (48, 48, '2026-02-20', 68.5, 173, 'Avaliação física do aluno 48');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (49, 49, '2026-02-21', 69.5, 174, 'Avaliação física do aluno 49');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (50, 50, '2026-02-22', 70.5, 175, 'Avaliação física do aluno 50');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (51, 51, '2026-02-23', 71.5, 176, 'Avaliação física do aluno 51');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (52, 52, '2026-02-24', 72.5, 177, 'Avaliação física do aluno 52');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (53, 53, '2026-02-25', 73.5, 178, 'Avaliação física do aluno 53');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (54, 54, '2026-02-26', 74.5, 179, 'Avaliação física do aluno 54');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (55, 55, '2026-02-27', 75.5, 180, 'Avaliação física do aluno 55');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (56, 56, '2026-02-28', 76.5, 181, 'Avaliação física do aluno 56');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (57, 57, '2026-02-01', 77.5, 182, 'Avaliação física do aluno 57');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (58, 58, '2026-02-02', 78.5, 183, 'Avaliação física do aluno 58');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (59, 59, '2026-02-03', 79.5, 184, 'Avaliação física do aluno 59');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (60, 60, '2026-02-04', 80.5, 185, 'Avaliação física do aluno 60');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (61, 61, '2026-02-05', 81.5, 186, 'Avaliação física do aluno 61');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (62, 62, '2026-02-06', 82.5, 187, 'Avaliação física do aluno 62');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (63, 63, '2026-02-07', 83.5, 188, 'Avaliação física do aluno 63');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (64, 64, '2026-02-08', 84.5, 189, 'Avaliação física do aluno 64');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (65, 65, '2026-02-09', 85.5, 190, 'Avaliação física do aluno 65');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (66, 66, '2026-02-10', 86.5, 191, 'Avaliação física do aluno 66');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (67, 67, '2026-02-11', 87.5, 192, 'Avaliação física do aluno 67');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (68, 68, '2026-02-12', 88.5, 193, 'Avaliação física do aluno 68');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (69, 69, '2026-02-13', 89.5, 194, 'Avaliação física do aluno 69');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (70, 70, '2026-02-14', 90.5, 160, 'Avaliação física do aluno 70');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (71, 71, '2026-02-15', 91.5, 161, 'Avaliação física do aluno 71');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (72, 72, '2026-02-16', 92.5, 162, 'Avaliação física do aluno 72');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (73, 73, '2026-02-17', 93.5, 163, 'Avaliação física do aluno 73');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (74, 74, '2026-02-18', 94.5, 164, 'Avaliação física do aluno 74');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (75, 75, '2026-02-19', 95.5, 165, 'Avaliação física do aluno 75');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (76, 76, '2026-02-20', 96.5, 166, 'Avaliação física do aluno 76');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (77, 77, '2026-02-21', 97.5, 167, 'Avaliação física do aluno 77');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (78, 78, '2026-02-22', 98.5, 168, 'Avaliação física do aluno 78');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (79, 79, '2026-02-23', 99.5, 169, 'Avaliação física do aluno 79');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (80, 80, '2026-02-24', 60.5, 170, 'Avaliação física do aluno 80');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (81, 81, '2026-02-25', 61.5, 171, 'Avaliação física do aluno 81');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (82, 82, '2026-02-26', 62.5, 172, 'Avaliação física do aluno 82');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (83, 83, '2026-02-27', 63.5, 173, 'Avaliação física do aluno 83');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (84, 84, '2026-02-28', 64.5, 174, 'Avaliação física do aluno 84');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (85, 85, '2026-02-01', 65.5, 175, 'Avaliação física do aluno 85');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (86, 86, '2026-02-02', 66.5, 176, 'Avaliação física do aluno 86');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (87, 87, '2026-02-03', 67.5, 177, 'Avaliação física do aluno 87');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (88, 88, '2026-02-04', 68.5, 178, 'Avaliação física do aluno 88');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (89, 89, '2026-02-05', 69.5, 179, 'Avaliação física do aluno 89');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (90, 90, '2026-02-06', 70.5, 180, 'Avaliação física do aluno 90');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (91, 91, '2026-02-07', 71.5, 181, 'Avaliação física do aluno 91');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (92, 92, '2026-02-08', 72.5, 182, 'Avaliação física do aluno 92');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (93, 93, '2026-02-09', 73.5, 183, 'Avaliação física do aluno 93');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (94, 94, '2026-02-10', 74.5, 184, 'Avaliação física do aluno 94');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (95, 95, '2026-02-11', 75.5, 185, 'Avaliação física do aluno 95');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (96, 96, '2026-02-12', 76.5, 186, 'Avaliação física do aluno 96');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (97, 97, '2026-02-13', 77.5, 187, 'Avaliação física do aluno 97');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (98, 98, '2026-02-14', 78.5, 188, 'Avaliação física do aluno 98');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (99, 99, '2026-02-15', 79.5, 189, 'Avaliação física do aluno 99');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (100, 100, '2026-02-16', 80.5, 190, 'Avaliação física do aluno 100');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (101, 101, '2026-02-17', 81.5, 191, 'Avaliação física do aluno 101');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (102, 102, '2026-02-18', 82.5, 192, 'Avaliação física do aluno 102');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (103, 103, '2026-02-19', 83.5, 193, 'Avaliação física do aluno 103');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (104, 104, '2026-02-20', 84.5, 194, 'Avaliação física do aluno 104');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (105, 105, '2026-02-21', 85.5, 160, 'Avaliação física do aluno 105');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (106, 106, '2026-02-22', 86.5, 161, 'Avaliação física do aluno 106');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (107, 107, '2026-02-23', 87.5, 162, 'Avaliação física do aluno 107');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (108, 108, '2026-02-24', 88.5, 163, 'Avaliação física do aluno 108');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (109, 109, '2026-02-25', 89.5, 164, 'Avaliação física do aluno 109');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (110, 110, '2026-02-26', 90.5, 165, 'Avaliação física do aluno 110');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (111, 111, '2026-02-27', 91.5, 166, 'Avaliação física do aluno 111');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (112, 112, '2026-02-28', 92.5, 167, 'Avaliação física do aluno 112');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (113, 113, '2026-02-01', 93.5, 168, 'Avaliação física do aluno 113');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (114, 114, '2026-02-02', 94.5, 169, 'Avaliação física do aluno 114');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (115, 115, '2026-02-03', 95.5, 170, 'Avaliação física do aluno 115');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (116, 116, '2026-02-04', 96.5, 171, 'Avaliação física do aluno 116');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (117, 117, '2026-02-05', 97.5, 172, 'Avaliação física do aluno 117');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (118, 118, '2026-02-06', 98.5, 173, 'Avaliação física do aluno 118');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (119, 119, '2026-02-07', 99.5, 174, 'Avaliação física do aluno 119');
INSERT INTO PhysicalAssesment (MemberID, Personaltrainerid, AssesmentDate, WeightKG, Heightcm, Notes) VALUES (120, 120, '2026-02-08', 60.5, 175, 'Avaliação física do aluno 120');

INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (1, 1, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (2, 2, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (3, 3, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (4, 4, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (5, 5, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (6, 6, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (7, 7, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (8, 8, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (9, 9, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (10, 10, '2026-08-10 16:00:00', '45 minutos', 'Cancelada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (11, 11, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (12, 12, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (13, 13, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (14, 14, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (15, 15, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (16, 16, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (17, 17, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (18, 18, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (19, 19, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (20, 20, '2026-08-10 14:00:00', '60 minutos', 'Cancelada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (21, 21, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (22, 22, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (23, 23, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (24, 24, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (25, 25, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (26, 26, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (27, 27, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (28, 28, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (29, 29, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (30, 30, '2026-08-10 12:00:00', '90 minutos', 'Cancelada', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (31, 31, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (32, 32, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (33, 33, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (34, 34, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (35, 35, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (36, 36, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (37, 37, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (38, 38, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (39, 39, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (40, 40, '2026-08-10 10:00:00', '45 minutos', 'Cancelada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (41, 41, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (42, 42, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (43, 43, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (44, 44, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (45, 45, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (46, 46, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (47, 47, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (48, 48, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (49, 49, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (50, 50, '2026-08-10 08:00:00', '60 minutos', 'Cancelada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (51, 51, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (52, 52, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (53, 53, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (54, 54, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (55, 55, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (56, 56, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (57, 57, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (58, 58, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (59, 59, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (60, 60, '2026-08-10 18:00:00', '90 minutos', 'Cancelada', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (61, 61, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (62, 62, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (63, 63, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (64, 64, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (65, 65, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (66, 66, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (67, 67, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (68, 68, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (69, 69, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (70, 70, '2026-08-10 16:00:00', '45 minutos', 'Cancelada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (71, 71, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (72, 72, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (73, 73, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (74, 74, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (75, 75, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (76, 76, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (77, 77, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (78, 78, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (79, 79, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (80, 80, '2026-08-10 14:00:00', '60 minutos', 'Cancelada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (81, 81, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (82, 82, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (83, 83, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (84, 84, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (85, 85, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (86, 86, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (87, 87, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (88, 88, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (89, 89, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (90, 90, '2026-08-10 12:00:00', '90 minutos', 'Cancelada', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (91, 91, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (92, 92, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (93, 93, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (94, 94, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (95, 95, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (96, 96, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (97, 97, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (98, 98, '2026-08-10 08:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (99, 99, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (100, 100, '2026-08-10 10:00:00', '45 minutos', 'Cancelada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (101, 101, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (102, 102, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (103, 103, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (104, 104, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (105, 105, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (106, 106, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (107, 107, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (108, 108, '2026-08-10 18:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (109, 109, '2026-08-10 07:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (110, 110, '2026-08-10 08:00:00', '60 minutos', 'Cancelada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (111, 111, '2026-08-10 09:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (112, 112, '2026-08-10 10:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (113, 113, '2026-08-10 11:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (114, 114, '2026-08-10 12:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (115, 115, '2026-08-10 13:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (116, 116, '2026-08-10 14:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (117, 117, '2026-08-10 15:00:00', '90 minutos', 'Concluída', 'Hipertrofia');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (118, 118, '2026-08-10 16:00:00', '45 minutos', 'Agendada', 'Musculação');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (119, 119, '2026-08-10 17:00:00', '60 minutos', 'Agendada', 'Funcional');
INSERT INTO SessionPT (PersonalTrainerID, MemberID, StartTime, Duration, Status, SessionType) VALUES (120, 120, '2026-08-10 18:00:00', '90 minutos', 'Cancelada', 'Hipertrofia');









USE ironfit;

ALTER TABLE GYM 
ADD COLUMN Openinghours VARCHAR (50);

ALTER TABLE SUBSCRIPTIONPLAN 
ADD COLUMN AnnualDiscount DECIMAL(5,2);

ALTER TABLE GROUPCLASS 
ADD COLUMN ROOM VARCHAR (50);

ALTER TABLE MEMBER 
ADD COLUMN BIRTHDATE DATE;

ALTER TABLE SUBSCRIPTION 
ADD COLUMN PaymentMethod VARCHAR (30);

ALTER TABLE classsbooking 
ADD COLUMN BOOKINGSTATUS VARCHAR (30); 

ALTER TABLE personaltrainer
ADD COLUMN HOURLYRATE DECIMAL (10,2);


ALTER TABLE physicalassesment 
ADD COLUMN BODYFAT DECIMAL (5,2);

ALTER TABLE sessionpt
ADD COLUMN PRICE DECIMAL (10,2);



USE IRONFIT;


-- =====================================================
-- 1. GYM - Openinghours
-- =====================================================

UPDATE GYM SET Openinghours = '06:00 - 22:00' WHERE GymID = 1;
UPDATE GYM SET Openinghours = '06:00 - 23:00' WHERE GymID = 2;
UPDATE GYM SET Openinghours = '05:30 - 22:00' WHERE GymID = 3;
UPDATE GYM SET Openinghours = '07:00 - 21:00' WHERE GymID = 4;
UPDATE GYM SET Openinghours = '06:00 - 22:30' WHERE GymID = 5;
UPDATE GYM SET Openinghours = '05:00 - 23:00' WHERE GymID = 6;
UPDATE GYM SET Openinghours = '06:30 - 22:00' WHERE GymID = 7;
UPDATE GYM SET Openinghours = '06:00 - 21:30' WHERE GymID = 8;
UPDATE GYM SET Openinghours = '05:30 - 22:30' WHERE GymID = 9;
UPDATE GYM SET Openinghours = '07:00 - 23:00' WHERE GymID = 10;


-- =====================================================
-- 2. SUBSCRIPTIONPLAN - AnnualDiscount
-- =====================================================

UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 5.00 WHERE SusbscriptionPlanID = 1;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 10.00 WHERE SusbscriptionPlanID = 2;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 15.00 WHERE SusbscriptionPlanID = 3;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 8.00 WHERE SusbscriptionPlanID = 4;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 12.00 WHERE SusbscriptionPlanID = 5;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 20.00 WHERE SusbscriptionPlanID = 6;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 7.00 WHERE SusbscriptionPlanID = 7;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 10.00 WHERE SusbscriptionPlanID = 8;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 18.00 WHERE SusbscriptionPlanID = 9;
UPDATE SUBSCRIPTIONPLAN SET AnnualDiscount = 25.00 WHERE SusbscriptionPlanID = 10;


-- =====================================================
-- 3. GROUPCLASS - ROOM
-- =====================================================

UPDATE GROUPCLASS SET ROOM = 'Sala 1' WHERE ClassID = 1;
UPDATE GROUPCLASS SET ROOM = 'Sala 2' WHERE ClassID = 2;
UPDATE GROUPCLASS SET ROOM = 'Sala 3' WHERE ClassID = 3;
UPDATE GROUPCLASS SET ROOM = 'Sala 4' WHERE ClassID = 4;
UPDATE GROUPCLASS SET ROOM = 'Sala 5' WHERE ClassID = 5;
UPDATE GROUPCLASS SET ROOM = 'Sala 6' WHERE ClassID = 6;
UPDATE GROUPCLASS SET ROOM = 'Sala 7' WHERE ClassID = 7;
UPDATE GROUPCLASS SET ROOM = 'Sala 8' WHERE ClassID = 8;
UPDATE GROUPCLASS SET ROOM = 'Sala 9' WHERE ClassID = 9;
UPDATE GROUPCLASS SET ROOM = 'Sala 10' WHERE ClassID = 10;


-- =====================================================
-- 4. MEMBER - BIRTHDATE
-- =====================================================

UPDATE MEMBER SET BIRTHDATE = '2000-05-10' WHERE MemberID = 1;
UPDATE MEMBER SET BIRTHDATE = '1998-08-22' WHERE MemberID = 2;
UPDATE MEMBER SET BIRTHDATE = '2002-03-15' WHERE MemberID = 3;
UPDATE MEMBER SET BIRTHDATE = '1995-11-30' WHERE MemberID = 4;
UPDATE MEMBER SET BIRTHDATE = '2001-07-08' WHERE MemberID = 5;
UPDATE MEMBER SET BIRTHDATE = '1997-01-25' WHERE MemberID = 6;
UPDATE MEMBER SET BIRTHDATE = '2003-09-12' WHERE MemberID = 7;
UPDATE MEMBER SET BIRTHDATE = '1999-04-18' WHERE MemberID = 8;
UPDATE MEMBER SET BIRTHDATE = '1994-12-05' WHERE MemberID = 9;
UPDATE MEMBER SET BIRTHDATE = '2000-06-27' WHERE MemberID = 10;


-- =====================================================
-- 5. SUBSCRIPTION - PaymentMethod
-- =====================================================

UPDATE SUBSCRIPTION SET PaymentMethod = 'Pix' WHERE SubscriptionID = 1;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Cartão' WHERE SubscriptionID = 2;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Dinheiro' WHERE SubscriptionID = 3;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Pix' WHERE SubscriptionID = 4;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Cartão' WHERE SubscriptionID = 5;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Boleto' WHERE SubscriptionID = 6;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Pix' WHERE SubscriptionID = 7;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Cartão' WHERE SubscriptionID = 8;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Dinheiro' WHERE SubscriptionID = 9;
UPDATE SUBSCRIPTION SET PaymentMethod = 'Pix' WHERE SubscriptionID = 10;


-- =====================================================
-- 6. CLASSSBOOKING - BOOKINGSTATUS
-- =====================================================

UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Confirmada' WHERE BookingID = 1;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Pendente' WHERE BookingID = 2;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Confirmada' WHERE BookingID = 3;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Cancelada' WHERE BookingID = 4;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Confirmada' WHERE BookingID = 5;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Pendente' WHERE BookingID = 6;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Confirmada' WHERE BookingID = 7;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Cancelada' WHERE BookingID = 8;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Confirmada' WHERE BookingID = 9;
UPDATE CLASSSBOOKING SET BOOKINGSTATUS = 'Pendente' WHERE BookingID = 10;


-- =====================================================
-- 7. PERSONALTRAINER - HOURLYRATE
-- =====================================================

UPDATE PERSONALTRAINER SET HOURLYRATE = 70.00 WHERE PersonalTrainerID = 1;
UPDATE PERSONALTRAINER SET HOURLYRATE = 80.00 WHERE PersonalTrainerID = 2;
UPDATE PERSONALTRAINER SET HOURLYRATE = 90.00 WHERE PersonalTrainerID = 3;
UPDATE PERSONALTRAINER SET HOURLYRATE = 100.00 WHERE PersonalTrainerID = 4;
UPDATE PERSONALTRAINER SET HOURLYRATE = 75.00 WHERE PersonalTrainerID = 5;
UPDATE PERSONALTRAINER SET HOURLYRATE = 85.00 WHERE PersonalTrainerID = 6;
UPDATE PERSONALTRAINER SET HOURLYRATE = 95.00 WHERE PersonalTrainerID = 7;
UPDATE PERSONALTRAINER SET HOURLYRATE = 110.00 WHERE PersonalTrainerID = 8;
UPDATE PERSONALTRAINER SET HOURLYRATE = 80.00 WHERE PersonalTrainerID = 9;
UPDATE PERSONALTRAINER SET HOURLYRATE = 120.00 WHERE PersonalTrainerID = 10;


-- =====================================================
-- 8. PHYSICALASSESMENT - BODYFAT
-- =====================================================

UPDATE PHYSICALASSESMENT SET BODYFAT = 18.50 WHERE AssesmentID = 1;
UPDATE PHYSICALASSESMENT SET BODYFAT = 22.30 WHERE AssesmentID = 2;
UPDATE PHYSICALASSESMENT SET BODYFAT = 15.80 WHERE AssesmentID = 3;
UPDATE PHYSICALASSESMENT SET BODYFAT = 25.40 WHERE AssesmentID = 4;
UPDATE PHYSICALASSESMENT SET BODYFAT = 19.20 WHERE AssesmentID = 5;
UPDATE PHYSICALASSESMENT SET BODYFAT = 21.70 WHERE AssesmentID = 6;
UPDATE PHYSICALASSESMENT SET BODYFAT = 16.90 WHERE AssesmentID = 7;
UPDATE PHYSICALASSESMENT SET BODYFAT = 24.10 WHERE AssesmentID = 8;
UPDATE PHYSICALASSESMENT SET BODYFAT = 17.60 WHERE AssesmentID = 9;
UPDATE PHYSICALASSESMENT SET BODYFAT = 20.50 WHERE AssesmentID = 10;


-- =====================================================
-- 9. SESSIONPT - PRICE
-- =====================================================

UPDATE SESSIONPT SET PRICE = 80.00 WHERE SessionID = 1;
UPDATE SESSIONPT SET PRICE = 90.00 WHERE SessionID = 2;
UPDATE SESSIONPT SET PRICE = 100.00 WHERE SessionID = 3;
UPDATE SESSIONPT SET PRICE = 120.00 WHERE SessionID = 4;
UPDATE SESSIONPT SET PRICE = 85.00 WHERE SessionID = 5;
UPDATE SESSIONPT SET PRICE = 95.00 WHERE SessionID = 6;
UPDATE SESSIONPT SET PRICE = 110.00 WHERE SessionID = 7;
UPDATE SESSIONPT SET PRICE = 130.00 WHERE SessionID = 8;
UPDATE SESSIONPT SET PRICE = 90.00 WHERE SessionID = 9;
UPDATE SESSIONPT SET PRICE = 150.00 WHERE SessionID = 10;

-- STORE PROCEDURES 

USE IRONFIT;
 
USE IRONFIT;

DELIMITER $$

/* =========================================================
   1. GYM
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_CadastrarGym $$

CREATE PROCEDURE sp_CadastrarGym(
    IN p_GymName VARCHAR(100),
    IN p_Address VARCHAR(255),
    IN p_City VARCHAR(100),
    IN p_Phone VARCHAR(20),
    IN p_OpeningHours VARCHAR(50)
)
BEGIN
    DECLARE v_CityCount INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao cadastrar academia. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_CityCount
    FROM GYM
    WHERE City = p_City;

    START TRANSACTION;

    INSERT INTO GYM
        (GymName, Address, City, PHONE, Openinghours)
    VALUES
        (p_GymName, p_Address, p_City, p_Phone,
         IFNULL(NULLIF(p_OpeningHours, ''), '06:00 - 22:00'));

    COMMIT;

    IF v_CityCount = 0 THEN
        SELECT CONCAT(
            'Academia cadastrada. Primeira unidade na cidade de ',
            p_City, '.'
        ) AS Mensagem;
    ELSE
        SELECT CONCAT(
            'Academia cadastrada. Já existiam ',
            v_CityCount,
            ' unidade(s) em ',
            p_City,
            '.'
        ) AS Mensagem;
    END IF;

END $$


/* =========================================================
   2. SUBSCRIPTIONPLAN
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_AtualizarPrecoPlano $$

CREATE PROCEDURE sp_AtualizarPrecoPlano(
    IN p_PlanID INT,
    IN p_NewPrice DECIMAL(10,2)
)
BEGIN
    DECLARE v_OldPrice DECIMAL(10,2);
    DECLARE v_ActiveSubs INT DEFAULT 0;
    DECLARE v_PlanExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar o plano. Operação revertida.' AS Mensagem;
    END;

    IF p_NewPrice <= 0 THEN

        SELECT
            'Preço inválido: o valor deve ser maior que zero.'
            AS Mensagem;

    ELSE

        SELECT COUNT(*)
        INTO v_PlanExists
        FROM SubscriptionPlan
        WHERE SusbscriptionPlanID = p_PlanID;

        IF v_PlanExists = 0 THEN

            SELECT
                'Plano não encontrado.'
                AS Mensagem;

        ELSE

            SELECT MonthlyPrice
            INTO v_OldPrice
            FROM SubscriptionPlan
            WHERE SusbscriptionPlanID = p_PlanID;

            SELECT COUNT(*)
            INTO v_ActiveSubs
            FROM Subscription
            WHERE SubscriptionPlanID = p_PlanID
              AND SubscriptionStatus = 'Ativa';

            START TRANSACTION;

            UPDATE SubscriptionPlan
            SET MonthlyPrice = p_NewPrice
            WHERE SusbscriptionPlanID = p_PlanID;

            COMMIT;

            SELECT CONCAT(
                'Preço alterado de ',
                v_OldPrice,
                ' para ',
                p_NewPrice,
                '. Assinaturas ativas afetadas: ',
                v_ActiveSubs
            ) AS Mensagem;

        END IF;

    END IF;

END $$


/* =========================================================
   3. GROUPCLASS
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_VerificarVagasAula $$

CREATE PROCEDURE sp_VerificarVagasAula(
    IN p_ClassID INT
)
BEGIN
    DECLARE v_Capacity INT DEFAULT 0;
    DECLARE v_Booked INT DEFAULT 0;
    DECLARE v_Vagas INT DEFAULT 0;
    DECLARE v_ClassExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao verificar vagas da aula.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_ClassExists
    FROM GROUPCLASS
    WHERE ClassID = p_ClassID;

    IF v_ClassExists = 0 THEN

        SELECT
            'Turma não encontrada.'
            AS Mensagem;

    ELSE

        SELECT Capacity
        INTO v_Capacity
        FROM GROUPCLASS
        WHERE ClassID = p_ClassID;

        SELECT COUNT(*)
        INTO v_Booked
        FROM CLASSSBOOKING
        WHERE ClassID = p_ClassID
          AND STATUS <> 'Cancelada';

        SET v_Vagas = v_Capacity - v_Booked;

        IF v_Vagas > 0 THEN

            SELECT CONCAT(
                'Vagas disponíveis: ',
                v_Vagas
            ) AS Mensagem;

        ELSE

            SELECT
                'Turma lotada. Não há vagas disponíveis.'
                AS Mensagem;

        END IF;

    END IF;

END $$


/* =========================================================
   4. MEMBER
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_CadastrarMembro $$

CREATE PROCEDURE sp_CadastrarMembro(
    IN p_Name VARCHAR(100),
    IN p_Email VARCHAR(255),
    IN p_Phone VARCHAR(20),
    IN p_GymID INT
)
BEGIN
    DECLARE v_GymExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao cadastrar membro. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_GymExists
    FROM GYM
    WHERE GymID = p_GymID;

    IF v_GymExists = 0 THEN

        SELECT
            'Cadastro não realizado: academia informada não existe.'
            AS Mensagem;

    ELSE

        START TRANSACTION;

        INSERT INTO MEMBER
            (
                MemberName,
                Email,
                phone,
                RegistrationDate,
                MEMBERSTATUS,
                GYMID
            )
        VALUES
            (
                p_Name,
                p_Email,
                p_Phone,
                CURDATE(),
                'Ativo',
                p_GymID
            );

        COMMIT;

        SELECT
            'Membro cadastrado com sucesso.'
            AS Mensagem;

    END IF;

END $$


/* =========================================================
   5. SUBSCRIPTION
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_CancelarAssinatura $$

CREATE PROCEDURE sp_CancelarAssinatura(
    IN p_SubscriptionID INT
)
BEGIN
    DECLARE v_Status VARCHAR(20);
    DECLARE v_MemberName VARCHAR(100);
    DECLARE v_SubscriptionExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao cancelar assinatura. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_SubscriptionExists
    FROM Subscription
    WHERE SubscriptionID = p_SubscriptionID;

    IF v_SubscriptionExists = 0 THEN

        SELECT
            'Assinatura não encontrada.'
            AS Mensagem;

    ELSE

        SELECT
            s.SubscriptionStatus,
            m.MemberName
        INTO
            v_Status,
            v_MemberName
        FROM Subscription s
        INNER JOIN MEMBER m
            ON s.MemberID = m.MemberID
        WHERE s.SubscriptionID = p_SubscriptionID;

        IF v_Status = 'Cancelada' THEN

            SELECT CONCAT(
                'A assinatura de ',
                v_MemberName,
                ' já está cancelada.'
            ) AS Mensagem;

        ELSE

            START TRANSACTION;

            UPDATE Subscription
            SET SubscriptionStatus = 'Cancelada'
            WHERE SubscriptionID = p_SubscriptionID;

            COMMIT;

            SELECT CONCAT(
                'Assinatura de ',
                v_MemberName,
                ' cancelada com sucesso.'
            ) AS Mensagem;

        END IF;

    END IF;

END $$


/* =========================================================
   6. CLASSSBOOKING
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_ConfirmarPresenca $$

CREATE PROCEDURE sp_ConfirmarPresenca(
    IN p_BookingID INT
)
BEGIN
    DECLARE v_Status VARCHAR(20);
    DECLARE v_BookingExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao confirmar presença. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_BookingExists
    FROM CLASSSBOOKING
    WHERE BookingID = p_BookingID;

    IF v_BookingExists = 0 THEN

        SELECT
            'Reserva não encontrada.'
            AS Mensagem;

    ELSE

        SELECT STATUS
        INTO v_Status
        FROM CLASSSBOOKING
        WHERE BookingID = p_BookingID;

        IF v_Status = 'Cancelada' THEN

            SELECT
                'Não é possível confirmar presença de uma reserva cancelada.'
                AS Mensagem;

        ELSE

            START TRANSACTION;

            UPDATE CLASSSBOOKING
            SET
                ATTENDANCE = TRUE,
                STATUS = 'Concluida'
            WHERE BookingID = p_BookingID;

            COMMIT;

            SELECT
                'Presença confirmada com sucesso.'
                AS Mensagem;

        END IF;

    END IF;

END $$


/* =========================================================
   7. PERSONALTRAINER
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_ReajustarValorHora $$

CREATE PROCEDURE sp_ReajustarValorHora(
    IN p_TrainerID INT,
    IN p_Percentual DECIMAL(5,2)
)
BEGIN
    DECLARE v_CurrentRate DECIMAL(10,2);
    DECLARE v_NewRate DECIMAL(10,2);
    DECLARE v_TrainerExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao reajustar valor da hora. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_TrainerExists
    FROM PersonalTrainer
    WHERE PersonalTrainerID = p_TrainerID;

    IF v_TrainerExists = 0 THEN

        SELECT
            'Personal Trainer não encontrado.'
            AS Mensagem;

    ELSE

        SELECT HOURLYRATE
        INTO v_CurrentRate
        FROM PersonalTrainer
        WHERE PersonalTrainerID = p_TrainerID;

        IF v_CurrentRate IS NULL THEN
            SET v_CurrentRate = 70.00;
        END IF;

        SET v_NewRate =
            v_CurrentRate * (1 + p_Percentual / 100);

        IF v_NewRate <= 0 THEN

            SELECT
                'Reajuste inválido: o valor resultante deve ser positivo.'
                AS Mensagem;

        ELSE

            START TRANSACTION;

            UPDATE PersonalTrainer
            SET HOURLYRATE = v_NewRate
            WHERE PersonalTrainerID = p_TrainerID;

            COMMIT;

            SELECT CONCAT(
                'Valor da hora atualizado de ',
                v_CurrentRate,
                ' para ',
                ROUND(v_NewRate, 2)
            ) AS Mensagem;

        END IF;

    END IF;

END $$


/* =========================================================
   8. PHYSICALASSESMENT
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_ClassificarIMC $$

CREATE PROCEDURE sp_ClassificarIMC(
    IN p_AssesmentID INT
)
BEGIN
    DECLARE v_Weight DECIMAL(10,2);
    DECLARE v_Height DECIMAL(10,2);
    DECLARE v_IMC DECIMAL(10,2);
    DECLARE v_MemberName VARCHAR(100);
    DECLARE v_AssessmentExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao calcular o IMC.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_AssessmentExists
    FROM PhysicalAssesment
    WHERE AssesmentID = p_AssesmentID;

    IF v_AssessmentExists = 0 THEN

        SELECT
            'Avaliação física não encontrada.'
            AS Resultado;

    ELSE

        SELECT
            pa.WeightKG,
            pa.Heightcm,
            m.MemberName
        INTO
            v_Weight,
            v_Height,
            v_MemberName
        FROM PhysicalAssesment pa
        INNER JOIN MEMBER m
            ON pa.MemberID = m.MemberID
        WHERE pa.AssesmentID = p_AssesmentID;

        IF v_Weight IS NULL OR v_Height IS NULL OR v_Height <= 0 THEN

            SELECT
                'Não é possível calcular o IMC: peso ou altura inválidos.'
                AS Resultado;

        ELSE

            SET v_IMC =
                v_Weight / POWER(v_Height / 100, 2);

            IF v_IMC < 18.5 THEN

                SELECT CONCAT(
                    v_MemberName,
                    ' - IMC: ',
                    ROUND(v_IMC, 2),
                    ' - Classificação: Abaixo do peso'
                ) AS Resultado;

            ELSEIF v_IMC < 25 THEN

                SELECT CONCAT(
                    v_MemberName,
                    ' - IMC: ',
                    ROUND(v_IMC, 2),
                    ' - Classificação: Peso normal'
                ) AS Resultado;

            ELSEIF v_IMC < 30 THEN

                SELECT CONCAT(
                    v_MemberName,
                    ' - IMC: ',
                    ROUND(v_IMC, 2),
                    ' - Classificação: Sobrepeso'
                ) AS Resultado;

            ELSE

                SELECT CONCAT(
                    v_MemberName,
                    ' - IMC: ',
                    ROUND(v_IMC, 2),
                    ' - Classificação: Obesidade'
                ) AS Resultado;

            END IF;

        END IF;

    END IF;

END $$


/* =========================================================
   9. SESSIONPT
   ========================================================= */

DROP PROCEDURE IF EXISTS sp_ConcluirSessao $$

CREATE PROCEDURE sp_ConcluirSessao(
    IN p_SessionID INT
)
BEGIN
    DECLARE v_Status VARCHAR(20);
    DECLARE v_Rate DECIMAL(10,2);
    DECLARE v_SessionExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao concluir sessão. Operação revertida.' AS Mensagem;
    END;

    SELECT COUNT(*)
    INTO v_SessionExists
    FROM SessionPT
    WHERE SessionID = p_SessionID;

    IF v_SessionExists = 0 THEN

        SELECT
            'Sessão não encontrada.'
            AS Mensagem;

    ELSE

        SELECT
            sp.Status,
            pt.HOURLYRATE
        INTO
            v_Status,
            v_Rate
        FROM SessionPT sp
        INNER JOIN PersonalTrainer pt
            ON sp.PersonalTrainerID = pt.PersonalTrainerID
        WHERE sp.SessionID = p_SessionID;

        IF v_Status = 'Cancelada' THEN

            SELECT
                'Não é possível concluir uma sessão cancelada.'
                AS Mensagem;

        ELSEIF v_Status = 'Concluída' THEN

            SELECT
                'Esta sessão já foi concluída.'
                AS Mensagem;

        ELSE

            START TRANSACTION;

            UPDATE SessionPT
            SET
                Status = 'Concluída',
                PRICE = v_Rate
            WHERE SessionID = p_SessionID;

            COMMIT;

            SELECT CONCAT(
                'Sessão concluída. Valor cobrado: ',
                v_Rate
            ) AS Mensagem;

        END IF;

    END IF;

END $$

DELIMITER ;
-- =====================================================================
-- EXEMPLOS DE CHAMADA (opcional, para testes)
-- =====================================================================
 CALL sp_CadastrarGym('IronFit Unidade 121', 'Rua Nova, 121', 'São Paulo', '(11) 90000-0121', '06:00 - 22:00');
CALL sp_AtualizarPrecoPlano(1, 109.90);
 CALL sp_VerificarVagasAula(1);
 CALL sp_CadastrarMembro('Aluno 121', 'aluno121@ironfit.com', '(11) 91000-0121', 1);
 CALL sp_CancelarAssinatura(1);
 CALL sp_ConfirmarPresenca(1);
 CALL sp_ReajustarValorHora(1, 10);
 CALL sp_ClassificarIMC(1);
 CALL sp_ConcluirSessao(1);

USE IRONFIT;

DELIMITER $$


/* =========================================================
   1. GYM
   Garante horário padrão de funcionamento
   ========================================================= */

DROP TRIGGER IF EXISTS trg_gym_before_insert $$

CREATE TRIGGER trg_gym_before_insert
BEFORE INSERT ON GYM
FOR EACH ROW
BEGIN
    IF NEW.Openinghours IS NULL OR NEW.Openinghours = '' THEN
        SET NEW.Openinghours = '06:00 - 22:00';
    END IF;
END $$


/* =========================================================
   2. SUBSCRIPTIONPLAN
   Impede preço negativo
   ========================================================= */

DROP TRIGGER IF EXISTS trg_subscriptionplan_before_insert $$

CREATE TRIGGER trg_subscriptionplan_before_insert
BEFORE INSERT ON SubscriptionPlan
FOR EACH ROW
BEGIN
    IF NEW.MonthlyPrice IS NULL OR NEW.MonthlyPrice < 0 THEN
        SET NEW.MonthlyPrice = 0.00;
    END IF;
END $$


/* =========================================================
   3. GROUPCLASS
   Define capacidade padrão da turma
   ========================================================= */

DROP TRIGGER IF EXISTS trg_groupclass_before_insert $$

CREATE TRIGGER trg_groupclass_before_insert
BEFORE INSERT ON GROUPCLASS
FOR EACH ROW
BEGIN
    IF NEW.Capacity IS NULL OR NEW.Capacity <= 0 THEN
        SET NEW.Capacity = 15;
    END IF;
END $$


/* =========================================================
   4. MEMBER
   Define status padrão do membro
   ========================================================= */

DROP TRIGGER IF EXISTS trg_member_before_insert $$

CREATE TRIGGER trg_member_before_insert
BEFORE INSERT ON MEMBER
FOR EACH ROW
BEGIN
    IF NEW.MEMBERSTATUS IS NULL OR NEW.MEMBERSTATUS = '' THEN
        SET NEW.MEMBERSTATUS = 'Ativo';
    END IF;

    IF NEW.RegistrationDate IS NULL THEN
        SET NEW.RegistrationDate = CURDATE();
    END IF;
END $$


/* =========================================================
   5. SUBSCRIPTION
   Define status e data inicial automaticamente
   ========================================================= */

DROP TRIGGER IF EXISTS trg_subscription_before_insert $$

CREATE TRIGGER trg_subscription_before_insert
BEFORE INSERT ON Subscription
FOR EACH ROW
BEGIN
    IF NEW.SubscriptionStatus IS NULL OR NEW.SubscriptionStatus = '' THEN
        SET NEW.SubscriptionStatus = 'Ativa';
    END IF;

    IF NEW.StartDate IS NULL THEN
        SET NEW.StartDate = CURDATE();
    END IF;
END $$


/* =========================================================
   6. CLASSSBOOKING
   Impede reserva quando a turma está lotada
   ========================================================= */

USE IRONFIT;

DELIMITER $$

DROP TRIGGER IF EXISTS trg_classsbooking_before_insert $$

CREATE TRIGGER trg_classsbooking_before_insert
BEFORE INSERT ON CLASSSBOOKING
FOR EACH ROW
BEGIN
    DECLARE v_Capacity INT DEFAULT 0;
    DECLARE v_Booked INT DEFAULT 0;

    SELECT Capacity
    INTO v_Capacity
    FROM GROUPCLASS
    WHERE ClassID = NEW.ClassID;

    SELECT COUNT(*)
    INTO v_Booked
    FROM CLASSSBOOKING
    WHERE ClassID = NEW.ClassID
      AND STATUS <> 'Cancelada';

    IF NEW.STATUS IS NULL OR NEW.STATUS = '' THEN
        SET NEW.STATUS = 'Agendada';
    END IF;

    IF NEW.BookingDate IS NULL THEN
        SET NEW.BookingDate = NOW();
    END IF;

    IF NEW.ATTENDANCE IS NULL THEN
        SET NEW.ATTENDANCE = FALSE;
    END IF;

END $$

/* =========================================================
   7. PERSONALTRAINER
   Define valor padrão da hora
   ========================================================= */

USE IRONFIT;

DELIMITER $$

DROP TRIGGER IF EXISTS trg_personaltrainer_before_insert $$

CREATE TRIGGER trg_personaltrainer_before_insert
BEFORE INSERT ON PersonalTrainer
FOR EACH ROW
BEGIN
    IF NEW.specialty IS NULL OR NEW.specialty = '' THEN
        SET NEW.specialty = 'Musculação';
    END IF;

    IF NEW.Certifications IS NULL OR NEW.Certifications = '' THEN
        SET NEW.Certifications = 'Não informado';
    END IF;
END $$



/* =========================================================
   8. PHYSICALASSESMENT
   Valida peso e altura
   ========================================================= */

USE IRONFIT;

DROP TRIGGER IF EXISTS trg_physicalassesment_before_insert;

CREATE TRIGGER trg_physicalassesment_before_insert
BEFORE INSERT ON PhysicalAssesment
FOR EACH ROW
SET NEW.AssesmentDate = IFNULL(NEW.AssesmentDate, CURDATE());
/* =========================================================
   9. SESSIONPT
   Define status, preço e horário automaticamente
   ========================================================= */

DROP TRIGGER IF EXISTS trg_sessionpt_before_insert;

CREATE TRIGGER trg_sessionpt_before_insert
BEFORE INSERT ON SessionPT
FOR EACH ROW
SET NEW.Status = IF(
    NEW.Status IS NULL OR NEW.Status = '',
    'Agendada',
    NEW.Status
);

DELIMITER ;


SHOW TRIGGERS FROM IRONFIT;

