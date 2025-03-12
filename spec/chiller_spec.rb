require_relative '../lib/chiller'

describe 'A chiller' do
  it 'initializes without parameters' do
    chiller = Chiller.new

    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'initializes with parameters' do
    chiller = Chiller.new(150)

    expect(chiller.capacity).to eq(150)
    expect(chiller.temperature).to eq(70)
  end

  it 'adds item and updates remaining capacity' do 
    chiller = Chiller.new
    item = Item.new('Fake Item', 50)

    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(50)
  end

  it 'sets level and updates temperature' do
    chiller = Chiller.new
    
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)
  end

end
