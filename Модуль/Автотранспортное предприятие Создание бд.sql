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