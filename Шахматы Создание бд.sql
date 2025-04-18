-- Таблица спортивных разрядов
CREATE TABLE Разряды (
    ID_разряда INT PRIMARY KEY IDENTITY(1,1),
    Название_разряда NVARCHAR(50) NOT NULL UNIQUE
);

-- Таблица уровней турниров
CREATE TABLE Уровни_турниров (
    ID_уровня INT PRIMARY KEY IDENTITY(1,1),
    Название_уровня NVARCHAR(50) NOT NULL UNIQUE
);

-- Таблица шахматистов
CREATE TABLE Шахматисты (
    ID_шахматиста INT PRIMARY KEY IDENTITY(1,1),
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Дата_рождения DATE NOT NULL,
    Страна NVARCHAR(50) NOT NULL,
    ID_разряда INT,
    Участвовал_в_чемпионате_мира BIT DEFAULT 0,
    Рейтинг INT CHECK (Рейтинг >= 0),
    FOREIGN KEY (ID_разряда) REFERENCES Разряды(ID_разряда)
);

-- Таблица турниров
CREATE TABLE Турниры (
    ID_турнира INT PRIMARY KEY IDENTITY(1,1),
    Название_турнира NVARCHAR(100) NOT NULL,
    Страна NVARCHAR(50) NOT NULL,
    Город NVARCHAR(50) NOT NULL,
    Дата_начала DATE NOT NULL,
    Дата_окончания DATE NOT NULL,
    ID_уровня INT NOT NULL,
    FOREIGN KEY (ID_уровня) REFERENCES Уровни_турниров(ID_уровня),
    CHECK (Дата_окончания >= Дата_начала)
);

-- Таблица участия в турнирах
CREATE TABLE Участие_в_турнирах (
    ID_участия INT PRIMARY KEY IDENTITY(1,1),
    ID_турнира INT NOT NULL,
    ID_шахматиста INT NOT NULL,
    Стартовый_номер INT NOT NULL,
    Занятое_место INT NOT NULL CHECK (Занятое_место > 0),
    FOREIGN KEY (ID_турнира) REFERENCES Турниры(ID_турнира),
    FOREIGN KEY (ID_шахматиста) REFERENCES Шахматисты(ID_шахматиста),
    UNIQUE (ID_турнира, ID_шахматиста),
    UNIQUE (ID_турнира, Стартовый_номер)
);