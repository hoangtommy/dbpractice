require 'rubygems'
require 'sqlite3'

$db = SQLite3::Database.new('dbfile')
$db.results_as_hash = true

def disconnect_and_quit
  $db.close
  puts 'Bye felicia, pray for snow!'
  exit
end

def create_table
  puts 'Creating snowboards table'
  $db.execute %q{
  	create table snowboards (
  	id integer primary key,
  	brand varchar(50),
  	name varchar(50),
  	profile varchar(50),
  	length integer
  	)
  }
end

def add_snowboard
  puts 'Enter snowboard brand:'
  brand = gets.chomp
  puts 'Enter snowboard name:'
  name = gets.chomp
  puts 'Enter profile:'
  profile = gets.chomp
  puts 'Enter length:'
  length = gets.chomp
  $db.execute("insert into snowboards (brand, name, profile, length) values (?, ?, ?, ?)", brand, name, profile, length)
end

def find_snowboard
  puts 'Enter a name or ID of the snowboard to find:'
  id = gets.chomp

  snowboard = $db.execute("select * from snowboards where name = ? or id = ?", id, id.to_i).first

  unless snowboard
  	puts 'No result found'
  	return
  end

  puts %Q{Brand: #{snowboard['brand']}
  Name: #{snowboard['name']}
  profile: #{snowboard['profile']}
  length: #{snowboard['length']}}

end

def show_all_snowboards
  puts $db.execute("select * from snowboards")
end

loop do
  puts %q{Please select an option:
  	1. Create snowboards table
  	2. Add a snowbaord
  	3. Look for a snowboard
  	4. Show all snowboards
  	5. Quit}

  case gets.chomp
    when '1'
      create_table
    when '2'
      add_snowboard
    when '3'
      find_snowboard
    when '4'
      show_all_snowboards
    when '5'
      disconnect_and_quit
    end
end
