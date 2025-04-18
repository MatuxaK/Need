-- 1. Определить сумму месячной оплаты для всех квартир дома No5
SELECT A.ApartmentNumber, SUM(P.PaymentAmount) AS TotalPayment
FROM Apartments A
JOIN Payments P ON A.ApartmentID = P.ApartmentID
WHERE A.HouseNumber = '5' AND P.PaymentMonth = 1 AND P.PaymentYear = 2023
GROUP BY A.ApartmentNumber;

-- 3. Определить общее число жильцов дома No5
SELECT SUM(NumberOfResidents) AS TotalResidents
FROM Apartments
WHERE HouseNumber = '5';
-- Создание таблицы 'Apartments'
CREATE TABLE Apartments (
    ApartmentID INT IDENTITY(1,1) PRIMARY KEY,
    HouseNumber NVARCHAR(50),
    ApartmentNumber NVARCHAR(50),
    NumberOfResidents INT,
    Area DECIMAL(10, 2)
);

-- Создание таблицы 'PaymentTypes'
CREATE TABLE PaymentTypes (
    PaymentTypeID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentTypeName NVARCHAR(255),
    PricePerArea DECIMAL(10, 2),
    PricePerResident DECIMAL(10, 2)
);

-- Создание таблицы 'Payments'
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    ApartmentID INT,
    PaymentTypeID INT,
    PaymentAmount DECIMAL(10, 2),
    PaymentMonth INT,
    PaymentYear INT,
    PaymentDate DATE,
    FOREIGN KEY (ApartmentID) REFERENCES Apartments(ApartmentID),
    FOREIGN KEY (PaymentTypeID) REFERENCES PaymentTypes(PaymentTypeID)
);

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
