-- 1. Выбрать список кораблей, посещавших "Одессу зимой 2011/2012г.
SELECT DISTINCT S.ShipName
FROM Ships S
JOIN ShipVisits SV ON S.ShipID = SV.ShipID
JOIN Ports P ON SV.PortID = P.PortID
WHERE P.PortName = 'Одесса' AND SV.ArrivalDate BETWEEN '2011-12-01' AND '2012-02-29';

-- 2. Определить, когда корабль "Кузнецов" посещал порт "Новороссийск с целью починки такелажа"
SELECT SV.ArrivalDate, SV.DepartureDate
FROM ShipVisits SV
JOIN Ships S ON SV.ShipID = S.ShipID
JOIN Ports P ON SV.PortID = P.PortID
WHERE S.ShipName = 'Кузнецов' AND P.PortName = 'Новороссийск' AND SV.PurposeOfVisit = 'Починка такелажа';

SELECT TOP 1 PurposeOfVisit, COUNT(*) AS VisitCount
FROM ShipVisits SV
JOIN Ports P ON SV.PortID = P.PortID
WHERE P.PortName = 'Ялта'
GROUP BY PurposeOfVisit
ORDER BY VisitCount DESC;