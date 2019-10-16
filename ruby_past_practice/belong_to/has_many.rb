class Song
  attr_accessor :artist, :name, :genre
  @@all = []
  def initialize(name, genre)
    @name = name
    @genre = genre
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def artist_name
    self.artist.name
  end
end




class Artist
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.artist = self
    @songs << song
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song_by_name(name, genre)
    song = Song.new(name, genre)
    add_song(song)
  end
end

kiki = Song.new("In My Feelings", "hip-hop")
hotline = Song.new("Hotline Bling", "pop")
country_roads = Song.new("Country Roads", "country")

drake = Artist.new("Drake")

drake.add_song(kiki)
drake.add_song(hotline)
drake.add_song(country_roads)

genres = drake.songs.collect do |song| 
  song.genre
end

puts kiki.artist.name