SELECT count(Employee.ssnum)
FROM Employee, Student
WHERE Employee.ssnum = Student.ssnum;
