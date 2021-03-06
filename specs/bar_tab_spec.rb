require('minitest/autorun')
require("minitest/rg")
require_relative("../bar_tab.rb")
require_relative("../room.rb")
require_relative("../guest.rb")

class TestBarTab < MiniTest::Test
  def setup
    @room1 = Room.new("main")
    @room2 = Room.new("80s")
    @bar_tab = BarTab.new
    @bar_tab.add_room_to_bar_tab(@room1)
    @bar_tab.add_room_to_bar_tab(@room2)
    @guest1 = Guest.new("Mick")
    @guest2 = Guest.new("Christine")
    @guest3 = Guest.new("John")
  end

  def test_bar_tab_before_guests
    assert_equal([@room1, @room2], @bar_tab.rooms)
    assert_equal(2000, @bar_tab.count_money)
  end

  def test_bar_tab_after_guests
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room2.check_in_guest(@guest3)
    assert_equal(2015, @bar_tab.count_money)
  end


end


#What happens when you have things in attr_accessor but not in the intialize? Is it OK but bad practice?

#If we create two objects with the same information e.g. song title and artist - is there anyway to replace the second with the first so they both are the same?

#if we update money via guests joining rooms - can we get the total_money as part of the bar to update automatically?
