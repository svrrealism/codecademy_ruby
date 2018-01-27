# Create a program that takes a sentence and counts the amount of occurrences
# for each word.

puts "Enter some words: "
print '> '
#tokenizes at commas apostrophes and spaces
text = $stdin.gets.chomp
words = text.split(/\s|'|,|\./)
frequencies = Hash.new(0)
words.each {|word| frequencies[word.to_sym] += 1}
frequencies = frequencies.sort_by { |k,v| v }
frequencies.reverse!

frequencies.each {|word,count| puts "#{word} : #{count.to_s}"}
