class Song
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @@all << self
    @name = name
  end
  
  def self.all
    @@all
  end
end

paradise = Song.new("Paradise by the Dashboard Light")
thriller = Song.new("Thriller")
puts paradise.name
puts thriller.name
print Song.all