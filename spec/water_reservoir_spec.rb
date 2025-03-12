require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'initializes with no parameters' do
    reservoir = WaterReservoir.new

    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'initializes with parameters' do
    reservoir = WaterReservoir.new(15, 10)

    expect(reservoir.capacity).to eq(15)
    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'is empty' do
    reservoir = WaterReservoir.new

    expect(reservoir.empty?).to eq(true)
  end

  it 'is not empty' do 
    reservoir = WaterReservoir.new(10, 5)

    expect(reservoir.empty?).to eq(false)
  end

  it 'fills' do
    reservoir = WaterReservoir.new
    reservoir.fill

    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'drains' do
    reservoir = WaterReservoir.new
    reservoir.fill
    reservoir.drain(5)

    expect(reservoir.current_water_volume).to eq(5)
  end

end
