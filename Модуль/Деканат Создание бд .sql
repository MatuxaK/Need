-- Таблица категорий дисциплин
CREATE TABLE Категории_дисциплин (
    ID_категории INT PRIMARY KEY IDENTITY(1,1),
    Название_категории NVARCHAR(50) NOT NULL CHECK (Название_категории IN ('гуманитарная', 'математическая', 'компьютерная', 'общеинженерная', 'естественнонаучная', 'специальная'))
);

-- Таблица дисциплин
CREATE TABLE Дисциплины (
    ID_дисциплины INT PRIMARY KEY IDENTITY(1,1),
    Название_дисциплины NVARCHAR(100) NOT NULL,
    ID_категории INT NOT NULL,
    Объем_часов INT NOT NULL CHECK (Объем_часов > 0),
    FOREIGN KEY (ID_категории) REFERENCES Категории_дисциплин(ID_категории)
);

-- Таблица преподавателей
CREATE TABLE Преподаватели (
    ID_преподавателя INT PRIMARY KEY IDENTITY(1,1),
    ФИО NVARCHAR(100) NOT NULL,
    Должность NVARCHAR(50)
);

-- Таблица групп
CREATE TABLE Группы (
    ID_группы INT PRIMARY KEY IDENTITY(1,1),
    Код_группы NVARCHAR(10) NOT NULL UNIQUE,
    Курс INT NOT NULL CHECK (Курс BETWEEN 1 AND 6),
    Количество_студентов INT NOT NULL CHECK (Количество_студентов > 0)
);

-- Таблица учебного плана (связь групп и дисциплин)
CREATE TABLE Учебный_план (
    ID_записи INT PRIMARY KEY IDENTITY(1,1),
    ID_группы INT NOT NULL,
    ID_дисциплины INT NOT NULL,
    Общий_объем_часов INT NOT NULL CHECK (Общий_объем_часов > 0),
    FOREIGN KEY (ID_группы) REFERENCES Группы(ID_группы),
    FOREIGN KEY (ID_дисциплины) REFERENCES Дисциплины(ID_дисциплины),
    UNIQUE (ID_группы, ID_дисциплины)
);

-- Таблица контроля (экзамены/зачеты)
CREATE TABLE Контроль (
    ID_контроля INT PRIMARY KEY IDENTITY(1,1),
    ID_группы INT NOT NULL,
    ID_дисциплины INT NOT NULL,
    ID_преподавателя INT NOT NULL,
    Вид_контроля NVARCHAR(10) NOT NULL CHECK (Вид_контроля IN ('зачет', 'экзамен')),
    Дата DATE NOT NULL,
    FOREIGN KEY (ID_группы) REFERENCES Группы(ID_группы),
    FOREIGN KEY (ID_дисциплины) REFERENCES Дисциплины(ID_дисциплины),
    FOREIGN KEY (ID_преподавателя) REFERENCES Преподаватели(ID_преподавателя)
);