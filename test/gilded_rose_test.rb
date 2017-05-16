require_relative 'test_helper.rb'

describe "tick test" do
  before do
    @item = GildedRose.new("myitem", 7, 10)
  end

  it "has a quality which decreases" do
    @item.tick
    @item.quality.must_equal 9
  end

  it "has a sell_in date which decreases" do
    @item.tick
    @item.days_remaining.must_equal 6
  end
  
  it "never has a negative quality" do
    100.times { @item.tick }
    @item.quality.must_be :>=, 0
  end
end

describe "aged brie test" do
  before do
    @item = GildedRose.new("aged brie", 7, 10)
  end

  it "has a quality which increases" do
    @item.tick
    @item.quality.must_equal 11
  end

  it "has a sell_in date which decreases" do
    @item.tick
    @item.days_remaining.must_equal 6
  end
  
  it "never has a quality > 50" do
    100.times { @item.tick }
    @item.quality.must_be :<=, 50
  end
end
