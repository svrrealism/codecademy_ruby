#Create a person class
#initialize 'boots up' every object of the instanced class

class Person
  def initialize(name)
    @name = name
  end
end

matz = Person.new("Yukihiro")
