require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    cell = Cell.new("B4")
    # @coordinate = Cell.new("B4")
    # @ship = Ship.new("Cruiser", 3)
  end
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_a(Cell)
  end
  it 'has a coordinate' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
  end
  it 'does cell have ship' do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end
  it 'is cell empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to be(true)
  end
  it 'is a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_a(Ship)
  end
  it '#place_ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    expect(cell.place_ship(cruiser)).to be_an_instance_of(Ship)
    require "pry";binding.pry
  end
end
