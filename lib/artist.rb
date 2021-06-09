require 'pry'

class Artist
    attr_accessor :name, :song, :genre
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

    def self.create(artist)
        artist = self.new(artist)
        artist.save
        artist
    end

    def add_song(song)
        @songs << song
        song.artist = self unless song.artist == self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def genres
        self.songs.collect {|g| g.genre}.uniq
    end

end