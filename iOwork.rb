# File.open("text2.txt").each { |line| puts line }
# File.open("text2.txt").each(',') { |line| puts line }
# File.open("text2.txt").each_byte { |byte| puts byte }

# File.open("text2.txt") do |f|
# 	2.times { puts f.getc }
# end

# puts File.open("text2.txt").readlines

# f = File.open("text2.txt")
# puts f.pos
# puts f.gets
# puts f.pos
# puts f.gets
# puts f.pos

# f = File.open("text2.txt", "r+")
# f.puts "Add this to the beginning yo"
# puts f.gets
# puts f.gets
# f.close

# f = File.open("text2.txt", "a+") # writes starting at the end 
# # puts f.gets
# f.putc "Replace the start with this"
# f.close

puts Dir.entries("~/Desktop/theodinproject")