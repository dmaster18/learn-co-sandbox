class Dog
  def initialize(breed, name)
    @breed = breed
    @name = name
  end
  attr_accessor :breed, :name
end

snoopy = Dog.new("Beagle", "Snoopy")
puts snoopy
puts snoopy.breed, snoopy.name
snoopy.name = "Snoop Dogg"
puts snoopy.name