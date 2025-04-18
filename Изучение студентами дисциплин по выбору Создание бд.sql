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