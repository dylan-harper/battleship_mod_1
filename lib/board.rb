require './lib/cell'
require './lib/ship'

class Board


  def initialize
    @coordinates = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']

  end

  def cells

    board_cells = {}
    @coordinates.each do |coordinate|
      board_cells[coordinate] = Cell.new(coordinate)
    end
    board_cells
  end

  def valid_coordinate?(coordinate)
    @coordinates.include?(coordinate)
  end

  #either all of the letters are the same OR all of the numbers are the same
  def consecutive_coordinates(coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate| #deciding to iterate over the coordinates
      split_coordinate = coordinate.split('') #splitting the coordinate letter/number in two
      letters << split_coordinate.first
      numbers << split_coordinate.last
    end
   #go through letters array and see if all elements are equal
   if letters[0] == letters[1] && letters[1] == letters[2]
     true
   elsif numbers[0] == numbers[1] && numbers[1] == numbers[2]
     true
   else
     false
   end
   #go through numbers array and see if all elements are equal

   #if one of the above conditions is true, coordinates are consecutive
   #else, coordinates are not consecutive
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count && consecutive_coordinates
  end
end
