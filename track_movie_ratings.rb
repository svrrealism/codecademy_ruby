#Create a movie tracker that will:
#1). Add new movie to a hash
#2). Update the rating for an existing movie
#3). Delete a movie from the hash
#4). Display all of the movies and ratings

movies = {
  inside_man: 7.3
}

puts %(
#{"="*35}
Welcome to the movies tracker v1.0
#{"="*35}

)

puts "Please select from the following choices:"

dont_quit = true

while dont_quit

  puts "--add to add a movie"
  puts "--update to update a movie"
  puts "--delete to delete a movie"
  puts "--display to display all movies and ratings"
  puts "--quit or --exit to quit this program"
  print '> '

  choice = $stdin.gets.chomp.downcase

  #Using case statements
  case choice

    when "add"
      puts "Enter a movie title to add: "
      title = $stdin.gets.chomp.to_sym
      if movies.has_key? title
        puts "movie already exists"
      else
        puts "Enter a number rating for #{title}: "
        print '> '
    	  rating = $stdin.gets.chomp.to_i
        movies[title] = rating
      end

    when "update"
      puts "Enter a movie to update"
      print '> '
      title = $stdin.gets.chomp.to_sym
      if movies[title] == nil
        puts "Movie does not exist in the hash."
      else
        puts "Please enter the new rating: "
        print '> '
        rating = $stdin.gets.chomp.to_i
        movies[title] = rating
      end

    when "display"
      movies.each {|m, r| puts "\n#{m}: #{r}\n\n" }
    when "delete"
      puts "Which movie would you like to delete?: "
      print '> '
      title = $stdin.gets.chomp.to_sym
      if movies[title] == nil
        puts "No movie to delete!"
      else
        movies.delete(title)
        puts "\n#{title} was deleted!\n\n"
      end

    when "quit"
      puts "\nBye!\n"
      exit(0)

    else
      puts "Could not recognize the input. Please try again."
  end
end
