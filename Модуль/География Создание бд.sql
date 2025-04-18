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
