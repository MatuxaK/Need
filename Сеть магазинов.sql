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

-- Заполнение таблицы владельцев
INSERT INTO Owners (owner_id, full_name, address, phone, salary, registration_number, registration_date) VALUES
(1, 'Кузнецов Алексей', 'Киевский, ул. Пушкина, 10', '123-4567', 5000.00, 'REG12345', '2020-01-01'),
(2, 'Иванова Мария', 'Центральный, ул. Ленина, 20', '987-6543', 6000.00, 'REG12346', '2021-03-12'),
(3, 'Петров Дмитрий', 'Киевский, ул. Мира, 5', '321-7654', 7000.00, 'REG12347', '2019-11-30'),
(4, 'Сидорова Анна', 'Северный, ул. Гоголя, 15', '654-3210', 5500.00, 'REG12348', '2022-06-15');

-- Заполнение таблицы магазинов
INSERT INTO Stores (store_id, name, address, phone, authorized_capital, profile) VALUES
(1, 'Продуктовый Магазин', 'Киевский, ул. Чернышевского, 8', '111-2222', 20000.00, 'продуктовый'),
(2, 'Галантерейный Магазин', 'Центральный, ул. Гагарина, 21', '333-4444', 25000.00, 'галантерейный'),
(3, 'Канцелярский Магазин', 'Киевский, ул. Аксакова, 12', '555-6666', 15000.00, 'канцелярский'),
(4, 'Спорттовары', 'Северный, ул. Спортивная, 3', '777-8888', 30000.00, 'спортивный');

-- Заполнение таблицы поставщиков
INSERT INTO Suppliers (supplier_id, full_name, address, phone, delivery_cost) VALUES
(1, 'ОАО "Поставщик1"', 'Киев, ул. Садовая, 4', '999-0000', 1500.00),
(2, 'ИП "Поставщик2"', 'Киев, ул. Фрунзе, 22', '888-2222', 1200.00),
(3, 'ЗАО "Поставщик3"', 'Северный, ул. Лесная, 8', '777-5555', 1700.00);

-- Заполнение таблицы принадлежности магазинов владельцам
INSERT INTO Ownerships (ownership_id, store_id, owner_id, capital_percentage) VALUES
(1, 1, 1, 60.00),
(2, 1, 3, 40.00),
(3, 2, 2, 100.00),
(4, 3, 1, 70.00),
(5, 4, 4, 100.00);
-- 1. Определение самого молодого предпринимателя, владеющего собственностью в районе 'Киевский'
SELECT full_name, registration_date
FROM Owners
WHERE address LIKE '%Киевский%'
ORDER BY registration_date DESC;

-- 2. Определение случаев, когда регистрировалось владение лицам, не достигшим 18 лет
SELECT *
FROM Owners
WHERE DATEDIFF(YEAR, registration_date, GETDATE()) < 18;

-- 3. Определение случаев, когда больше 50% уставного капитала магазина внесено предпринимателем, проживающим в другом районе
SELECT o.full_name, s.name AS store_name, o.address AS owner_address, o.registration_number
FROM Ownerships ow
JOIN Owners o ON ow.owner_id = o.owner_id
JOIN Stores s ON ow.store_id = s.store_id
WHERE ow.capital_percentage > 50 
AND o.address NOT LIKE '%' + s.address + '%';

-- 4. Вывод списка профилей магазинов, которыми владеет предприниматель 'Кузнецов' в порядке убывания вложенного в них капитала
SELECT s.profile, s.authorized_capital
FROM Ownerships ow
JOIN Owners o ON ow.owner_id = o.owner_id
JOIN Stores s ON ow.store_id = s.store_id
WHERE o.full_name = 'Кузнецов'
ORDER BY s.authorized_capital DESC;
