require './lib/cell'
require './lib/ship'

class Board


  def initialize
    #can we make the below more dynamic?
    @coordinates = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']

  end

  def cells

    board_cells = {}
    @coordinates.each do |coordinate|
      #makes i equal key and new cell instance equal value
      board_cells[coordinate] = Cell.new(coordinate)
      # board_cells.store(coordinate, cell = Cell.new(i))
      #stores new keyvalue in hash accumulator
    end

    board_cells
  end

  def valid_coordinate?(coordinate)
    @coordinates.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    (ship.length == coordinates.count) # && consecutive_coordinates
  end
end
