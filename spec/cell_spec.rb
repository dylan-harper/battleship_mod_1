require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end

  it 'exists' do
    expect(@cell).to be_a(Cell)
  end

  it 'has a coordinate' do
    expect(@cell.coordinate).to eq("B4")
  end

  it 'does cell have ship' do
    expect(@cell.ship).to eq(nil)
  end

  it 'is cell empty' do
    expect(@cell.empty?).to be(true)
  end

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'is a ship' do
    expect(@cruiser).to be_a(Ship)
  end

  it '#place_ship' do
    expect(@cell.place_ship(@cruiser)).to be_an_instance_of(Ship)
    expect(@cell.empty?).to be(false)
  end

  it '#fired_upon should be false' do
    @cell.place_ship(@cruiser)


    expect(@cell.fired_upon?).to be(false)
  end

  it '#fired_upon should be true' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    @cell.fired_upon?

    expect(@cell.fired_upon?).to be(true)
  end

  it 'will return "." if cell has not been fired upon' do

    expect(@cell.render).to eq(".")
  end


  it 'will return M if cell is hit but there is no ship' do
    @cell.fire_upon
    @cell.fired_upon?

    expect(@cell.render).to eq("M")
  end

  it 'will return H if ship is hit' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    @cell.fired_upon?

    expect(@cell.render).to eq("H")
  end

  it "will return X if ship is hit and sunk" do
    @cell.place_ship(@cruiser)
    3.times do @cell.fire_upon
    end
    
    expect(@cell.render).to eq ("X")
  end

  it "#render will return an option boolean" do
    @cell.place_ship(@cruiser)

    expect(@cell.render(s = true)).to eq("S")
  end
end
