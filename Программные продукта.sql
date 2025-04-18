-- Вставка данных в таблицу Products
INSERT INTO Products (ProductID, ProductName, Version, ProductType, Company, ReleaseDate, ApplicationArea, LicenseCost)
VALUES 
(1, 'Продукт A', '1.0', 'Прикладное ПО', 'Компания A', '2022-01-15', 'Финансы', 1000.00),
(2, 'Продукт B', '2.5', 'Прикладное ПО', 'Компания B', '2023-03-22', 'Маркетинг', 1500.00),
(3, 'Продукт C', '3.1', 'Прикладное ПО', 'Компания C', '2021-07-10', 'Управление проектами', 800.00),
(4, 'Продукт D', '4.0', 'Прикладное ПО', 'Компания D', '2024-05-01', 'Образование', 1200.00),
(5, 'Продукт E', '1.2', 'Прикладное ПО', 'Компания E', '2023-11-30', 'Здравоохранение', 950.00);

-- Вставка данных в таблицу Users
INSERT INTO Users (UserID, UserName, Region, ApplicationField)
VALUES 
(1, 'Белый ветер', 'Москва', 'Торговля'),
(2, 'Зеленый лес', 'Санкт-Петербург', 'Логистика'),
(3, 'Синий океан', 'Екатеринбург', 'Финансы'),
(4, 'Красный холм', 'Казань', 'Образование'),
(5, 'Желтая звезда', 'Новосибирск', 'Здравоохранение');

-- Вставка данных в таблицу Installations
INSERT INTO Installations (InstallationID, ProductID, UserID, InstallationCost, InstallationDate, DeinstallationDate, LicenseCount)
VALUES 
(1, 1, 1, 500.00, '2024-01-10', NULL, 5),
(2, 2, 2, 700.00, '2024-02-15', NULL, 3),
(3, 3, 3, 300.00, '2024-03-20', NULL, 7),
(4, 4, 4, 600.00, '2024-04-25', NULL, 4),
(5, 5, 5, 450.00, '2024-05-30', NULL, 6);
SELECT TOP 1 ApplicationArea, COUNT(*) AS ProductCount
FROM Products
GROUP BY ApplicationArea
ORDER BY ProductCount DESC;


SELECT SUM(InstallationCost) AS TotalCost
FROM Installations i
JOIN Users u ON i.UserID = u.UserID
WHERE u.UserName = 'Белый ветер' AND YEAR(i.InstallationDate) = 2024;

-- Создание таблицы для хранения информации о программных продуктах
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Version VARCHAR(50),
    ProductType VARCHAR(100),
    Company VARCHAR(255),
    ReleaseDate DATE,
    ApplicationArea VARCHAR(100),
    LicenseCost DECIMAL(10, 2)
);

-- Создание таблицы для хранения информации о пользователях
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Region VARCHAR(100),
    ApplicationField VARCHAR(100)
);

-- Создание таблицы для хранения информации об инсталляциях программных продуктов
CREATE TABLE Installations (
    InstallationID INT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    InstallationCost DECIMAL(10, 2),
    InstallationDate DATE,
    DeinstallationDate DATE,
    LicenseCount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
