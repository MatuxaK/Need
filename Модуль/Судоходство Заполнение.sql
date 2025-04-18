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