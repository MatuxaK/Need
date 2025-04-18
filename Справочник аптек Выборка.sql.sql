-- Определить, какой болезнью чаще всего страдают жители района 'Киевский'
SELECT TOP 1 indications, COUNT(*) AS count
FROM Medicines m
JOIN Pharmacy_Medicines pm ON m.medicine_id = pm.medicine_id
JOIN Pharmacies p ON pm.pharmacy_id = p.pharmacy_id
WHERE p.district = 'Киевский'
GROUP BY indications
ORDER BY count DESC;

-- Определить, какие убытки понесет аптека №47, если в течение месяца не реализует все лекарства, у которых кончается срок годности
SELECT SUM(price * quantity) AS total_loss
FROM Medicines m
JOIN Pharmacy_Medicines pm ON m.medicine_id = pm.medicine_id
WHERE pm.pharmacy_id = 5 AND m.expiry_date <= DATEADD(MONTH, 1, GETDATE());

-- Определить, в каких аптеках дешевле всего 'анальгин'
SELECT p.name, MIN(m.price) AS min_price
FROM Medicines m
JOIN Pharmacy_Medicines pm ON m.medicine_id = pm.medicine_id
JOIN Pharmacies p ON pm.pharmacy_id = p.pharmacy_id
WHERE m.name = 'Анальгин'
GROUP BY p.name
ORDER BY min_price;
