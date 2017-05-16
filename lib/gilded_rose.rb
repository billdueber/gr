

class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name, days_remaining, quality)
    @name           = name
    @days_remaining = days_remaining
    @quality        = quality

    if @quality > 50
      # TODO: make better error message
      puts "quality can't set over 50"
      @quality = 50
    end
  end

  def tick # one day passes
    @days_remaining = @days_remaining - 1
    if @name == "Aged Brie"
      @quality = @quality + 1 unless @quality >= 50
    else
      @quality = @quality - 1 unless @quality <= 0
    end
  end

end
