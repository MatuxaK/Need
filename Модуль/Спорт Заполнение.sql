-- Вставка данных (Примеры)
INSERT INTO Sports (SportName, UnitOfMeasure, WorldRecord, RecordDate) VALUES
('Бег', 'секунды', 9.58, '2009-08-16'),
('Шахматы', 'очки', NULL, NULL),
('Плавание', 'секунды', 46.91, '2009-07-30'),
('Велоспорт', 'часы', 5.26, '2022-08-13');

INSERT INTO Athletes (FullName, DateOfBirth, Team, SportsRank) VALUES
('Караваев', '1990-05-10', 'Динамо', 'КМС'),
('Сидоров', '1988-11-22', 'Спартак', 'МС'),
('Петров', '1992-07-01', 'ЦСКА', 'КМС'),
('Смирнов', '1985-09-18', 'Торпедо', 'МС');

INSERT INTO Competitions (CompetitionName, AthleteID, SportID, Result, CompetitionDate, CompetitionPlace) VALUES
('Открытый чемпионат Киева', 1, 2, 10.00, '2011-01-05', 'Киев');

INSERT INTO AthleteSports (AthleteID, SportID) VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,1),
(3,4),
(4,1),
(4,2),
(4,3),
(4,4);