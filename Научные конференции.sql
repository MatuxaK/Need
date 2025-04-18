-- Таблица ученых
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    organization VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    academic_degree VARCHAR(50) NOT NULL
);

-- Таблица конференций
CREATE TABLE Conferences (
    conference_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    date DATE NOT NULL
);

-- Таблица типов участников
CREATE TABLE ParticipantTypes (
    type_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Таблица участия ученых в конференциях
CREATE TABLE ConferenceParticipants (
    participation_id INT PRIMARY KEY,
    scientist_id INT NOT NULL,
    conference_id INT NOT NULL,
    type_id INT NOT NULL,
    presentation_topic VARCHAR(200) NOT NULL,
    is_published Bit NOT NULL,
    FOREIGN KEY (scientist_id) REFERENCES Scientists(scientist_id),
    FOREIGN KEY (conference_id) REFERENCES Conferences(conference_id),
    FOREIGN KEY (type_id) REFERENCES ParticipantTypes(type_id)
);
-- Вставка данных в таблицу ученых
INSERT INTO Scientists (scientist_id, name, organization, country, academic_degree) VALUES
(1, 'Иванов Иван', 'Национальный университет', 'Россия', 'Доктор наук'),
(2, 'Петров Петр', 'Московский институт', 'Россия', 'Кандидат наук'),
(3, 'Смит Джон', 'Гарвардский университет', 'США', 'Доктор наук'),
(4, 'Ли Хао', 'Цзиньва университет', 'Китай', 'Кандидат наук'),
(5, 'Браун Эми', 'Оксфордский университет', 'Великобритания', 'Доктор наук');

-- Вставка данных в таблицу конференций
INSERT INTO Conferences (conference_id, name, location, date) VALUES
(1, 'Конференция по информационным технологиям', 'Москва', '2011-03-15'),
(2, 'Международная конференция по науке', 'Санкт-Петербург', '2011-06-20'),
(3, 'Конференция по физике', 'Нью-Йорк', '2011-09-10'),
(4, 'Космическая конференция', 'Лондон', '2011-05-05'),
(5, 'Конференция по биологии', 'Сидней', '2011-11-11');

-- Вставка данных в таблицу типов участников
INSERT INTO ParticipantTypes (type_id, name) VALUES
(1, 'Докладчик'),
(2, 'Слушатель'),
(3, 'Организатор');

-- Вставка данных в таблицу участия ученых в конференциях
INSERT INTO ConferenceParticipants (participation_id, scientist_id, conference_id, type_id, presentation_topic, is_published) VALUES
(1, 1, 1, 1, 'Технологии будущего', 1),        -- Ученый 1, Докладчик на конференции 1, опубликовано
(2, 1, 2, 1, 'Информационные технологии', 0),  -- Ученый 1, Докладчик на конференции 2, не опубликовано
(3, 2, 2, 2, 'Инновации', 0),                    -- Ученый 2, Слушатель на конференции 2, не опубликовано
(4, 3, 3, 1, 'Квантовая физика', 1),            -- Ученый 3, Докладчик на конференции 3, опубликовано
(5, 4, 1, 2, 'Новые технологии', 0),             -- Ученый 4, Слушатель на конференции 1, не опубликовано
(6, 5, 2, 1, 'Научные исследования', 1),        -- Ученый 5, Докладчик на конференции 2, опубликовано
(7, 1, 3, 1, 'Астрономия', 1),                   -- Ученый 1, Докладчик на конференции 3, опубликовано
(8, 2, 4, 2, 'Астрономия', 0),                   -- Ученый 2, Слушатель на конференции 4, не опубликовано
(9, 3, 5, 1, 'Генетика', 1);                     -- Ученый 3, Докладчик на конференции 5, опубликовано

SELECT s.name, COUNT(cp.participation_id) AS publication_count
FROM Scientists s
JOIN ConferenceParticipants cp ON s.scientist_id = cp.scientist_id
JOIN Conferences c ON cp.conference_id = c.conference_id
WHERE cp.is_published = 1 AND YEAR(c.date) = 2011
GROUP BY s.name;

SELECT DISTINCT c.name
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
WHERE cp.is_published = 0;

SELECT TOP 1 c.name, COUNT(cp.participation_id) AS speaker_count
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
WHERE cp.type_id = 1  -- тип Докладчик
GROUP BY c.name
ORDER BY speaker_count DESC;

SELECT c.name, COUNT(DISTINCT s.country) AS country_count
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
JOIN Scientists s ON cp.scientist_id = s.scientist_id
GROUP BY c.name;

-- Получение одной записи о самом активном ученом по публикациям
SELECT TOP 1 s.name, COUNT(cp.participation_id) AS publication_count
FROM Scientists s
JOIN ConferenceParticipants cp ON s.scientist_id = cp.scientist_id
JOIN Conferences c ON cp.conference_id = c.conference_id
WHERE cp.is_published = 1 AND YEAR(c.date) = 2011
GROUP BY s.name
ORDER BY publication_count DESC;