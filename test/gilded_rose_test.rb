require_relative 'test_helper.rb'
class GildedRoseTest < MiniTest::Unit::TestCase

  def update_quality_for_item_with(sell_in,
                                   quality,
                                   name             = 'normal item',
                                   sell_in_decrease = 1)

    item = Item.new(name, sell_in, quality)
    update_quality([item])
    skip
assert_equal item.sell_in, sell_in - sell_in_decrease
    item
  end

  def test_normal_item_before_sell_date
    item = update_quality_for_item_with(5, 10, 'normal')
    skip
assert_equal 9, item.quality
  end

  def test_normal_item_on_sell_date
    item = update_quality_for_item_with(0, 10, 'normal')
    skip
assert_equal 8, item.quality
  end

  def test_normal_item_after_sell_date
    item = update_quality_for_item_with(-10, 10, 'normal')
    skip
assert_equal 8, item.quality
  end

  def test_normal_item_of_zero_quality
    item = update_quality_for_item_with(5, 0, 'normal')
    skip
assert_equal 0, item.quality
  end

  def test_brie_before_sell_date
    item = update_quality_for_item_with(5, 10, 'Aged Brie')
    skip
assert_equal 11, item.quality
  end

  def test_brie_before_sell_date_with_max_quality
    item = update_quality_for_item_with(5, 50, 'Aged Brie')
    skip
assert_equal 50, item.quality
  end

  def test_brie_on_sell_date
    item = update_quality_for_item_with(0, 10, 'Aged Brie')
    skip
assert_equal 12, item.quality
  end

  def test_brie_on_sell_date_near_max_quality
    item = update_quality_for_item_with(5, 49, 'Aged Brie')
    skip
assert_equal 50, item.quality
  end

  def test_brie_on_sell_date_with_max_quality
    item = update_quality_for_item_with(5, 50, 'Aged Brie')
    skip
assert_equal 50, item.quality
  end

  def test_brie_after_sell_date
    item = update_quality_for_item_with(-10, 10, 'Aged Brie')
    skip
assert_equal 12, item.quality
  end

  def test_brie_after_sell_date_with_max_quality
    item = update_quality_for_item_with(-10, 50, 'Aged Brie')
    skip
assert_equal 50, item.quality
  end

  def test_sulfuras_before_sell_date
    item = update_quality_for_item_with(5, 80, 'Sulfuras, Hand of Ragnaros', 0)
    skip
assert_equal 80, item.quality
  end

  def test_sulfuras_on_sell_date
    item = update_quality_for_item_with(0, 80, 'Sulfuras, Hand of Ragnaros', 0)
    skip
assert_equal 80, item.quality
  end

  def test_sulfuras_after_sell_date
    item = update_quality_for_item_with(-10, 80, 'Sulfuras, Hand of Ragnaros', 0)
    skip
assert_equal 80, item.quality
  end

  def test_backstage_pass_long_before_sell_date
    item = update_quality_for_item_with(11, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 11, item.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound
    item = update_quality_for_item_with(10, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 12, item.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound_at_max_quality
    item = update_quality_for_item_with(10, 50, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 50, item.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound
    item = update_quality_for_item_with(6, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 12, item.quality
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound_at_max_quality
    item = update_quality_for_item_with(6, 50, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 50, item.quality
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound
    item = update_quality_for_item_with(5, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 13, item.quality
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound_at_max_quality
    item = update_quality_for_item_with(5, 50, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 50, item.quality
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound
    item = update_quality_for_item_with(1, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 13, item.quality
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound_at_max_quality
    item = update_quality_for_item_with(1, 50, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 50, item.quality
  end

  def test_backstage_pass_on_sell_date
    item = update_quality_for_item_with(0, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 0, item.quality
  end

  def test_backstage_pass_after_sell_date
    item = update_quality_for_item_with(-10, 10, 'Backstage passes to a TAFKAL80ETC concert')
    skip
assert_equal 0, item.quality
  end

  def test_conjured_item_before_sell_date
    item = update_quality_for_item_with(5, 10, 'Conjured Mana Cake')
    skip
assert_equal 8, item.quality
  end

  def test_conjured_item_at_zero_quality
    item = update_quality_for_item_with(5, 0, 'Conjured Mana Cake')
    skip
assert_equal 0, item.quality
  end

  def test_conjured_item_on_sell_date
    item = update_quality_for_item_with(0, 10, 'Conjured Mana Cake')
    skip
assert_equal 6, item.quality
  end

  def test_conjured_item_on_sell_date_at_zero_quality
    item = update_quality_for_item_with(0, 0, 'Conjured Mana Cake')
    skip
assert_equal 0, item.quality
  end

  def test_conjured_item_after_sell_date
    item = update_quality_for_item_with(-10, 10, 'Conjured Mana Cake')
    skip
assert_equal 6, item.quality
  end

  def test_conjured_item_after_sell_date_at_zero_quality
    item = update_quality_for_item_with(-10, 0, 'Conjured Mana Cake')
    skip
assert_equal 0, item.quality
  end

  def test_several_items
    items = [Item.new("normal item", 5, 10),
             Item.new("Aged Brie", 3, 10)]

    update_quality(items)
    skip
assert_equal  9, items[0].quality
    skip
assert_equal  4, items[0].sell_in
    skip
assert_equal 11, items[1].quality
    skip
assert_equal  2, items[1].sell_in
  end

end