require './lib/cell'
require './lib/ship'
require './lib/board'

puts "Welcome to BATTLESHIP"
puts "Enter p to play. Enter q to quit"





def computer_board
  @c_board = Board.new
  @c_board.cells

  computer_cruiser = Ship.new("Cruiser", 3)
  computer_sub = Ship.new("Submarine", 2)

  computer_cruiser_coords = @c_board.coordinates.sample(3)
  computer_sub_coords = @c_board.coordinates.sample(2)

  if @c_board.valid_placement?(computer_cruiser, computer_cruiser_coords) == false
    while @c_board.valid_placement?(computer_cruiser, computer_cruiser_coords) == false do
      computer_cruiser_coords = @c_board.coordinates.sample(3)
    end
  else
  end

  if @c_board.valid_placement?(computer_sub, computer_sub_coords) == false
    while @c_board.valid_placement?(computer_sub, computer_sub_coords) == false do
      computer_sub_coords = @c_board.coordinates.sample(2)
    end
  else
  end

  @c_board.place(computer_cruiser, computer_cruiser_coords)
  @c_board.place(computer_sub, computer_sub_coords)


end

def player_board
  @board = Board.new
  @board.cells

  player_cruiser = Ship.new("Cruiser", 3)
  player_sub = Ship.new("Submarine", 2)
  cruiser_coords = []
  sub_coords = []

  puts "Enter the squares for the Cruiser (3 spaces):"

  cruiser_coords << gets.chomp
  cruiser_coords = cruiser_coords[0].split

  if @board.valid_placement?(player_cruiser, cruiser_coords) == true
    @board.place(player_cruiser, cruiser_coords)
    puts "Your have placed your cruiser on #{cruiser_coords}"
  elsif !@board.valid_placement?(player_cruiser, cruiser_coords)
    while !@board.valid_placement?(player_cruiser, cruiser_coords) do
      puts "Either those coordinates are taken or they are invalid. Try again:"
      cruiser_coords = []
      cruiser_coords << gets.chomp
      cruiser_coords = cruiser_coords[0].split
    end
    puts "Those are valid coordinates. You have placed your cruiser on #{cruiser_coords}"
  end
  @board.place(player_cruiser, cruiser_coords)
  # puts @board.render
  puts @board.render(s = true)

  puts "Enter the squares for the Submarine (2 spaces):"

  sub_coords << gets.chomp
  sub_coords = sub_coords[0].split

  if @board.valid_placement?(player_sub, sub_coords) == true
    @board.place(player_sub, sub_coords)
    puts "Your have placed your cruiser on #{sub_coords}"
  elsif !@board.valid_placement?(player_sub, sub_coords)
    while !@board.valid_placement?(player_sub, sub_coords) do
      puts "Either those coordinates are taken or they are invalid. Try again:"
      sub_coords = []
      sub_coords << gets.chomp
      sub_coords = sub_coords[0].split
    end
    puts "Those are valid coordinates. You have placed your cruiser on #{sub_coords}"
  end
  @board.place(player_sub, sub_coords)
  puts @board.render(s = true)

end

def turn
  puts "It is your turn. Which cell would you like to fire upon? :"
  choice = gets.chomp
  choice = choice.to_s

  if @c_board.cells[choice].ship != nil
   @c_board.cells[choice].fire_upon
   puts "Succesful hit!"
  elsif @c_board.cells[choice].ship == nil
   puts "Miss"
  end

  puts @c_board.render
  puts @board.render(s = true)
end

def computer_turn
  puts "Now it's the computer's turn: "
  random = @board.coordinates.sample(1)
  random = random
  random = random[0]
  if @board.cells[random].ship != nil
     @board.cells[random].fire_upon
     puts "Succesful hit by the computer!"
  elsif @board.cells[random].ship == nil
     puts "The computer missed"
  end
  puts @c_board.render
  puts @board.render(s = true)
end



def game_initiate

  computer_board

  puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long."
  puts @c_board.render

  player_board


  puts "****************************"
  puts "This is the complete board: "
  puts "****************************"
  puts @c_board.render
  puts @board.render(s = true)

  turn
  computer_turn
  turn
  computer_turn
  turn
  computer_turn

end


user_input = gets.chomp
if user_input == "q" || user_input == "Q"
  puts "Maybe next time!"
elsif user_input == "p" || user_input == "P"
  game_initiate
end
