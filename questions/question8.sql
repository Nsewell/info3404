SELECT * FROM Employee1 WHERE salary/12 = 4000 -- This query runs a comparison, potentially needing to use floating point arithmetic, on each query
SELECT * FROM Employee1 WHERE salary = 12*4000 -- This minor change runs the calculation once, then comparing records to the stored variable
