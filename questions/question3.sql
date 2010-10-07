SELECT max(salary), dept FROM employee GROUP BY dept; -- Uses GROUP BY

SELECT dept,salary FROM employee E WHERE salary >= ALL (SELECT salary FROM employee WHERE dept = E.dept);

-- Temporary tables?
create table deptsalaries AS (select dept, salary from employee order by dept);
select max(salary),dept from deptsalaries group by dept;
