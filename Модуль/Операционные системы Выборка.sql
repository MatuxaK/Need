SELECT DISTINCT p.process_name
FROM Resource_Allocations ra
JOIN Processes p ON ra.process_id = p.process_id
JOIN Resources r ON ra.resource_id = r.resource_id
WHERE ra.requested_quantity > r.quantity;

SELECT p.process_name, ra.requested_quantity
FROM Resource_Allocations ra
JOIN Processes p ON ra.process_id = p.process_id
WHERE ra.resource_id = (SELECT resource_id FROM Resources WHERE resource_name = 'файл data1')
ORDER BY p.priority ASC; -- Убывание приоритета

SELECT DISTINCT r.resource_name
FROM Resource_Allocations ra
JOIN Processes p_alloc ON ra.process_id = p_alloc.process_id
JOIN Resources r ON ra.resource_id = r.resource_id
JOIN Resource_Allocations ra_owner ON r.resource_id = ra_owner.resource_id
JOIN Processes p_owner ON ra_owner.process_id = p_owner.process_id
WHERE p_alloc.priority < p_owner.priority;