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
  if statement != "" and statement != "\n" and statement !~ /^--/
    log statement.inspect
    log @dbc.query("EXPLAIN " + statement).to_a
    log Benchmark.realtime { puts @dbc.query(statement).to_a[0].inspect }
    log
  end
end

def log(message="")
  puts message
  @log.puts message 
end

statements = File.read(ARGV[0]).split(';') rescue "SELECT 'bogus';"
logfile = File.basename(ARGV[0], '.sql') rescue "log"

puts logfile
`mkdir -p log/`
@log = File.new('log/'+logfile, 'w')
connect(statements) {|statement| bench statement.strip}

