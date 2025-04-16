-- Создание таблицы Производители
CREATE TABLE Производители (
    ID INT PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Страна VARCHAR(50) NOT NULL,
    Город VARCHAR(50) NOT NULL,
    Адрес VARCHAR(100) NOT NULL
);

-- Создание таблицы Модели_ПЭВМ
CREATE TABLE Модели_ПЭВМ (
    ID INT PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Тип_процессора VARCHAR(50) NOT NULL,
    Тактовая_частота DECIMAL(5,2) NOT NULL,
    Объем_ОЗУ INT NOT NULL,
    Объем_ЖД INT NOT NULL,
    Дата_выпуска DATE NOT NULL
);

-- Создание таблицы Продавцы
CREATE TABLE Продавцы (
    ID INT PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Адрес VARCHAR(100) NOT NULL,
    Телефон VARCHAR(20) NOT NULL
);

-- Создание таблицы Поставки
CREATE TABLE Поставки (
    ID_производителя INT NOT NULL,
    ID_модели INT NOT NULL,
    ID_продавца INT NOT NULL,
    Объем_партии INT NOT NULL,
    Цена_партии DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ID_производителя, ID_модели, ID_продавца),
    FOREIGN KEY (ID_производителя) REFERENCES Производители(ID),
    FOREIGN KEY (ID_модели) REFERENCES Модели_ПЭВМ(ID),
    FOREIGN KEY (ID_продавца) REFERENCES Продавцы(ID)
);