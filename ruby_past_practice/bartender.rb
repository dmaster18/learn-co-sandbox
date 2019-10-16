class Bartender
  attr_accessor :name
  
  BARTENDERS = []
  
  def initialize(name)
    @name = name
    BARTENDERS << self
  end
  
  def self.all
    BARTENDERS
  end
  
  def intro
    "Hello, my name is #{@name}!"
  end
  
  def make_drink
    @cocktail_ingredients = []
    choose_liquor
    choose_mixer
    choose_garnish
    return "Here is your drink. It contains #{@cocktail_ingredients}."
  end
  
  private
  
  def choose_liquor
    @cocktail_ingredients.push("whiskey")
  end
  
  def choose_mixer
    @cocktail_ingredients.push("vermouth")
  end
  
  def choose_garnish
    @cocktail_ingredients.push("olives")
  end
end

phil = Bartender.new("Phil")
bob = Bartender.new("Bob")
joe = Bartender.new("Joe")
ellen = Bartender.new("Ellen")
alex = Bartender.new("Alex")
puts Bartender.all
puts phil.make_drink