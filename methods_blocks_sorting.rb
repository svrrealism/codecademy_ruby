
puts '='*15
puts "Getting Technical / Sorting"
puts '='*15

books = ["Charlie and the Chocolate Factory",
  "War and Peace",
  "Utopia",
  "A Brief History of Time",
  "A Wrinkle in Time"]

#this is regular sort by ascending/alphabetical order
puts books.sort! { |firstBook, secondBook| firstBook <=> secondBook }

#this is sort in descending/reverse order
puts books.sort! {|firstBook, secondBook| secondBook <=> firstBook }


puts '='*15
puts "Basic Methods Review"
puts '='*15

#make a method that prints something
def welcome()
  puts "Welcome to Ruby!"
end
welcome()

#make a method that interpolates
def welcome2(name)
  puts "Hello, #{name}"
end

welcome2("Marie")
#iterate over array and square the numbers
my_array = [1, 2, 3, 4, 5]
my_array.each {|s| puts s*s }

#sort some fruits in reverse order

puts fruits = %w(orange apple banana pear grapes)
puts fruits.sort! { |first, second| second <=> first }
