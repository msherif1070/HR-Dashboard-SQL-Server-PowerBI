SELECT race, COUNT(*) AS count
FROM employees e
JOIN race r
ON e.raceID = r.raceID
WHERE age >= 18
GROUP BY race
ORDER BY count DESC;

