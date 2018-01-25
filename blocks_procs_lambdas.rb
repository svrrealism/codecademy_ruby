#When you have a function that passes control to a block, it uses the yield function

def block_test
  puts "In the method"
  puts "Still there"
  yield
  puts "Back in the method"
end

block_test { puts "Now...in the block... " }
