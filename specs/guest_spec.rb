require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Mike")
  end

  def test_guest_name
    assert_equal("Mike", @guest1.name)
  end

end
