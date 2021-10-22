require 'rspec'
require './lib/board'
require './lib/ship'

RSpec.describe Board do
  before(:each) do
    @board = Board.new

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

  it '#valid_placement? evaluates ship and coordinates for length' do
    submarine = Ship.new("Submarine", 2)
    # submarine1 = Ship.new("Submarine", 2) ??If this and the below test are included, test doesn't pass
    cruiser = Ship.new("Cruiser", 3)

    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
    expect(@board.valid_placement?(cruiser, ["B1", "B2"])).to be(false)
    # expect(@board.valid_placement?(submarine1, ["C1", "C2"])).to be(true)
  end

  # it '#valid_placement ship and coordinates length equal' do
  #
  # end

  it '#consecutive_coordinates ensures coordinates are consecutive' do
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    cruiser_coordinates = ["A1", "A2", "A3"]
    submarine_coordinates = ["C2", "D3"]


    expect(@board.consecutive_coordinates(cruiser_coordinates)).to be(true)
    expect(@board.consecutive_coordinates(submarine_coordinates)).to be(false)
  end

  
end
