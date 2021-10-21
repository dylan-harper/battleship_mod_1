require 'rspec'
require './lib/board'

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

end
