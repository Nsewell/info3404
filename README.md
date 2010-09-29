# README

This is the INFO3404 assignment

# Setup

You can run the sql files on any postgres database.
You can benchmark the total running of the files with the time command, like so
`time psql -U postgres < question?.sql`
To do this without password authentication (the -W flag), you will need to configure pg_hba.conf to allow trusted access.

Ruby has been used to generate test data and benchmark individual statements into the log files. It's not necessary to use it if you don't want to. If you do want to run the rake tasks, you'll need to install git, ruby, rubygems, rake and the ruby-pg gem. 

To get the code
`git clone git@github.com:Nsewell/info3404.git`
`cd info3404`
To get the latest version
`git pull`

If you want to get ruby, etc, the current best in breed package manager for OSX is Homebrew.
http://mxcl.github.com/homebrew/
http://www.engineyard.com/blog/2010/homebrew-os-xs-missing-package-manager/

`curl -L http://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C /usr/local` #or wherever you want
`brew install git ruby` #etc

# Questions

## Question 1
Consider the query: Find all students who are employees.
One way to express the query is
    SELECT Employee.ssnum
    FROM Employee, Student
    WHERE Employee.name = Student.name
    Another way is
    SELECT Employee.ssnum
    FROM Employee, Student
    WHERE Employee.ssnum = Student.ssnum

Which of the above two queries is more efficient and under what circumstances ?
Remember, you can generate data and actually test it out.

## Question 2
Consider the query: Find employees with the name Smith or who are in the
acquisitions department.
One way to write the query is
    SELECT Employee.ssnum
    FROM Employee
    WHERE Employee.name = ‘Smith’
    OR Employee.dept = ‘acquisitions’
Is there another way to write this query. Which one is perhaps more efficient?

## Question 3.
Consider the query: Find the highest paid employee per department. Express
this query using a correlated nested query and also using temporary tables.
Which way is more efficient? Again, check the query plan.

## Question 4. 
Consider the query: For the salary ranges, $40,000 to $49,999; $50,000 to
$59,999; $60,000 to $69,999 and $70,000 to $79,999, order the employees by
ssnum. These are effectively four queries. Is there a way where ordering is only
done once ? Again test your answer on real data.

## Question 5. 
Consider the query: Find all employees in departments that are also in the
Techdept relation. Express this query using subqueries and without using
subqueries. Check the query plan and determine which is more efficient.

## Question 6. 
Consider the query. Find employees who earn exactly the average salary in
their department where their department is a technical one. Express the query
with and without using subqueries. Determine which one is more efficient.

## Question 7. 
Consider the query: Find the average salary of the information department.
Answer the query with and without using HAVING. Which is more efficient.

## Question 8-­‐Question 10 are based on the following schema.

    Employee1(ssnum,name,dept,manager,salary)
    Student1(ssnum,name,course,grade,stipend,written_evaluation)


## Question 8. 
When the Student1 relation was created a nonclustering index on salary was also created. However, the following simple is too slow.
    SELECT *
    FROM Employee1
    WHERE salary/12 = 4000

Explain why the query could be slow and how the situation can be remedied.

## Question 9.
Suppose there are 30 Employee1 records per page. Each employee belongs to one of the 50 departments. Should you put a nonclustering index on department ?

## Question 10. 
Suppose that student stipends correspond to monthly salaries, whereas the
employee salaries are yearly. To find out which employees are paid as much as
which students, we have two choices.

    SELECT * FROM Employee1, Student1 WHERE salary = 12*stipend
    Or
    SELECT * FROM Employee1, Student1 WHERE salary/12 = stipend

Which is better from an efficiency perspective? What if there is an index on both salary and stipend. Consider different cases like: one relation is bigger than
another; there is a clustering and a non-­‐clustering index etc.
