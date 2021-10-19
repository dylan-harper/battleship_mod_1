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
  #adding some ideas for what these methods could be
  def fired_upon?
    if @ship.health == length
      true
    else
      false
    end
  end
  def fire_upon
    @ship.health -= 1
  end
end
