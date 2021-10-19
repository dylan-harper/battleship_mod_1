class Cell
  attr_reader :coordinate,
              :ship,
              :empty
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @empty = empty
  end
end
