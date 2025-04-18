-- Создание таблицы актеров
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    title VARCHAR(100),
    role_type VARCHAR(100),  -- амплуа
    gender CHAR(1) -- 'M' для мужчины, 'F' для женщины
);

-- Создание таблицы ролей
CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    role_type VARCHAR(100), -- тип рати (главная, вторая, эпизод, статист и т.д.)
    play_title VARCHAR(255) -- название пьесы
);

-- Создание таблицы назначений ролей
CREATE TABLE RoleAssignments (
    assignment_id INT PRIMARY KEY,
    actor_id INT NOT NULL,
    role_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    role_type VARCHAR(100), -- тип роли
    director VARCHAR(255),   -- режиссер
    cast_number INT,         -- номер состава
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);
