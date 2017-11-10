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
    @guest1.money = 4
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    assert_equal([@guest2], @room1.guests)
    assert_equal(4, @guest1.money)
    assert_equal(45, @guest2.money)
    assert_equal(1005, @room1.money)
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
    assert_equal("Sorry you can't come in", @room1.check_in_guest(@guest6))
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
    assert_equal(1030, @room1.money)
  end

  def test_capacity_not_reached_limit_is_changed
    @room1.capacity = 10
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)
    @room1.check_in_guest(@guest4)
    @room1.check_in_guest(@guest5)
    @room1.check_in_guest(@guest6)
    assert_equal(6, @room1.guests.length)
    assert_equal([@guest1, @guest2, @guest3, @guest4, @guest5, @guest6], @room1.guests)
  end

  def test_cheer_no_favourite_song
    @room1.check_in_guest(@guest1)
    shout = @guest1.cheer(@room1)
    assert_equal("Wahey! I love caraoke", shout)
  end

  def test_cheer_with_favourite_song_guest_not_in_room
    @room1.add_song(@song2)
    @guest1.favourite_song = @song2
    shout = @guest1.cheer(@room1)
    assert_nil(shout)
  end

  def test_cheer_with_favourite_song_in_room
    @room1.check_in_guest(@guest1)
    @room1.add_song(@song2)
    @guest1.favourite_song = @song2
    shout = @guest1.cheer(@room1)
    assert_equal("OMG I love Song 2", shout)
  end

  
end
