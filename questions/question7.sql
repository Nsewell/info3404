SELECT AVG(salary) 
FROM employee 
WHERE employee.dept = 'information';

SELECT AVG(salary) 
FROM employee 
GROUP BY dept HAVING employee.dept = 'information';
