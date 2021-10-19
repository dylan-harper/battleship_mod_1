require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @coordinate = Cell.new("B4")
  end
  it 'exists' do
    expect(@cell).to be_a(Cell)
  end
  it 'has a coordinate' do
    expect(@coordinate).to be_instance_of(Cell)
  end
  it 'is a ship' do
  end

end
