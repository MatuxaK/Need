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

-- Вставка данных (Примеры)
INSERT INTO Dishes (DishName, Category, Recipe, PortionWeight) VALUES
('Борщ', 'Первое', 'Рецепт', 300.00);

INSERT INTO Products (ProductName, Category, Calories, UnitPrice, UnitOfMeasure) VALUES
('Картофель', 'Овощи', 100, 10.00, 'кг');

INSERT INTO DishIngredients (DishID, ProductID, Quantity, AddingOrder, Portions) VALUES
(1, 1, 0.50, 1, 1);

-- 2. Выбрать название блюд с указанием калорийности одной порции для каждого из них
SELECT D.DishName, SUM(P.Calories * DI.Quantity) AS TotalCalories
FROM Dishes D
JOIN DishIngredients DI ON D.DishID = DI.DishID
JOIN Products P ON DI.ProductID = P.ProductID
GROUP BY D.DishName;

-- 3. Определить блюдо, в которое входит больше всего продуктов категории "пряность"
SELECT TOP 1 D.DishName
FROM Dishes D
JOIN DishIngredients DI ON D.DishID = DI.DishID
JOIN Products P ON DI.ProductID = P.ProductID
WHERE P.Category = 'Пряность'
GROUP BY D.DishName
ORDER BY COUNT(*) DESC;