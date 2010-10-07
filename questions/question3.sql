SELECT max(salary), dept 
FROM employee 
GROUP BY dept; -- Uses GROUP BY

SELECT dept,salary 
FROM employee E 
WHERE salary >= ALL (SELECT salary FROM employee WHERE dept = E.dept);

-- Temporary tables?
CREATE TABLE deptsalaries AS (
  SELECT dept, salary FROM employee ORDER BY dept
);

SELECT max(salary),dept 
FROM deptsalaries 
GROUP BY dept;
