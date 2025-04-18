-- Таблица социальных статусов
CREATE TABLE Социальные_статусы (
    ID_статуса INT PRIMARY KEY IDENTITY(1,1),
    Название_статуса NVARCHAR(50) NOT NULL UNIQUE CHECK (Название_статуса IN ('учащийся', 'работающий', 'временно неработающий', 'инвалид', 'пенсионер'))
);

-- Таблица текущих состояний пациентов
CREATE TABLE Состояния_пациентов (
    ID_состояния INT PRIMARY KEY IDENTITY(1,1),
    Название_состояния NVARCHAR(50) NOT NULL UNIQUE CHECK (Название_состояния IN ('лечится', 'вылечился', 'направлен в стационар', 'умер'))
);

-- Таблица специализаций врачей
CREATE TABLE Специализации_врачей (
    ID_специализации INT PRIMARY KEY IDENTITY(1,1),
    Название_специализации NVARCHAR(50) NOT NULL UNIQUE
);

-- Таблица квалификаций врачей
CREATE TABLE Квалификации_врачей (
    ID_квалификации INT PRIMARY KEY IDENTITY(1,1),
    Название_квалификации NVARCHAR(20) NOT NULL UNIQUE CHECK (Название_квалификации IN ('1-я категория', '2-я категория', '3-я категория'))
);

-- Таблица пациентов
CREATE TABLE Пациенты (
    ID_пациента INT PRIMARY KEY IDENTITY(1,1),
    Номер_карты NVARCHAR(20) NOT NULL UNIQUE,
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Отчество NVARCHAR(50),
    Дата_рождения DATE NOT NULL,
    ID_социального_статуса INT NOT NULL,
    ID_текущего_состояния INT NOT NULL,
    FOREIGN KEY (ID_социального_статуса) REFERENCES Социальные_статусы(ID_статуса),
    FOREIGN KEY (ID_текущего_состояния) REFERENCES Состояния_пациентов(ID_состояния)
);

-- Таблица врачей
CREATE TABLE Врачи (
    ID_врача INT PRIMARY KEY IDENTITY(1,1),
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Отчество NVARCHAR(50),
    Должность NVARCHAR(100) NOT NULL,
    ID_специализации INT NOT NULL,
    ID_квалификации INT NOT NULL,
    FOREIGN KEY (ID_специализации) REFERENCES Специализации_врачей(ID_специализации),
    FOREIGN KEY (ID_квалификации) REFERENCES Квалификации_врачей(ID_квалификации)
);

-- Таблица диагнозов
CREATE TABLE Диагнозы (
    ID_диагноза INT PRIMARY KEY IDENTITY(1,1),
    Название_диагноза NVARCHAR(100) NOT NULL UNIQUE
);

-- Таблица лечебных случаев (связь пациентов и врачей)
CREATE TABLE Лечебные_случаи (
    ID_случая INT PRIMARY KEY IDENTITY(1,1),
    ID_пациента INT NOT NULL,
    ID_врача INT NOT NULL,
    ID_диагноза INT NOT NULL,
    Амбулаторное_лечение BIT NOT NULL,
    Срок_потери_трудоспособности INT CHECK (Срок_потери_трудоспособности >= 0),
    На_диспансерном_учете BIT NOT NULL,
    Дата_начала_лечения DATE NOT NULL,
    FOREIGN KEY (ID_пациента) REFERENCES Пациенты(ID_пациента),
    FOREIGN KEY (ID_врача) REFERENCES Врачи(ID_врача),
    FOREIGN KEY (ID_диагноза) REFERENCES Диагнозы(ID_диагноза)
);