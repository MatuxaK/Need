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
