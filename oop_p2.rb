class Dog
  def initialize(name, breed)
     @name = name
     @breed = breed
  end
  public def bark
    puts "Woof!"
  end
  private def idea
    @id_number = 12345
  end
end

#Modules - one of the main purposes of them is to separate methods and variables
#          into different named paces. This is called namespacing and it would be
#          for instance, how ruby does not confuse Math::PI and Circle::PI (Math::PI is real module)

module Circle
  PI = 3.141592653589793

  def Circle.area(radius)
    PI * radius**2
  end

  def Circle.circumference(radius)
    2 * PI * radius
  end
end

#using classes with modules = 'mixins'
# THIS IS ONLY AT THE INSTANCE LEVEL
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump


#At the class level you have the extend method which can allow a class to
#take in a module's methods at the class level as opposed to the instance level.

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}: #{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAndNow
  extend ThePresent
end

TheHereAnd.now
