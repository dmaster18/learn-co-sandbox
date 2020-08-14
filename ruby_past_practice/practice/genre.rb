#module Practice::Genre
  class Genre
    def initialize=(genre_name: genre_name)
      @genre_name = genre_name
    end

    attr_accessor :genre_name
  end
end
