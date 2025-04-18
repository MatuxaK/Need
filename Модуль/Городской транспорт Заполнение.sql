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