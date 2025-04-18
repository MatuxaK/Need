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

INSERT INTO Ships (ShipName, Displacement, PortOfRegistry, Captain) VALUES
('Кузнецов', 55000, 'Мурманск', 'Иванов'),
('Аврора', 12000, 'Санкт-Петербург', 'Петров'),
('Santa Maria', 1000, 'Cadiz', 'Columbus');

INSERT INTO Ports (PortName, Country, Category) VALUES
('Одесса', 'Украина', 'Торговый'),
('Новороссийск', 'Россия', 'Военный'),
('Ялта', 'Украина', 'Пассажирский');

INSERT INTO ShipVisits (ShipID, PortID, ArrivalDate, DepartureDate, BerthNumber, PurposeOfVisit) VALUES
(1, 2, '2011-12-20', '2011-12-25', '12', 'Починка такелажа'),
(1, 2, '2012-01-15', '2012-01-20', '15', 'Пополнение запасов'),
(2, 1, '2011-11-25', '2011-12-01', '3', 'Туризм'),
(3, 3, '2010-05-10', '2010-05-15', '1', 'Туризм');

-- 1. Выбрать список кораблей, посещавших "Одессу зимой 2011/2012г.
SELECT DISTINCT S.ShipName
FROM Ships S
JOIN ShipVisits SV ON S.ShipID = SV.ShipID
JOIN Ports P ON SV.PortID = P.PortID
WHERE P.PortName = 'Одесса' AND SV.ArrivalDate BETWEEN '2011-12-01' AND '2012-02-29';

-- 2. Определить, когда корабль "Кузнецов" посещал порт "Новороссийск с целью починки такелажа"
SELECT SV.ArrivalDate, SV.DepartureDate
FROM ShipVisits SV
JOIN Ships S ON SV.ShipID = S.ShipID
JOIN Ports P ON SV.PortID = P.PortID
WHERE S.ShipName = 'Кузнецов' AND P.PortName = 'Новороссийск' AND SV.PurposeOfVisit = 'Починка такелажа';

SELECT TOP 1 PurposeOfVisit, COUNT(*) AS VisitCount
FROM ShipVisits SV
JOIN Ports P ON SV.PortID = P.PortID
WHERE P.PortName = 'Ялта'
GROUP BY PurposeOfVisit
ORDER BY VisitCount DESC;