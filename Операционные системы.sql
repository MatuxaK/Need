-- Таблица процессов
CREATE TABLE Processes (
    process_id INT PRIMARY KEY IDENTITY(1,1),
    process_name NVARCHAR(255) NOT NULL,
    priority INT CHECK (priority BETWEEN 1 AND 4),  -- 1 = критический, 2 = высокий, 3 = нормальный, 4 = запасной
    class NVARCHAR(20) NOT NULL,
    owner_id INT NOT NULL         -- Идентификатор владельца
);

-- Таблица ресурсов
CREATE TABLE Resources (
    resource_id INT PRIMARY KEY IDENTITY(1,1),
    resource_name NVARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),  -- Количество
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0) -- Цена за единицу
);

-- Таблица заявок на ресурсы
CREATE TABLE Resource_Allocations (
    allocation_id INT PRIMARY KEY IDENTITY(1,1),
    process_id INT NOT NULL,
    resource_id INT NOT NULL,
    requested_quantity INT NOT NULL CHECK (requested_quantity > 0),
    allocated_quantity INT NOT NULL CHECK (allocated_quantity >= 0),
    FOREIGN KEY (process_id) REFERENCES Processes(process_id),
    FOREIGN KEY (resource_id) REFERENCES Resources(resource_id)
);

-- Вставка тестовых данных в таблицу процессов
INSERT INTO Processes (process_name, priority, class, owner_id) VALUES
('Process A', 1, 'Критический', 1001),
('Process B', 2, 'Высокий', 1002),
('Process C', 3, 'Нормальный', 1003),
('Process D', 4, 'Запасной', 1004),
('Process E', 3, 'Нормальный', 1005);

-- Вставка тестовых данных в таблицу ресурсов
INSERT INTO Resources (resource_name, quantity, unit_price) VALUES
('файл data1', 100, 10.00),
('файл data2', 150, 15.00),
('файл data3', 200, 20.00);

-- Вставка тестовых данных в таблицу заявок на ресурсы
INSERT INTO Resource_Allocations (process_id, resource_id, requested_quantity, allocated_quantity) VALUES
(1, 1, 50, 50),
(2, 1, 30, 20),
(3, 2, 100, 100),
(4, 3, 50, 0), -- Заявка не выполнена
(5, 2, 70, 30);
SELECT DISTINCT p.process_name
FROM Resource_Allocations ra
JOIN Processes p ON ra.process_id = p.process_id
JOIN Resources r ON ra.resource_id = r.resource_id
WHERE ra.requested_quantity > r.quantity;

SELECT p.process_name, ra.requested_quantity
FROM Resource_Allocations ra
JOIN Processes p ON ra.process_id = p.process_id
WHERE ra.resource_id = (SELECT resource_id FROM Resources WHERE resource_name = 'файл data1')
ORDER BY p.priority ASC; -- Убывание приоритета

SELECT DISTINCT r.resource_name
FROM Resource_Allocations ra
JOIN Processes p_alloc ON ra.process_id = p_alloc.process_id
JOIN Resources r ON ra.resource_id = r.resource_id
JOIN Resource_Allocations ra_owner ON r.resource_id = ra_owner.resource_id
JOIN Processes p_owner ON ra_owner.process_id = p_owner.process_id
WHERE p_alloc.priority < p_owner.priority;