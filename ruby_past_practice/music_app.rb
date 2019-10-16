class Song
  @@all_songs = []
  @@all_names = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all_songs << self
    @@all_names << self.name
  end
  
  def self.all_songs
    puts @@all_songs
  end
  
  def self.all_names
    puts @@all_names
  end
end

help = Song.new("Help")
hey_jude = Song.new("Hey Jude")
eleanor_rigby = Song.new("Eleanor Rigby")
Song.all_songs
Song.all_names