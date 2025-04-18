-- Вставка данных (Примеры)
INSERT INTO Dishes (DishName, Category, Recipe, PortionWeight) VALUES
('Борщ', 'Первое', 'Рецепт', 300.00);

INSERT INTO Products (ProductName, Category, Calories, UnitPrice, UnitOfMeasure) VALUES
('Картофель', 'Овощи', 100, 10.00, 'кг');

INSERT INTO DishIngredients (DishID, ProductID, Quantity, AddingOrder, Portions) VALUES
(1, 1, 0.50, 1, 1);