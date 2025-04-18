SELECT s.name, COUNT(cp.participation_id) AS publication_count
FROM Scientists s
JOIN ConferenceParticipants cp ON s.scientist_id = cp.scientist_id
JOIN Conferences c ON cp.conference_id = c.conference_id
WHERE cp.is_published = 1 AND YEAR(c.date) = 2011
GROUP BY s.name;

SELECT DISTINCT c.name
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
WHERE cp.is_published = 0;

SELECT TOP 1 c.name, COUNT(cp.participation_id) AS speaker_count
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
WHERE cp.type_id = 1  -- тип Докладчик
GROUP BY c.name
ORDER BY speaker_count DESC;

SELECT c.name, COUNT(DISTINCT s.country) AS country_count
FROM Conferences c
JOIN ConferenceParticipants cp ON c.conference_id = cp.conference_id
JOIN Scientists s ON cp.scientist_id = s.scientist_id
GROUP BY c.name;

-- Получение одной записи о самом активном ученом по публикациям
SELECT TOP 1 s.name, COUNT(cp.participation_id) AS publication_count
FROM Scientists s
JOIN ConferenceParticipants cp ON s.scientist_id = cp.scientist_id
JOIN Conferences c ON cp.conference_id = c.conference_id
WHERE cp.is_published = 1 AND YEAR(c.date) = 2011
GROUP BY s.name
ORDER BY publication_count DESC;