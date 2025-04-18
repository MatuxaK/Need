-- Создание таблицы 'Vehicles'
CREATE TABLE Vehicles (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    LicensePlate NVARCHAR(50),
    Brand NVARCHAR(255),
    TechnicalCondition NVARCHAR(255),
    Mileage INT,
    CarryingCapacity DECIMAL(10, 2),
    FuelConsumption DECIMAL(5, 2)
);

-- Создание таблицы 'Drivers'
CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    PersonnelNumber NVARCHAR(50),
    FullName NVARCHAR(255),
    DateOfBirth DATE,
    WorkExperience INT,
    Salary DECIMAL(10, 2),
    Category NVARCHAR(255)
);

-- Создание таблицы 'Trips'
CREATE TABLE Trips (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleID INT,
    DriverID INT,
    DepartureDate DATE,
    ArrivalDate DATE,
    Destination NVARCHAR(255),
    Distance INT,
    FuelConsumed DECIMAL(10, 2),
    CargoWeight DECIMAL(10, 2),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO Vehicles (LicensePlate, Brand, TechnicalCondition, Mileage, CarryingCapacity, FuelConsumption) VALUES
('AB123CD', 'ГАЗель', 'Хорошее', 100000, 1500.00, 12.00),
('CD456EF', 'КАМАЗ', 'Отличное', 200000, 10000.00, 25.00);

INSERT INTO Drivers (PersonnelNumber, FullName, DateOfBirth, WorkExperience, Salary, Category) VALUES
('1', 'Иванов Иван', '1980-05-10', 10, 50000.00, 'B, C'),
('2', 'Петров Петр', '1975-02-15', 15, 60000.00, 'C, E');

INSERT INTO Trips (VehicleID, DriverID, DepartureDate, ArrivalDate, Destination, Distance, FuelConsumed, CargoWeight) VALUES
(1, 1, '2023-01-10', '2023-01-11', 'Москва', 1000, 120.00, 1000.00),
(2, 2, '2023-02-01', '2023-02-02', 'Санкт-Петербург', 700, 175.00, 8000.00);

-- 1. Выбрать автомобиль с наименьшим расходом горючего за данный период
SELECT TOP 1 V.LicensePlate
FROM Vehicles V
JOIN Trips T ON V.VehicleID = T.VehicleID
ORDER BY V.FuelConsumption;

-- 2. Выбрать водителей, использующих заданную марку автомобиля
SELECT D.FullName
FROM Drivers D
JOIN Trips T ON D.DriverID = T.DriverID
JOIN Vehicles V ON T.VehicleID = V.VehicleID
WHERE V.Brand = 'ГАЗель';
