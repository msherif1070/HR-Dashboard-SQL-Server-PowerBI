SELECT location_state, COUNT(*) count
FROM employees e
JOIN address a
ON e.addressID = a.addressID
GROUP BY location_state
ORDER BY count DESC;
