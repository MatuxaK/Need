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