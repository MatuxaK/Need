-- Создание таблицы 'TransportTypes'
CREATE TABLE TransportTypes (
    TypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(255),
    AverageSpeed DECIMAL(5, 2),
    NumberOfVehicles INT,
    Fare DECIMAL(5, 2)
);

-- Создание таблицы 'Routes'
CREATE TABLE Routes (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    RouteNumber NVARCHAR(50),
    NumberOfStops INT,
    NumberOfVehicles INT,
    PassengersPerDay INT
);

-- Создание таблицы 'PathSegments'
CREATE TABLE PathSegments (
    SegmentID INT IDENTITY(1,1) PRIMARY KEY,
    RouteID INT,
    StartPoint NVARCHAR(255),
    EndPoint NVARCHAR(255),
    Distance DECIMAL(5, 2),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- Создание таблицы 'TransportRoutes'
CREATE TABLE TransportRoutes (
    TransportRouteID INT IDENTITY(1,1) PRIMARY KEY,
    TypeID INT,
    RouteID INT,
    FOREIGN KEY (TypeID) REFERENCES TransportTypes(TypeID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);