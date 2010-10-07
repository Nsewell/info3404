DROP INDEX IF EXISTS employee_idx;

SELECT ssnum, salary FROM employee WHERE salary > 40000 AND salary <= 50000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 50000 AND salary <= 60000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 60000 AND salary <= 70000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 70000 AND salary <= 80000 ORDER BY ssnum;

CREATE INDEX employee_idx
  ON Employee
  USING btree
  (ssnum);
ALTER TABLE Employee CLUSTER ON employee_idx;

SELECT ssnum, salary FROM employee WHERE salary > 40000 AND salary <= 50000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 50000 AND salary <= 60000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 60000 AND salary <= 70000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 70000 AND salary <= 80000 ORDER BY ssnum;

