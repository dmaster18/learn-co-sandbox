module Music
  class Artist
    def initialize(artist_name: artist_name)
      @artist_name = artist_name
    end

    attr_accessor :artist_name
  end
  
  class Genre
    def initialize(genre_name: genre_name)
      @genre_name = genre_name
    end

    attr_accessor :genre_name
  end
  
end
