-- Таблица семейств животных
CREATE TABLE Семейства (
    ID_семейства INT PRIMARY KEY IDENTITY(1,1),
    Название_семейства NVARCHAR(100) NOT NULL UNIQUE,
    Описание NVARCHAR(500)
);

-- Таблица континентов
CREATE TABLE Континенты (
    ID_континента INT PRIMARY KEY IDENTITY(1,1),
    Название_континента NVARCHAR(50) NOT NULL UNIQUE
);

-- Таблица видов животных
CREATE TABLE Виды_животных (
    ID_вида INT PRIMARY KEY IDENTITY(1,1),
    Название_вида NVARCHAR(100) NOT NULL UNIQUE,
    ID_семейства INT NOT NULL,
    ID_континента INT NOT NULL,
    Суточное_потребление_корма DECIMAL(10,2) NOT NULL CHECK (Суточное_потребление_корма > 0),
    FOREIGN KEY (ID_семейства) REFERENCES Семейства(ID_семейства),
    FOREIGN KEY (ID_континента) REFERENCES Континенты(ID_континента)
);

-- Таблица комплексов/помещений
CREATE TABLE Комплексы (
    ID_комплекса INT PRIMARY KEY IDENTITY(1,1),
    Название_комплекса NVARCHAR(100) NOT NULL,
    Номер_помещения NVARCHAR(20) NOT NULL,
    Наличие_водоема BIT DEFAULT 0,
    Отопление BIT DEFAULT 0,
    Вместимость INT NOT NULL CHECK (Вместимость > 0),
    UNIQUE (Название_комплекса, Номер_помещения)
);

-- Таблица размещения животных
CREATE TABLE Размещение_животных (
    ID_размещения INT PRIMARY KEY IDENTITY(1,1),
    ID_вида INT NOT NULL,
    ID_комплекса INT NOT NULL,
    Количество_особей INT NOT NULL CHECK (Количество_особей > 0),
    Дата_заселения DATE NOT NULL,
    FOREIGN KEY (ID_вида) REFERENCES Виды_животных(ID_вида),
    FOREIGN KEY (ID_комплекса) REFERENCES Комплексы(ID_комплекса)
);

-- Таблица размножения животных
CREATE TABLE Размножение (
    ID_размножения INT PRIMARY KEY IDENTITY(1,1),
    ID_вида INT NOT NULL,
    ID_комплекса INT NOT NULL,
    Дата_размножения DATE NOT NULL,
    Количество_потомства INT NOT NULL CHECK (Количество_потомства > 0),
    FOREIGN KEY (ID_вида) REFERENCES Виды_животных(ID_вида),
    FOREIGN KEY (ID_комплекса) REFERENCES Комплексы(ID_комплекса)
);