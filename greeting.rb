class Person
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
end

kanye = Person.new("Kanye West")
puts kanye.name