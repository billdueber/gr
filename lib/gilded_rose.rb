

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality
  end

  def tick # one day passes
     @quality -=  1 if (@quality > 0 )
     @quality = 50 if (@quality >= 49)
     @days_remaining -= 1 
  end

end

