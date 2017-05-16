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

  it "quality can never be negative" do
    @item.quality = 0
    @item.tick
    @item.quality.must_equal 0
  end

  it "quality can never be more than 50" do
    @item = GildedRose.new("over50", 7, 51)
    @item.quality.must_equal 50
  end
end
