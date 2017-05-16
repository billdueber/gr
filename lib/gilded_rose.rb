

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality
  end

  def tick # one day passes
    if @name == "Aged Brie" 
      @quality += 1
    else
      @quality -= 1
      if @quality < 0
        @quality = 0
      end
    end
    if @quality > 50
     @quality = 50
    end
    @days_remaining -= 1
  end

end

