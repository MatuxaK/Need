SELECT DISTINCT language 
FROM Nationalities
WHERE country_id = (SELECT country_id FROM Countries WHERE name = 'Китай')
AND (total_population * 1.0 / (SELECT population FROM Countries WHERE name = 'Китай')) >= 0.2;

SELECT name, population 
FROM Countries;

SELECT c.capital 
FROM Countries c
JOIN Nationalities n ON c.country_id = n.country_id
WHERE n.name = 'светлый эльф'
ORDER BY n.total_population DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;  -- Можно использовать также LIMIT для других SQL диалектов

SELECT DISTINCT n.name 
FROM Nationalities n
JOIN Countries c ON n.country_id = c.country_id
WHERE c.region = 'Драконы Горы';
