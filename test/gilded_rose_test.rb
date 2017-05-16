require_relative 'test_helper.rb'
class GildedRoseTest < MiniTest::Test

  def test_normal_item_before_sell_date
    item = GildedRose.for('normal', 10, 5)
    item.tick
    assert_equal 9, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_normal_item_on_sell_date
    item = GildedRose.for('normal', 10, 0)
    item.tick
    assert_equal 8, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_normal_item_after_sell_date
    item = GildedRose.for('normal', 10, -10)
    item.tick
    assert_equal 8, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_normal_item_of_zero_quality
    item = GildedRose.for('normal', 0, 5)
    item.tick
    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date
    item = GildedRose.for('Aged Brie', 10, 5)
    item.tick
    assert_equal 11, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date_with_max_quality
    item = GildedRose.for('Aged Brie', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date
    item = GildedRose.for('Aged Brie', 10, 0)
    item.tick
    assert_equal 12, item.quality
    assert_equal -1, item.days_remaining

  end

  def test_brie_on_sell_date_near_max_quality
    item = GildedRose.for('Aged Brie', 49, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date_with_max_quality
    item = GildedRose.for('Aged Brie', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_after_sell_date
    item = GildedRose.for('Aged Brie', 10, -10)
    item.tick
    assert_equal 12, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_brie_after_sell_date_with_max_quality
    item = GildedRose.for('Aged Brie', 50, -10)
    item.tick
    assert_equal 50, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_sulfuras_before_sell_date
    item = GildedRose.for('Sulfuras, Hand of Ragnaros', 80, 15)
    item.tick
    assert_equal 80, item.quality
    assert_equal 14, item.days_remaining
  end

  def test_sulfuras_on_sell_date
    item = GildedRose.for('Sulfuras, Hand of Ragnaros', 80, 0)
    item.tick
    assert_equal 80, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_sulfuras_after_sell_date
    item = GildedRose.for('Sulfuras, Hand of Ragnaros', 80, -10)
    item.tick
    assert_equal 80, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_backstage_pass_long_before_sell_date
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 11)
    item.tick
    assert_equal 11, item.quality
    assert_equal 10, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 10)
    item.tick
    assert_equal 12, item.quality
    assert_equal 9, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 50, 10)
    item.tick
    assert_equal 50, item.quality
    assert_equal 9, item.days_remaining

  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 6)
    item.tick
    assert_equal 12, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 50, 6)
    item.tick
    assert_equal 50, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 5)
    item.tick
    assert_equal 13, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 1)
    item.tick
    assert_equal 13, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 50, 1)
    item.tick
    assert_equal 50, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_on_sell_date
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, 0)
    item.tick
    assert_equal 0, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_backstage_pass_after_sell_date
    item = GildedRose.for('Backstage passes to a TAFKAL80ETC concert', 10, -10)
    item.tick
    assert_equal 0, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_conjured_item_before_sell_date
    skip
    item = GildedRose.for('Conjured Mana Cake', 10, 5)
    item.tick
    assert_equal 8, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_at_zero_quality
    skip
    item = GildedRose.for('Conjured Mana Cake', 0, 5)
    item.tick
    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_on_sell_date
    skip
    item = GildedRose.for('Conjured Mana Cake', 10, 0)
    item.tick
    assert_equal 6, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_conjured_item_on_sell_date_at_zero_quality
    skip
    item = GildedRose.for('Conjured Mana Cake', 0, 0)
    item.tick
    assert_equal 0, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_conjured_item_after_sell_date
    skip
    item = GildedRose.for('Conjured Mana Cake', 10, -10)
    item.tick
    assert_equal 6, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_conjured_item_after_sell_date_at_zero_quality
    skip
    item = GildedRose.for('Conjured Mana Cake', 0, -10)
    item.tick
    assert_equal 0, item.quality
    assert_equal -11, item.days_remaining
  end

end
