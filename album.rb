class Album
  def initialize(album_name, album_artist)
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
puts astro_lounge.album_artist
puts astro_lounge.album_name
puts astro_lounge.release_date
puts rocks.album_artist
puts rocks.album_name
puts rocks.release_date
puts Album.class
