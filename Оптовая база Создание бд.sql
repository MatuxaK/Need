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