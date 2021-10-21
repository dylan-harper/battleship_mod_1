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
end
