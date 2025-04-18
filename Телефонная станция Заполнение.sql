-- Вставка данных (Примеры)
INSERT INTO Subscribers (PhoneNumber, FullName, Address, HasBlocker, Note, ATSCode, AreaCode, Debt, InstallationDate) VALUES
('123-45-67', 'Иванов Иван', 'ул. Ленина, 1', 0, 'Квартира', '47', '123', 50.00, '2010-01-10'),
('234-56-78', 'Петров Петр', 'ул. Гагарина, 2', 1, 'Офис', '47', '123', 150.00, '2011-05-15'),
('345-67-89', 'Сидоров Сидор', 'ул. Пушкина, 3', 0, 'Квартира', '48', '234', 20.00, '2012-03-20');

INSERT INTO PairedNumbers (PhoneNumber1, PhoneNumber2, ATSCode) VALUES
('111-22-33', '444-55-66', '47'),
('777-88-99', '000-11-22', '48');