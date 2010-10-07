SELECT dept, avg(salary) 
FROM employee e 
WHERE dept in (
  SELECT dept FROM techdept
) GROUP BY dept;

SELECT employee.dept, AVG(salary) 
FROM employee JOIN techdept 
ON employee.dept = techdept.dept GROUP BY employee.dept;

/*
The join is faster

*/
