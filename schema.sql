DROP SEQUENCE IF EXISTS ssnums; 
CREATE SEQUENCE ssnums START 1;
-- CREATE sequence sq;

-- Tables
DROP TABLE IF EXISTS techdept; 
CREATE TABLE techdept (
  dept varchar(255) PRIMARY KEY, 
  manager varchar(255), 
  location varchar(255)
);

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
  ssnum bigint NOT NULL, 
  name varchar(255), 
  course varchar(8), 
  grade integer,
  CONSTRAINT Employee_pkey2 PRIMARY KEY (ssnum )
);

DROP VIEW IF EXISTS salary;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  ssnum bigint NOT NULL, 
  name varchar(255), 
  manager varchar(255), 
  dept varchar(255), 
  salary integer, 
  numfriends integer,
  CONSTRAINT Employee_pkey PRIMARY KEY (ssnum )
);

-- Questions 8-10
DROP TABLE IF EXISTS Employee1;
CREATE TABLE Employee1(
  ssnum bigserial,
  name varchar(255),
  dept varchar(255),
  manager varchar(255),
  salary integer
);

DROP TABLE IF EXISTS Student1;
CREATE TABLE Student1(
  ssnum bigserial,
  name varchar(255),
  course varchar(8),
  stipend integer,
  written_evaluation varchar(255) --text?
);

CREATE INDEX nameidx_Student ON Student USING hash ("name");
CREATE INDEX nameidx_Employee ON Employee USING hash ("name");
CREATE INDEX techdept_idx
  ON TechDept
  USING btree
  (dept);
ALTER TABLE TechDept CLUSTER ON techdept_idx;

/*
CREATE INDEX employee_idx
  ON Employee
  USING btree
  (ssnum);

ALTER TABLE Employee CLUSTER ON employee_idx;
*/
