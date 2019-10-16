class Artist
  attr_accessor :name, :genre
  
  def initialize(name, genre)
    @name = name
    @genre = genre
  end
end

drake = Artist.new("Drake", "rap")
hotline_bling = Song.new("Hotline Bling")
hotline_bling.arist = drake
puts hotline_bling.artist.name