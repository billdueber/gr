

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality
  end

  def tick # one day passes
    @days_remaining -= 1
    if @name == 'aged brie'  
      increase_quality
    else
      decrease_quality
    end
  end

  def decrease_quality
    @quality -= 1
    if @quality < 0  
      @quality = 0
    end
  end

  def increase_quality
    @quality += 1
    if @quality > 50
      @quality = 50
    end
  end

end
