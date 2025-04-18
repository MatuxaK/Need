-- Таблица единиц измерения
CREATE TABLE Единицы_измерения (
    ID_единицы INT PRIMARY KEY IDENTITY(1,1),
    Название_единицы NVARCHAR(20) NOT NULL UNIQUE,
    Сокращение NVARCHAR(10) NOT NULL UNIQUE
);

-- Таблица товаров
CREATE TABLE Товары (
    ID_товара INT PRIMARY KEY IDENTITY(1,1),
    Код_товара NVARCHAR(20) NOT NULL UNIQUE,
    Название_товара NVARCHAR(100) NOT NULL,
    ID_единицы INT NOT NULL,
    Стоимость_единицы DECIMAL(10,2) NOT NULL CHECK (Стоимость_единицы > 0),
    Количество_на_складе DECIMAL(10,3) NOT NULL CHECK (Количество_на_складе >= 0),
    Описание_товара NVARCHAR(500),
    FOREIGN KEY (ID_единицы) REFERENCES Единицы_измерения(ID_единицы)
);

-- Таблица поставщиков
CREATE TABLE Поставщики (
    ID_поставщика INT PRIMARY KEY IDENTITY(1,1),
    Номер_поставщика NVARCHAR(20) NOT NULL UNIQUE,
    Название_компании NVARCHAR(100) NOT NULL,
    Адрес NVARCHAR(200) NOT NULL,
    Телефон NVARCHAR(20) NOT NULL,
    ФИО_контактного_лица NVARCHAR(100) NOT NULL,
    Номер_счета NVARCHAR(30) NOT NULL
);

-- Таблица поставок
CREATE TABLE Поставки (
    ID_поставки INT PRIMARY KEY IDENTITY(1,1),
    ID_поставщика INT NOT NULL,
    ID_товара INT NOT NULL,
    Дата_поставки DATE NOT NULL,
    Количество_товара DECIMAL(10,3) NOT NULL CHECK (Количество_товара > 0),
    Стоимость_единицы_на_момент_поставки DECIMAL(10,2) NOT NULL CHECK (Стоимость_единицы_на_момент_поставки > 0),
    Срок_поставки_в_днях INT NOT NULL CHECK (Срок_поставки_в_днях > 0),
    FOREIGN KEY (ID_поставщика) REFERENCES Поставщики(ID_поставщика),
    FOREIGN KEY (ID_товара) REFERENCES Товары(ID_товара)
);

-- Таблица истории цен
CREATE TABLE История_цен (
    ID_записи INT PRIMARY KEY IDENTITY(1,1),
    ID_товара INT NOT NULL,
    Дата_изменения DATE NOT NULL,
    Новая_цена DECIMAL(10,2) NOT NULL CHECK (Новая_цена > 0),
    FOREIGN KEY (ID_товара) REFERENCES Товары(ID_товара)
);

-- Заполнение единиц измерения
INSERT INTO Единицы_измерения (Название_единицы, Сокращение) VALUES
('Штука', 'шт'),
('Килограмм', 'кг'),
('Литр', 'л'),
('Метр', 'м'),
('Упаковка', 'уп');

-- Заполнение товаров
INSERT INTO Товары (Код_товара, Название_товара, ID_единицы, Стоимость_единицы, Количество_на_складе, Описание_товара) VALUES
('T001', 'Коврик для мыши', 1, 150.00, 100, 'Резиновый коврик для компьютерной мыши'),
('T002', 'Кабель HDMI', 1, 500.00, 50, 'Кабель HDMI 2.0 длиной 2 метра'),
('T003', 'Молоток', 1, 300.00, 30, 'Строительный молоток 500г'),
('T004', 'Краска белая', 2, 250.00, 200, 'Акриловая краска для стен'),
('T005', 'Инструмент набор', 5, 1500.00, 15, 'Набор инструментов из 24 предметов');

-- Заполнение поставщиков
INSERT INTO Поставщики (Номер_поставщика, Название_компании, Адрес, Телефон, ФИО_контактного_лица, Номер_счета) VALUES
('P001', 'ООО "ТехноПоставка"', 'ул. Ленина, 10', '+79001234567', 'Иванов Иван Иванович', '40702810500000012345'),
('P002', 'АО "СтройМатериалы"', 'ул. Строителей, 25', '+79007654321', 'Петров Петр Петрович', '40702810500000054321'),
('P003', 'ИП "Компьютерные технологии"', 'ул. Программистов, 33', '+79009876543', 'Сидорова Мария Владимировна', '40702810500000098765');

-- Заполнение поставок
INSERT INTO Поставки (ID_поставщика, ID_товара, Дата_поставки, Количество_товара, Стоимость_единицы_на_момент_поставки, Срок_поставки_в_днях) VALUES
(1, 1, '2023-01-15', 50, 140.00, 5),
(1, 2, '2023-01-20', 30, 480.00, 7),
(2, 3, '2023-02-10', 20, 280.00, 10),
(2, 4, '2023-02-15', 100, 230.00, 7),
(3, 1, '2023-03-01', 40, 145.00, 3),
(3, 5, '2023-03-05', 10, 1450.00, 14),
(1, 1, '2000-12-10', 30, 120.00, 7),
(1, 5, '2000-12-15', 5, 1400.00, 10),
(2, 5, '2001-01-20', 15, 1420.00, 8),
(3, 5, '2001-02-05', 10, 1430.00, 5);

-- Заполнение истории цен
INSERT INTO История_цен (ID_товара, Дата_изменения, Новая_цена) VALUES
(1, '2022-01-01', 130.00),
(1, '2022-06-01', 140.00),
(1, '2023-01-01', 150.00),
(2, '2022-01-01', 450.00),
(2, '2023-01-01', 500.00),
(3, '2022-01-01', 280.00),
(3, '2023-01-01', 300.00),
(4, '2022-01-01', 230.00),
(4, '2023-01-01', 250.00),
(5, '2022-01-01', 1400.00),
(5, '2023-01-01', 1500.00);

SELECT 
    п.Название_компании,
    п.ФИО_контактного_лица,
    п.Телефон
FROM 
    Поставщики п
WHERE NOT EXISTS (
    SELECT т.ID_товара
    FROM Товары т
    WHERE NOT EXISTS (
        SELECT 1
        FROM Поставки пост
        WHERE пост.ID_поставщика = п.ID_поставщика
        AND пост.ID_товара = т.ID_товара
    )
);

SELECT TOP 1
    п.Название_компании,
    AVG(пост.Стоимость_единицы_на_момент_поставки) AS Средняя_цена
FROM 
    Поставщики п
JOIN 
    Поставки пост ON п.ID_поставщика = пост.ID_поставщика
JOIN 
    Товары т ON пост.ID_товара = т.ID_товара
WHERE 
    т.Название_товара = 'Коврик для мыши'
GROUP BY 
    п.ID_поставщика, п.Название_компании
ORDER BY 
    Средняя_цена ASC;
--Товары, цены на которые никогда не повышались:
SELECT 
    т.Название_товара
FROM 
    Товары т
WHERE NOT EXISTS (
    SELECT 1
    FROM История_цен иц1
    JOIN История_цен иц2 ON 
        иц1.ID_товара = иц2.ID_товара AND
        иц1.Дата_изменения < иц2.Дата_изменения AND
        иц1.Новая_цена < иц2.Новая_цена
    WHERE иц1.ID_товара = т.ID_товара
);