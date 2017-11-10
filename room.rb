class Room
  attr_reader :name, :guests, :songs

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
  end

  def check_in_guest(guest)
    @guests << guest
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end


end
