SELECT department, gender, COUNT(*) count
FROM employees e 
JOIN departments d
ON e.departmentsID = d.departmentsID
GROUP BY department, gender
ORDER BY department;