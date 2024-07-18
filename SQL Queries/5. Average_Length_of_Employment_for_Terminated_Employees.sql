SELECT ROUND(AVG(DATEDIFF(DAY, hire_date, termdate)), 2)/365 as avg_length_of_employment
FROM employees
WHERE termdate <= GETDATE();
