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

-- Вставка данных (Примеры)
INSERT INTO Minerals (MineralName, UnitOfMeasure, AnnualDemand, UnitPrice) VALUES
('Железная руда', 'тонна', 1000000, 500.00),
('Уголь', 'тонна', 2000000, 200.00);

INSERT INTO Deposits (DepositName, Reserves, DevelopmentMethod, AnnualProduction, CostPerUnit) VALUES
('Криворожское', 100000000, 'Открытый', 1000000, 100.00),
('Эльдорадо', 50000000, 'Шахтный', 500000, 150.00);

INSERT INTO ExtractionPoints (DepositID, MineralID) VALUES
(1, 1),
(2, 2);

-- 3. Определить, какие ископаемые добываются в Эльдорадо", и добыча является прибыльной
SELECT M.MineralName
FROM Minerals M
JOIN ExtractionPoints EP ON M.MineralID = EP.MineralID
JOIN Deposits D ON EP.DepositID = D.DepositID
WHERE D.DepositName = 'Эльдорадо' AND D.CostPerUnit < M.UnitPrice;