require_relative '../lib/water_dispenser'

class FakeVessel
  attr_reader :volume

  def initialize
    @volume = 15
    @is_full = false
  end

  def fill
    @is_full = true
  end
end

class FakeReservoir
  attr_reader :capacity
  attr_accessor :current_water_volume

  def initialize(capacity = 15, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
  end

  def empty?
    current_water_volume == 0
  end

  def fill
    current_water_volume = capacity
  end
   
  def drain(volume)
      self.current_water_volume -= volume
    end
end

describe 'A water dispenser' do
  it 'sets the reservoir' do
    reservoir = FakeReservoir.new
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to eq(reservoir)
  end
 
it 'can be dispense' do
    reservoir = FakeReservoir.new(20, 16)
    dispenser = WaterDispenser.new(reservoir)
    vessel = FakeVessel.new
    expect(dispenser.dispense(vessel)).to eq(true)
    expect(dispenser.reservoir.current_water_volume).to eq(1)
end
end
