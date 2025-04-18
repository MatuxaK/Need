-- Создание базы данных
CREATE DATABASE ProductionDB;
GO

USE ProductionDB;
GO

-- Таблица для изделий
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductCode VARCHAR(50) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    IsStandard BIT NOT NULL,
    Notes VARCHAR(255),
    AnnualProductionVolume INT
);

-- Таблица для предприятий
CREATE TABLE Manufacturers (
    ManufacturerID INT PRIMARY KEY IDENTITY(1,1),
    ManufacturerCode VARCHAR(50) NOT NULL,
    ManufacturerName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- Таблица для материалов
CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY IDENTITY(1,1),
    MaterialName VARCHAR(100) NOT NULL,
    MaterialType VARCHAR(50),
    UnitOfMeasure VARCHAR(20),
    PricePerUnit DECIMAL(10, 2),
    IsUsedInProduct BIT NOT NULL
);

-- Таблица для спецификаций изделий
CREATE TABLE ProductSpecifications (
    SpecificationID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    MaterialID INT FOREIGN KEY REFERENCES Materials(MaterialID),
    Quantity INT,
    SpecificationDate DATE,
    CancellationDate DATE
);

-- Таблица для выпуска изделий
CREATE TABLE ProductionRecords (
    ProductionID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID),
    YearOfProduction INT,
    ProductionVolume INT
);

-- Вставка тестовых записей в таблицу Manufacturers
INSERT INTO Manufacturers (ManufacturerCode, ManufacturerName, Address, Phone)
VALUES 
('M001', 'Производитель А', 'г. Москва, ул. Ленина, д. 1', '123-456'),
('M002', 'Производитель Б', 'г. Санкт-Петербург, ул. Пушкина, д. 2', '789-012'),
('M003', 'Производитель В', 'г. Казань, ул. Горького, д. 3', '345-678');

-- Вставка тестовых записей в таблицу Products
INSERT INTO Products (ProductCode, ProductName, IsStandard, Notes, AnnualProductionVolume)
VALUES 
('P001', 'Изделие 1', 1, 'Стандартное изделие', 10000),
('P002', 'Изделие 2', 0, 'Нестандартное изделие', 5000),
('P003', 'Изделие 3', 1, NULL, 15000),
('P004', 'Изделие 4', 0, NULL, 2000);

-- Вставка тестовых записей в таблицу Materials
INSERT INTO Materials (MaterialName, MaterialType, UnitOfMeasure, PricePerUnit, IsUsedInProduct)
VALUES 
('Сталь', 'Металл', 'кг', 50.00, 1),
('Алюминий', 'Цветной металл', 'кг', 100.00, 1),
('Лапша', 'Продукты питания', 'кг', 30.00, 1),
('Пластик', 'Полимер', 'кг', 20.00, 1);

-- Вставка тестовых записей в таблицу ProductSpecifications
INSERT INTO ProductSpecifications (ProductID, MaterialID, Quantity, SpecificationDate)
VALUES 
(1, 1, 2000, '2023-01-01'),
(1, 2, 1000, '2023-01-01'),
(2, 1, 1500, '2023-01-01'),
(2, 3, 3000, '2023-01-01'),
(3, 2, 2500, '2023-01-01'),
(4, 4, 5000, '2023-01-01');

-- Вставка тестовых записей в таблицу ProductionRecords
INSERT INTO ProductionRecords (ProductID, ManufacturerID, YearOfProduction, ProductionVolume)
VALUES 
(1, 1, 2000, 8000),
(1, 2, 2001, 9000),
(2, 1, 2000, 4000),
(3, 3, 2000, 12000),
(4, 2, 2000, 1500);

SELECT p.ProductName, COUNT(ps.MaterialID) AS MaterialCount
FROM Products p
JOIN ProductSpecifications ps ON p.ProductID = ps.ProductID
JOIN Materials m ON ps.MaterialID = m.MaterialID
WHERE m.MaterialType = 'цветной металл'
GROUP BY p.ProductName
ORDER BY MaterialCount DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY; -- Для SQL Server

SELECT p.ProductName
FROM Products p
WHERE p.ProductID NOT IN (
    SELECT pr.ProductID
    FROM ProductionRecords pr
    WHERE pr.YearOfProduction = 2000
);

WITH MaterialCosts AS (
    SELECT 
        pr.ProductID,
        SUM(m.PricePerUnit * ps.Quantity) AS TotalCost,
        pr.YearOfProduction
    FROM ProductionRecords pr
    JOIN ProductSpecifications ps ON pr.ProductID = ps.ProductID
    JOIN Materials m ON ps.MaterialID = m.MaterialID
    GROUP BY pr.ProductID, pr.YearOfProduction
)

SELECT 
    p.ProductName
FROM Products p
JOIN MaterialCosts mc1 ON p.ProductID = mc1.ProductID AND mc1.YearOfProduction = 2000
JOIN MaterialCosts mc2 ON p.ProductID = mc2.ProductID AND mc2.YearOfProduction = 1999
WHERE mc1.TotalCost < mc2.TotalCost;

SELECT 
    AVG(ps.Quantity) AS AverageMonthlyConsumption
FROM ProductSpecifications ps
JOIN Materials m ON ps.MaterialID = m.MaterialID
JOIN ProductionRecords pr ON ps.ProductID = pr.ProductID
WHERE m.MaterialName = 'лапша' AND pr.YearOfProduction = 2000;
