#Create a person class
#initialize 'boots up' every object of the instanced class
#determine the number of instances a class has by tracking it with a class var
class Person
  @@people_count = 0
  def initialize(name)
    @name = name
    @@people_count += 1
  end
  def self.count_people
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
user1 = Person.new("zenulv")

puts Person.count_people
