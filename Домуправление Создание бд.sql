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
