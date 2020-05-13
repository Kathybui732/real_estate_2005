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
    @rooms.select do |room|
      room.category == room_cat
    end
  end

  def area
    @rooms.reduce(0) do |area, room|
      area + room.area
    end
  end

  def details
    details = {
      "price" => @price.delete("$").to_i,
      "address" => @address
    }
  end

  def price_per_square_foot
    (@price.delete("$").to_f / area).round(2)
  end

  def rooms_sorted_by_area
    room_areas = @rooms.sort_by do |room|
      room.area
    end
    room_areas.reverse
  end
end
