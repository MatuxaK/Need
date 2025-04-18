-- Таблица работ
CREATE TABLE Работы (
    ID_работы INT PRIMARY KEY IDENTITY(1,1),
    Шифр_работы NVARCHAR(20) NOT NULL UNIQUE,
    Название_работы NVARCHAR(200) NOT NULL,
    Трудоемкость_часы DECIMAL(10,2) NOT NULL CHECK (Трудоемкость_часы > 0),
    Дата_завершения DATE NOT NULL
);

-- Таблица должностей
CREATE TABLE Должности (
    ID_должности INT PRIMARY KEY IDENTITY(1,1),
    Название_должности NVARCHAR(100) NOT NULL UNIQUE,
    Описание NVARCHAR(500)
);

-- Таблица сотрудников
CREATE TABLE Сотрудники (
    ID_сотрудника INT PRIMARY KEY IDENTITY(1,1),
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Отчество NVARCHAR(50),
    ID_должности INT NOT NULL,
    Табельный_номер NVARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (ID_должности) REFERENCES Должности(ID_должности)
);

-- Таблица поручений
CREATE TABLE Поручения (
    ID_поручения INT PRIMARY KEY IDENTITY(1,1),
    ID_работы INT NOT NULL,
    ID_сотрудника INT NOT NULL,
    Дата_выдачи DATE NOT NULL,
    Трудоемкость_часы DECIMAL(10,2) NOT NULL CHECK (Трудоемкость_часы > 0),
    Плановая_дата_окончания DATE NOT NULL,
    Реальная_дата_окончания DATE,
    Процент_выполнения DECIMAL(5,2) NOT NULL CHECK (Процент_выполнения >= 0 AND Процент_выполнения <= 100) DEFAULT 0,
    FOREIGN KEY (ID_работы) REFERENCES Работы(ID_работы),
    FOREIGN KEY (ID_сотрудника) REFERENCES Сотрудники(ID_сотрудника),
    CHECK (Плановая_дата_окончания >= Дата_выдачи),
    CHECK (Реальная_дата_окончания >= Дата_выдачи OR Реальная_дата_окончания IS NULL)
);