-- 1. Определить спортсменов, которые выступают более чем в 3 видах спорта
SELECT A.FullName
FROM Athletes A
JOIN AthleteSports S ON A.AthleteID = S.AthleteID
GROUP BY A.FullName
HAVING COUNT(*) > 3;

-- 2. Вывести таблицу распределения мест в соревновании "открытый чемпионат в городе "Киев" по шахматам в 2011г
SELECT A.FullName, C.Result, C.CompetitionPlace
FROM Competitions C
JOIN Athletes A ON C.AthleteID = A.AthleteID
JOIN Sports S ON C.SportID = S.SportID
WHERE C.CompetitionName = 'Открытый чемпионат Киева' AND C.CompetitionDate BETWEEN '2011-01-01' AND '2011-12-31' AND S.SportName = 'Шахматы';

-- 3. Определить наилучший показатель спортсмена "Караваева" в виде спорта "бег"
SELECT TOP 1 C.Result
FROM Competitions C
JOIN Athletes A ON C.AthleteID = A.AthleteID
JOIN Sports S ON C.SportID = S.SportID
WHERE A.FullName = 'Караваев' AND S.SportName = 'Бег'
ORDER BY C.Result;