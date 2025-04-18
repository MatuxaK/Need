-- Добавление факультетов
INSERT INTO Факультеты (Название_факультета, Количество_мест, Описание) VALUES
('Факультет информационных технологий', 150, 'Факультет подготовки специалистов в области ИТ'),
('Факультет экономики и управления', 200, 'Факультет экономического образования'),
('Факультет гуманитарных наук', 180, 'Факультет гуманитарного образования');

-- Добавление групп
INSERT INTO Группы (Номер_группы, ID_факультета, Год_формирования) VALUES
('ИТ-101', 1, 2024),
('ЭК-201', 2, 2024),
('ГН-301', 3, 2024),
('ИТ-102', 1, 2024),
('ЭК-202', 2, 2024);

-- Добавление студентов
INSERT INTO Студенты (Фамилия, Имя, Отчество, Дата_рождения, ID_семейного_положения, Сведения_о_семье) VALUES
('Иванов', 'Иван', 'Петрович', '2005-05-15', 1, 'Живет с родителями'),
('Петрова', 'Мария', 'Сергеевна', '2005-08-20', 2, 'Живет в общежитии'),
('Сидоров', 'Алексей', 'Николаевич', '2005-02-10', 1, 'Живет с родителями'),
('Козлова', 'Анна', 'Владимировна', '2005-11-25', 3, 'Живет в общежитии'),
('Николаев', 'Дмитрий', 'Алексеевич', '2005-06-15', 1, 'Живет с родителями');

-- Добавление записей об обучении
INSERT INTO Обучение (ID_студента, ID_группы, ID_специальности, Курс, Стипендия, Год_зачисления) VALUES
(1, 1, 101, 1, 1500.00, 2024),
(2, 2, 201, 1, 1200.00, 2024),
(3, 1, 101, 1, 1500.00, 2024),
(4, 3, 301, 1, 1000.00, 2024),
(5, 2, 201, 1, 1200.00, 2024);