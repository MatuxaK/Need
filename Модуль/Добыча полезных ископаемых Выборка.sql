-- 3. Определить, какие ископаемые добываются в Эльдорадо", и добыча является прибыльной
SELECT M.MineralName
FROM Minerals M
JOIN ExtractionPoints EP ON M.MineralID = EP.MineralID
JOIN Deposits D ON EP.DepositID = D.DepositID
WHERE D.DepositName = 'Эльдорадо' AND D.CostPerUnit < M.UnitPrice;