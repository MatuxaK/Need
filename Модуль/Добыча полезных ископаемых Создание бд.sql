-- Создание таблицы 'Minerals'
CREATE TABLE Minerals (
    MineralID INT IDENTITY(1,1) PRIMARY KEY,
    MineralName NVARCHAR(255),
    UnitOfMeasure NVARCHAR(50),
    AnnualDemand INT,
    UnitPrice DECIMAL(10, 2)
);

-- Создание таблицы 'Deposits'
CREATE TABLE Deposits (
    DepositID INT IDENTITY(1,1) PRIMARY KEY,
    DepositName NVARCHAR(255),
    Reserves INT,
    DevelopmentMethod NVARCHAR(255),
    AnnualProduction INT,
    CostPerUnit DECIMAL(10, 2)
);

-- Создание таблицы 'ExtractionPoints'
CREATE TABLE ExtractionPoints (
    PointID INT IDENTITY(1,1) PRIMARY KEY,
    DepositID INT,
    MineralID INT,
    FOREIGN KEY (DepositID) REFERENCES Deposits(DepositID),
    FOREIGN KEY (MineralID) REFERENCES Minerals(MineralID)
);