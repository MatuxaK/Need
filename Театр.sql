-- Создание таблицы актеров
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    title VARCHAR(100),
    role_type VARCHAR(100),  -- амплуа
    gender CHAR(1) -- 'M' для мужчины, 'F' для женщины
);

-- Создание таблицы ролей
CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    role_type VARCHAR(100), -- тип рати (главная, вторая, эпизод, статист и т.д.)
    play_title VARCHAR(255) -- название пьесы
);

-- Создание таблицы назначений ролей
CREATE TABLE RoleAssignments (
    assignment_id INT PRIMARY KEY,
    actor_id INT NOT NULL,
    role_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    role_type VARCHAR(100), -- тип роли
    director VARCHAR(255),   -- режиссер
    cast_number INT,         -- номер состава
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);
-- Заполнение таблицы актеров
INSERT INTO Actors (actor_id, full_name, title, role_type, gender) VALUES
(1, 'Иванов Иван', 'Заслуженный артист', 'герой-любовник', 'M'),
(2, 'Петрова Анна', 'Народная артистка', 'инженю', 'F'),
(3, 'Сидоров Сергей', 'Артист', 'злодей', 'M'),
(4, 'Кузнецова Ольга', 'Артистка', 'героиня', 'F'),
(5, 'Титов Алексей', 'Артист', 'комик', 'M'),
(6, 'Акимова Нина', 'Заслуженная артистка', 'классическая героиня', 'F');

-- Заполнение таблицы ролей
INSERT INTO Roles (role_id, role_name, role_type, play_title) VALUES
(1, 'Роль Любовника', 'главная', 'В поисках счастья'),
(2, 'Роль Злодея', 'главная', 'Тайна потерянного времени'),
(3, 'Роль Инженю', 'вторая', 'Свет в окне'),
(4, 'Статист в балете', 'статист', 'Танцы под луной'),
(5, 'Комическая Роль', 'эпизод', 'Смех и радость');

-- Заполнение таблицы назначений ролей
INSERT INTO RoleAssignments (assignment_id, actor_id, role_id, start_date, end_date, role_type, director, cast_number) VALUES
(1, 1, 1, '2021-03-15', '2021-05-15', 'главная', 'Балайан', 1),
(2, 3, 2, '2021-06-10', '2021-09-10', 'главная', 'Балайан', 1),
(3, 2, 3, '2021-04-01', '2021-07-01', 'вторая', 'Смирнов', 2),
(4, 4, 2, '2021-09-12', '2021-12-12', 'главная', 'Балайан', 2),
(5, 5, 5, '2020-11-01', '2021-02-01', 'эпизод', 'Петров', 1),
(6, 1, 1, '2021-05-16', NULL, 'главная', 'Балайан', 2),
(7, 6, 4, '2019-09-01', NULL, 'статист', 'Кузьмин', 1),
(8, 2, 1, '2022-01-01', NULL, 'главная', 'Дмитриев', 3),
(9, 3, 2, '2018-05-15', '2019-05-15', 'главная', 'Балайан', 1),
(10, 4, 2, '2018-06-01', '2018-12-01', 'главная', 'Савченко', 1);

SELECT a.full_name
FROM Actors a
JOIN RoleAssignments ra ON a.actor_id = ra.actor_id
WHERE ra.director = 'Балайан';

SELECT r.play_title
FROM RoleAssignments ra
JOIN Roles r ON ra.role_id = r.role_id
WHERE ra.role_type = 'главная'
GROUP BY r.play_title
HAVING COUNT(DISTINCT ra.actor_id) > 3;

SELECT a.full_name
FROM Actors a
WHERE NOT EXISTS (
    SELECT 1
    FROM RoleAssignments ra
    WHERE ra.actor_id = a.actor_id
    AND ra.start_date >= '2012-01-01'
);