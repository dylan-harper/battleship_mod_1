require './lib/ship'



RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "can create an instance of ship" do

    expect(@cruiser).to be_an_instance_of(Ship)
    expect(@cruiser.name).to eq("Cruiser")
  end

  it "has health equal to its length" do

    expect(@cruiser.health).to eq(3)
  end

  it "will only sink if health becomes 0" do

    expect(@cruiser.sunk?).to be(false)
  end

  it "loses 1 health when hit" do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)

    @cruiser.hit
    expect(@cruiser.sunk?).to be(false)
    expect(@cruiser.health).to eq(1)

    @cruiser.hit
    expect(@cruiser.sunk?).to be(true)
    expect(@cruiser.health).to eq(0)
  end

  it "sinks when health equals 0" do
    2.times { @cruiser.hit }

    expect(@cruiser.sunk?).to be(false)

    @cruiser.hit

    expect(@cruiser.sunk?).to be(true)
  end
end
