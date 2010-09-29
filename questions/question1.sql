SELECT count(Employee.ssnum) --Concise output
FROM Employee, Student
WHERE Employee.name = Student.name;
SELECT count(Employee.ssnum)
FROM Employee, Student
WHERE Employee.ssnum = Student.ssnum;
