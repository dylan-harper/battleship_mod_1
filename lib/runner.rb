require './lib/cell'
require './lib/ship'
require './lib/board'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit"


def game_initiate
  @board = Board.new
  @board.cells

  computer_cruiser = Ship.new("Cruiser", 3)
  computer_sub = Ship.new("Submarine", 2)

  computer_cruiser_coords = @board.coordinates.sample(3)
  computer_sub_coords = @board.coordinates.sample(2)

  if @board.valid_placement?(computer_cruiser, computer_cruiser_coords)
    return
  elsif !@board.valid_placement?(computer_cruiser, computer_cruiser_coords)
    while !@board.valid_placement?(computer_cruiser, computer_cruiser_coords) do
      computer_cruiser_coords = @board.coordinates.sample(3)
    end
  end

  if @board.valid_placement?(computer_sub, computer_sub_coords)
    return
  elsif !@board.valid_placement?(computer_sub, computer_sub_coords)
    while !@board.valid_placement?(computer_sub, computer_sub_coords) do
      computer_sub_coords = @board.coordinates.sample(2)
    end
  end

  @board.place(computer_cruiser, computer_cruiser_coords)
  @board.place(computer_sub, computer_sub_coords)

  puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
  puts @board.render

  player_cruiser = Ship.new("Cruiser", 3)
  player_sub = Ship.new("Submarine", 2)
  cruiser_coords = []
  sub_coords = []

  puts "Enter the squares for the Cruiser (3 spaces):"
  cruiser_coords << gets.chomp
  cruiser_coords = cruiser_coords[0].split

  if @board.valid_placement?(player_cruiser, cruiser_coords)
    @board.place(player_cruiser, cruiser_coords)
  elsif !@board.valid_placement?(player_cruiser, cruiser_coords)
    while !@board.valid_placement?(player_cruiser, cruiser_coords) do
      puts "Either those coordinates are taken or they are invalid. Try again:"
      cruiser_coords = gets.chomp
      cruiser_coords = cruiser_coords[0].split
      @board.valid_placement?(player_cruiser, cruiser_coords)
    end
    @board.place(player_cruiser, cruiser_coords)
  end


#   puts "First cruiser coordinate:"
#   cruiser_coord_1 = gets.chomp.to_s
#
#   puts "Second cruiser coordinate:"
#   cruiser_coord_2 = gets.chomp.to_s
#   puts "Third cruiser coordinate:"
#   cruiser_coord_3 = gets.chomp
#
#   if @board.valid_coordinate?(cruiser_coord_1)
#     cruiser_coords << cruiser_coord_1
#   elsif !@board.valid_coordinate?(cruiser_coord_1)
#     while !@board.valid_coordinate?(cruiser_coord_1) do
#       puts "Incorrect coordinate. Try again."
#       cruiser_coord_1 = gets.chomp.to_s
#     end
#     cruiser_coords << cruiser_coord_1
#   end
#
# require "pry"; binding.pry
#
#   puts "Second coordinate:"
#   cruiser_coord_2 = gets.chomp
#
#   if @board.valid_coordinate?(cruiser_coord_2)
#     cruiser_coords << cruiser_coord_2
#   elsif !@board.valid_coordinate?(cruiser_coord_2)
#     while !@board.valid_coordinate?(cruiser_coord_2) do
#       puts "Incorrect coordinate. Try again."
#       cruiser_coord_2 = gets.chomp
#     end
#     cruiser_coords << cruiser_coord_2
#   end
#
#   require "pry"; binding.pry

  # cruiser_coords << cruiser_coord_2
  # puts "Third coordinate:"
  # cruiser_coord_3 = gets.chomp
  # cruiser_coords<< cruiser_coord_3
  #
  # puts "Enter the squares for the Submarine (2 spaces:)"
  # sub_coords = []
  #
  #
  # sub_coords << sub_coord_1
  # puts "Second coordinate:"
  # sub_coord_2 = gets.chomp
  # sub_coords << sub_coord_2
  #
  #
  # p cruiser_coords
  # p sub_coords
end



user_input = gets.chomp
if user_input == "q" || user_input == "Q"
  puts "Maybe next time!"
elsif user_input == "p" || user_input == "P"
  game_initiate
end
