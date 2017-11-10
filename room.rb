class Room
  attr_reader :name, :guests, :songs
  attr_accessor :capacity

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
    @capacity = 5
  end

  def check_in_guest(guest)
    if @guests.length < @capacity
      @guests << guest
    else
      return "Sorry you have to wait for someone to leave"
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end


end
