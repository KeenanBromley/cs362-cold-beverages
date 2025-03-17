require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  it 'initializes' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.water_dispenser).to eq(dispenser)
    expect(refrigerator.water_reservoir).to eq(reservoir)
  end

  it 'adds an item to the chiller' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    item = Item.new('Fake Item', 50)
    refrigerator.chill(item)

    expect(chiller.remaining_capacity).to eq(50)
  end

  it 'adds an item to the freezer' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    item = Item.new('Fake Item', 50)
    refrigerator.freeze(item)

    expect(freezer.remaining_capacity).to eq(50)
  end

  it 'knows the total capacity when empty' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)

    expect(refrigerator.total_capacity).to eq(200)
  end

  it 'knows the total capacity after adding items' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    item1 = Item.new('Freezer Item', 50)
    item2 = Item.new('Chiller Item', 50)
    refrigerator.freeze(item1)
    refrigerator.chill(item2)

    expect(refrigerator.total_capacity).to eq(200)
  end

  it 'knows the remianing capacity after adding items' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    item1 = Item.new('Freezer Item', 50)
    item2 = Item.new('Chiller Item', 50)
    refrigerator.freeze(item1)
    refrigerator.chill(item2)

    expect(refrigerator.remaining_capacity).to eq(100)
  end

  it 'sets the chiller level' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    refrigerator.set_chiller_level(5)

    expect(chiller.temperature).to eq(45)
  end

  it 'sets the freezer level' do
    chiller = Chiller.new
    freezer = Freezer.new
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    refrigerator.set_freezer_level(5)

    expect(freezer.temperature).to eq(20)
  end

  it 'can be pluged in' do
    vessel = Vessel.new('FakeVessel', 15)
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(vessel)
    freezer = Freezer.new
    chiller = Chiller.new
    refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
    refrigerator.plug_in
    expect(refrigerator.instance_variable_get(:@power)).to eq(:on)
    expect(refrigerator.chiller.instance_variable_get(:@power)).to eq(:on)
    expect(refrigerator.freezer.instance_variable_get(:@power)).to eq(:on)
end

it 'can be un-pluged' do
  vessel = Vessel.new('FakeVessel', 15)
  reservoir = WaterReservoir.new
  dispenser = WaterDispenser.new(vessel)
  freezer = Freezer.new
  chiller = Chiller.new
  refrigerator = Refrigerator.new(chiller, freezer, dispenser, reservoir)
  refrigerator.unplug
    expect(refrigerator.instance_variable_get(:@power)).to eq(:off)
    expect(refrigerator.chiller.instance_variable_get(:@power)).to eq(:off)
    expect(refrigerator.freezer.instance_variable_get(:@power)).to eq(:off)
end

end
