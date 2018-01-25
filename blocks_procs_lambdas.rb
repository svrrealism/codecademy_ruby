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
