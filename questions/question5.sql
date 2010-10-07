SELECT count(ssnum) FROM employee JOIN techdept on techdept.dept = employee.dept;

SELECT count(ssnum) FROM employee JOIN (select dept from techdept) t on t.dept = employee.dept;

SELECT count(ssnum) FROM employee where dept IN (SELECT dept FROM techdept);


/*
The first query, without any subqueries, is the most efficient.

The third query is substantially slower, and the main difference seems to be the hash IN join, and so it is speculated that this is slower.

"SELECT count(ssnum) FROM employee JOIN techdept on techdept.dept = employee.dept"
QUERY PLANAggregate  (cost=47.38..47.39 rows=1 width=8)
QUERY PLAN  ->  Hash Join  (cost=11.12..44.88 rows=1000 width=8)
QUERY PLAN        Hash Cond: ((employee.dept)::text = (techdept.dept)::text)
QUERY PLAN        ->  Seq Scan on employee  (cost=0.00..20.00 rows=1000 width=15)
QUERY PLAN        ->  Hash  (cost=10.50..10.50 rows=50 width=516)
QUERY PLAN              ->  Seq Scan on techdept  (cost=0.00..10.50 rows=50 width=516)
{"count"=>"567"}
0.00127196311950684
total: 0.00127196311950684

"SELECT count(ssnum) FROM employee JOIN (select dept from techdept) t on t.dept = employee.dept"
QUERY PLANAggregate  (cost=47.38..47.39 rows=1 width=8)
QUERY PLAN  ->  Hash Join  (cost=11.12..44.88 rows=1000 width=8)
QUERY PLAN        Hash Cond: ((employee.dept)::text = (techdept.dept)::text)
QUERY PLAN        ->  Seq Scan on employee  (cost=0.00..20.00 rows=1000 width=15)
QUERY PLAN        ->  Hash  (cost=10.50..10.50 rows=50 width=516)
QUERY PLAN              ->  Seq Scan on techdept  (cost=0.00..10.50 rows=50 width=516)
{"count"=>"567"}
0.00116086006164551
total: 0.00243282318115234

"SELECT count(ssnum) FROM employee where dept IN (SELECT dept FROM techdept)"
QUERY PLANAggregate  (cost=47.38..47.39 rows=1 width=8)
QUERY PLAN  ->  Hash IN Join  (cost=11.12..44.88 rows=1000 width=8)
QUERY PLAN        Hash Cond: ((employee.dept)::text = (techdept.dept)::text)
QUERY PLAN        ->  Seq Scan on employee  (cost=0.00..20.00 rows=1000 width=15)
QUERY PLAN        ->  Hash  (cost=10.50..10.50 rows=50 width=516)
QUERY PLAN              ->  Seq Scan on techdept  (cost=0.00..10.50 rows=50 width=516)
{"count"=>"567"}
0.00590205192565918
total: 0.00833487510681152

*/
