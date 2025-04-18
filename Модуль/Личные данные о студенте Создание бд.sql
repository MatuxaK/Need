-- Таблица факультетов
CREATE TABLE Факультеты (
    ID_факультета INT PRIMARY KEY IDENTITY(1,1),
    Название_факультета NVARCHAR(100) NOT NULL,
    Количество_мест INT NOT NULL CHECK (Количество_мест > 0),
    Описание NVARCHAR(255)
);

-- Таблица групп
CREATE TABLE Группы (
    ID_группы INT PRIMARY KEY IDENTITY(1,1),
    Номер_группы NVARCHAR(20) NOT NULL,
    ID_факультета INT NOT NULL,
    Год_формирования INT NOT NULL CHECK (Год_формирования > 1900),
    FOREIGN KEY (ID_факультета) REFERENCES Факультеты(ID_факультета)
);

-- Таблица студентов
CREATE TABLE Студенты (
    ID_студента INT PRIMARY KEY IDENTITY(1,1),
    Фамилия NVARCHAR(50) NOT NULL,
    Имя NVARCHAR(50) NOT NULL,
    Отчество NVARCHAR(50),
    Дата_рождения DATE NOT NULL,
    ID_семейного_положения INT,
    Сведения_о_семье NVARCHAR(500),
);

-- Таблица обучения (связь студентов, групп и специальностей)
CREATE TABLE Обучение (
    ID_обучения INT PRIMARY KEY IDENTITY(1,1),
    ID_студента INT NOT NULL,
    ID_группы INT NOT NULL,
    ID_специальности INT NOT NULL,
    Курс INT NOT NULL CHECK (Курс BETWEEN 1 AND 6),
    Стипендия DECIMAL(10,2) CHECK (Стипендия >= 0),
    Год_зачисления INT NOT NULL CHECK (Год_зачисления > 1900),
    FOREIGN KEY (ID_студента) REFERENCES Студенты(ID_студента),
    FOREIGN KEY (ID_группы) REFERENCES Группы(ID_группы),
    UNIQUE (ID_студента, ID_группы, ID_специальности)
);