SELECT p.ProductName, COUNT(ps.MaterialID) AS MaterialCount
FROM Products p
JOIN ProductSpecifications ps ON p.ProductID = ps.ProductID
JOIN Materials m ON ps.MaterialID = m.MaterialID
WHERE m.MaterialType = 'цветной металл'
GROUP BY p.ProductName
ORDER BY MaterialCount DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY; -- Для SQL Server

SELECT p.ProductName
FROM Products p
WHERE p.ProductID NOT IN (
    SELECT pr.ProductID
    FROM ProductionRecords pr
    WHERE pr.YearOfProduction = 2000
);

WITH MaterialCosts AS (
    SELECT 
        pr.ProductID,
        SUM(m.PricePerUnit * ps.Quantity) AS TotalCost,
        pr.YearOfProduction
    FROM ProductionRecords pr
    JOIN ProductSpecifications ps ON pr.ProductID = ps.ProductID
    JOIN Materials m ON ps.MaterialID = m.MaterialID
    GROUP BY pr.ProductID, pr.YearOfProduction
)

SELECT 
    p.ProductName
FROM Products p
JOIN MaterialCosts mc1 ON p.ProductID = mc1.ProductID AND mc1.YearOfProduction = 2000
JOIN MaterialCosts mc2 ON p.ProductID = mc2.ProductID AND mc2.YearOfProduction = 1999
WHERE mc1.TotalCost < mc2.TotalCost;

SELECT 
    AVG(ps.Quantity) AS AverageMonthlyConsumption
FROM ProductSpecifications ps
JOIN Materials m ON ps.MaterialID = m.MaterialID
JOIN ProductionRecords pr ON ps.ProductID = pr.ProductID
WHERE m.MaterialName = 'лапша' AND pr.YearOfProduction = 2000;
