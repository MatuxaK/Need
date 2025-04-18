-- 1. Определить сумму месячной оплаты для всех квартир дома No5
SELECT A.ApartmentNumber, SUM(P.PaymentAmount) AS TotalPayment
FROM Apartments A
JOIN Payments P ON A.ApartmentID = P.ApartmentID
WHERE A.HouseNumber = '5' AND P.PaymentMonth = 1 AND P.PaymentYear = 2023
GROUP BY A.ApartmentNumber;

-- 3. Определить общее число жильцов дома No5
SELECT SUM(NumberOfResidents) AS TotalResidents
FROM Apartments
WHERE HouseNumber = '5';
