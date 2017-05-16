

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality
  end

  def tick # one day passes
    @days_remaining -= 1
    if @name == 'Aged Brie'
      @quality += 1 if @quality < 50
    else
      @quality -= 1 if @quality > 0
    end
  end

end

