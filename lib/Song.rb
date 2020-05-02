require 'pry'
class Song 

  
  attr_accessor :name
  attr_reader :artist, :genre 
  extend Concerns::Findable
  
  @@all = [] 
  
  def initialize(name,artist=nil,genre=nil)
    @name = name 
    self.artist= artist if artist 
    self.genre= genre  if genre 
    save
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(song)
    song = self.new(song)
    song.save 
    song 
  end 
  
  def songs 
    @songs 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre 
    @genre
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
  @@all.detect {|find| find.name == name}
end
 
def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
end

    
    def self.all 
    @@all 
  end
  
   def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name
    genre = Genre.find_or_create_by_name
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  
  
  
  
  end 


