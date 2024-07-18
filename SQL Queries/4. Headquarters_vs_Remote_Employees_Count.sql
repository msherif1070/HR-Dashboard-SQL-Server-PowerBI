SELECT location, COUNT(*) count
FROM employees e
JOIN location l
ON e.locationID = l.locationID
GROUP BY location
ORDER BY count DESC;