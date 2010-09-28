require 'rubygems'
require 'pg'
require 'yaml'
require 'faker'

Dbname = 'info3404'
DB = YAML.load_file 'database.yml'

@dbc = PGconn.connect(:dbname => DB['database'], :user => DB['username'])
    puts @dbc.query('SELECT * FROM employee;').to_a
    @dbc.prepare('ins', "INSERT INTO employee (name, manager, dept, salary, numfriends) VALUES ($1, $2, $3, $4, $5);")
    @dbc.exec_prepared('ins', [Faker::Name::name,Faker::Name::name, Faker::Name::name, rand(100), rand(100)])
    puts @dbc.query('SELECT * FROM employee;').to_a
    @dbc.close

