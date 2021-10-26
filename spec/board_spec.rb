require 'rspec'
require './lib/board'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @board.cells
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists' do

    expect(@board).to be_a(Board)
  end

  it 'board has cells' do

    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.keys.length).to eq(16)
  end

  it '#valid_coordinate? tells us if the coordinate is on the board or not' do

    expect(@board.valid_coordinate?('A1')).to be(true)
    expect(@board.valid_coordinate?('D4')).to be(true)
    expect(@board.valid_coordinate?('A5')).to be(false)
    expect(@board.valid_coordinate?('E1')).to be(false)
    expect(@board.valid_coordinate?('A22')).to be(false)
  end

  it '#valid_placement? evaluates ship and coordinates for length to be false' do

    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    expect(@board.valid_placement?(@cruiser, ["B1", "B2"])).to be(false)

  end

  it '#valid_placement? evaluates ships and coodinates for length to be true' do
    submarine_1 = Ship.new("Submarine", 2)
    cruiser_1 = Ship.new("Cruiser", 3)

    expect(@board.valid_placement?(submarine_1, ["C1", "C2"])).to be(true)
    expect(@board.valid_placement?(cruiser_1, ["D1", "D2", "D3"])).to be(true)
  end

  it '#consecutive_coordinates ensures coordinates are consecutive' do
    cruiser_coordinates = ["A1", "A2", "A3"]
    submarine_coordinates = ["C2", "D3"]
    require "pry"; binding.pry
    expect(@board.consecutive_coordinates(@submarine, ["A1", "A4"])).to be(false)
    # expect(@board.consecutive_coordinates(["A1", "D1"])).to be(false)
    expect(@board.consecutive_coordinates(@submarine, ["C2", "D2"])).to be(true)
    expect(@board.consecutive_coordinates(@cruiser, cruiser_coordinates)).to be(true)
    expect(@board.consecutive_coordinates(@submarine, submarine_coordinates)).to be(false)
  end

  it '#place puts ship with associated cells' do

    cruiser_coordinates = ["A1", "A2", "A3"]
    @board.valid_placement?(@cruiser, cruiser_coordinates)
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]


    expect(cell_1.ship).to eq(@cruiser)
    expect(cell_2.ship).to eq(@cruiser)
    expect(cell_3.ship).to eq(@cruiser)
  end

  it '#place wont allow a cell to have two ships on it' do
    submarine_1 = Ship.new("Submarine", 2)
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    cell_4 = @board.cells["B3"]
    cell_5 = @board.cells["A3"]
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["B3", "A3"])
    expect(@board.valid_placement?(@submarine, ["B3", "A3"])).to be false
  end

 it 'renders the board' do

  expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
 end

end
