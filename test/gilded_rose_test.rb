require_relative 'test_helper.rb'

class GildedRoseTest < MiniTest::Test
  def test_normal_item_initialize_min_qaulity
    item = GildedRose.new('normal', GildedRose::MIN_QUALITY-1, 0)
    assert_equal GildedRose::MIN_QUALITY, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_normal_item_initialize_max_qaulity
    item = GildedRose.new('normal', GildedRose::MAX_QUALITY+1, 0)
    assert_equal GildedRose::MAX_QUALITY, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_normal_item_before_sell_date
    item = GildedRose.new('normal', 10, 5)
    item.tick
    assert_equal 9, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_normal_item_on_sell_date
    item = GildedRose.new('normal', 10, 0)
    item.tick
    assert_equal 8, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_normal_item_after_sell_date
    item = GildedRose.new('normal', 10, -10)
    item.tick
    assert_equal 8, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_normal_item_of_zero_quality
    item = GildedRose.new('normal', 0, 5)
    item.tick
    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date
    item = GildedRose.new('Aged Brie', 10, 5)
    item.tick
    assert_equal 11, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_before_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date
    item = GildedRose.new('Aged Brie', 10, 0)
    item.tick
    assert_equal 12, item.quality
    assert_equal -1, item.days_remaining

  end

  def test_brie_on_sell_date_near_max_quality
    item = GildedRose.new('Aged Brie', 49, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_on_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_brie_after_sell_date
    item = GildedRose.new('Aged Brie', 10, -10)
    item.tick
    assert_equal 12, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_brie_after_sell_date_with_max_quality
    item = GildedRose.new('Aged Brie', 50, -10)
    item.tick
    assert_equal 50, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_sulfuras_before_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 50, 15)
    item.tick
    assert_equal 50, item.quality
    assert_equal 15, item.days_remaining
  end

  def test_sulfuras_on_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 50, 0)
    item.tick
    assert_equal 50, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_sulfuras_after_sell_date
    item = GildedRose.new('Sulfuras, Hand of Ragnaros', 50, -10)
    item.tick
    assert_equal 50, item.quality
    assert_equal -10, item.days_remaining
  end

  def test_backstage_pass_long_before_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 11)
    item.tick
    assert_equal 11, item.quality
    assert_equal 10, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
    item.tick
    assert_equal 12, item.quality
    assert_equal 9, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 10)
    item.tick
    assert_equal 50, item.quality
    assert_equal 9, item.days_remaining

  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 6)
    item.tick
    assert_equal 12, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_medium_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 6)
    item.tick
    assert_equal 50, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
    item.tick
    assert_equal 13, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_upper_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 5)
    item.tick
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 1)
    item.tick
    assert_equal 13, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_very_close_to_sell_date_lower_bound_at_max_quality
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 50, 1)
    item.tick
    assert_equal 50, item.quality
    assert_equal 0, item.days_remaining
  end

  def test_backstage_pass_on_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
    item.tick
    assert_equal 0, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_backstage_pass_after_sell_date
    item = GildedRose.new('Backstage passes to a TAFKAL80ETC concert', 10, -10)
    item.tick
    assert_equal 0, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_conjured_item_before_sell_date
    skip
    item = GildedRose.new('Conjured Mana Cake', 10, 5)
    item.tick
    assert_equal 8, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_at_zero_quality
    skip
    item = GildedRose.new('Conjured Mana Cake', 0, 5)
    item.tick
    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_item_on_sell_date
    skip
    item = GildedRose.new('Conjured Mana Cake', 10, 0)
    item.tick
    assert_equal 6, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_conjured_item_on_sell_date_at_zero_quality
    skip
    item = GildedRose.new('Conjured Mana Cake', 0, 0)
    item.tick
    assert_equal 0, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_conjured_item_after_sell_date
    skip
    item = GildedRose.new('Conjured Mana Cake', 10, -10)
    item.tick
    assert_equal 6, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_conjured_item_after_sell_date_at_zero_quality
    skip
    item = GildedRose.new('Conjured Mana Cake', 0, -10)
    item.tick
    assert_equal 0, item.quality
    assert_equal -11, item.days_remaining
  end

  def test_stress_test_quality_of_all_items
    skip
    names = GildedRose::SPECIALIZED_CLASSES.keys.push('default')
    quality = GildedRose::MIN_QUALITY + ((GildedRose::MAX_QUALITY - GildedRose::MIN_QUALITY) / 2).round
    quality += 1 if (quality % 2) == 0
    days_remaining = (GildedRose::MAX_QUALITY - GildedRose::MIN_QUALITY) * 2
    names.each do |name|
      item = GildedRose.new(name, quality, days_remaining)
      days_remaining.times do |i|
        item.tick
        assert(item.quality >= GildedRose::MIN_QUALITY, name.to_s + " quality of " + item.quality.to_s + " < " + GildedRose::MIN_QUALITY.to_s )
        assert(item.quality <= GildedRose::MAX_QUALITY, name.to_s + " quality of " + item.quality.to_s + " < " + GildedRose::MAX_QUALITY.to_s )
        assert_equal (days_remaining - (i+1)), item.days_remaining, name.to_s + " days remaining"
      end
    end
  end
end
