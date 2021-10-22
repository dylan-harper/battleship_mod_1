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

  def consecutive_coordinates(coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate| #deciding to iterate over the coordinates
      split_coordinate = coordinate.split('') #splitting the coordinate letter/number in two
      letters << split_coordinate.first
      numbers << split_coordinate.last
    end
   #go through letters array and see if all elements are equal
   if letters.all? { |letter| letter == letters[0] } #letters[0] == letters[1] && letters[1] == letters[2]
     true
   elsif numbers.all? { |number| number == numbers[0] }
     true
   else
     false
   end
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count && consecutive_coordinates == true && valid_coordinates(coordinates) == true
  end

  #is below method supposed to make a hash within a hash?
  #make a new hash with ship as key, coordinates as values
  #each coordinate would hopefully still have a cell instance and we could reach it
  def place(ship, coordinates)
    cells_covered = {}

    if valid_placement?(ship, coordinates) == true

      @coordinates.each do |coordinates|
      cells_covered[ship] = coordinates
      end

      cells_covered.merge(@coordinates)
    end

  end
end
