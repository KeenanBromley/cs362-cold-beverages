class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    if (vessel.volume > @reservoir.current_water_volume && @reservoir.current_water_volume != 0)
      @reservoir.drain(@reservoir.current_water_volume)
      vessel.fill
    else
      reservoir.drain(vessel.volume)
      vessel.fill
    end
  end

end
