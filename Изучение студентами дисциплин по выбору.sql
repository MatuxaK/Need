-- Создание таблицы 'Students'
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255),
    Address NVARCHAR(255),
    PhoneNumber NVARCHAR(20),
    RecordBookNumber NVARCHAR(50)
);

-- Создание таблицы 'DeansOffices'
CREATE TABLE DeansOffices (
    OfficeID INT IDENTITY(1,1) PRIMARY KEY,
    OfficeName NVARCHAR(255),
    Address NVARCHAR(255)
);

-- Создание таблицы 'Groups'
CREATE TABLE Groups (
    GroupID INT IDENTITY(1,1) PRIMARY KEY,
    GroupName NVARCHAR(50),
    Speciality NVARCHAR(255)
);

-- Создание таблицы 'Disciplines'
CREATE TABLE Disciplines (
    DisciplineID INT IDENTITY(1,1) PRIMARY KEY,
    DisciplineName NVARCHAR(255),
    LectureHours INT,
    SeminarHours INT,
    LaboratoryHours INT
);

-- Создание таблицы 'StudentDisciplines'
CREATE TABLE StudentDisciplines (
    StudentID INT,
    DisciplineID INT,
    Grade NVARCHAR(50),
    PRIMARY KEY (StudentID, DisciplineID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID)
);

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

-- 1. Получить список студентов, изучающих заданную дисциплину и сдавших ее
SELECT S.FullName
FROM Students S
JOIN StudentDisciplines SD ON S.StudentID = SD.StudentID
JOIN Disciplines D ON SD.DisciplineID = D.DisciplineID
WHERE D.DisciplineName = 'Алгоритмы и структуры данных' AND SD.Grade IS NOT NULL;

-- 2. Получить список дисциплин, изученных заданным студентом и объем дисциплины
SELECT D.DisciplineName, D.LectureHours + D.SeminarHours + D.LaboratoryHours AS TotalHours
FROM Disciplines D
JOIN StudentDisciplines SD ON D.DisciplineID = SD.DisciplineID
JOIN Students S ON SD.StudentID = S.StudentID
WHERE S.FullName = 'Иванов Иван';

-- 3. Получить список адресов деканата
SELECT Address FROM DeansOffices;