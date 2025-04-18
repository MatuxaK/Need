-- 3. Вывести маршруты трамваев в порядке убывания их протяжённости
SELECT R.RouteNumber, SUM(PS.Distance) AS TotalDistance
FROM Routes R
JOIN PathSegments PS ON R.RouteID = PS.RouteID
JOIN TransportRoutes TR ON R.RouteID = TR.RouteID
JOIN TransportTypes TT ON TR.TypeID = TT.TypeID
WHERE TT.TypeName = 'Трамвай'
GROUP BY R.RouteNumber
ORDER BY TotalDistance DESC;

-- 4. Вывести список ежедневных денежных поступлений для всех видов транспорта
SELECT TT.TypeName, SUM(R.PassengersPerDay * TT.Fare) AS DailyRevenue
FROM TransportTypes TT
JOIN TransportRoutes TR ON TT.TypeID = TR.TypeID
JOIN Routes R ON TR.RouteID = R.RouteID
GROUP BY TT.TypeName;
