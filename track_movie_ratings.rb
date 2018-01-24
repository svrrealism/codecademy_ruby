#Create a movie tracker that will:
#1). Add new movie to a hash
#2). Update the rating for an existing movie
#3). Delete a movie from the hash
#4). Display all of the movies and ratings

movies_and_ratings = {}

puts "Welcome to the movies tracker v1.0"
puts "Please select from the following choices:"

puts "--add to add a movie"
puts "--update to update a movie"
puts "--delete to delete a movie"
puts "--display to display all movies and ratings"

choice = $stdin.gets.chomp.downcase
print '> '



# if choice == add
