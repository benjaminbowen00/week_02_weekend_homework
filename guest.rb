class Guest
  attr_reader :name
  attr_accessor :money, :favourite_song, :worst_song

  def initialize(name)
    @name = name
    @money = 50
    @favourite_song = nil
    @worst_song = nil
  end

#the guest must be in the room for any cheer - and the room must include the song for the OMG string to be returned.
  def cheer(room)
    return if !room.guests.include?(self)
    if (room.songs.include?(@favourite_song))
      return "OMG I love #{@favourite_song.title}"
    else
      return "Wahey! I love caraoke"
    end
  end

end
