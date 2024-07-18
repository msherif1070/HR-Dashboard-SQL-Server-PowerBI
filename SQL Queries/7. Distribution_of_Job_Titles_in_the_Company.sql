SELECT jobtitle, COUNT(*) count
FROM employees e
JOIN jobTitle j
ON e.jobID = j.jobID
GROUP BY jobtitle
ORDER BY jobtitle DESC;
