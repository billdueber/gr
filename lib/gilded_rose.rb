module GildedRose
  class Item
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
    end
  end

  class Normal < Item
    def tick
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0

      @quality = 0 if @quality <= 0
    end
  end

  class AgedBrie < Item
    def tick
      @quality += 1
      @quality += 1 if @days_remaining <= 0

      @quality = 50 if @quality >= 50
    end
  end

  class Backstage < Item
    def tick
      @quality  = 0 if @days_remaining <= 0
      @quality += 1 if @days_remaining >= 11
      @quality += 2 if @days_remaining <= 10 && @days_remaining >= 6
      @quality += 3 if @days_remaining <= 5  && @days_remaining >= 1

      @quality = 50 if @quality >= 50
    end
  end

  class Conjured < Item
    def tick
      @quality -= 2
      @quality -= 2 if @days_remaining <= 0

      @quality = 0 if @quality <= 0
    end
  end

  DEFAULT_CLASS                                 =  Item
  SPECIALIZED_CLASSES = {
    'normal'                                    => Normal,
    'Aged Brie'                                 => AgedBrie,
    'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    'Conjured Mana Cake'                        => Conjured
  }

  def self.new(name, quality, days_remaining)
    @item = (SPECIALIZED_CLASSES[name] || DEFAULT_CLASS).new(quality, days_remaining)
  end
end
