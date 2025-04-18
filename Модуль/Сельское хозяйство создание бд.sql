-- Таблица видов собственности
CREATE TABLE Виды_собственности (
    ID_вида INT PRIMARY KEY IDENTITY(1,1),
    Название_вида NVARCHAR(100) NOT NULL UNIQUE
);

-- Таблица единиц измерения
CREATE TABLE Единицы_измерения (
    ID_единицы INT PRIMARY KEY IDENTITY(1,1),
    Название_единицы NVARCHAR(20) NOT NULL UNIQUE,
    Сокращение NVARCHAR(10) NOT NULL UNIQUE
);

-- Таблица продукции
CREATE TABLE Продукция (
    ID_продукции INT PRIMARY KEY IDENTITY(1,1),
    Название_продукции NVARCHAR(100) NOT NULL,
    ID_единицы INT NOT NULL,
    Закупочная_цена DECIMAL(12,2) NOT NULL CHECK (Закупочная_цена > 0),
    FOREIGN KEY (ID_единицы) REFERENCES Единицы_измерения(ID_единицы)
);

-- Таблица предприятий
CREATE TABLE Предприятия (
    ID_предприятия INT PRIMARY KEY IDENTITY(1,1),
    Наименование NVARCHAR(200) NOT NULL,
    Дата_регистрации DATE NOT NULL,
    ID_вида_собственности INT NOT NULL,
    Число_работников INT NOT NULL CHECK (Число_работников > 0),
    Основной_вид_продукции NVARCHAR(100),
    Передовое_в_технологиях BIT DEFAULT 0,
    Прибыль DECIMAL(12,2),
    Примечание NVARCHAR(500),
    FOREIGN KEY (ID_вида_собственности) REFERENCES Виды_собственности(ID_вида)
);

-- Таблица поставок
CREATE TABLE Поставки (
    ID_поставки INT PRIMARY KEY IDENTITY(1,1),
    ID_предприятия INT NOT NULL,
    ID_продукции INT NOT NULL,
    Дата_поставки DATE NOT NULL,
    Объем DECIMAL(12,3) NOT NULL CHECK (Объем > 0),
    Себестоимость DECIMAL(12,2) NOT NULL CHECK (Себестоимость > 0),
    FOREIGN KEY (ID_предприятия) REFERENCES Предприятия(ID_предприятия),
    FOREIGN KEY (ID_продукции) REFERENCES Продукция(ID_продукции)
);