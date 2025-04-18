INSERT INTO Teachers (FullName, Address, Position, AcademicDegree) VALUES
('Иванов Иван', 'ул. Ленина, 1', 'Доцент', 'Кандидат наук');

INSERT INTO Disciplines (DisciplineCode, DisciplineName, Hours, ControlType, Cycle) VALUES
('123', 'Математика', 100, 'Экзамен', 'Математический');

INSERT INTO Departments (DepartmentCode, DepartmentName, HeadTeacherID) VALUES
('ФИТ', 'Факультет информационных технологий', 1);

INSERT INTO Classrooms (ClassroomNumber) VALUES
('301');

INSERT INTO Schedules (TeacherID, DisciplineID, ClassroomID, Date, Time, GroupID) VALUES
(1, 1, 1, '2023-01-10', '10:00', 'АП-17а');