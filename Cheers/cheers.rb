# puts "What's your name?"
# name = gets.chomp
# "\e[1;36;44m" #can do 31 - 38 and 41 - 48


# passing junk on command line
# ARGV is an array of arguments from command line
name = ARGV[0]
puts name
name = name.downcase
for i in 0...name.length
  if name[i] == 'a' or name[i] == 'e' or name[i] == 'i' or name[i] == 'o' or name[i] == 'u'
    article = "an"
  else
    article = "a"
  end
  letter = name[i].upcase
  puts "Give me #{article}... #{letter}"
end
puts "#{name.upcase}'s just GRAND!"
puts "Your name backwards is #{name.reverse}"












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
