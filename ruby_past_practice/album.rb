class Album
  @@album_count = 0
  
  def self.count
    @@album_count
  end
  
  def initialize(album_name, album_artist)
    @@album_count +=1
    @album_name = album_name
    @album_artist = album_artist
  end
  
  def album_name 
    @album_name
  end
  
  def album_artist
    @album_artist
  end
  
  def release_date=(date)
    @release_date = date
  end
  
  def release_date
    @release_date
  end
end

astro_lounge = Album.new("Astro Lounge", "Smash Mouth")
rocks = Album.new("Rocks", "Aerosmith")
astro_lounge.release_date = 1999
rocks.release_date = 1972
back_in_black = Album.new("Back in Black", "AC/DC")
back_in_black.release_date = 1980
puts astro_lounge.album_artist
puts astro_lounge.album_name
puts astro_lounge.release_date
puts rocks.album_artist
puts rocks.album_name
puts rocks.release_date
puts back_in_black.album_artist
puts back_in_black.album_name
puts back_in_black.release_date
puts Album
puts Album.count
