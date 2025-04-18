-- Таблица типов самолетов
CREATE TABLE Типы_самолетов (
    ID_типа INT PRIMARY KEY IDENTITY(1,1),
    Название_типа NVARCHAR(50) NOT NULL UNIQUE,
    Число_мест INT NOT NULL CHECK (Число_мест > 0),
    Скорость_полета INT NOT NULL CHECK (Скорость_полета > 0) -- км/ч
);

-- Таблица маршрутов
CREATE TABLE Маршруты (
    ID_маршрута INT PRIMARY KEY IDENTITY(1,1),
    Номер_маршрута NVARCHAR(20) NOT NULL UNIQUE,
    Пункт_вылета NVARCHAR(100) NOT NULL,
    Пункт_назначения NVARCHAR(100) NOT NULL,
    Расстояние INT NOT NULL CHECK (Расстояние > 0) -- км
);

-- Таблица самолетов
CREATE TABLE Самолеты (
    ID_самолета INT PRIMARY KEY IDENTITY(1,1),
    Номер_самолета NVARCHAR(20) NOT NULL UNIQUE,
    ID_типа INT NOT NULL,
    FOREIGN KEY (ID_типа) REFERENCES Типы_самолетов(ID_типа)
);

-- Таблица рейсов
CREATE TABLE Рейсы (
    ID_рейса INT PRIMARY KEY IDENTITY(1,1),
    ID_самолета INT NOT NULL,
    ID_маршрута INT NOT NULL,
    Дата_вылета DATETIME NOT NULL,
    Дата_прилета DATETIME NOT NULL,
    Проданные_билеты INT NOT NULL CHECK (Проданные_билеты >= 0),
    FOREIGN KEY (ID_самолета) REFERENCES Самолеты(ID_самолета),
    FOREIGN KEY (ID_маршрута) REFERENCES Маршруты(ID_маршрута),
    CHECK (Дата_прилета > Дата_вылета)
);