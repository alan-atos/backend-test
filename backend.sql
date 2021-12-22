
CREATE TABLE Languages (
  LanguagesID int primary key,
  Name varchar(20) not null,
);

CREATE TABLE Countries (
  CountriesID int primary key,
  Name varchar(20) unique not null,
  Capital varchar(20)  not null,
  Population int  not null,
  CONSTRAINT FK_PersonOrder FOREIGN KEY (LanguagesID) REFERENCES Countries(LanguagesID)
);

insert into Languages values ('1', 'English');
insert into Languages values ('2', 'Spanish');
select * from Languages;

insert into Countries values ('1', 'Colombia', 'Bogota', '51678214', '2');
insert into Countries values ('2', 'Australia', 'Canberra', '25933724', '1');
select * from Countries;

UPDATE Countries
SET Population = '250000'
WHERE CountriesID = 1;

DELETE FROM Countries WHERE Population > '100000';

-- inner join between two tables by matching value (LanguagesID)
SELECT Languages.LanguagesID, Countries.CustomerName, Languages.Name
FROM Languages
INNER JOIN Countries ON Languages.LanguagesID=Countries.LanguagesID;

-- count how many countries speak the same language
SELECT COUNT(CountriesID), LanguagesID
FROM Countries
GROUP BY LanguagesID;

--stored procesure
-- Select all countries
CREATE PROCEDURE SelectAllCountries
AS
SELECT * FROM Countries
GO;

EXEC SelectAllCustomers;

--insert
CREATE PROCEDURE InstertCountries
AS
BEGIN
	insert into Countries 
    values ('5', 'Colombia', 'Bogota', '51678214', '2'),
    ('6', 'Austria', 'Vienna', '52677314', '2')
    ('7', 'China', 'Beijing', '90078214', '2')

END
GO;

EXEC InstertCountries;

--update
CREATE PROCEDURE UpdateCountries
AS
UPDATE Countries
SET Population = '250000'
WHERE CountriesID = 1;
GO;

EXEC DeleteCountries;


--delete
CREATE PROCEDURE DeleteCountries
AS
DELETE FROM Countries WHERE Capital > 'Bogota';
GO;

EXEC DeleteCountries;

