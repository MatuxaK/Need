-- Создание таблицы 'Sports'
CREATE TABLE Sports (
    SportID INT IDENTITY(1,1) PRIMARY KEY,
    SportName NVARCHAR(255),
    UnitOfMeasure NVARCHAR(50),
    WorldRecord DECIMAL(10, 2),
    RecordDate DATE
);

-- Создание таблицы 'Athletes'
CREATE TABLE Athletes (
    AthleteID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255),
    DateOfBirth DATE,
    Team NVARCHAR(255),
    SportsRank NVARCHAR(255)
);

-- Создание таблицы 'Competitions'
CREATE TABLE Competitions (
    CompetitionID INT IDENTITY(1,1) PRIMARY KEY,
    CompetitionName NVARCHAR(255),
    AthleteID INT,
    SportID INT,
    Result DECIMAL(10, 2),
    CompetitionDate DATE,
    CompetitionPlace NVARCHAR(255),
    FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    FOREIGN KEY (SportID) REFERENCES Sports(SportID)
);

-- Создание таблицы 'AthleteSports'
CREATE TABLE AthleteSports (
  AthleteID INT,
  SportID INT,
  PRIMARY KEY (AthleteID, SportID),
  FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
  FOREIGN KEY (SportID) REFERENCES Sports(SportID)
);
-- Вставка данных (Примеры)
INSERT INTO Sports (SportName, UnitOfMeasure, WorldRecord, RecordDate) VALUES
('Бег', 'секунды', 9.58, '2009-08-16'),
('Шахматы', 'очки', NULL, NULL),
('Плавание', 'секунды', 46.91, '2009-07-30'),
('Велоспорт', 'часы', 5.26, '2022-08-13');

INSERT INTO Athletes (FullName, DateOfBirth, Team, SportsRank) VALUES
('Караваев', '1990-05-10', 'Динамо', 'КМС'),
('Сидоров', '1988-11-22', 'Спартак', 'МС'),
('Петров', '1992-07-01', 'ЦСКА', 'КМС'),
('Смирнов', '1985-09-18', 'Торпедо', 'МС');

INSERT INTO Competitions (CompetitionName, AthleteID, SportID, Result, CompetitionDate, CompetitionPlace) VALUES
('Открытый чемпионат Киева', 1, 2, 10.00, '2011-01-05', 'Киев');

INSERT INTO AthleteSports (AthleteID, SportID) VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,1),
(3,4),
(4,1),
(4,2),
(4,3),
(4,4);

-- 1. Определить спортсменов, которые выступают более чем в 3 видах спорта
SELECT A.FullName
FROM Athletes A
JOIN AthleteSports S ON A.AthleteID = S.AthleteID
GROUP BY A.FullName
HAVING COUNT(*) > 3;

-- 2. Вывести таблицу распределения мест в соревновании "открытый чемпионат в городе "Киев" по шахматам в 2011г
SELECT A.FullName, C.Result, C.CompetitionPlace
FROM Competitions C
JOIN Athletes A ON C.AthleteID = A.AthleteID
JOIN Sports S ON C.SportID = S.SportID
WHERE C.CompetitionName = 'Открытый чемпионат Киева' AND C.CompetitionDate BETWEEN '2011-01-01' AND '2011-12-31' AND S.SportName = 'Шахматы';

-- 3. Определить наилучший показатель спортсмена "Караваева" в виде спорта "бег"
SELECT TOP 1 C.Result
FROM Competitions C
JOIN Athletes A ON C.AthleteID = A.AthleteID
JOIN Sports S ON C.SportID = S.SportID
WHERE A.FullName = 'Караваев' AND S.SportName = 'Бег'
ORDER BY C.Result;
