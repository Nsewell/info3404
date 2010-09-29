SELECT ssnum, salary FROM employee WHERE salary > 40000 AND salary <= 50000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 50000 AND salary <= 60000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 60000 AND salary <= 70000 ORDER BY ssnum;
SELECT ssnum, salary FROM employee WHERE salary > 70000 AND salary <= 80000 ORDER BY ssnum;

CREATE OR REPLACE VIEW salary AS SELECT ssnum, salary FROM employee ORDER BY ssnum;

SELECT ssnum, salary FROM salary WHERE salary > 40000 AND salary <= 50000;
SELECT ssnum, salary FROM salary WHERE salary > 50000 AND salary <= 60000;
SELECT ssnum, salary FROM salary WHERE salary > 60000 AND salary <= 70000;
SELECT ssnum, salary FROM salary WHERE salary > 70000 AND salary <= 80000;
