require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship
  end
  def empty?
    @ship == nil
  end
  def place_ship(cruiser)
    @ship = cruiser
  end
end
