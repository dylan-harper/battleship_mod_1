require './lib/cell'
require './lib/ship'

class Board

  attr_reader :board_cells

  def initialize
    @coordinates = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
    @board_cells = {}
  end

  def cells
    if @board_cells.keys.length == 0
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

  if letters.include("A") && letters.include?("D")
    false
  elsif numbers.include?("1") && numbers.include?("4")
    false
  elsif letters.all? { |letter| letter == letters[0] } 
    true
  elsif numbers.all? { |number| number == numbers[0] } 
    true
   else
    false
   end
  end

  def overlapping_ships?(coordinates)
    coordinates.each do |coordinate|
      if @board_cells[coordinate].ship != nil
        return true
      else
        return false
      end
    end
  end


  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count && consecutive_coordinates(coordinates) && !overlapping_ships?(coordinates)
  end


  def place(ship, coordinates)
      coordinates.each do |coordinate|
        @board_cells[coordinate].place_ship(ship)
      end
  end

  def render
    rendered_board = "  1 2 3 4 \nA "
    @board_cells.each_with_index do |(coordinate, cell), index|
      rendered_board = rendered_board + cell.render + " "
      if index == 3
        rendered_board = rendered_board + "\nB "
      elsif index == 7
        rendered_board = rendered_board + "\nC "
      elsif index == 11
        rendered_board = rendered_board + "\nD "
      elsif index == 15
        rendered_board = rendered_board + "\n"
      end
    end
    rendered_board
  end
end
