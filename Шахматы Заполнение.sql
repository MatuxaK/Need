-- Заполнение разрядов
INSERT INTO Разряды (Название_разряда) VALUES 
('Кандидат в мастера спорта'),
('Мастер спорта'),
('Гроссмейстер'),
('Международный гроссмейстер');

-- Заполнение уровней турниров
INSERT INTO Уровни_турниров (Название_уровня) VALUES 
('Локальный'),
('Национальный'),
('Международный'),
('Гран-при'),
('Чемпионат мира');

-- Заполнение шахматистов
INSERT INTO Шахматисты (Фамилия, Имя, Дата_рождения, Страна, ID_разряда, Участвовал_в_чемпионате_мира, Рейтинг) VALUES
('Карлсен', 'Магнус', '1990-11-30', 'Норвегия', 4, 1, 2865),
('Каруана', 'Фабиано', '1992-07-30', 'США', 4, 1, 2782),
('Непомнящий', 'Ян', '1990-07-14', 'Россия', 4, 1, 2773),
('Дин', 'Лижэнь', '1992-10-24', 'Китай', 4, 1, 2780),
('Гири', 'Аниш', '1994-06-28', 'Нидерланды', 4, 1, 2760),
('Свидлер', 'Пётр', '1976-06-17', 'Россия', 4, 0, 2720),
('Накамура', 'Хикару', '1987-12-09', 'США', 4, 0, 2768),
('Аронян', 'Левон', '1982-10-06', 'Армения', 4, 1, 2750);

-- Заполнение турниров
INSERT INTO Турниры (Название_турнира, Страна, Город, Дата_начала, Дата_окончания, ID_уровня) VALUES
('Чемпионат мира', 'Казахстан', 'Астана', '2023-04-07', '2023-04-30', 5),
('Турнир претендентов', 'Испания', 'Мадрид', '2022-06-16', '2022-07-05', 4),
('Wijk aan Zee', 'Нидерланды', 'Вейк-ан-Зее', '2023-01-13', '2023-01-29', 3),
('Sinquefield Cup', 'США', 'Сент-Луис', '2022-09-01', '2022-09-12', 3),
('Чемпионат России', 'Россия', 'Москва', '2022-12-01', '2022-12-15', 2);

-- Заполнение участия в турнирах
INSERT INTO Участие_в_турнирах (ID_турнира, ID_шахматиста, Стартовый_номер, Занятое_место) VALUES
(1, 1, 1, 1), (1, 2, 2, 2), (1, 3, 3, 3), (1, 4, 4, 4),
(2, 2, 1, 1), (2, 3, 2, 2), (2, 4, 3, 3), (2, 5, 4, 4),
(3, 1, 1, 1), (3, 5, 2, 2), (3, 6, 3, 3), (3, 7, 4, 4),
(4, 2, 1, 1), (4, 7, 2, 2), (4, 8, 3, 3), (4, 1, 4, 4),
(5, 3, 1, 1), (5, 6, 2, 2), (5, 8, 3, 3);