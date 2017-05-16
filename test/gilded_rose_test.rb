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

end

describe "quality is never negative" do
  it "has a sell_in date which decreases" do
    @item = GildedRose.new("myitem", 7, 1)
    @item.tick
    @item.quality.must_equal 0
    @item.tick
    @item.quality.must_equal 0
  end
end

describe "aged brie increases quality" do
  it "quality should increase" do
    @item = GildedRose.new("Aged Brie", 7, 1)
    @item.tick
    @item.quality.must_equal 2
    @item.tick
    @item.quality.must_equal 3
  end
end

describe "quality should never be more than 50" do
  it "quality should increase until 50" do
    @item = GildedRose.new("Aged Brie", 7, 50)
    @item.tick
    @item.quality.must_equal 50
  end
end




