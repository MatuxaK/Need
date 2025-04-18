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
