SELECT dept, avg(salary) from employee e where dept in (SELECT dept from techdept) group by dept;
SELECT employee.dept, AVG(salary) from employee join techdept on employee.dept = techdept.dept group by employee.dept;

/*
The join is faster

*/
