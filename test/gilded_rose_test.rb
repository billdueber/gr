require_relative 'test_helper.rb'

describe "tick test" do
  before do
    @item = GildedRose.new("myitem", 7, 10)
    @brie = GildedRose.new("Aged Brie", 7, 10)
  end

  it "has a quality which decreases" do
    @item.tick
    @item.quality.must_equal 9
  end

  it "has a sell_in date which decreases" do
    @item.tick
    @item.days_remaining.must_equal 6
  end

  it "quality is never negative" do
    (1..20).each {@item.tick} 
    @item.quality.must_equal 0
  end

  it "increases the quality of Aged Brie" do
    @brie.tick
    @brie.quality.must_equal 11
  end

  it "quality is never more than 50" do
    (1..50).each {@brie.tick}
    @brie.quality.must_equal 50
  end

  
end
