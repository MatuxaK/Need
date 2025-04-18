-- Создание таблицы лекарств
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    indications VARCHAR(255),       -- показания к использованию
    contraindications VARCHAR(255),  -- противопоказания
    manufacturer VARCHAR(255) NOT NULL,
    type VARCHAR(50),                -- тип (таблетки, микстура, мазь и т.д.)
    dosage VARCHAR(50),              -- дозировка
    price DECIMAL(10, 2) NOT NULL,   -- цена
    quantity INT NOT NULL,            -- количество
    expiry_date DATE NOT NULL         -- срок годности
);

-- Создание таблицы аптек
CREATE TABLE Pharmacies (
    pharmacy_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),      -- специализация аптеки
    district VARCHAR(100),            -- район
    phone VARCHAR(20)                 -- телефон
);

-- Создание таблицы, связывающей лекарства и аптеки
CREATE TABLE Pharmacy_Medicines (
    id INT PRIMARY KEY,
    pharmacy_id INT NOT NULL,
    medicine_id INT NOT NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
-- Заполнение таблицы лекарств
INSERT INTO Medicines (medicine_id, name, indications, contraindications, manufacturer, type, dosage, price, quantity, expiry_date) VALUES
(1, 'Анальгин', 'Боль', 'Аллергия', 'ФармГрупп', 'таблетки', '500 мг', 25.00, 100, '2024-12-31'),
(2, 'Парацетамол', 'Лихорадка', 'Заболевания печени', 'МедАльянс', 'таблетки', '500 мг', 15.00, 200, '2025-01-15'),
(3, 'Микстура от кашля', 'Кашель', 'Аллергия', 'Здоровье', 'микстура', '10 мл', 30.00, 150, '2024-06-15'),
(4, 'Мазь для суставов', 'Боль в суставах', 'Открытые раны', 'Медик', 'мазь', '50 г', 40.00, 80, '2024-11-01'),
(5, 'Аспирин', 'Боль, воспаление', 'Язва', 'ЕвроФарм', 'таблетки', '500 мг', 20.00, 60, '2024-09-30');

-- Заполнение таблицы аптек
INSERT INTO Pharmacies (pharmacy_id, name, specialization, district, phone) VALUES
(1, 'Аптека №1', 'Общая', 'Киевский', '044-123-4567'),
(2, 'Аптека №2', 'Профилактическая', 'Киевский', '044-234-5678'),
(3, 'Аптека №3', 'Скорая помощь', 'Центральный', '044-345-6789'),
(4, 'Аптека №4', 'Специализирующаяся на детских лекарствах', 'Северный', '044-456-7890'),
(5, 'Аптека №47', 'Общая', 'Киевский', '044-567-8901');

-- Заполнение таблицы связывающей лекарства с аптеками
INSERT INTO Pharmacy_Medicines (id, pharmacy_id, medicine_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 3, 4),
(6, 4, 5),
(7, 5, 1),
(8, 5, 2),
(9, 5, 4);

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

