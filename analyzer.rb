# File.open("text.txt").each { |line| puts line }
  # the above is the same approach as the below with the added advantage 
  # the first approach closing the object after using it

# f = File.new("text.txt", "r") # r here stands for read
# puts f.gets
# f.close


lines = File.readlines(ARGV.first)
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

word_count = text.split.size
sentence_count = text.split(/\.+|\?|\!/).size
paragraph_count = text.split(/\n\n/).size


# puts "#{word_count} words in this motherfucker"
# puts "#{sentence_count} sentences up in this bitch"
# puts "#{paragraph_count} paragraphs in this joint"

puts "Average sentences per paragraph: #{sentence_count / paragraph_count}"
puts "Average words per sentence: #{word_count / sentence_count}"