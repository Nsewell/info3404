select name, salary, employee.dept from employee join (select employee.dept, avg(salary) from employee join (select dept from techdept) n on n.dept = employee.dept group by employee.dept) k on k.avg = employee.salary;

--? WTF?
