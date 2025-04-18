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