SELECT department, ROUND(AVG(DATEDIFF(DAY, termdate, GETDATE())/365),0) as avg_tenure
FROM employees e
JOIN departments d
ON e.departmentsID = d.departmentsID
WHERE termdate <= GETDATE() AND termdate IS NOT NULL
GROUP BY department;