puts "What is your name?"
name = gets.chomp
name.downcase!

for i in 0..name.length-1
  if name[i] == 'a' or name[i] == 'e' or name[i] == 'i' or name[i] == 'o' or name[i] == 'u'
    article = "an"
  else
    article = "a"
  end
  letter = name[i].upcase
  puts "Give me #{article}... #{letter}"
end
puts "#{name.upcase}'s just GRAND!"
# print has no line break

# count = name.length
# i = 0
# while i < count do
#   puts name[i]
#   i = i + 1
# end

# puts "Or:"

# name.each_char do |char|
#   puts char
# end
