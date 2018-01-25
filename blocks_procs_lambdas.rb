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
