INSERT INTO Vehicles (LicensePlate, Brand, TechnicalCondition, Mileage, CarryingCapacity, FuelConsumption) VALUES
('AB123CD', 'ГАЗель', 'Хорошее', 100000, 1500.00, 12.00),
('CD456EF', 'КАМАЗ', 'Отличное', 200000, 10000.00, 25.00);

INSERT INTO Drivers (PersonnelNumber, FullName, DateOfBirth, WorkExperience, Salary, Category) VALUES
('1', 'Иванов Иван', '1980-05-10', 10, 50000.00, 'B, C'),
('2', 'Петров Петр', '1975-02-15', 15, 60000.00, 'C, E');

INSERT INTO Trips (VehicleID, DriverID, DepartureDate, ArrivalDate, Destination, Distance, FuelConsumed, CargoWeight) VALUES
(1, 1, '2023-01-10', '2023-01-11', 'Москва', 1000, 120.00, 1000.00),
(2, 2, '2023-02-01', '2023-02-02', 'Санкт-Петербург', 700, 175.00, 8000.00);
