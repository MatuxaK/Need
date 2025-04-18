-- Создание таблицы владельцев
CREATE TABLE Owners (
    owner_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    registration_date DATE NOT NULL
);

-- Создание таблицы магазинов
CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    authorized_capital DECIMAL(10, 2) NOT NULL,
    profile VARCHAR(100) NOT NULL
);

-- Создание таблицы поставщиков
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    delivery_cost DECIMAL(10, 2) NOT NULL
);

-- Создание таблицы для хранения принадлежности магазинов владельцам
CREATE TABLE Ownerships (
    ownership_id INT PRIMARY KEY,
    store_id INT NOT NULL,
    owner_id INT NOT NULL,
    capital_percentage DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);
