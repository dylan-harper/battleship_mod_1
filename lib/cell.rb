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
    if @ship.health == @ship.length #unsure about this method
      false
    else
      true
    end
  end
  def fire_upon
   # if @ship != nil
    #  puts "."
   # else
      @ship.hit
  end
  def render
    if cell.fired_upon? == false
      puts "."
    elsif cell.fired_upon? == true || @ship == nil
      puts "M"
    elsif ...
  end
end
