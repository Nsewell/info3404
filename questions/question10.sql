SELECT count(*) FROM Employee1, Student1 WHERE salary/12 = stipend;
SELECT count(*) FROM Employee1, Student1 WHERE salary = (12*stipend + salary % 12);


-- NOTE this is a precise version where only whole divisions of 12 are accepted. In the second instance, floating point arithmetic is used;
SELECT count(*) FROM Employee1, Student1 WHERE salary = 12*stipend;
SELECT count(*) FROM Employee1, Student1 WHERE salary/12.0 = stipend;

