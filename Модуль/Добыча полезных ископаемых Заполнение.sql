-- Вставка данных (Примеры)
INSERT INTO Minerals (MineralName, UnitOfMeasure, AnnualDemand, UnitPrice) VALUES
('Железная руда', 'тонна', 1000000, 500.00),
('Уголь', 'тонна', 2000000, 200.00);

INSERT INTO Deposits (DepositName, Reserves, DevelopmentMethod, AnnualProduction, CostPerUnit) VALUES
('Криворожское', 100000000, 'Открытый', 1000000, 100.00),
('Эльдорадо', 50000000, 'Шахтный', 500000, 150.00);

INSERT INTO ExtractionPoints (DepositID, MineralID) VALUES
(1, 1),
(2, 2);