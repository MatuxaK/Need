-- Создание таблицы лекарств
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    indications VARCHAR(255),       -- показания к использованию
    contraindications VARCHAR(255),  -- противопоказания
    manufacturer VARCHAR(255) NOT NULL,
    type VARCHAR(50),                -- тип (таблетки, микстура, мазь и т.д.)
    dosage VARCHAR(50),              -- дозировка
    price DECIMAL(10, 2) NOT NULL,   -- цена
    quantity INT NOT NULL,            -- количество
    expiry_date DATE NOT NULL         -- срок годности
);

-- Создание таблицы аптек
CREATE TABLE Pharmacies (
    pharmacy_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),      -- специализация аптеки
    district VARCHAR(100),            -- район
    phone VARCHAR(20)                 -- телефон
);

-- Создание таблицы, связывающей лекарства и аптеки
CREATE TABLE Pharmacy_Medicines (
    id INT PRIMARY KEY,
    pharmacy_id INT NOT NULL,
    medicine_id INT NOT NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacies(pharmacy_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
