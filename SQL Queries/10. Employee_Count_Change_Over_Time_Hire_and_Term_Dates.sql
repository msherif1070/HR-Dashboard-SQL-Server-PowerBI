SELECT 
    YEAR(hire_date) AS year, 
    COUNT(*) AS hires, 
    SUM(CASE WHEN termdate IS NOT NULL AND termdate <= GETDATE() THEN 1 ELSE 0 END) AS terminations, 
    COUNT(*) - SUM(CASE WHEN termdate IS NOT NULL AND termdate <= GETDATE() THEN 1 ELSE 0 END) AS net_change,
    ROUND((CAST((COUNT(*) - SUM(CASE WHEN termdate IS NOT NULL AND termdate <= GETDATE() THEN 1 ELSE 0 END)) AS DECIMAL(10,2)) / COUNT(*) * 100), 2) AS net_change_percent

FROM employees
GROUP BY YEAR(hire_date)
ORDER BY year ASC;