require 'rubygems'
require 'pg'
require 'benchmark'
require 'yaml'

DB = YAML.load_file 'database.yml'

def connect(statements)
  @dbc = PGconn.connect(:dbname => DB['database'], :user => DB['username'])

  statements.each {|i| yield i}

  @dbc.close
end

def bench(statement)
  if statement != "\n"
    puts statement
    puts Benchmark.measure { puts @dbc.query(statement).to_a }
  end

end

statements = File.read(ARGV[0]).split(';') rescue "SELECT 'bogus';"
puts statements.inspect

connect(statements) {|statement| bench statement}
