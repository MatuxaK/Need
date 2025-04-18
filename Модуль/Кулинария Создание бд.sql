-- Создание таблицы 'Dishes'
CREATE TABLE Dishes (
    DishID INT IDENTITY(1,1) PRIMARY KEY,
    DishName NVARCHAR(255),
    Category NVARCHAR(255),
    Recipe NVARCHAR(MAX),
    PortionWeight DECIMAL(10, 2)
);

-- Создание таблицы 'Products'
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(255),
    Category NVARCHAR(255),
    Calories INT,
    UnitPrice DECIMAL(10, 2),
    UnitOfMeasure NVARCHAR(50)
);

-- Создание таблицы 'DishIngredients'
CREATE TABLE DishIngredients (
    DishID INT,
    ProductID INT,
    Quantity DECIMAL(10, 2),
    AddingOrder INT,
    Portions INT,
    PRIMARY KEY (DishID, ProductID),
    FOREIGN KEY (DishID) REFERENCES Dishes(DishID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);