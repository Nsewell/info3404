SELECT count(Employee.ssnum) --Concise output
FROM Employee, Student
WHERE Employee.name = Student.name;
