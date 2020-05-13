class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price >= "$500000"
  end

  def rooms_from_category(room_cat)
    @rooms.sort_by do |room|
      room.category == room_cat
    end
  end
end
