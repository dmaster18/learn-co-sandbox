require 'pry'
require_relative 'music.rb'


class Song
  include Music

  def initialize(title: title)
    @title = title
  end
  
  attr_accessor :title

  def artist=(artist_name)
    @artist = Music::Artist.new(artist_name: artist_name)
    @artist
  end

  def artist
    @artist
  end

  def genre=(genre_name)
    @genre = Music::Genre.new(genre_name: genre_name)
    @genre
  end

  def genre
    @genre
  end

  binding.pry

end




