-- Вставка данных (Примеры)
INSERT INTO Students (FullName, Address, PhoneNumber, RecordBookNumber) VALUES
('Иванов Иван', 'ул. Ленина, 1', '123-45-67', '12345'),
('Петров Петр', 'ул. Гагарина, 2', '234-56-78', '67890');

INSERT INTO DeansOffices (OfficeName, Address) VALUES
('Деканат ФИТ', 'ул. Университетская, 1');

INSERT INTO Groups (GroupName, Speciality) VALUES
('АП-11', 'Прикладная математика');

INSERT INTO Disciplines (DisciplineName, LectureHours, SeminarHours, LaboratoryHours) VALUES
('Алгоритмы и структуры данных', 32, 16, 32);

INSERT INTO StudentDisciplines (StudentID, DisciplineID, Grade) VALUES
(1, 1, 'Отлично'),
(2, 1, 'Хорошо');
