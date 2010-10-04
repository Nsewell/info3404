SELECT count(Employee.ssnum) --Concise output
FROM Employee, Student
WHERE Employee.name = Student.name;

SELECT count(Employee.ssnum)
FROM Employee, Student
WHERE Employee.ssnum = Student.ssnum;

/*
The times from running these queries on 1000 rows
0.032912015914917
0.0121109485626221

The query with ssnums is substantially faster.
Ssnum is a big integer, while the name is a variable length character string that can be a much larger size and takes longer to hash.
There is a clustered index on ssnum which makes lookup faster than the unclustered index on name.

Ssnums are always guaranteed to be unique, while names may not necissarily be so.
*/
