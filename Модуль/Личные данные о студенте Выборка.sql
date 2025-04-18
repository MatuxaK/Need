SELECT 
    Курс, 
    COUNT(*) AS Количество_студентов
FROM 
    Обучение
GROUP BY 
    Курс
ORDER BY 
    Курс;

	SELECT 
    g.Номер_группы,
    SUM(o.Стипендия) AS Суммарная_стипендия
FROM 
    Обучение o
JOIN 
    Группы g ON o.ID_группы = g.ID_группы
GROUP BY 
    g.Номер_группы
ORDER BY 
    g.Номер_группы;

	SELECT 
    g.Номер_группы,
    COUNT(o.ID_студента) AS Численность_студентов
FROM 
    Группы g
JOIN 
    Факультеты f ON g.ID_факультета = f.ID_факультета
LEFT JOIN 
    Обучение o ON g.ID_группы = o.ID_группы
WHERE 
    f.Название_факультета = 'АП'
GROUP BY 
    g.Номер_группы
ORDER BY 
    g.Номер_группы;