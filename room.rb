class Room
  attr_reader :name, :guests, :songs, :money
  attr_accessor :capacity

  def initialize(name)
    @name = name
    @guests = []
    @songs = []
    @capacity = 5
    @money = 1000
  end

  def check_in_guest(guest)
    if (@guests.length < @capacity) && (guest.money >= 5)
      @guests << guest
      guest.money -= 5
      @money += 5
    else
      return "Sorry you can't come in"
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs << song
  end


end
