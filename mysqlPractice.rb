require 'rubygems'
require 'mysql'

db = Mysql.connect('localhost', 'root', '', 'test')

# Perform arbitrary SQL query
db.query("insert into snowboards (brand, name) values ('Capita', 'Ultrafear')")

# Perform a query that returns data
begin
  query = db.query('select * from snowboards')
  puts "There were #{query.num_rows} rows returned"

  query.each_hash do |h|
  	puts h.inspect
  end
rescue
  puts db.errno
  puts db.error
end

# Close the connection
db.close