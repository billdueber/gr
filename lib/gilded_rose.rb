

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality
  end

  def tick # one day passes
    @days_remaining -= 1
    delta = @name == 'Aged Brie' ? 1 : -1
    @quality += delta
    @quality = 0 if @quality < 0
    @quality = 50 if @quality > 50
  end

end

