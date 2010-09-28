require 'rubygems'
require 'pg'
require 'yaml'
require 'faker'

DB = YAML.load_file 'database.yml'

Prepared = {
'ins_emp' => "INSERT INTO employee (name, manager, dept, salary, numfriends) VALUES ($1, $2, $3, $4, $5);",
'ins_stu' => "INSERT INTO student (name, course, grade) VALUES ($1, $2, $3);",
'ins_emps' => "INSERT INTO employee (name, manager, dept, salary, numfriends, ssnum) VALUES ($1, $2, $3, $4, $5, $6);",
'ins_stus' => "INSERT INTO student (name, course, grade, ssnum) VALUES ($1, $2, $3, $4);"
}

def connect(times=100)
  @dbc = PGconn.connect(:dbname => DB['database'], :user => DB['username'])
  Prepared.each {|name, statement| @dbc.prepare(name, statement)}

  clear #Resets part of the DB
  times.times {|i| yield i}

  #puts @dbc.query('SELECT * FROM employee;').to_a
  @dbc.close
end

def studentemployee(i)
  ssnum = @dbc.query("select nextval('ssnums');").to_a[0]['nextval'].to_i
  emp = employee(ssnum)
  #puts emp.inspect
  ssnum = @dbc.query("select nextval('ssnums');").to_a[0]['nextval'].to_i if i >= SHARED
  stu = student(ssnum)
  #puts stu.inspect
  stu[0] = emp[0] if i < SHARED
  @dbc.exec_prepared('ins_emps', emp)
  @dbc.exec_prepared('ins_stus', stu)
end

Courses = ['info3404', 'info1000', 'info1905', 'info2820', 'comp2007', 'comp2129']
def employee(ssnum=-1)
  a = [Faker::Name::name,Faker::Name::name, Faker::Name::name, rand(100), rand(100)]	
  a << ssnum if ssnum >= 0
  a
end
def student(ssnum=-1)
  a = [Faker::Name::name, Courses.choice, rand(100)]	
  a << ssnum if ssnum >= 0
  a
end

def clear
  @dbc.query "DROP TABLE IF EXISTS student; CREATE TABLE student (ssnum bigserial, name varchar(255), course varchar(8), grade integer);"
  @dbc.query "DROP TABLE IF EXISTS employee; CREATE TABLE employee (ssnum bigserial, name varchar(255), manager varchar(255), dept varchar(255), salary integer, numfriends integer);"
  @dbc.query "DROP SEQUENCE IF EXISTS ssnums; CREATE SEQUENCE ssnums START 1;"
end

SHARED = 1000
connect(10000) {|i| studentemployee i}
