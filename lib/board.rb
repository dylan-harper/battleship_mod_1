require './lib/cell'
require './lib/ship'

class Board

  attr_accessor :board_cells

  def initialize
    @coordinates = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    @board_cells = {}
  end

  def cells
    if @board_cells.keys.length < 16
      @coordinates.each do |coordinate|
        @board_cells[coordinate] = Cell.new(coordinate)
      end
    else
      @board_cells
    end
  end

  def valid_coordinate?(coordinate)
    @coordinates.include?(coordinate)
  end

  def consecutive_coordinates(coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate|
      split_coordinate = coordinate.split('')
      letters << split_coordinate.first
      numbers << split_coordinate.last
    end

   if letters.all? { |letter| letter == letters[0] }
     true
   elsif numbers.all? { |number| number == numbers[0] }
     true
   else
     false
   end
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count && consecutive_coordinates(coordinates) == true #&& @board_cells.
  end


  def place(ship, coordinates)
      coordinates.each do |coordinate|
        @board_cells[coordinate].place_ship(ship)
      end

  end
end
