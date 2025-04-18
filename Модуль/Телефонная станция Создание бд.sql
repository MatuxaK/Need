-- Создание таблицы 'Subscribers'
CREATE TABLE Subscribers (
    SubscriberID INT IDENTITY(1,1) PRIMARY KEY,
    PhoneNumber NVARCHAR(20),
    FullName NVARCHAR(255),
    Address NVARCHAR(255),
    HasBlocker BIT,
    Note NVARCHAR(MAX),
    ATSCode NVARCHAR(50),
    AreaCode NVARCHAR(50),
    Debt DECIMAL(10, 2),
    InstallationDate DATE
);

-- Создание таблицы 'PairedNumbers'
CREATE TABLE PairedNumbers (
    PairedNumberID INT IDENTITY(1,1) PRIMARY KEY,
    PhoneNumber1 NVARCHAR(20),
    PhoneNumber2 NVARCHAR(20),
    ATSCode NVARCHAR(50)
);