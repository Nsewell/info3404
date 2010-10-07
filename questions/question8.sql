SELECT * 
FROM Employee1 
WHERE salary/12 = 4000; 

SELECT * 
FROM Employee1 
WHERE salary < 4001*12 and salary > 4000*12;


-- This query runs a comparison, potentially needing to use floating point arithmetic, on each query
-- Due to integer representation, the query is modified

--SELECT * FROM Employee1 WHERE salary = 12*4000 
-- This minor change runs the calculation once, then comparing records to the stored variable
