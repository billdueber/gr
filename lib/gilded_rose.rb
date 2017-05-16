module GildedRose
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  class Item
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @quality = 0 if @quality < 0
      @quality = 50 if @quality > 50
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
    end
  end

  class Normal < Item
    def tick
      @days_remaining -= 1
      return if quality == 0

      @quality -= 1
      @quality -= 1 if days_remaining <= 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if quality == 50

      @quality += 1
      @quality += 1 if days_remaining <= 0
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return if quality == 50
      return @quality = 0 if days_remaining < 0

      @quality += 1
      @quality += 1 if days_remaining < 10
      @quality += 1 if days_remaining < 5
    end
  end

  class Conjured < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 2
      @quality -= 2 if @days_remaining <= 0
      @quality = 0 if @quality < 0
    end
  end

  DEFAULT_CLASS = Item
  SPECIALIZED_CLASSES = {
      'normal' => Normal,
      'Aged Brie' => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Conjured Mana Cake' => Conjured
  }

  def self.for(name, quality, days_remaining)
    (SPECIALIZED_CLASSES[name] || DEFAULT_CLASS).new(quality, days_remaining)
  end

end




