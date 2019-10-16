class Dog
  attr_accessor :name, :owner
  
  def initialize(name)
    @name = name
  end
  
  def call_on
    puts self
  end
  
  def get_adopted(owner_name)
    self.owner = owner_name
  end
end

fido = Dog.new("Fido")
fido.owner = "Sophie"
puts fido.owner
fido.get_adopted("Anthony")
puts fido.owner
