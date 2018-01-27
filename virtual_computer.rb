#Create a fictional machine that shows the manipulation of files by users, etc

class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
  	time = Time.now
    @files[filename] = time
    puts "#{filename} was created."
  end

  def Computer.get_users
  	return @@users
  end
end

my_computer = Computer.new("zenulv", "12345")
my_computer = Computer.new("zenulv2", "12345")

my_computer.create("hi.txt")

puts Computer.get_users
