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
  if ARGV[0] =~ /question4/ && statement =~ /CREATE/ ; @total = 0; log "Resetting Total"; end #hax
  log statement.inspect
  #log @dbc.query("EXPLAIN " + statement).to_a unless ARGV[0] =~ /question4/ && statement =~ /CREATE/ #hax rescue ""
  bench = Benchmark.realtime { log @dbc.query(statement).count } 
  log bench
  @total += bench
  #log "total: #{@total}"
  log
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
@total = 0
connect(statements) {|statement| bench statement.strip if statement != "" and statement.length > 3 and statement != "\n" and statement !~ /^--/}

