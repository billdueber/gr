class GildedRose

  attr_reader :name, :quality, :days_remaining
  
  def initialize(name, quality, days_remaining)
    @name =name
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    case name
      when 'normal'
        return normal_tick
      when 'Aged Brie'
        return brie_tick
      when 'Backstage passes to a TAFKAL80ETC concert'
        return backstage_tick
      when 'Sulfuras, Hand of Ragnaros'
        return sulfuras_tick
    end
  end

  def normal_tick
    @days_remaining -= 1
    return if quality == 0

    @quality -= 1
    @quality -= 1 if days_remaining <= 0
  end

  def brie_tick
    @days_remaining -= 1
    return if quality == 50

    @quality += 1
    @quality += 1 if days_remaining <= 0
  end

  def sulfuras_tick
    @days_remaining -= 1
  end

  def backstage_tick
    @days_remaining -= 1
    return if quality == 50
    return @quality = 0 if days_remaining < 0

    @quality += 1
    @quality += 1 if days_remaining < 10
    @quality += 1 if days_remaining < 5
  end
end
