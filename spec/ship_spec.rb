require './lib/ship'



RSpec.describe Ship do

  it "can create an instance of ship" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_an_instance_of(Ship)
    expect(cruiser.name).to eq("Cruiser")

  end

  it "has health equal to its length" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it "will only sink if health becomes 0" do
    cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to be(false)
  end

  it "loses 1 health when hit" do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    expect(cruiser.health).to eq(2)

    cruiser.hit

    expect(cruiser.health).to eq(1)

    cruiser.hit

    expect(cruiser.health).to eq(0)

  end

  it "sinks when health equals 0" do
    cruiser = Ship.new("Cruiser", 3)
    2.times { cruiser.hit }

    expect(cruiser.sunk?).to be(false)

    cruiser.hit

    expect(cruiser.sunk?).to be(true)
  end
end
