SELECT a.full_name
FROM Actors a
JOIN RoleAssignments ra ON a.actor_id = ra.actor_id
WHERE ra.director = 'Балайан';

SELECT r.play_title
FROM RoleAssignments ra
JOIN Roles r ON ra.role_id = r.role_id
WHERE ra.role_type = 'главная'
GROUP BY r.play_title
HAVING COUNT(DISTINCT ra.actor_id) > 3;

SELECT a.full_name
FROM Actors a
WHERE NOT EXISTS (
    SELECT 1
    FROM RoleAssignments ra
    WHERE ra.actor_id = a.actor_id
    AND ra.start_date >= '2012-01-01'
);