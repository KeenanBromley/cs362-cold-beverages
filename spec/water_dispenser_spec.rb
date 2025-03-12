require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  it 'sets the reservoir' do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to eq(reservoir)
  end
end
