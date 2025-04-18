-- Создание таблицы стран
CREATE TABLE Countries (
    country_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    region VARCHAR(100) NOT NULL,
    capital VARCHAR(255) NOT NULL,
    area DECIMAL(10, 2) NOT NULL,                  -- площадь территории
    developed BIT,                                 -- является ли страна развитой
    population INT NOT NULL                         -- население
);

-- Создание таблицы национальностей
CREATE TABLE Nationalities (
    nationality_id INT PRIMARY KEY IDENTITY(1,1),
    country_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    language VARCHAR(100) NOT NULL,
    total_population INT NOT NULL,                 -- общая численность
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);


-- Заполнение таблицы стран
INSERT INTO Countries (name, region, capital, area, developed, population) VALUES
('Китай', 'Восточная Азия', 'Пекин', 9596961, 0, 1393409038),
('США', 'Северная Америка', 'Вашингтон', 9372610, 1, 331002651),
('Бразилия', 'Южная Америка', 'Бразилиа', 8515767, 0, 212559417),
('Германия', 'Европа', 'Берлин', 357022, 1, 83783942),
('Австралия', 'Океания', 'Канберра', 7692024, 1, 25687041),
('Индия', 'Южная Азия', 'Нью-Дели', 3287263, 0, 1380004385);

-- Заполнение таблицы национальностей
INSERT INTO Nationalities (country_id, name, language, total_population) VALUES
(1, 'Хань', 'Мандарин', 1200000000),
(1, 'Тибетцы', 'Тибетский', 6000000),
(2, 'Англичане', 'Английский', 45000000),
(2, 'Испанцы', 'Испанский', 36000000),
(3, 'Португальцы', 'Португальский', 210000000),
(4, 'Немцы', 'Немецкий', 76000000),
(5, 'Австралийцы', 'Английский', 25000000),
(6, 'Индийцы', 'Хинди', 900000000);

SELECT DISTINCT language 
FROM Nationalities
WHERE country_id = (SELECT country_id FROM Countries WHERE name = 'Китай')
AND (total_population * 1.0 / (SELECT population FROM Countries WHERE name = 'Китай')) >= 0.2;

SELECT name, population 
FROM Countries;

SELECT c.capital 
FROM Countries c
JOIN Nationalities n ON c.country_id = n.country_id
WHERE n.name = 'светлый эльф'
ORDER BY n.total_population DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;  -- Можно использовать также LIMIT для других SQL диалектов

SELECT DISTINCT n.name 
FROM Nationalities n
JOIN Countries c ON n.country_id = c.country_id
WHERE c.region = 'Драконы Горы';
