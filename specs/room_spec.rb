require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mick")
    @guest2 = Guest.new("Christine")
    @guest3 = Guest.new("John")
    @guest4 = Guest.new("Stevie")
    @guest5 = Guest.new("Paul")
    @guest6 = Guest.new("Ringo")
    @song1 = Song.new("Sara", "Fleetwood Mac")
    @song2 = Song.new("Song 2", "Blur")
    @room1 = Room.new("main")
  end

  def test_room_name
    assert_equal("main", @room1.name)
  end

  def test_no_guests
    assert_equal([], @room1.guests)
  end

  def test_no_songs
    assert_equal([], @room1.songs)
  end


 def test_add_guests
   @room1.check_in_guest(@guest1)
   @room1.check_in_guest(@guest2)
   assert_equal([@guest1, @guest2], @room1.guests)
 end

 def test_remove_guests
   @room1.check_in_guest(@guest1)
   @room1.check_in_guest(@guest2)
   @room1.check_in_guest(@guest3)
   @room1.check_out_guest(@guest2)
   assert_equal([@guest1, @guest3], @room1.guests)
 end

 def test_add_song
   @room1.add_song(@song1)
   @room1.add_song(@song2)
   assert_equal([@song1, @song2], @room1.songs)
 end

 def test_capacity
   assert_equal(5, @room1.capacity)
 end

 def test_change_capacity
   @room1.capacity = 10
   assert_equal(10, @room1.capacity)
 end

 def test_capacity_reached
   @room1.check_in_guest(@guest1)
   @room1.check_in_guest(@guest2)
   @room1.check_in_guest(@guest3)
   @room1.check_in_guest(@guest4)
   @room1.check_in_guest(@guest5)
   assert_equal("Sorry you have to wait for someone to leave", @room1.check_in_guest(@guest6))
 end

 def test_capacity_not_reached_if_someone_has_left
   @room1.check_in_guest(@guest1)
   @room1.check_in_guest(@guest2)
   @room1.check_in_guest(@guest3)
   @room1.check_in_guest(@guest4)
   @room1.check_in_guest(@guest5)
   @room1.check_out_guest(@guest3)
   @room1.check_in_guest(@guest6)
   assert_equal([@guest1, @guest2, @guest4, @guest5, @guest6], @room1.guests)
 end



end
