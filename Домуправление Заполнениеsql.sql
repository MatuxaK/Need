-- Вставка данных (Примеры)
INSERT INTO Apartments (HouseNumber, ApartmentNumber, NumberOfResidents, Area) VALUES
('5', '12', 3, 50.00),
('5', '13', 2, 40.00);

INSERT INTO PaymentTypes (PaymentTypeName, PricePerArea, PricePerResident) VALUES
('Квартплата', 10.00, 50.00),
('Теплоснабжение', 5.00, 25.00);

INSERT INTO Payments (ApartmentID, PaymentTypeID, PaymentAmount, PaymentMonth, PaymentYear, PaymentDate) VALUES
(1, 1, 750.00, 1, 2023, '2023-01-15'),
(1, 2, 325.00, 1, 2023, '2023-01-15'),
(2, 1, 650.00, 1, 2023, '2023-01-20');
