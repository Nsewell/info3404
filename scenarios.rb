require 'rubygems'
require 'pg'
require 'yaml'
require 'faker'

DB = YAML.load_file 'database.yml'

Prepared = {
'ins_emp'  => "INSERT INTO employee (name, manager, dept, salary, numfriends) VALUES ($1, $2, $3, $4, $5);",
'ins_stu'  => "INSERT INTO student (name, course, grade) VALUES ($1, $2, $3);",
'ins_emps' => "INSERT INTO employee (name, manager, dept, salary, numfriends, ssnum) VALUES ($1, $2, $3, $4, $5, $6);",
'ins_stus' => "INSERT INTO student (name, course, grade, ssnum) VALUES ($1, $2, $3, $4);",
'ins_dept' => "INSERT INTO techdept (dept, manager, location) VALUES ($1, $2, $3);",
'ins_emp1' => "INSERT INTO Employee1 (name, dept, manager, salary) VALUES ($1, $2, $3, $4);",
'ins_stu1' => "INSERT INTO Student1 (name, course, stipend, written_evaluation) VALUES ($1, $2, $3, $4);"
}

def connect(times=100)
  @dbc = PGconn.connect(:dbname => DB['database'], :user => DB['username'])
  Prepared.each {|name, statement| @dbc.prepare(name, statement)}

  clear #Resets part of the DB
  depts

  times.times {|i| yield i}

  #puts @dbc.query('SELECT * FROM employee;').to_a
  @dbc.close
end

def studentemployee(i)
  ssnum = @dbc.query("select nextval('ssnums');").to_a[0]['nextval'].to_i
  emp = employee(ssnum)
  ssnum = @dbc.query("select nextval('ssnums');").to_a[0]['nextval'].to_i if i >= SHARED
  stu = student(ssnum)
  stu[0] = emp[0] if i < SHARED
  @dbc.exec_prepared('ins_emps', emp)
  @dbc.exec_prepared('ins_stus', stu)
  @dbc.exec_prepared('ins_emp1', employee1)
  @dbc.exec_prepared('ins_stu1', student1)
end

Courses = ['info3404', 'info1000', 'info1905', 'info2820', 'comp2007', 'comp2129']
def depts
  @depts = Array.new
  10.times do |i| 
    dept = Faker::Name::first_name
    @depts << dept
    @dbc.exec_prepared('ins_dept', [dept, Faker::Name::name, Faker::Name::name]) if i <= 5 
    # question 5 makes more sense if not every employee's department is a tech dept
  end
end

def employee(ssnum=-1)
  salary = rand(80_000)
  salary += 40_000 if salary < 40_000
  a = [Faker::Name::last_name,Faker::Name::name, @depts.choice, salary, rand(100)]	
  a << ssnum if ssnum >= 0
  a
end
def student(ssnum=-1)
  a = [Faker::Name::name, Courses.choice, rand(100)]	
  a << ssnum if ssnum >= 0
  a
end

def employee1
  [Faker::Name::name, Faker::Name::first_name, Faker::Name::name, 40_000+rand(10_000)] 
end

def student1
  [Faker::Name::name, Courses.choice, 4_000+rand(1_000), Faker::Name::name] 
end


def clear
  query = File.read 'schema.sql'
  @dbc.query query
end

SHARED = 100
connect(1000) {|i| studentemployee i}
