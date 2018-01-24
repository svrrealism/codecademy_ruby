#create a hash called my_hash

my_hash = Hash.new()

#iterate over the hash matz
#and print VALUES

matz = { "First name" => "Yukihiro",
  "Last name" => "Matsumoto",
  "Age" => 47,
  "Nationality" => "Japanese",
  "Nickname" => "Matz"
}

matz.each {|k,v| puts "#{matz[k]}" }

puts '='*15
puts "Nil a formal introduction"
puts '='*15

#When you access an element that is not there, nil is returned

creatures = {
  "weasels" => 0,
  "puppies" => 6,
  "platypuses" => 3,
  "canaries" => 1,
  "Heffalumps" => 7,
  "Tiggers" => 1
}

#=> gives nil, which is:
#   NOT false, but is nothing at all
creatures["cats"]

#Don't have to settle for nil as a default value
#if you initialize with a non existent key, then you get that key
no_nil_hash = Hash.new("Lol")

#Now if you try to access a nonexistent key in no_nil_hash
# You will get "Lol" instead of nil




###SYMBOLS FINALLY!!!!!
puts '='*15
puts "SYMBOLS"
puts '='*15

# We can certainly use strings as Ruby hash keys;
# As we've seen, there's always more than one way to do something in Ruby.
# However, the Rubyist's approach would be to use symbols.


menagerie = { :foxes => 2,
  :giraffe => 1,
  :weezards => 17,
  :elves => 1,
  :canaries => 4,
  :ham => 1
}

#Think of a symbol as a name.
#They are not strings:
puts "string" == :string
puts :string.class

#While you can have multiple copies of strings,
#there is on one copy of a particular symbol at a time

puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id


#create a var set to a symbol

my_first_symbol = :some_symbol

#Symbols are typically used for referencing
#hash keys or method names
#they make good hash keys because:
  # 1. They're immutable/can't be changed once created
  # 2. Only one copy exists at a time so they save memory
  # 3. Symbols as keys are faster than strings
     #as keys because of the 2 reasons above

symbol_hash = {
 :one => 1,
 :yay_symbols => "Are Awesome!",
 :save_memory => "Yes, they do!",
}

#converting between symbols and strings is a snap
#use the .to_s to convert to strings, .to_sym for symbols

#Example: Say we have a array of strings
# that we'd like to use as hash keys
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
#1. create a new var called symbols set to a blank array
symbols = []
#2. iterate over string with .each
strings.each { |s| symbols.push(s.to_sym)}

puts symbols

#You can also turn strings into symbols with .itern
#This will internalize strings into a symbol just like .to_sym
strings.each { |s| symbols.push(s.intern)}

puts symbols


#Build a hash from the ground up using hash rockets
#create a hash called movies with symbols as keys and string values

movies = {
  :inside_man => '7.6',
  :tank_girl => '5.3'
}

#Ruby 1.9 syntax changed hash symbol notation like so:
#No MOAR rockets
movies = {
  inside_man: '7.6',
  tank_girl: '5.3'
}

#Dare to compare - See how hash lookup is faster with symbols

require 'benchmark'

string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

string_time = Benchmark.realtime do
  100_000.times { string_AZ["r"] }
end

symbol_time = Benchmark.realtime do
  100_000.times { symbol_AZ[:r] }
end

puts "String time: #{string_time} seconds."
puts "Symbol time: #{symbol_time} seconds."

# Select specific elements from a hash using the .select method

grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
}

grades.select { |name, grade| grade <  97 }
# ==> { :bob => 92, :chris => 95 }

grades.select { |k, v| k == :alice }
# ==> { :alice => 100 }


#create a new var, good_movies and set it equal to the result
#of calling .select on movie_ratings, selecting movies with > 3 stars.
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

good_movies = movie_ratings.select {|k,v| v > 3 }

#Say you only want just keys or just values
#methods: .keys, .values || .each_value, .each_key
#Print out just the titles
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

puts movie_ratings.keys

movie_ratings.each_key { |k| puts k }
