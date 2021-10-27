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

  if @board.valid_placement?(computer_cruiser, computer_cruiser_coords) == false
    while @board.valid_placement?(computer_cruiser, computer_cruiser_coords) == false do
      computer_cruiser_coords = @board.coordinates.sample(3)
    end
  else
  end

  if @board.valid_placement?(computer_sub, computer_sub_coords) == false
    while @board.valid_placement?(computer_sub, computer_sub_coords) == false do
      computer_sub_coords = @board.coordinates.sample(2)
    end
  else
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
    puts "Your have placed your cruiser on " + cruiser_coords
  elsif @board.valid_placement?(player_cruiser, cruiser_coords) == false
    while !@board.valid_placement?(player_cruiser, cruiser_coords) do
      puts "Either those coordinates are taken or they are invalid. Try again:"
      cruiser_coords = gets.chomp
      cruiser_coords = cruiser_coords[0].split
    end
    @board.place(player_cruiser, cruiser_coords)
  end
end



user_input = gets.chomp
if user_input == "q" || user_input == "Q"
  puts "Maybe next time!"
elsif user_input == "p" || user_input == "P"
  game_initiate
end
