-- Таблица владельцев автомобилей
CREATE TABLE Владельцы (
    ID_владельца INT PRIMARY KEY IDENTITY(1,1),
    Номер_прав NVARCHAR(20) NOT NULL UNIQUE,
    ФИО NVARCHAR(100) NOT NULL,
    Адрес NVARCHAR(200),
    Телефон NVARCHAR(20)
);

-- Таблица автомобилей
CREATE TABLE Автомобили (
    ID_автомобиля INT PRIMARY KEY IDENTITY(1,1),
    Номер_авто NVARCHAR(15) NOT NULL UNIQUE,
    Марка NVARCHAR(50) NOT NULL,
    Модель NVARCHAR(50),
    Мощность INT CHECK (Мощность > 0),
    Год_выпуска INT NOT NULL CHECK (Год_выпуска > 1900),
    Цвет NVARCHAR(30),
    ID_владельца INT NOT NULL,
    FOREIGN KEY (ID_владельца) REFERENCES Владельцы(ID_владельца)
);

-- Таблица механиков
CREATE TABLE Механики (
    ID_механика INT PRIMARY KEY IDENTITY(1,1),
    Табельный_номер NVARCHAR(10) NOT NULL UNIQUE,
    ФИО NVARCHAR(100) NOT NULL,
    Адрес NVARCHAR(200),
    Телефон NVARCHAR(20),
    Разряд INT CHECK (Разряд BETWEEN 1 AND 8)
);

-- Таблица мастерских
CREATE TABLE Мастерские (
    ID_мастерской INT PRIMARY KEY IDENTITY(1,1),
    Номер_мастерской NVARCHAR(10) NOT NULL UNIQUE,
    Название NVARCHAR(100) NOT NULL,
    Адрес NVARCHAR(200) NOT NULL,
    Телефон NVARCHAR(20)
);

-- Таблица категорий работ
CREATE TABLE Категории_работ (
    ID_категории INT PRIMARY KEY IDENTITY(1,1),
    Название_категории NVARCHAR(50) NOT NULL UNIQUE,
    Описание NVARCHAR(200)
);

-- Таблица нарядов на ремонт
CREATE TABLE Наряды (
    ID_наряда INT PRIMARY KEY IDENTITY(1,1),
    ID_автомобиля INT NOT NULL,
    ID_мастерской INT NOT NULL,
    Стоимость DECIMAL(10,2) CHECK (Стоимость >= 0),
    Дата_выдачи DATE NOT NULL,
    Плановая_дата_окончания DATE NOT NULL,
    Реальная_дата_окончания DATE,
    ID_категории INT NOT NULL,
    FOREIGN KEY (ID_автомобиля) REFERENCES Автомобили(ID_автомобиля),
    FOREIGN KEY (ID_мастерской) REFERENCES Мастерские(ID_мастерской),
    FOREIGN KEY (ID_категории) REFERENCES Категории_работ(ID_категории),
    CHECK (Плановая_дата_окончания >= Дата_выдачи),
    CHECK (Реальная_дата_окончания >= Дата_выдачи OR Реальная_дата_окончания IS NULL)
);

-- Таблица назначений механиков (многие-ко-многим)
CREATE TABLE Назначения_механиков (
    ID_назначения INT PRIMARY KEY IDENTITY(1,1),
    ID_наряда INT NOT NULL,
    ID_механика INT NOT NULL,
    FOREIGN KEY (ID_наряда) REFERENCES Наряды(ID_наряда),
    FOREIGN KEY (ID_механика) REFERENCES Механики(ID_механика),
    UNIQUE (ID_наряда, ID_механика)
);