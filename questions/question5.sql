select ssnum from employee join techdept on techdept.dept = employee.dept;
select ssnum from employee join (select dept from techdept) t on t.dept = employee.dept;

