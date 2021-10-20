require './lib/ship'

class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship
    @miss
  end

  def empty? #how to incorporate this into the tests/code... maybe its' just the same thing as @miss?
    @ship == nil
  end

  def place_ship(cruiser)
    @ship = cruiser
  end

  def fired_upon?
    if @miss == true
      true
    elsif @ship != nil && @ship.health < @ship.length
      true
    elsif @miss == nil
      false
    end
  end

  def fire_upon
    if @ship != nil
      @ship.hit && @miss = false
    elsif @ship == nil
      @miss = true
    end

  end

  def render(s = nil)
    if @ship != nil && s == true
      return "S"
    end

    if @miss == nil
      return "."
    elsif @miss == true
      return "M"
    elsif @miss == false && @ship.health > 0
      return "H"
    elsif @ship.sunk? == true
      return "X"
    end
  end
end
