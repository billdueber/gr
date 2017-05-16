module GildedRose

  attr_reader :item
  
  def self.for(name, quality, days_remaining)
   klass_for(name).new(quality, days_remaining)
  end

  def self.klass_for(name)
    case name
      when 'normal'
        Normal
      when 'Aged Brie'
        Brie
      when 'Backstage passes to a TAFKAL80ETC concert'
        Backstage
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras
    end
  end

  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if quality == 0

      @quality -= 1
      @quality -= 1 if days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if quality == 50

      @quality += 1
      @quality += 1 if days_remaining <= 0
    end
  end

  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if quality == 50
      return @quality = 0 if days_remaining < 0

      @quality += 1
      @quality += 1 if days_remaining < 10
      @quality += 1 if days_remaining < 5
    end
  end
end




