SELECT TOP 1 ApplicationArea, COUNT(*) AS ProductCount
FROM Products
GROUP BY ApplicationArea
ORDER BY ProductCount DESC;


SELECT SUM(InstallationCost) AS TotalCost
FROM Installations i
JOIN Users u ON i.UserID = u.UserID
WHERE u.UserName = 'Белый ветер' AND YEAR(i.InstallationDate) = 2024;
