-- Создание таблицы 'Ships'
CREATE TABLE Ships (
    ShipID INT IDENTITY(1,1) PRIMARY KEY,
    ShipName NVARCHAR(255),
    Displacement INT,
    PortOfRegistry NVARCHAR(255),
    Captain NVARCHAR(255)
);

-- Создание таблицы 'Ports'
CREATE TABLE Ports (
    PortID INT IDENTITY(1,1) PRIMARY KEY,
    PortName NVARCHAR(255),
    Country NVARCHAR(255),
    Category NVARCHAR(255)
);

-- Создание таблицы 'ShipVisits'
CREATE TABLE ShipVisits (
    VisitID INT IDENTITY(1,1) PRIMARY KEY,
    ShipID INT,
    PortID INT,
    ArrivalDate DATE,
    DepartureDate DATE,
    BerthNumber NVARCHAR(50),
    PurposeOfVisit NVARCHAR(255),
    FOREIGN KEY (ShipID) REFERENCES Ships(ShipID),
    FOREIGN KEY (PortID) REFERENCES Ports(PortID)
);