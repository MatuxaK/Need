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
