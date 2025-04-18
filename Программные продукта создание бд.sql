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
