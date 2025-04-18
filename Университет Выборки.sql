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