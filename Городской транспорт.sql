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

INSERT INTO TransportTypes (TypeName, AverageSpeed, NumberOfVehicles, Fare) VALUES
('Троллейбус', 20.00, 50, 3.00),
('Трамвай', 18.00, 30, 3.00),
('Автобус', 25.00, 60, 4.00);

INSERT INTO Routes (RouteNumber, NumberOfStops, NumberOfVehicles, PassengersPerDay) VALUES
('49', 20, 10, 500),
('50', 25, 12, 600),
('11', 15, 8, 400);

INSERT INTO PathSegments (RouteID, StartPoint, EndPoint, Distance) VALUES
(1, 'Холодная Гора', 'Центр', 5.00),
(1, 'Центр', 'Выборг', 3.00),
(2, 'Холодная Гора', '23 Августа', 4.00);

INSERT INTO TransportRoutes (TypeID, RouteID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- 3. Вывести маршруты трамваев в порядке убывания их протяжённости
SELECT R.RouteNumber, SUM(PS.Distance) AS TotalDistance
FROM Routes R
JOIN PathSegments PS ON R.RouteID = PS.RouteID
JOIN TransportRoutes TR ON R.RouteID = TR.RouteID
JOIN TransportTypes TT ON TR.TypeID = TT.TypeID
WHERE TT.TypeName = 'Трамвай'
GROUP BY R.RouteNumber
ORDER BY TotalDistance DESC;

-- 4. Вывести список ежедневных денежных поступлений для всех видов транспорта
SELECT TT.TypeName, SUM(R.PassengersPerDay * TT.Fare) AS DailyRevenue
FROM TransportTypes TT
JOIN TransportRoutes TR ON TT.TypeID = TR.TypeID
JOIN Routes R ON TR.RouteID = R.RouteID
GROUP BY TT.TypeName;
