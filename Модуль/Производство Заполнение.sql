-- Вставка тестовых записей в таблицу Manufacturers
INSERT INTO Manufacturers (ManufacturerCode, ManufacturerName, Address, Phone)
VALUES 
('M001', 'Производитель А', 'г. Москва, ул. Ленина, д. 1', '123-456'),
('M002', 'Производитель Б', 'г. Санкт-Петербург, ул. Пушкина, д. 2', '789-012'),
('M003', 'Производитель В', 'г. Казань, ул. Горького, д. 3', '345-678');

-- Вставка тестовых записей в таблицу Products
INSERT INTO Products (ProductCode, ProductName, IsStandard, Notes, AnnualProductionVolume)
VALUES 
('P001', 'Изделие 1', 1, 'Стандартное изделие', 10000),
('P002', 'Изделие 2', 0, 'Нестандартное изделие', 5000),
('P003', 'Изделие 3', 1, NULL, 15000),
('P004', 'Изделие 4', 0, NULL, 2000);

-- Вставка тестовых записей в таблицу Materials
INSERT INTO Materials (MaterialName, MaterialType, UnitOfMeasure, PricePerUnit, IsUsedInProduct)
VALUES 
('Сталь', 'Металл', 'кг', 50.00, 1),
('Алюминий', 'Цветной металл', 'кг', 100.00, 1),
('Лапша', 'Продукты питания', 'кг', 30.00, 1),
('Пластик', 'Полимер', 'кг', 20.00, 1);

-- Вставка тестовых записей в таблицу ProductSpecifications
INSERT INTO ProductSpecifications (ProductID, MaterialID, Quantity, SpecificationDate)
VALUES 
(1, 1, 2000, '2023-01-01'),
(1, 2, 1000, '2023-01-01'),
(2, 1, 1500, '2023-01-01'),
(2, 3, 3000, '2023-01-01'),
(3, 2, 2500, '2023-01-01'),
(4, 4, 5000, '2023-01-01');

-- Вставка тестовых записей в таблицу ProductionRecords
INSERT INTO ProductionRecords (ProductID, ManufacturerID, YearOfProduction, ProductionVolume)
VALUES 
(1, 1, 2000, 8000),
(1, 2, 2001, 9000),
(2, 1, 2000, 4000),
(3, 3, 2000, 12000),
(4, 2, 2000, 1500);
