-- Заполнение владельцев
INSERT INTO Владельцы (Номер_прав, ФИО, Адрес, Телефон) VALUES
('AB123456', 'Иванов Сергей Петрович', 'ул. Ленина, 10', '+79001234567'),
('CD654321', 'Петров Андрей Иванович', 'ул. Гагарина, 25', '+79007654321'),
('EF789012', 'Сидорова Мария Владимировна', 'ул. Пушкина, 33', '+79009876543');

-- Заполнение автомобилей
INSERT INTO Автомобили (Номер_авто, Марка, Модель, Мощность, Год_выпуска, Цвет, ID_владельца) VALUES
('А123БВ777', 'Mercedes-Benz', '600', 300, 2015, 'черный', 1),
('В456ТУ777', 'Volkswagen', 'Golf', 150, 2018, 'синий', 2),
('С789ОР777', 'GAZ', 'М-20 Победа', 52, 1948, 'бежевый', 3),
('Х123ХХ777', 'Mercedes-Benz', '600', 350, 2020, 'серебристый', 1),
('У456УУ777', 'ZIS', '110', 140, 1946, 'черный', 2);

-- Заполнение механиков
INSERT INTO Механики (Табельный_номер, ФИО, Адрес, Телефон, Разряд) VALUES
('M001', 'Кузнецов Алексей Дмитриевич', 'ул. Мира, 15', '+79051112233', 6),
('M002', 'Смирнова Ольга Игоревна', 'ул. Садовая, 22', '+79052223344', 5),
('M003', 'Попов Владимир Сергеевич', 'ул. Лесная, 7', '+79053334455', 7),
('M004', 'Васильев Игорь Николаевич', 'ул. Речная, 12', '+79054445566', 4);

-- Заполнение мастерских
INSERT INTO Мастерские (Номер_мастерской, Название, Адрес, Телефон) VALUES
('MS001', 'Автосервис на Ленина', 'ул. Ленина, 50', '+74951234567'),
('MS002', 'Техцентр ГАЗ', 'ул. Автозаводская, 10', '+74957654321'),
('MS003', 'Премиум Сервис', 'ул. Центральная, 1', '+74959876543');

-- Заполнение категорий работ
INSERT INTO Категории_работ (Название_категории, Описание) VALUES
('Двигатель', 'Ремонт и обслуживание двигателя'),
('Трансмиссия', 'Ремонт коробки передач и сцепления'),
('Электрика', 'Ремонт электрооборудования'),
('Кузовные работы', 'Ремонт и покраска кузова'),
('Реставрация', 'Реставрация классических автомобилей');

-- Заполнение нарядов
INSERT INTO Наряды (ID_автомобиля, ID_мастерской, Стоимость, Дата_выдачи, Плановая_дата_окончания, Реальная_дата_окончания, ID_категории) VALUES
(1, 3, 25000.00, '2023-05-10', '2023-05-15', '2023-05-17', 1),
(2, 1, 12000.00, '2023-05-12', '2023-05-14', '2023-05-14', 3),
(3, 2, 50000.00, '2023-05-01', '2023-05-20', '2023-05-25', 5),
(4, 3, 30000.00, '2023-06-01', '2023-06-05', '2023-06-10', 1),
(5, 2, 45000.00, '2023-06-02', '2023-06-15', NULL, 5),
(1, 1, 8000.00, '2023-06-10', '2023-06-12', '2023-06-11', 4);

-- Заполнение назначений механиков
INSERT INTO Назначения_механиков (ID_наряда, ID_механика) VALUES
(1, 1), (1, 3),
(2, 2),
(3, 4), (3, 1),
(4, 3),
(5, 4),
(6, 2);