SELECT department,
	   COUNT(*) as total_count,
	   SUM(CASE WHEN termdate <= GETDATE() AND termdate IS NOT NULL THEN 1 ELSE 0 END) as Terminated_count,
	   SUM(CASE WHEN termdate IS NULL THEN 1 ELSE 0 END) as active_count,
	   FLOOR((CAST(SUM(CASE WHEN termdate <= GETDATE() THEN 1 ELSE 0 END) AS DECIMAL(10,2)) / COUNT(*)) * 100) as termination_rate
FROM employees e
JOIN departments d
ON e.departmentsID = d.departmentsID
GROUP BY department
ORDER BY termination_rate DESC;

