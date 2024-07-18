SELECT gender, COUNT(*) AS count
FROM employees
WHERE age >= 18
GROUP BY gender
ORDER BY count DESC;