require_relative '../lib/freezer'

describe 'A freezer' do
  it 'initializes without paramters' do
    freezer = Freezer.new

    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'initializes with paremeters' do
    freezer = Freezer.new(150)

    expect(freezer.capacity).to eq(150)
    expect(freezer.temperature).to eq(70)
  end

  it 'adds item and updates capacity' do
    freezer = Freezer.new
    item = Item.new('Fake Item', 50)

    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(50)
  end

  it 'sets freezer level and updates temp' do
    freezer = Freezer.new

    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end

  it 'can turn on' do
    freezer = Freezer.new
    freezer.turn_on
    expect(freezer.instance_variable_get(:@power)).to eq(:on)
  end

  it 'can turn off' do
    freezer = Freezer.new
    freezer.turn_off
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
  end

end
