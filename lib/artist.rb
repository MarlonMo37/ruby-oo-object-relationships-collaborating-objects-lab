class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        # @songs = [] 
    end

    def self.all 
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs 
        Song.all.select {|a| a.artist == self}
    end

    def self.find(name)
        self.all.find {|a| a.name =  name} 
    end

    def self.find_or_create_by_name(name)
        if self.find(name) == nil
            self.new(name)
        else
            self.find(name)
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end
end