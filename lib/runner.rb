# require 'cell'
# require_relative '/ship'
# require_relative '/board'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit"

class Ship

  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    @health < 1
  end

  def hit
    @health -= 1
  end



end

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

  def place_ship(ship)
    @ship = ship
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

  def consecutive_coordinates(ship, coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate|
      split_coordinate = coordinate.split('')
      letters << split_coordinate.first
      numbers << split_coordinate.last
    end

    if letters.include?("A") && letters.include?("D")
      false
    elsif numbers.include?("1") && numbers.include?("4")
      false
    elsif ship.length == 2 && numbers.include?("1") && numbers.include?("3")
      false
    elsif ship.length == 2 && numbers.include?("2") && numbers.include?("4")
      false
    elsif ship.length == 2 && letters.include?("A") && letters.include?("C")
      false
    elsif ship.length == 2 && letters.include?("B") && letters.include?("D")
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
    ship.length == coordinates.count && consecutive_coordinates(ship, coordinates) && !overlapping_ships?(coordinates)
  end


  def place(ship, coordinates)
      coordinates.each do |coordinate|
        @board_cells[coordinate].place_ship(ship)
      end
  end

  def render(s = nil)

    rendered_board = "  1 2 3 4 \nA "


    if s == nil
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
    end

    if s == true
      @board_cells.each_with_index do |(coordinate, cell), index|
        rendered_board = rendered_board + cell.render(true) + " "
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
    end

    rendered_board

  end
end


def game_initiate
  @board = Board.new
  @board.cells
  @player_cruiser_coords_og = []
  puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
  puts @board.render
  puts "Enter the squares for the Cruiser (3 spaces):"
  @player_cruiser_coords_og << gets.chomp
end



user_input = gets.chomp
if user_input == "q" || user_input == "Q"
  puts "Maybe next time!"
elsif user_input == "p" || user_input == "P"
  game_initiate
end
