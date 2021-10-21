require 'rspec'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it '#cells contains all cells in a hash' do
    expect(@board.cells).to eq(
      {
      "A1" => an_instance_of(Cell),
      "A2" => an_instance_of(Cell),
      "A3" => an_instance_of(Cell),
      "A4" => an_instance_of(Cell),
      "B1" => an_instance_of(Cell),
      "B2" => an_instance_of(Cell),
      "B3" => an_instance_of(Cell),
      "B4" => an_instance_of(Cell),
      "C1" => an_instance_of(Cell),
      "C2" => an_instance_of(Cell),
      "C3" => an_instance_of(Cell),
      "C4" => an_instance_of(Cell),
      "D1" => an_instance_of(Cell),
      "D2" => an_instance_of(Cell),
      "D3" => an_instance_of(Cell),
      "D4" => an_instance_of(Cell)
      }
    )
  end
end
