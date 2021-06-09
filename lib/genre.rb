require 'pry'

class Genre
    attr_accessor :name, :songs, :artist
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    def artists
        self.songs.collect{|a| a.artist}.uniq
    end

end