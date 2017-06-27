class BaseItem
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
  end

  def is_past_sell_date
    @days_remaining <= 0
  end
end

class NormalItem < BaseItem
  def tick
    @quality -= 1
    @quality -= 1 if self.is_past_sell_date
    @quality = 0 if @quality < 0
  end
end

class AgedBrie < BaseItem
  def tick
    @quality += 1
    @quality += 1 if self.is_past_sell_date
    @quality = 50 if @quality > 50
  end
end

class SulfurasHandOfRagnaros < BaseItem
end

class BackstagePass < BaseItem
  def tick
    @quality += 1
    @quality += 1 if @days_remaining <= 10
    @quality += 1 if @days_remaining <= 5
    @quality = 50 if @quality > 50
    @quality = 0 if self.is_past_sell_date
  end
end

class ConjuredManaCake < BaseItem
  def tick
    @quality -= 2
    @quality -= 2 if self.is_past_sell_date
    @quality = 0 if @quality < 0
  end
end

ItemTypeTable = {
  'Aged Brie' => AgedBrie,
  'Sulfuras, Hand of Ragnaros' => SulfurasHandOfRagnaros,
  'Backstage passes to a TAFKAL80ETC concert' => BackstagePass,
  'Conjured Mana Cake' => ConjuredManaCake,
}

ItemTypeTable.default = NormalItem

class GildedRose
  def initialize(name, quality, days_remaining)
    @item = ItemTypeTable[name].new(quality, days_remaining)
  end

  def tick
    @item.tick
  end

  def quality
    @item.quality
  end
end
