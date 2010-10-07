SELECT AVG(salary) FROM employee where employee.dept = 'information'
SELECT AVG(salary), dept FROM employee group by dept having employee.dept = 'information';
