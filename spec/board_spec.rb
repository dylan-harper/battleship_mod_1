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

  it '#valid_placement? ship and coordinates length not equal' do
    submarine = Ship.new("Submarine", 2)
    cruiser = Ship.new("Cruiser", 3)
    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
    require 'pry';binding.pry
    expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
  end

  it '#valid_placement ship and coordinates length equal' do

  end
end
