#create a method that takes an array which can be
#sorted in reverse if a param, rev is set to true
#pretend it's a library

def alphabetize(arr, rev=false)
  if rev
    arr.sort! {|first, second| second <=> first }
  else
    arr.sort! {|first, second| first <=> second }
  end
end

books = ["Heart of Darkness", "Code Complete", "The Lorax", "The Prophet", "Absalom, Absalom!"]

puts "From A-Z: #{alphabetize(books)}"
puts "From Z-A: #{alphabetize(books, true)}"
