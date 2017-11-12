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

#updated so you can't add the same song twice
#update if a person has a worst song, they leave if it is added to the room
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    for person in @guests
      if person.worst_song == song
        @guests.delete(person)
      end
    end
  end




end
