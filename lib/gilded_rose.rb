class GildedRose
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  
  def initialize(name, quality, days_remaining)
    @item = GildedRose.klass_for(name).new(name,quality,days_remaining)
  end

  def tick
    @item.tick
  end

  def quality
    @item.quality
  end

  def days_remaining
    @item.days_remaining
  end

  def self.klass_for(name)
    case name
    when 'Aged Brie'
      AgedBrie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      BackstagePass
    when 'Conjured Mana Cake'
      ConjuredCake
    else
      NormalItem
    end
  end
end

class GildedRoseItem
  attr_reader :name, :quality, :days_remaining
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(name,quality,days_remaining)
    @name =name
    @quality = quality
    @quality = MIN_QUALITY if @quality < MIN_QUALITY
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
    @days_remaining = days_remaining
  end

	def increment_quality(amount=1)
    @quality += amount if @quality < MAX_QUALITY

	end

	def decrement_quality(amount=1)
    @quality -= amount if @quality > MIN_QUALITY
	end

  def tick
    @days_remaining -= 1
  end

  def expired?
    @days_remaining < 0
  end
end


class NormalItem < GildedRoseItem
  def tick
    super
    decrement_quality
    decrement_quality if expired?
  end
end


class AgedBrie < GildedRoseItem
  def tick
    super
    increment_quality
    increment_quality if expired? 
  end
end

class Sulfuras < GildedRoseItem
  def tick
    super
    increment_quality
  end
end

class BackstagePass < GildedRoseItem
  def tick
   super
   if expired?
     @quality = 0
   else
     increment_quality
     increment_quality if @days_remaining < 10
     increment_quality if @days_remaining < 5
   end
  end
end

class ConjuredCake < GildedRoseItem
  def tick
    super
    decrement_quality(2)
    decrement_quality(2) if expired?
  end
end
