-- 1. Определение самого молодого предпринимателя, владеющего собственностью в районе 'Киевский'
SELECT full_name, registration_date
FROM Owners
WHERE address LIKE '%Киевский%'
ORDER BY registration_date DESC;

-- 2. Определение случаев, когда регистрировалось владение лицам, не достигшим 18 лет
SELECT *
FROM Owners
WHERE DATEDIFF(YEAR, registration_date, GETDATE()) < 18;

-- 3. Определение случаев, когда больше 50% уставного капитала магазина внесено предпринимателем, проживающим в другом районе
SELECT o.full_name, s.name AS store_name, o.address AS owner_address, o.registration_number
FROM Ownerships ow
JOIN Owners o ON ow.owner_id = o.owner_id
JOIN Stores s ON ow.store_id = s.store_id
WHERE ow.capital_percentage > 50 
AND o.address NOT LIKE '%' + s.address + '%';

-- 4. Вывод списка профилей магазинов, которыми владеет предприниматель 'Кузнецов' в порядке убывания вложенного в них капитала
SELECT s.profile, s.authorized_capital
FROM Ownerships ow
JOIN Owners o ON ow.owner_id = o.owner_id
JOIN Stores s ON ow.store_id = s.store_id
WHERE o.full_name = 'Кузнецов'
ORDER BY s.authorized_capital DESC;
