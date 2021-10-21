require 'rspec'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    # coordinates = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    # cells = coordinates.map do |coordinate|
    #   Cell.new(coordinate)
    # end
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'board has cells' do
    expect(@board.cells).to be_a(Hash)
    # @board.cells.each do |coordinate, cell|
    #   expect(cell.coordinate).to eq(coordinate)
    # end
    # require 'pry';binding.pry
    expect(@board.cells.keys.length).to eq(16)
  end
end
