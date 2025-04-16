INSERT INTO Производители (ID, Название, Страна, Город, Адрес) VALUES
(1, 'ASUS', 'Тайвань', 'Тайбэй', 'ул. Компьютерная, 15'),
(2, 'Lenovo', 'Китай', 'Пекин', 'ул. Технологическая, 42'),
(3, 'HP', 'США', 'Пало-Альто', 'ул. Кремниевая, 150'),
(4, 'Dell', 'США', 'Раунд-Рок', 'ул. Деловая, 1'),
(5, 'Acer', 'Тайвань', 'Синьбэй', 'ул. Электронная, 77');

INSERT INTO Модели_ПЭВМ (ID, Название, Тип_процессора, Тактовая_частота, Объем_ОЗУ, Объем_ЖД, Дата_выпуска) VALUES
(1, 'VivoBook 15', 'Intel Core i5', 2.5, 8, 512, '2022-03-15'),
(2, 'ThinkPad X1', 'Intel Core i7', 3.2, 16, 1024, '2021-11-20'),
(3, 'Pavilion G6', 'AMD Ryzen 5', 3.0, 8, 256, '2023-01-10'),
(4, 'Inspiron 3501', 'Intel Core i3', 2.0, 4, 256, '2020-09-05'),
(5, 'Swift 3', 'AMD Ryzen 7', 3.5, 16, 512, '2022-07-30'),
(6, 'ROG Strix', 'Intel Core i9', 4.0, 32, 2048, '2023-05-12'),
(7, 'IdeaPad 5', 'AMD Ryzen 5', 3.2, 8, 512, '2022-08-18');

INSERT INTO Продавцы (ID, Название, Адрес, Телефон) VALUES
(1, 'Компьютерный мир', 'ул. Центральная, 10', '+7(495)123-45-67'),
(2, 'Эльдорадо', 'ул. Торговая, 25', '+7(495)765-43-21'),
(3, 'М.Видео', 'ул. Покупательская, 33', '+7(495)987-65-43'),
(4, 'Ситилинк', 'ул. Электронная, 7', '+7(495)456-78-90'),
(5, 'DNS', 'ул. Компьютерная, 99', '+7(495)111-22-33');

INSERT INTO Поставки (ID_производителя, ID_модели, ID_продавца, Объем_партии, Цена_партии) VALUES
(1, 1, 1, 50, 2500000.00),
(1, 6, 3, 20, 3500000.00),
(2, 2, 2, 30, 4200000.00),
(2, 7, 4, 40, 2800000.00),
(3, 3, 5, 60, 1800000.00),
(4, 4, 1, 100, 1500000.00),
(5, 5, 3, 35, 2100000.00),
(1, 1, 4, 25, 1300000.00),
(3, 3, 2, 45, 1350000.00),
(5, 5, 5, 30, 1800000.00);