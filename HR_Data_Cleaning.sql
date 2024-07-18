-- Convert termdate column to DATE format
UPDATE employees
SET termdate = LEFT(termdate, 19)
WHERE termdate IS NOT NULL AND termdate LIKE '%UTC';
GO;

UPDATE employees
SET termdate = CONVERT(date, termdate, 120)
WHERE termdate IS NOT NULL AND termdate != ' '
AND ISDATE(termdate) = 1;
GO;

-- Modify termdate column to DATE type
ALTER TABLE employees
ALTER COLUMN termdate DATE;
GO;

-- Add age column
ALTER TABLE employees
ADD age INT;
GO;

-- Update age column with calculated values
UPDATE employees
SET age = DATEDIFF(YEAR, birthdate, GETDATE());
GO;



