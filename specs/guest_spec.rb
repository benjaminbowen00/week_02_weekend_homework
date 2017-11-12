require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike")
    @song3 = Song.new("My heart will go on", "Celine Dion")
  end

  def test_guest_name
    assert_equal("Mike", @guest1.name)
  end

  def test_worst_song
    @guest1.worst_song = @song3
    assert_equal(@song3, @guest1.worst_song)
    assert_equal("Celine Dion", @guest1.worst_song.artist)
  end
end
