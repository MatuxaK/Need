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
