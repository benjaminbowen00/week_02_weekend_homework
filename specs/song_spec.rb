require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new("Sara", "Fleetwood Mac")
  end

  def test_song_title
    assert_equal("Sara", @song1.title)
  end

  def test_song_artist
    assert_equal("Fleetwood Mac", @song1.artist)
  end
end
