#When you have a function that passes control to a block, it uses the yield function

def block_test
  puts "In the method"
  puts "Still there"
  yield
  puts "Back in the method"
end

block_test { puts "Now...in the block... " }

#Can also yield with parameters (pass parameters to yield)

def yield_name(name)
  puts "I'm in the method, let's yield"
  yield("Kim")
  puts "In between the yields"
  yield(name)
  puts "Block complete, back in the method"
end

yield_name("eric") { |n| puts "My name is #{n}"}
yield_name("zenulv") { |n| puts "My name is #{n}"}


#defining our own yield method
def double(n)
  yield(n)
end

double(2) { |i| i*2 }


#So basically I imagine some code happening and then you can just pass off the
# current result of where it's at to some block that can be outside of the method's
# internal logic. Almost like planning the orchestration and then being able to change
# the values on the fly. Useful.

# Save a block using something called Procs
# The following prints out multiples of 3 by passing a range converted to an iterable array
# to then be passed to a block
multiples_of_3 = Proc.new do |n|
  n%3 == 0
end

puts (1..100).to_a.select(&multiples_of_3)

#Define a proc called cube that raises a number to the third power
#needed 'puts' or else the untainted array would be returned.
cube = Proc.new do |i|
  puts i**3
end

puts (1..100).to_a.select(&cube)
#Note that both map and collect do the same thing
#You don't have to print here for some reason...puts will actually suppress the output
(1..100).to_a.collect!(&cube)
[1,2,3].collect!(&cube)
[1, 2, 3].map!(&cube)



# The '&' is used to convert the Proc to a block

#Write a Proc that will do a round-down on a set of data using '.floor' method
round_down = Proc.new do |n|
  n.floor
end

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]

ints  = floats.collect!(&round_down)
puts ints


# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

# Complete this as a new Proc
over_4_feet = Proc.new do |height|
	height >= 4
end

# Change these three so that they use your new over_4_feet Proc
# If we used collect like above, the array that is returned would only
  # return booleans because of Proc's block logic: height >= 4....
can_ride_1 = group_1.select!(&over_4_feet)
can_ride_2 = group_2.select!(&over_4_feet)
can_ride_3 = group_3.select!(&over_4_feet)

puts can_ride_1
puts can_ride_2
puts can_ride_3




# THATS CRAZZZZZZZZY!!!!!
# YOU CAN "MAKE" A FUNCTION "TAKE" A PROC OBJECT!!!!

#create method using yield and Proc, use them together

def greeter
  yield
end

phrase = Proc.new do |w|
  puts "Hello there!"
end
#SEEE?!?!?
greeter(&phrase)

# We did the above to see that the Proc can be called
# But an easier way is to call it directly
hi = Proc.new { puts "Hello!" }
hi.call


strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
puts nums

# Recall that you can pass a Ruby method name around with a symbol
# You can also convert symbols to Procs using '&'

arr = [1,2,3,4,5,6,7,8,9,10]

to_strings = arr.map(&:to_s)

to_strings.each {|i| puts i.class }



#So the difference between lambdas and procs are:
  #1. Lambda will return its value back to the function from which it is called.
    #a). Lambda will check the arguments passed to it and will throw an error
    #    if there are an improper amount of arguments

  #2. Proc will return a value immediately and the method, if one is being used, will return
  #   the value of the Proc.
    #a). Proc will not check for any parameters that are passed to it, returning nil if
    #    improper amount of arguments are supplied.


#Demonstrated like so:

#Proc

def proc_method
  block = Proc.new { return "This is the block message."}
  block.call
  "Method message!"
end

puts proc_method

def lambda_method
  block = lambda { return "This is the block messsage."}
  block.call
  "Method message!"
end

puts lambda_method


#Recap:
#In the end, a BLOCK of code can be passed to a select or each function:
#It can also be passed to yield in a function, where the function breaks out of it's
#routine to perform the rest of the execution.
(1..10).to_a.each { |n| puts n if n%2 == 0 }

# def block_function(data)
#   puts "rawr, block_function execution: #{data}"
#   yield(data)
#   puts "And back in the block_function: #{data}"
# end
# arr = (1..100).to_a
# block_function(arr) { |x| x if x%2 == 0 }

#Proc is a block of code that is an object. It returns a value immediately in a method (stops method).

# lambda is a block of code that is a Proc object which returns a value if used in a function, that also checks supplied params





odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select { |n| n if n.is_a? Integer }


ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

under_100 = Proc.new { |n| puts n if n<100}

ages.select(&under_100)



#Create Lambda to get values less than M
#Then pass the lambda to a method
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}

first_half = lambda { |key,value| puts value if value < 'M' }

crew.select(&first_half)
