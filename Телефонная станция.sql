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

-- Вставка данных (Примеры)
INSERT INTO Subscribers (PhoneNumber, FullName, Address, HasBlocker, Note, ATSCode, AreaCode, Debt, InstallationDate) VALUES
('123-45-67', 'Иванов Иван', 'ул. Ленина, 1', 0, 'Квартира', '47', '123', 50.00, '2010-01-10'),
('234-56-78', 'Петров Петр', 'ул. Гагарина, 2', 1, 'Офис', '47', '123', 150.00, '2011-05-15'),
('345-67-89', 'Сидоров Сидор', 'ул. Пушкина, 3', 0, 'Квартира', '48', '234', 20.00, '2012-03-20');

INSERT INTO PairedNumbers (PhoneNumber1, PhoneNumber2, ATSCode) VALUES
('111-22-33', '444-55-66', '47'),
('777-88-99', '000-11-22', '48');

-- 1. Выбрать пары сблокированных телефонов
SELECT S1.PhoneNumber, S2.PhoneNumber
FROM Subscribers S1
JOIN Subscribers S2 ON S1.HasBlocker = 1 AND S2.HasBlocker = 1
WHERE S1.SubscriberID < S2.SubscriberID;

-- 4. Выбрать список абонентов АТС 47, имеющих задолженность больше 100 руб
SELECT PhoneNumber, FullName
FROM Subscribers
WHERE ATSCode = '47' AND Debt > 100.00;