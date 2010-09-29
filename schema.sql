DROP SEQUENCE IF EXISTS ssnums; CREATE SEQUENCE ssnums START 1;

DROP TABLE IF EXISTS techdept; 
CREATE TABLE techdept (
  dept varchar(255), 
  manager varchar(255), 
  location varchar(255)
);

DROP TABLE IF EXISTS student;
CREATE TABLE student (
  ssnum bigint, 
  name varchar(255), 
  course varchar(8), 
  grade integer
);

DROP VIEW IF EXISTS salary;

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  ssnum bigint, 
  name varchar(255), 
  manager varchar(255), 
  dept varchar(255), 
  salary integer, 
  numfriends integer
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
  
