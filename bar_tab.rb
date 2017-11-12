class BarTab
  attr_reader :rooms, :total_money

  def initialize
    @rooms = []
    @total_money = 0
  end
  #if we have rooms linked to a bartab and we add a guest to the room,we can update the room money, can we automatically update the @total_money - uncertain about how they are linked. Is this where inheritance would be involved - as the way we have classes a room could be on more than one bartab
  def add_room_to_bar_tab(room)
    @rooms << room
  end

  def count_money
    for room in @rooms
      @total_money += room.money
    end
    #Why do we not get @total_money returned unless we have the line below?
    return @total_money
  end


end
