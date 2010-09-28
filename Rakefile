require 'rubygems'
require 'pg'
require 'yaml'
require 'faker'

Dbname = 'info3404'
DB = YAML.load_file 'database.yml'

puts ARGV

namespace :db do
  desc 'Drops the database'
  task :drop do
    `dropdb -U #{DB['username']} -W #{DB['database']}`
  end

  desc 'Creates the database'
  task :create do
    `createdb -U #{DB['username']} -W #{DB['database']}`
  end
 
  desc 'Dumps the database to a file named after the date'
  task :dump do
    format = ARGV[1].nil? ? `date +%F:%T`.strip : ARGV[1] 
    `mkdir -p dump`
    `pg_dump -U #{DB['username']} -W #{DB['database']} | gzip -c > 'dump/#{DB['database']}-#{format}.sql.gz'`
  end
  
  namespace :load do
    Dir['dump/*.sql.gz'].map{|f| File.basename(f,'.sql.gz').to_sym}.each do |dump_file|

      desc "Loads the #{dump_file} sql file"
      task(dump_file) do
        `zcat dump/#{dump_file}.sql | psql -U #{DB['username']} -W #{DB['database']}`
       end
    end
  end

  desc 'loads the database with fake test data'
  task :faker do
    @dbc = PGconn.connect(:dbname => DB['database'], :user => DB['username'])
    puts @dbc.query('SELECT * FROM employee;').to_a
    @dbc.prepare('ins', "INSERT INTO employee (name, manager, dept, salary, numfriends) VALUES ($1, $2, $3, $4, $5);")
    @dbc.exec_prepared('ins', [Faker::Name::name,Faker::Name::name, Faker::Name::name, rand(100), rand(100)])
    puts @dbc.query('SELECT * FROM employee;').to_a
    @dbc.close
  end

  desc 'Clears the database'
  task(:clear => [:drop, :create])
end

namespace :question do
    Dir['questions/*.sql'].map{|f| File.basename(f,'.sql').to_sym}.each do |sql_file|

      desc "Times the running of the #{sql_file} sql file"
      task(sql_file) do
        puts `time psql -U #{DB['username']} #{DB['database']} < questions/#{sql_file}.sql ` #no password for accurate timing, set up in pg_hba.conf
       end
    end

end
