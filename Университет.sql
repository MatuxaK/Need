-- Создание таблицы 'Teachers'
CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255),
Address NVARCHAR(255),
    Position NVARCHAR(255),
    AcademicDegree NVARCHAR(255)
);

-- Создание таблицы 'Disciplines'
CREATE TABLE Disciplines (
    DisciplineID INT IDENTITY(1,1) PRIMARY KEY,
    DisciplineCode NVARCHAR(50),
    DisciplineName NVARCHAR(255),
    Hours INT,
    ControlType NVARCHAR(255),
    Cycle NVARCHAR(255)
);

-- Создание таблицы 'Departments'
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentCode NVARCHAR(50),
    DepartmentName NVARCHAR(255),
    HeadTeacherID INT,
    FOREIGN KEY (HeadTeacherID) REFERENCES Teachers(TeacherID)
);

-- Создание таблицы 'Classrooms'
CREATE TABLE Classrooms (
    ClassroomID INT IDENTITY(1,1) PRIMARY KEY,
    ClassroomNumber NVARCHAR(50)
);

-- Создание таблицы 'Schedules'
CREATE TABLE Schedules (
    ScheduleID INT IDENTITY(1,1) PRIMARY KEY,
    TeacherID INT,
    DisciplineID INT,
    ClassroomID INT,
    Date DATE,
    Time TIME,
    GroupID NVARCHAR(50),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID),
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID)
);
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

SELECT t.FullName, t.Position
FROM Teachers t
WHERE t.TeacherID NOT IN (
    SELECT DISTINCT s.TeacherID
    FROM Schedules s
    WHERE s.Date BETWEEN '2001-03-01' AND '2001-05-31' -- весенний семестр
)
ORDER BY t.FullName;

SELECT D.DisciplineName, S.Date, S.Time
FROM Schedules S
JOIN Disciplines D ON S.DisciplineID = D.DisciplineID
WHERE S.GroupID = 'АП-17а' AND S.Date BETWEEN '2001-03-01' AND '2001-03-31';