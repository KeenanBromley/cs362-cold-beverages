class Vessel
  attr_reader :volume

  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @empty = true
  end

  def name
    @name
  end

  def volume
    @volume
  end

  def fill
    @empty = false
  end

  def empty?
    @empty
  end

end
