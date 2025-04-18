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
