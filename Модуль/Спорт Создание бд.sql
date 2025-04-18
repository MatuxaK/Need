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